// Copyright (C) 1999-2000 Id Software, Inc.
//

// this file holds commands that can be executed by the server console, but not remote clients

#include "g_local.h"


/*
==============================================================================

PACKET FILTERING
 

You can add or remove addresses from the filter list with:

addip <ip>
removeip <ip>

The ip address is specified in dot format, and any unspecified digits will match any value, so you can specify an entire class C network with "addip 192.246.40".

Removeip will only remove an address specified exactly the same way.  You cannot addip a subnet, then removeip a single host.

listip
Prints the current list of filters.

g_filterban <0 or 1>

If 1 (the default), then ip addresses matching the current list will be prohibited from entering the game.  This is the default setting.

If 0, then only addresses matching the list will be allowed.  This lets you easily set up a private game, or a game that only allows players from your local network.


==============================================================================
*/

// extern	vmCvar_t	g_banIPs;
// extern	vmCvar_t	g_filterBan;


typedef struct ipFilter_s
{
	unsigned	mask;
	unsigned	compare;
} ipFilter_t;

#define	MAX_IPFILTERS	1024

static ipFilter_t	ipFilters[MAX_IPFILTERS];
static int			numIPFilters;

/*
=================
StringToFilter
=================
*/
static qboolean StringToFilter (char *s, ipFilter_t *f)
{
	char	num[128];
	int		i, j;
	byte	b[4];
	byte	m[4];
	
	for (i=0 ; i<4 ; i++)
	{
		b[i] = 0;
		m[i] = 0;
	}
	
	for (i=0 ; i<4 ; i++)
	{
		if (*s < '0' || *s > '9')
		{
			G_Printf( "Bad filter address: %s\n", s );
			return qfalse;
		}
		
		j = 0;
		while (*s >= '0' && *s <= '9')
		{
			num[j++] = *s++;
		}
		num[j] = 0;
		b[i] = atoi(num);
		if (b[i] != 0)
			m[i] = 255;

		if (!*s)
			break;
		s++;
	}
	
	f->mask = *(unsigned *)m;
	f->compare = *(unsigned *)b;
	
	return qtrue;
}

/*
=================
UpdateIPBans
=================
*/
static void UpdateIPBans (void)
{
	byte	b[4];
	int		i;
	char	iplist[MAX_INFO_STRING];

	*iplist = 0;
	for (i = 0 ; i < numIPFilters ; i++)
	{
		if (ipFilters[i].compare == 0xffffffff)
			continue;

		*(unsigned *)b = ipFilters[i].compare;
		Com_sprintf( iplist + strlen(iplist), sizeof(iplist) - strlen(iplist), 
			"%i.%i.%i.%i ", b[0], b[1], b[2], b[3]);
	}

	trap_Cvar_Set( "g_banIPs", iplist );
}

/*
=================
G_FilterPacket
=================
*/
qboolean G_FilterPacket (char *from)
{
	int		i;
	unsigned	in;
	byte m[4] = {'\0','\0','\0','\0'};
	char *p;

	i = 0;
	p = from;
	while (*p && i < 4) {
		m[i] = 0;
		while (*p >= '0' && *p <= '9') {
			m[i] = m[i]*10 + (*p - '0');
			p++;
		}
		if (!*p || *p == ':')
			break;
		i++, p++;
	}
	
	in = *(unsigned *)m;

	for (i=0 ; i<numIPFilters ; i++)
		if ( (in & ipFilters[i].mask) == ipFilters[i].compare)
			return g_filterBan.integer != 0;

	return g_filterBan.integer == 0;
}

/*
=================
AddIP
=================
*/
static void AddIP( char *str )
{
	int		i;

	for (i = 0 ; i < numIPFilters ; i++)
		if (ipFilters[i].compare == 0xffffffff)
			break;		// free spot
	if (i == numIPFilters)
	{
		if (numIPFilters == MAX_IPFILTERS)
		{
			G_Printf ("IP filter list is full\n");
			return;
		}
		numIPFilters++;
	}
	
	if (!StringToFilter (str, &ipFilters[i]))
		ipFilters[i].compare = 0xffffffffu;

	UpdateIPBans();
}

/*
=================
G_ProcessIPBans
=================
*/
void G_ProcessIPBans(void) 
{
	char *s, *t;
	char		str[MAX_TOKEN_CHARS];

	Q_strncpyz( str, g_banIPs.string, sizeof(str) );

	for (t = s = g_banIPs.string; *t; /* */ ) {
		s = strchr(s, ' ');
		if (!s)
			break;
		while (*s == ' ')
			*s++ = 0;
		if (*t)
			AddIP( t );
		t = s;
	}
}


/*
=================
Svcmd_AddIP_f
=================
*/
void Svcmd_AddIP_f (void)
{
	char		str[MAX_TOKEN_CHARS];

	if ( trap_Argc() < 2 ) {
		G_Printf("Usage:  addip <ip-mask>\n");
		return;
	}

	trap_Argv( 1, str, sizeof( str ) );

	AddIP( str );

}

/*
=================
Svcmd_RemoveIP_f
=================
*/
void Svcmd_RemoveIP_f (void)
{
	ipFilter_t	f;
	int			i;
	char		str[MAX_TOKEN_CHARS];

	if ( trap_Argc() < 2 ) {
		G_Printf("Usage:  sv removeip <ip-mask>\n");
		return;
	}

	trap_Argv( 1, str, sizeof( str ) );

	if (!StringToFilter (str, &f))
		return;

	for (i=0 ; i<numIPFilters ; i++) {
		if (ipFilters[i].mask == f.mask	&&
			ipFilters[i].compare == f.compare) {
			ipFilters[i].compare = 0xffffffffu;
			G_Printf ("Removed.\n");

			UpdateIPBans();
			return;
		}
	}

	G_Printf ( "Didn't find %s.\n", str );
}

/*
===================
Svcmd_EntityList_f
===================
*/
void	Svcmd_EntityList_f (void) {
	int			e;
	gentity_t		*check;

	check = g_entities+1;
	for (e = 1; e < level.num_entities ; e++, check++) {
		if ( !check->inuse ) {
			continue;
		}
		G_Printf("%3i:", e);
		switch ( check->s.eType ) {
		case ET_GENERAL:
			G_Printf("ET_GENERAL          ");
			break;
		case ET_PLAYER:
			G_Printf("ET_PLAYER           ");
			break;
		case ET_ITEM:
			G_Printf("ET_ITEM             ");
			break;
		case ET_MISSILE:
			G_Printf("ET_MISSILE          ");
			break;
		case ET_MOVER:
			G_Printf("ET_MOVER            ");
			break;
		case ET_BEAM:
			G_Printf("ET_BEAM             ");
			break;
		case ET_PORTAL:
			G_Printf("ET_PORTAL           ");
			break;
		case ET_SPEAKER:
			G_Printf("ET_SPEAKER          ");
			break;
		case ET_PUSH_TRIGGER:
			G_Printf("ET_PUSH_TRIGGER     ");
			break;
		case ET_TELEPORT_TRIGGER:
			G_Printf("ET_TELEPORT_TRIGGER ");
			break;
		case ET_INVISIBLE:
			G_Printf("ET_INVISIBLE        ");
			break;
		case ET_GRAPPLE:
			G_Printf("ET_GRAPPLE          ");
			break;
		default:
			G_Printf("%3i                 ", check->s.eType);
			break;
		}

		if ( check->classname ) {
			G_Printf("%s", check->classname);
		}
		G_Printf("\n");
	}
}

gclient_t	*ClientForString( const char *s ) {
	gclient_t	*cl;
	int			i;
	int			idnum;

	// numeric values are just slot numbers
	if ( s[0] >= '0' && s[0] <= '9' ) {
		idnum = atoi( s );
		if ( idnum < 0 || idnum >= level.maxclients ) {
			Com_Printf( "Bad client slot: %i\n", idnum );
			return NULL;
		}

		cl = &level.clients[idnum];
		if ( cl->pers.connected == CON_DISCONNECTED ) {
			G_Printf( "Client %i is not connected\n", idnum );
			return NULL;
		}
		return cl;
	}

	// check for a name match
	for ( i=0 ; i < level.maxclients ; i++ ) {
		cl = &level.clients[i];
		if ( cl->pers.connected == CON_DISCONNECTED ) {
			continue;
		}
		if ( !Q_stricmp( cl->pers.netname, s ) ) {
			return cl;
		}
	}

	G_Printf( "User %s is not on the server\n", s );

	return NULL;
}
int G_ClientNumberFromStrippedSubstring ( const char* name ){
	char		s2[MAX_STRING_CHARS];
	char		n2[MAX_STRING_CHARS];
	int			i, match = -1;
	gclient_t	*cl;

	for ( i=0 ; i < level.numConnectedClients ; i++ ) {
		cl=&level.clients[level.sortedClients[i]];
		if (strstr(n2, s2)) {
			if(match != -1)
			{ //found more than one match
				return -2;
			}
			match = level.sortedClients[i];
		}
	}

	return match;
}
int G_ClientNumberFromArg ( char* name){
	int client_id = 0;
	char *cp;
	cp = name;
	while (*cp) {
		if ( *cp >= '0' && *cp <= '9' ) cp++;
		else {
			client_id = -1; //mark as alphanumeric
			break;
		}
	}
	if (client_id == 0) { // arg is assumed to be client number
		client_id = atoi(name);
	} else { // arg is client name
		if (client_id == -1) {
			client_id = G_ClientNumberFromStrippedSubstring(name);
		}
	}
	return client_id;
}

/*
===================
Svcmd_ForceTeam_f

forceteam <player> <team>
===================
*/
void	Svcmd_ForceTeam_f( void ) {
	gclient_t	*cl;
	char		str[MAX_TOKEN_CHARS];

	// find the player
	trap_Argv( 1, str, sizeof( str ) );
	cl = ClientForString( str );
	if ( !cl ) {
		return;
	}

	// set the team
	trap_Argv( 2, str, sizeof( str ) );
	SetTeam( &g_entities[cl - level.clients], str );
}
gclient_t *cl;
int client_id = -1;
char str[MAX_TOKEN_CHARS];
char arg1[MAX_STRING_CHARS];
void Svcmd_Slap(void)
{
	if (!g_gametype.integer == GT_FFA) {
		G_Printf("Can only use Slap command in FFA gametype.\n");
		return;
	}
	if (trap_Argc() != 2) {
		G_Printf("slap <Client Number>\n");
		return; 
	}
	trap_Argv( 1, str, sizeof(str));
	cl = ClientForString(str);
	if (!cl) {
		return;
	}
	trap_Argv( 1, arg1, sizeof(arg1));
	client_id = G_ClientNumberFromArg(arg1);
	if (g_entities[client_id].client->ps.duelInProgress || g_gametype.integer == GT_TOURNAMENT) {
		G_Printf("This client seems to be dueling. You may use the command on the client once they are done.\n");
		return;
	}
	g_entities[client_id].client->ps.forceHandExtend = HANDEXTEND_KNOCKDOWN;
	g_entities[client_id].client->ps.forceDodgeAnim = 0;
	g_entities[client_id].client->ps.velocity[2] = 600;
	g_entities[client_id].client->ps.forceHandExtendTime = level.time + 2400;
	g_entities[client_id].client->ps.quickerGetup = qfalse;
	if (jd_Messages.integer !=0) {
		trap_SendServerCommand(-1, va("print \"%s ^7has been ^5Slapped.\n\"", g_entities[client_id].client->pers.netname));
	}
}
void Svcmd_Sleep(void)
{
	if (!g_gametype.integer == GT_FFA) {
		G_Printf("Can only use Sleep command in FFA gametype.\n");
		return;
	}
	if (trap_Argc() != 2) {
		G_Printf("sleep <Client Number>\n");
		return; 
	}
	trap_Argv( 1, str, sizeof(str));
	cl = ClientForString(str);
	if (!cl) {
		return;
	}
	trap_Argv( 1, arg1, sizeof(arg1));
	client_id = G_ClientNumberFromArg(arg1);
	if (g_entities[client_id].client->ps.duelInProgress || g_gametype.integer == GT_TOURNAMENT) {
		G_Printf("This client seems to be dueling. You may use the command on the client once they are done.\n");
		return;
	}
	//REMOVE
	if (g_entities[client_id].client->pers.Sleep == qtrue) {
		g_entities[client_id].client->pers.Sleep = qfalse;
		g_entities[client_id].client->ps.forceHandExtendTime = 100;
		g_entities[client_id].flags &= ~FL_GODMODE;
		if (jd_Messages.integer !=0) {
			trap_SendServerCommand(-1, va("print\"%s ^7is now ^5Awake.\n\"", g_entities[client_id].client->pers.netname));
		}
	} else {//APPLY
		g_entities[client_id].client->pers.Sleep = qtrue;
		g_entities[client_id].client->ps.forceHandExtend = HANDEXTEND_KNOCKDOWN;
		g_entities[client_id].client->ps.forceDodgeAnim = 0;
		g_entities[client_id].client->ps.forceHandExtendTime = Q3_INFINITE;
		g_entities[client_id].client->ps.quickerGetup = qfalse;
		g_entities[client_id].client->ps.saberHolstered = qtrue;
		g_entities[client_id].flags |= FL_GODMODE;
		if (jd_Messages.integer !=0) {
			trap_SendServerCommand(-1, va("print\"%s ^7has been put to ^5Sleep.\n\"", g_entities[client_id].client->pers.netname));
		}
	}
}

char	*ConcatArgs( int start );

/*
=================
ConsoleCommand

=================
*/
qboolean	ConsoleCommand( void ) {
	char	cmd[MAX_TOKEN_CHARS];

	trap_Argv( 0, cmd, sizeof( cmd ) );

	if ( Q_stricmp (cmd, "entitylist") == 0 ) {
		Svcmd_EntityList_f();
		return qtrue;
	}

	if ( Q_stricmp (cmd, "forceteam") == 0 ) {
		Svcmd_ForceTeam_f();
		return qtrue;
	}

	if (Q_stricmp (cmd, "game_memory") == 0) {
		Svcmd_GameMem_f();
		return qtrue;
	}

	if (Q_stricmp (cmd, "addbot") == 0) {
		Svcmd_AddBot_f();
		return qtrue;
	}

	if (Q_stricmp (cmd, "botlist") == 0) {
		Svcmd_BotList_f();
		return qtrue;
	}

/*	if (Q_stricmp (cmd, "abort_podium") == 0) {
		Svcmd_AbortPodium_f();
		return qtrue;
	}
*/
	if (Q_stricmp (cmd, "addip") == 0) {
		Svcmd_AddIP_f();
		return qtrue;
	}

	if (Q_stricmp (cmd, "removeip") == 0) {
		Svcmd_RemoveIP_f();
		return qtrue;
	}

	if (Q_stricmp (cmd, "listip") == 0) {
		trap_SendConsoleCommand( EXEC_NOW, "g_banIPs\n" );
		return qtrue;
	}
	//JediDog: added these 2 commands
	if (Q_stricmp (cmd, "slap") == 0) {
		Svcmd_Slap();
		return qtrue;
	}
	if (Q_stricmp (cmd, "sleep") == 0) {
		Svcmd_Sleep();
		return qtrue;
	}

	if (g_dedicated.integer) {
		if (Q_stricmp (cmd, "say") == 0) {//JediDog: fixed next line, and added color :)
			trap_SendServerCommand(-1, va("print\"^5[^7Server^5]^7: %s\n\"", ConcatArgs(1)));
			return qtrue;
		}
		if (Q_stricmp (cmd, "csay") == 0) {
			trap_SendServerCommand(-1, va("cp\"%s\n\"", ConcatArgs(1)));
			return qtrue;
		}
		// everything else will also be printed as a say command
		//JediDog: fixed next line, and added color :)
		trap_SendServerCommand(-1, va("print \"^5[^7Server^5]^7: %s\n\"", ConcatArgs(0)));
		return qtrue;
	}

	return qfalse;
}

