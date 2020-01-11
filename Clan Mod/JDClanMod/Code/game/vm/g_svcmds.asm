code
proc StringToFilter 160 8
file "../g_svcmds.c"
line 60
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:// this file holds commands that can be executed by the server console, but not remote clients
;5:
;6:#include "g_local.h"
;7:
;8:
;9:/*
;10:==============================================================================
;11:
;12:PACKET FILTERING
;13: 
;14:
;15:You can add or remove addresses from the filter list with:
;16:
;17:addip <ip>
;18:removeip <ip>
;19:
;20:The ip address is specified in dot format, and any unspecified digits will match any value, so you can specify an entire class C network with "addip 192.246.40".
;21:
;22:Removeip will only remove an address specified exactly the same way.  You cannot addip a subnet, then removeip a single host.
;23:
;24:listip
;25:Prints the current list of filters.
;26:
;27:g_filterban <0 or 1>
;28:
;29:If 1 (the default), then ip addresses matching the current list will be prohibited from entering the game.  This is the default setting.
;30:
;31:If 0, then only addresses matching the list will be allowed.  This lets you easily set up a private game, or a game that only allows players from your local network.
;32:
;33:
;34:==============================================================================
;35:*/
;36:
;37:// extern	vmCvar_t	g_banIPs;
;38:// extern	vmCvar_t	g_filterBan;
;39:
;40:
;41:typedef struct ipFilter_s
;42:{
;43:	unsigned	mask;
;44:	unsigned	compare;
;45:} ipFilter_t;
;46:
;47:#define	MAX_IPFILTERS	1024
;48:
;49:static ipFilter_t	ipFilters[MAX_IPFILTERS];
;50:static int			numIPFilters;
;51:extern int G_ClientNumberFromArg( char *str);
;52:void uwRename(gentity_t *player, const char *newname);
;53:
;54:/*
;55:=================
;56:StringToFilter
;57:=================
;58:*/
;59:static qboolean StringToFilter (char *s, ipFilter_t *f)
;60:{
line 66
;61:	char	num[128];
;62:	int		i, j;
;63:	byte	b[4];
;64:	byte	m[4];
;65:	
;66:	for (i=0 ; i<4 ; i++)
ADDRLP4 132
CNSTI4 0
ASGNI4
LABELV $79
line 67
;67:	{
line 68
;68:		b[i] = 0;
ADDRLP4 132
INDIRI4
ADDRLP4 136
ADDP4
CNSTU1 0
ASGNU1
line 69
;69:		m[i] = 0;
ADDRLP4 132
INDIRI4
ADDRLP4 140
ADDP4
CNSTU1 0
ASGNU1
line 70
;70:	}
LABELV $80
line 66
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 4
LTI4 $79
line 72
;71:	
;72:	for (i=0 ; i<4 ; i++)
ADDRLP4 132
CNSTI4 0
ASGNI4
LABELV $83
line 73
;73:	{
line 74
;74:		if (*s < '0' || *s > '9')
ADDRLP4 144
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 48
LTI4 $89
ADDRLP4 144
INDIRI4
CNSTI4 57
LEI4 $87
LABELV $89
line 75
;75:		{
line 76
;76:			G_Printf( "Bad filter address: %s\n", s );
ADDRGP4 $90
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 77
;77:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $78
JUMPV
LABELV $87
line 80
;78:		}
;79:		
;80:		j = 0;
ADDRLP4 128
CNSTI4 0
ASGNI4
ADDRGP4 $92
JUMPV
LABELV $91
line 82
;81:		while (*s >= '0' && *s <= '9')
;82:		{
line 83
;83:			num[j++] = *s++;
ADDRLP4 148
ADDRLP4 128
INDIRI4
ASGNI4
ADDRLP4 156
CNSTI4 1
ASGNI4
ADDRLP4 128
ADDRLP4 148
INDIRI4
ADDRLP4 156
INDIRI4
ADDI4
ASGNI4
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 152
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
ASGNP4
ADDRLP4 148
INDIRI4
ADDRLP4 0
ADDP4
ADDRLP4 152
INDIRP4
INDIRI1
ASGNI1
line 84
;84:		}
LABELV $92
line 81
ADDRLP4 148
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 48
LTI4 $94
ADDRLP4 148
INDIRI4
CNSTI4 57
LEI4 $91
LABELV $94
line 85
;85:		num[j] = 0;
ADDRLP4 128
INDIRI4
ADDRLP4 0
ADDP4
CNSTI1 0
ASGNI1
line 86
;86:		b[i] = atoi(num);
ADDRLP4 0
ARGP4
ADDRLP4 152
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
ADDRLP4 136
ADDP4
ADDRLP4 152
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 87
;87:		if (b[i] != 0)
ADDRLP4 132
INDIRI4
ADDRLP4 136
ADDP4
INDIRU1
CVUI4 1
CNSTI4 0
EQI4 $95
line 88
;88:			m[i] = 255;
ADDRLP4 132
INDIRI4
ADDRLP4 140
ADDP4
CNSTU1 255
ASGNU1
LABELV $95
line 90
;89:
;90:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $97
line 91
;91:			break;
ADDRGP4 $85
JUMPV
LABELV $97
line 92
;92:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 93
;93:	}
LABELV $84
line 72
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 4
LTI4 $83
LABELV $85
line 95
;94:	
;95:	f->mask = *(unsigned *)m;
ADDRFP4 4
INDIRP4
ADDRLP4 140
INDIRU4
ASGNU4
line 96
;96:	f->compare = *(unsigned *)b;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 136
INDIRU4
ASGNU4
line 98
;97:	
;98:	return qtrue;
CNSTI4 1
RETI4
LABELV $78
endproc StringToFilter 160 8
proc UpdateIPBans 1040 28
line 108
;99:}
;100:
;101:/*
;102:=================
;103:UpdateIPBans
;104:=================
;105:*/
;106://cm NOTE: Updated to put banned ips into a file
;107:static void UpdateIPBans (void)
;108:{
line 114
;109:	byte	b[4];
;110:	int		i;
;111:	char	ipstr[MAX_INFO_STRING];
;112:	fileHandle_t	f;
;113:
;114:	trap_FS_FOpenFile( "banIP.txt", &f, FS_WRITE );
ADDRGP4 $100
ARGP4
ADDRLP4 1032
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 115
;115:	if ( !f )
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $101
line 116
;116:	{
line 117
;117:		trap_Printf( va("BAN Error: file cannot be opened for writing: %s\n", "banIP.txt") );
ADDRGP4 $103
ARGP4
ADDRGP4 $100
ARGP4
ADDRLP4 1036
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 118
;118:		return;
ADDRGP4 $99
JUMPV
LABELV $101
line 120
;119:	}
;120:	for (i = 0 ; i < numIPFilters ; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $107
JUMPV
LABELV $104
line 121
;121:	{
line 122
;122:		if (ipFilters[i].compare == 0xffffffff)
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
CNSTU4 4294967295
NEU4 $108
line 123
;123:			continue;
ADDRGP4 $105
JUMPV
LABELV $108
line 125
;124:
;125:		*(unsigned *)b = ipFilters[i].compare;
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
ASGNU4
line 126
;126:		Com_sprintf( ipstr, sizeof(ipstr), "%i.%i.%i.%i ", b[0], b[1], b[2], b[3]);
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $112
ARGP4
ADDRLP4 0
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 0+1
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 0+2
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 0+3
INDIRU1
CVUI4 1
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 127
;127:		trap_FS_Write( ipstr, strlen(ipstr), f);
ADDRLP4 8
ARGP4
ADDRLP4 1036
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1032
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 128
;128:	}
LABELV $105
line 120
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $107
ADDRLP4 4
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $104
line 129
;129:	trap_FS_FCloseFile( f );
ADDRLP4 1032
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 131
;130:
;131:}
LABELV $99
endproc UpdateIPBans 1040 28
lit
align 1
LABELV $117
char 1 0
char 1 0
char 1 0
char 1 0
export G_FilterPacket
code
proc G_FilterPacket 28 0
line 158
;132:/*static void UpdateIPBans (void)
;133:{
;134:	byte	b[4];
;135:	int		i;
;136:	char	iplist[MAX_INFO_STRING];
;137:
;138:	*iplist = 0;
;139:	for (i = 0 ; i < numIPFilters ; i++)
;140:	{
;141:		if (ipFilters[i].compare == 0xffffffff)
;142:			continue;
;143:
;144:		*(unsigned *)b = ipFilters[i].compare;
;145:		Com_sprintf( iplist + strlen(iplist), sizeof(iplist) - strlen(iplist), 
;146:			"%i.%i.%i.%i ", b[0], b[1], b[2], b[3]);
;147:	}
;148:
;149:	trap_Cvar_Set( "g_banIPs", iplist );
;150:}*/
;151:
;152:/*
;153:=================
;154:G_FilterPacket
;155:=================
;156:*/
;157:qboolean G_FilterPacket (char *from)
;158:{
line 161
;159:	int		i;
;160:	unsigned	in;
;161:	byte m[4] = {'\0','\0','\0','\0'};
ADDRLP4 8
ADDRGP4 $117
INDIRB
ASGNB 4
line 164
;162:	char *p;
;163:
;164:	i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 165
;165:	p = from;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $119
JUMPV
LABELV $118
line 166
;166:	while (*p && i < 4) {
line 167
;167:		m[i] = 0;
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
CNSTU1 0
ASGNU1
ADDRGP4 $122
JUMPV
LABELV $121
line 168
;168:		while (*p >= '0' && *p <= '9') {
line 169
;169:			m[i] = m[i]*10 + (*p - '0');
ADDRLP4 16
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 10
ADDRLP4 16
INDIRP4
INDIRU1
CVUI4 1
MULI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
ADDI4
CVIU4 4
CVUU1 4
ASGNU1
line 170
;170:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 171
;171:		}
LABELV $122
line 168
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 48
LTI4 $124
ADDRLP4 16
INDIRI4
CNSTI4 57
LEI4 $121
LABELV $124
line 172
;172:		if (!*p || *p == ':')
ADDRLP4 20
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $127
ADDRLP4 20
INDIRI4
CNSTI4 58
NEI4 $125
LABELV $127
line 173
;173:			break;
ADDRGP4 $120
JUMPV
LABELV $125
line 174
;174:		i++, p++;
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ASGNP4
line 175
;175:	}
LABELV $119
line 166
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $128
ADDRLP4 4
INDIRI4
CNSTI4 4
LTI4 $118
LABELV $128
LABELV $120
line 177
;176:	
;177:	in = *(unsigned *)m;
ADDRLP4 12
ADDRLP4 8
INDIRU4
ASGNU4
line 179
;178:
;179:	for (i=0 ; i<numIPFilters ; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $132
JUMPV
LABELV $129
line 180
;180:		if ( (in & ipFilters[i].mask) == ipFilters[i].compare)
ADDRLP4 16
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 12
INDIRU4
ADDRLP4 16
INDIRI4
ADDRGP4 ipFilters
ADDP4
INDIRU4
BANDU4
ADDRLP4 16
INDIRI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
NEU4 $133
line 181
;181:			return g_filterBan.integer != 0;
ADDRGP4 g_filterBan+12
INDIRI4
CNSTI4 0
EQI4 $138
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $139
JUMPV
LABELV $138
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $139
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $116
JUMPV
LABELV $133
LABELV $130
line 179
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $132
ADDRLP4 4
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $129
line 183
;182:
;183:	return g_filterBan.integer == 0;
ADDRGP4 g_filterBan+12
INDIRI4
CNSTI4 0
NEI4 $142
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $143
JUMPV
LABELV $142
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $143
ADDRLP4 24
INDIRI4
RETI4
LABELV $116
endproc G_FilterPacket 28 0
export G_CheckMaxConnections
proc G_CheckMaxConnections 76 12
line 187
;184:}
;185:
;186:qboolean G_CheckMaxConnections( char *from )
;187:{ // returns qfalse when # of players on this ip is <= sv_maxConnections or dont care to check
line 188
;188:	int i=0,n=0,count=1;
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 40
CNSTI4 1
ASGNI4
line 193
;189:	int idnum;
;190:	char from2[22];
;191:	gentity_t *ent;
;192:
;193:	if ( !sv_maxConnections.integer ) { // max connections check is disabled //RoAR mod NOTE: Changed.
ADDRGP4 sv_maxConnections+12
INDIRI4
CNSTI4 0
NEI4 $145
line 194
;194:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $144
JUMPV
LABELV $145
line 197
;195:	}
;196:
;197:	if ( g_dedicated.integer == 1 ) { //RoAR mod NOTE: Hosting a local server?
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 1
NEI4 $148
line 198
;198:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $144
JUMPV
LABELV $148
line 201
;199:	}
;200:
;201:	Q_strncpyz(from2, from, sizeof(from2));
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 22
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 202
;202:	n=0;
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 $152
JUMPV
LABELV $151
line 203
;203:	while(++n<strlen(from2))if(from2[n]==':')from2[n]=0;// stip port off of "from"
ADDRLP4 32
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 58
NEI4 $154
ADDRLP4 32
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
LABELV $154
LABELV $152
ADDRLP4 44
ADDRLP4 32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 32
ADDRLP4 44
INDIRI4
ASGNI4
ADDRLP4 4
ARGP4
ADDRLP4 48
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $151
line 205
;204:
;205:	if ( !Q_stricmp(from2, "localhost" ) ) { // localhost doesnt matter
ADDRLP4 4
ARGP4
ADDRGP4 $158
ARGP4
ADDRLP4 52
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $156
line 206
;206:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $144
JUMPV
LABELV $156
line 209
;207:	}
;208:
;209:	if ( !Q_stricmp(from2, "" ) || from2[0] == 0 ) { // bots dont matter either
ADDRLP4 4
ARGP4
ADDRGP4 $161
ARGP4
ADDRLP4 56
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $162
ADDRLP4 4
INDIRI1
CVII4 1
ADDRLP4 60
INDIRI4
NEI4 $159
LABELV $162
line 210
;210:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $144
JUMPV
LABELV $159
line 213
;211:	}
;212:
;213:	for(i =0 ; i < g_maxclients.integer; i++) {
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRGP4 $166
JUMPV
LABELV $163
line 214
;214:		idnum = level.sortedClients[i];
ADDRLP4 36
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
ASGNI4
line 215
;215:		ent = g_entities + idnum;
ADDRLP4 0
CNSTI4 852
ADDRLP4 36
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 217
;216:		
;217:		if ( !ent || !ent->client )
ADDRLP4 68
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 68
INDIRU4
EQU4 $171
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 68
INDIRU4
NEU4 $169
LABELV $171
line 218
;218:			continue;
ADDRGP4 $164
JUMPV
LABELV $169
line 220
;219:			
;220:		if ( ent->client->pers.connected == CON_DISCONNECTED )
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 0
NEI4 $172
line 221
;221:			continue;
ADDRGP4 $164
JUMPV
LABELV $172
line 223
;222:
;223:		if ( Q_stricmp(from2, ent->client->sess.IPstring ) )	// ips are not same so dont count
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1684
ADDP4
ARGP4
ADDRLP4 72
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $174
line 224
;224:			continue;
ADDRGP4 $164
JUMPV
LABELV $174
line 226
;225:
;226:		count++;
ADDRLP4 40
ADDRLP4 40
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 227
;227:	}
LABELV $164
line 213
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $166
ADDRLP4 28
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $163
line 229
;228:
;229:	if ( count > sv_maxConnections.integer ) {
ADDRLP4 40
INDIRI4
ADDRGP4 sv_maxConnections+12
INDIRI4
LEI4 $176
line 230
;230:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $144
JUMPV
LABELV $176
line 233
;231:	}
;232:
;233:	return qfalse;
CNSTI4 0
RETI4
LABELV $144
endproc G_CheckMaxConnections 76 12
export AddIP
proc AddIP 8 8
line 244
;234:}
;235:
;236:/*
;237:=================
;238:AddIP
;239:=================
;240:*/
;241://cm NOTE: Made this a normal void for adding IPs in cmds.c
;242://static void AddIP( char *str )
;243:void AddIP( char *str )
;244:{
line 247
;245:	int		i;
;246:
;247:	for (i = 0 ; i < numIPFilters ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $183
JUMPV
LABELV $180
line 248
;248:		if (ipFilters[i].compare == 0xffffffff)
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
CNSTU4 4294967295
NEU4 $184
line 249
;249:			break;		// free spot
ADDRGP4 $182
JUMPV
LABELV $184
LABELV $181
line 247
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $183
ADDRLP4 0
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $180
LABELV $182
line 250
;250:	if (i == numIPFilters)
ADDRLP4 0
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
NEI4 $187
line 251
;251:	{
line 252
;252:		if (numIPFilters == MAX_IPFILTERS)
ADDRGP4 numIPFilters
INDIRI4
CNSTI4 1024
NEI4 $189
line 253
;253:		{
line 254
;254:			G_Printf ("IP filter list is full\n");
ADDRGP4 $191
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 255
;255:			return;
ADDRGP4 $179
JUMPV
LABELV $189
line 257
;256:		}
;257:		numIPFilters++;
ADDRLP4 4
ADDRGP4 numIPFilters
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 258
;258:	}
LABELV $187
line 260
;259:	
;260:	if (!StringToFilter (str, &ipFilters[i]))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 StringToFilter
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $192
line 261
;261:		ipFilters[i].compare = 0xffffffffu;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
CNSTU4 4294967295
ASGNU4
LABELV $192
line 263
;262:
;263:	UpdateIPBans();
ADDRGP4 UpdateIPBans
CALLV
pop
line 264
;264:}
LABELV $179
endproc AddIP 8 8
proc InitialAddIP 8 8
line 267
;265://cm NOTE: Added to put banned ips into a file
;266:static void InitialAddIP( char *str )
;267:{
line 270
;268:	int		i;
;269:
;270:	for (i = 0 ; i < numIPFilters ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $199
JUMPV
LABELV $196
line 271
;271:		if (ipFilters[i].compare == 0xffffffff)
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
CNSTU4 4294967295
NEU4 $200
line 272
;272:			break;		// free spot
ADDRGP4 $198
JUMPV
LABELV $200
LABELV $197
line 270
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $199
ADDRLP4 0
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $196
LABELV $198
line 273
;273:	if (i == numIPFilters)
ADDRLP4 0
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
NEI4 $203
line 274
;274:	{
line 275
;275:		if (numIPFilters == MAX_IPFILTERS)
ADDRGP4 numIPFilters
INDIRI4
CNSTI4 1024
NEI4 $205
line 276
;276:		{
line 277
;277:			G_Printf ("IP filter list is full\n");
ADDRGP4 $191
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 278
;278:			return;
ADDRGP4 $195
JUMPV
LABELV $205
line 280
;279:		}
;280:		numIPFilters++;
ADDRLP4 4
ADDRGP4 numIPFilters
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 281
;281:	}
LABELV $203
line 283
;282:	
;283:	if (!StringToFilter (str, &ipFilters[i]))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 StringToFilter
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $207
line 284
;284:		ipFilters[i].compare = 0xffffffffu;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
CNSTU4 4294967295
ASGNU4
LABELV $207
line 285
;285:}
LABELV $195
endproc InitialAddIP 8 8
export G_ProcessIPBans
proc G_ProcessIPBans 40 12
line 294
;286:
;287:/*
;288:=================
;289:G_ProcessIPBans
;290:=================
;291:*/
;292://cm NOTE: Updated to put banned ips into a file
;293:void G_ProcessIPBans(void) 
;294:{
line 300
;295:	char *s, *t;
;296:	int len;
;297:	fileHandle_t	f;
;298:	char *buf;
;299:
;300:	numIPFilters = 0;
ADDRGP4 numIPFilters
CNSTI4 0
ASGNI4
line 302
;301:
;302:	len = trap_FS_FOpenFile( "banIP.txt", &f, FS_READ );
ADDRGP4 $100
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 303
;303:	if ( !f )
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $211
line 304
;304:	{
line 305
;305:		trap_Printf( va( "BAN Warning: file cannot be opened for reading: %s\n", "banIP.txt") );
ADDRGP4 $213
ARGP4
ADDRGP4 $100
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 306
;306:		return;
ADDRGP4 $210
JUMPV
LABELV $211
line 308
;307:	}
;308:	if ( !len )
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $214
line 309
;309:	{ //empty file
line 310
;310:		trap_FS_FCloseFile( f );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 311
;311:		return;
ADDRGP4 $210
JUMPV
LABELV $214
line 314
;312:	}
;313:
;314:	if ( (buf = BG_TempAlloc(len+1)) == 0 )
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_TempAlloc
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 24
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $216
line 315
;315:	{//alloc memory for buffer
line 316
;316:		return;
ADDRGP4 $210
JUMPV
LABELV $216
line 318
;317:	}
;318:	trap_FS_Read( buf, len, f );
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 319
;319:	trap_FS_FCloseFile( f );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 321
;320:
;321:	for (t = s = buf; *t; /* */ ) {
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ASGNP4
ADDRGP4 $221
JUMPV
LABELV $218
line 322
;322:		s = strchr(s, ' ');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 32
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 32
INDIRP4
ASGNP4
line 323
;323:		if (!s)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $225
line 324
;324:			break;
ADDRGP4 $220
JUMPV
LABELV $224
line 326
;325:		while (*s == ' ')
;326:			*s++ = 0;
ADDRLP4 36
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI1 0
ASGNI1
LABELV $225
line 325
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $224
line 327
;327:		if (*t)
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $227
line 328
;328:			InitialAddIP( t );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 InitialAddIP
CALLV
pop
LABELV $227
line 329
;329:		t = s;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 330
;330:	}
LABELV $219
line 321
LABELV $221
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $218
LABELV $220
line 331
;331:	BG_TempFree(len+1);
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 BG_TempFree
CALLV
pop
line 332
;332:}
LABELV $210
endproc G_ProcessIPBans 40 12
export Svcmd_AddIP_f
proc Svcmd_AddIP_f 1028 12
line 359
;333:/*void G_ProcessIPBans(void) 
;334:{
;335:	char *s, *t;
;336:	char		str[MAX_TOKEN_CHARS];
;337:
;338:	Q_strncpyz( str, g_banIPs.string, sizeof(str) );
;339:
;340:	for (t = s = g_banIPs.string; *t; ) {
;341:		s = strchr(s, ' ');
;342:		if (!s)
;343:			break;
;344:		while (*s == ' ')
;345:			*s++ = 0;
;346:		if (*t)
;347:			AddIP( t );
;348:		t = s;
;349:	}
;350:}*/
;351:
;352:
;353:/*
;354:=================
;355:Svcmd_AddIP_f
;356:=================
;357:*/
;358:void Svcmd_AddIP_f (void)
;359:{
line 362
;360:	char		str[MAX_TOKEN_CHARS];
;361:
;362:	if ( trap_Argc() < 2 ) {
ADDRLP4 1024
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 2
GEI4 $230
line 363
;363:		G_Printf("Usage:  addip <ip-mask>\n");
ADDRGP4 $232
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 364
;364:		return;
ADDRGP4 $229
JUMPV
LABELV $230
line 367
;365:	}
;366:
;367:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 369
;368:
;369:	AddIP( str );
ADDRLP4 0
ARGP4
ADDRGP4 AddIP
CALLV
pop
line 371
;370:
;371:}
LABELV $229
endproc Svcmd_AddIP_f 1028 12
export Svcmd_RemoveIP_f
proc Svcmd_RemoveIP_f 1048 12
line 379
;372:
;373:/*
;374:=================
;375:Svcmd_RemoveIP_f
;376:=================
;377:*/
;378:void Svcmd_RemoveIP_f (void)
;379:{
line 384
;380:	ipFilter_t	f;
;381:	int			i;
;382:	char		str[MAX_TOKEN_CHARS];
;383:
;384:	if ( trap_Argc() < 2 ) {
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 2
GEI4 $234
line 385
;385:		G_Printf("Usage:  sv removeip <ip-mask>\n");
ADDRGP4 $236
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 386
;386:		return;
ADDRGP4 $233
JUMPV
LABELV $234
line 389
;387:	}
;388:
;389:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 391
;390:
;391:	if (!StringToFilter (str, &f))
ADDRLP4 12
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1040
ADDRGP4 StringToFilter
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $237
line 392
;392:		return;
ADDRGP4 $233
JUMPV
LABELV $237
line 394
;393:
;394:	for (i=0 ; i<numIPFilters ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $242
JUMPV
LABELV $239
line 395
;395:		if (ipFilters[i].mask == f.mask	&&
ADDRLP4 1044
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 1044
INDIRI4
ADDRGP4 ipFilters
ADDP4
INDIRU4
ADDRLP4 4
INDIRU4
NEU4 $243
ADDRLP4 1044
INDIRI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
ADDRLP4 4+4
INDIRU4
NEU4 $243
line 396
;396:			ipFilters[i].compare == f.compare) {
line 397
;397:			ipFilters[i].compare = 0xffffffffu;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
CNSTU4 4294967295
ASGNU4
line 398
;398:			G_Printf ("Removed.\n");
ADDRGP4 $248
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 400
;399:
;400:			UpdateIPBans();
ADDRGP4 UpdateIPBans
CALLV
pop
line 401
;401:			return;
ADDRGP4 $233
JUMPV
LABELV $243
line 403
;402:		}
;403:	}
LABELV $240
line 394
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $242
ADDRLP4 0
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $239
line 405
;404:
;405:	G_Printf ( "Didn't find %s.\n", str );
ADDRGP4 $249
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 406
;406:}
LABELV $233
endproc Svcmd_RemoveIP_f 1048 12
export Svcmd_EntityList_f
proc Svcmd_EntityList_f 16 8
line 413
;407:
;408:/*
;409:===================
;410:Svcmd_EntityList_f
;411:===================
;412:*/
;413:void	Svcmd_EntityList_f (void) {
line 417
;414:	int			e;
;415:	gentity_t		*check;
;416:
;417:	check = g_entities+1;
ADDRLP4 0
ADDRGP4 g_entities+852
ASGNP4
line 418
;418:	for (e = 1; e < level.num_entities ; e++, check++) {
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $255
JUMPV
LABELV $252
line 419
;419:		if ( !check->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $257
line 420
;420:			continue;
ADDRGP4 $253
JUMPV
LABELV $257
line 422
;421:		}
;422:		G_Printf("%3i:", e);
ADDRGP4 $259
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 423
;423:		switch ( check->s.eType ) {
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $260
ADDRLP4 8
INDIRI4
CNSTI4 13
GTI4 $260
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $288
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $288
address $263
address $265
address $267
address $269
address $260
address $260
address $271
address $273
address $275
address $277
address $279
address $281
address $283
address $285
code
LABELV $263
line 425
;424:		case ET_GENERAL:
;425:			G_Printf("ET_GENERAL          ");
ADDRGP4 $264
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 426
;426:			break;
ADDRGP4 $261
JUMPV
LABELV $265
line 428
;427:		case ET_PLAYER:
;428:			G_Printf("ET_PLAYER           ");
ADDRGP4 $266
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 429
;429:			break;
ADDRGP4 $261
JUMPV
LABELV $267
line 431
;430:		case ET_ITEM:
;431:			G_Printf("ET_ITEM             ");
ADDRGP4 $268
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 432
;432:			break;
ADDRGP4 $261
JUMPV
LABELV $269
line 434
;433:		case ET_MISSILE:
;434:			G_Printf("ET_MISSILE          ");
ADDRGP4 $270
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 435
;435:			break;
ADDRGP4 $261
JUMPV
LABELV $271
line 437
;436:		case ET_MOVER:
;437:			G_Printf("ET_MOVER            ");
ADDRGP4 $272
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 438
;438:			break;
ADDRGP4 $261
JUMPV
LABELV $273
line 440
;439:		case ET_BEAM:
;440:			G_Printf("ET_BEAM             ");
ADDRGP4 $274
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 441
;441:			break;
ADDRGP4 $261
JUMPV
LABELV $275
line 443
;442:		case ET_PORTAL:
;443:			G_Printf("ET_PORTAL           ");
ADDRGP4 $276
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 444
;444:			break;
ADDRGP4 $261
JUMPV
LABELV $277
line 446
;445:		case ET_SPEAKER:
;446:			G_Printf("ET_SPEAKER          ");
ADDRGP4 $278
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 447
;447:			break;
ADDRGP4 $261
JUMPV
LABELV $279
line 449
;448:		case ET_PUSH_TRIGGER:
;449:			G_Printf("ET_PUSH_TRIGGER     ");
ADDRGP4 $280
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 450
;450:			break;
ADDRGP4 $261
JUMPV
LABELV $281
line 452
;451:		case ET_TELEPORT_TRIGGER:
;452:			G_Printf("ET_TELEPORT_TRIGGER ");
ADDRGP4 $282
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 453
;453:			break;
ADDRGP4 $261
JUMPV
LABELV $283
line 455
;454:		case ET_INVISIBLE:
;455:			G_Printf("ET_INVISIBLE        ");
ADDRGP4 $284
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 456
;456:			break;
ADDRGP4 $261
JUMPV
LABELV $285
line 458
;457:		case ET_GRAPPLE:
;458:			G_Printf("ET_GRAPPLE          ");
ADDRGP4 $286
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 459
;459:			break;
ADDRGP4 $261
JUMPV
LABELV $260
line 461
;460:		default:
;461:			G_Printf("%3i                 ", check->s.eType);
ADDRGP4 $287
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 462
;462:			break;
LABELV $261
line 465
;463:		}
;464:
;465:		if ( check->classname ) {
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $289
line 466
;466:			G_Printf("%s", check->classname);
ADDRGP4 $291
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 467
;467:		}
LABELV $289
line 468
;468:		G_Printf("\n");
ADDRGP4 $292
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 469
;469:	}
LABELV $253
line 418
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 852
ADDP4
ASGNP4
LABELV $255
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $252
line 470
;470:}
LABELV $250
endproc Svcmd_EntityList_f 16 8
export ClientForString
proc ClientForString 24 8
line 472
;471:
;472:gclient_t	*ClientForString( const char *s ) {
line 478
;473:	gclient_t	*cl;
;474:	int			i;
;475:	int			idnum;
;476:
;477:	// numeric values are just slot numbers
;478:	if ( s[0] >= '0' && s[0] <= '9' ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 48
LTI4 $294
ADDRLP4 12
INDIRI4
CNSTI4 57
GTI4 $294
line 479
;479:		idnum = atoi( s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 480
;480:		if ( idnum < 0 || idnum >= level.maxclients ) {
ADDRLP4 20
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
LTI4 $299
ADDRLP4 20
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $296
LABELV $299
line 481
;481:			Com_Printf( "Bad client slot: %i\n", idnum );
ADDRGP4 $300
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 482
;482:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $293
JUMPV
LABELV $296
line 485
;483:		}
;484:
;485:		cl = &level.clients[idnum];
ADDRLP4 0
CNSTI4 2972
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 486
;486:		if ( cl->pers.connected == CON_DISCONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 0
NEI4 $301
line 487
;487:			G_Printf( "Client %i is not connected\n", idnum );
ADDRGP4 $303
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 488
;488:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $293
JUMPV
LABELV $301
line 490
;489:		}
;490:		return cl;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $293
JUMPV
LABELV $294
line 494
;491:	}
;492:
;493:	// check for a name match
;494:	for ( i=0 ; i < level.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $307
JUMPV
LABELV $304
line 495
;495:		cl = &level.clients[i];
ADDRLP4 0
CNSTI4 2972
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 496
;496:		if ( cl->pers.connected == CON_DISCONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 0
NEI4 $309
line 497
;497:			continue;
ADDRGP4 $305
JUMPV
LABELV $309
line 499
;498:		}
;499:		if ( !Q_stricmp( cl->pers.netname, s ) ) {
ADDRLP4 0
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $311
line 500
;500:			return cl;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $293
JUMPV
LABELV $311
line 502
;501:		}
;502:	}
LABELV $305
line 494
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $307
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $304
line 504
;503:
;504:	G_Printf( "User %s is not on the server\n", s );
ADDRGP4 $313
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 506
;505:
;506:	return NULL;
CNSTP4 0
RETP4
LABELV $293
endproc ClientForString 24 8
export Svcmd_ForceTeam_f
proc Svcmd_ForceTeam_f 1032 12
line 516
;507:}
;508:
;509:/*
;510:===================
;511:Svcmd_ForceTeam_f
;512:
;513:forceteam <player> <team>
;514:===================
;515:*/
;516:void	Svcmd_ForceTeam_f( void ) {
line 521
;517:	gclient_t	*cl;
;518:	char		str[MAX_TOKEN_CHARS];
;519:
;520:	// find the player
;521:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 522
;522:	cl = ClientForString( str );
ADDRLP4 0
ARGP4
ADDRLP4 1028
ADDRGP4 ClientForString
CALLP4
ASGNP4
ADDRLP4 1024
ADDRLP4 1028
INDIRP4
ASGNP4
line 523
;523:	if ( !cl ) {
ADDRLP4 1024
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $315
line 524
;524:		return;
ADDRGP4 $314
JUMPV
LABELV $315
line 528
;525:	}
;526:
;527:	// set the team
;528:	trap_Argv( 2, str, sizeof( str ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 529
;529:	SetTeam( &g_entities[cl - level.clients], str );
CNSTI4 852
ADDRLP4 1024
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2972
DIVI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 530
;530:}
LABELV $314
endproc Svcmd_ForceTeam_f 1032 12
export Svcmd_LockTeam
proc Svcmd_LockTeam 96 12
line 533
;531:
;532:	void	Svcmd_LockTeam( void ) 
;533:	{
line 535
;534:		char teamname[MAX_TEAMNAME];
;535:		if ( g_gametype.integer >= GT_TEAM || g_gametype.integer == GT_FFA ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
GEI4 $322
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
NEI4 $318
LABELV $322
line 537
;536:		
;537:		if ( trap_Argc() != 2 ){
ADDRLP4 32
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 2
EQI4 $323
line 538
;538:			G_Printf("Usage: /lockteam (team)\nTEAMS = Spectator, Blue, Red, Free\n");
ADDRGP4 $325
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 539
;539:			return;
ADDRGP4 $317
JUMPV
LABELV $323
line 541
;540:		}
;541:		trap_Argv( 1, teamname, sizeof( teamname ) );		
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 542
;542:		if ( !Q_stricmp( teamname, "red" ) || !Q_stricmp( teamname, "r" ) ) {
ADDRLP4 0
ARGP4
ADDRGP4 $328
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $330
ADDRLP4 0
ARGP4
ADDRGP4 $329
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $326
LABELV $330
line 543
;543:			if (level.isLockedred == qfalse){
ADDRGP4 level+9096
INDIRI4
CNSTI4 0
NEI4 $331
line 544
;544:			level.isLockedred = qtrue;
ADDRGP4 level+9096
CNSTI4 1
ASGNI4
line 545
;545:			G_LogPrintf("LockTeam admin command executed by SERVER on Red Team. (locking)\n");
ADDRGP4 $335
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 546
;546:			trap_SendServerCommand( -1, va("cp \"^7The ^1Red ^7team is now ^1Locked^7.\n\""));
ADDRGP4 $336
ARGP4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 547
;547:			trap_SendServerCommand( -1, va("print \"^7The ^1Red ^7team is now ^1Locked^7.\n\""));
ADDRGP4 $337
ARGP4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 548
;548:			}
ADDRGP4 $319
JUMPV
LABELV $331
line 549
;549:			else {
line 550
;550:			level.isLockedred = qfalse;
ADDRGP4 level+9096
CNSTI4 0
ASGNI4
line 551
;551:			G_LogPrintf("LockTeam admin command executed by SERVER on Red Team. (unlocking)\n");
ADDRGP4 $339
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 552
;552:			trap_SendServerCommand( -1, va("cp \"^7The ^1Red ^7team is now ^2unLocked^7.\n\""));
ADDRGP4 $340
ARGP4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 553
;553:			trap_SendServerCommand( -1, va("print \"^7The ^1Red ^7team is now ^2unLocked^7.\n\""));
ADDRGP4 $341
ARGP4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 554
;554:			}
line 555
;555:		}
ADDRGP4 $319
JUMPV
LABELV $326
line 556
;556:		else if ( !Q_stricmp( teamname, "blue" ) || !Q_stricmp( teamname, "b" ) ) {
ADDRLP4 0
ARGP4
ADDRGP4 $344
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $346
ADDRLP4 0
ARGP4
ADDRGP4 $345
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $342
LABELV $346
line 557
;557:			if (level.isLockedblue == qfalse){
ADDRGP4 level+9100
INDIRI4
CNSTI4 0
NEI4 $347
line 558
;558:			level.isLockedblue = qtrue;
ADDRGP4 level+9100
CNSTI4 1
ASGNI4
line 559
;559:			G_LogPrintf("LockTeam admin command executed by SERVER on Blue Team. (locking)\n");
ADDRGP4 $351
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 560
;560:			trap_SendServerCommand( -1, va("cp \"^7The ^4Blue ^7team is now ^1Locked^7.\n\""));
ADDRGP4 $352
ARGP4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 561
;561:			trap_SendServerCommand( -1, va("print \"^7The ^4Blue ^7team is now ^1Locked^7.\n\""));
ADDRGP4 $353
ARGP4
ADDRLP4 56
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 562
;562:			}
ADDRGP4 $319
JUMPV
LABELV $347
line 563
;563:			else {
line 564
;564:			level.isLockedblue = qfalse;
ADDRGP4 level+9100
CNSTI4 0
ASGNI4
line 565
;565:			G_LogPrintf("LockTeam admin command executed by SERVER on Blue Team. (unlocking)\n");
ADDRGP4 $355
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 566
;566:			trap_SendServerCommand( -1, va("cp \"^7The ^4Blue ^7team is now ^2unLocked^7.\n\""));
ADDRGP4 $356
ARGP4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 567
;567:			trap_SendServerCommand( -1, va("print \"^7The ^4Blue ^7team is now ^2unLocked^7.\n\""));
ADDRGP4 $357
ARGP4
ADDRLP4 56
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 568
;568:			}
line 569
;569:		}
ADDRGP4 $319
JUMPV
LABELV $342
line 570
;570:		else if( !Q_stricmp( teamname, "spectator" ) || !Q_stricmp( teamname, "s" ) || !Q_stricmp( teamname, "spec" ) || !Q_stricmp( teamname, "spectate" ) ) {
ADDRLP4 0
ARGP4
ADDRGP4 $360
ARGP4
ADDRLP4 52
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $366
ADDRLP4 0
ARGP4
ADDRGP4 $361
ARGP4
ADDRLP4 56
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $366
ADDRLP4 0
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 60
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $366
ADDRLP4 0
ARGP4
ADDRGP4 $363
ARGP4
ADDRLP4 64
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $358
LABELV $366
line 571
;571:			if (level.isLockedspec == qfalse){
ADDRGP4 level+9104
INDIRI4
CNSTI4 0
NEI4 $367
line 572
;572:			level.isLockedspec = qtrue;
ADDRGP4 level+9104
CNSTI4 1
ASGNI4
line 573
;573:			G_LogPrintf("LockTeam admin command executed by SERVER on Spectator Team. (locking)\n");
ADDRGP4 $371
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 574
;574:			trap_SendServerCommand( -1, va("cp \"^7The ^3Spectator ^7team is now ^1Locked^7.\n\""));
ADDRGP4 $372
ARGP4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 575
;575:			trap_SendServerCommand( -1, va("print \"^7The ^3Spectator ^7team is now ^1Locked^7.\n\""));
ADDRGP4 $373
ARGP4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 576
;576:			}
ADDRGP4 $319
JUMPV
LABELV $367
line 577
;577:			else {
line 578
;578:			level.isLockedspec = qfalse;
ADDRGP4 level+9104
CNSTI4 0
ASGNI4
line 579
;579:			G_LogPrintf("LockTeam admin command executed by SERVER on Spectator Team. (locking)\n");
ADDRGP4 $371
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 580
;580:			trap_SendServerCommand( -1, va("cp \"^7The ^3Spectator ^7team is now ^2unLocked^7.\n\""));
ADDRGP4 $375
ARGP4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 581
;581:			trap_SendServerCommand( -1, va("print \"^7The ^3Spectator ^7team is now ^2unLocked^7.\n\""));
ADDRGP4 $376
ARGP4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 582
;582:			}
line 583
;583:		}
ADDRGP4 $319
JUMPV
LABELV $358
line 584
;584:		else if( !Q_stricmp( teamname, "join" ) || !Q_stricmp( teamname, "free" ) || !Q_stricmp( teamname, "enter" )
ADDRLP4 0
ARGP4
ADDRGP4 $379
ARGP4
ADDRLP4 68
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $387
ADDRLP4 0
ARGP4
ADDRGP4 $380
ARGP4
ADDRLP4 72
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $387
ADDRLP4 0
ARGP4
ADDRGP4 $381
ARGP4
ADDRLP4 76
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $387
ADDRLP4 0
ARGP4
ADDRGP4 $382
ARGP4
ADDRLP4 80
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $387
ADDRLP4 0
ARGP4
ADDRGP4 $383
ARGP4
ADDRLP4 84
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $377
LABELV $387
line 585
;585:			 || !Q_stricmp( teamname, "f" ) || !Q_stricmp( teamname, "j" )) {
line 586
;586:			if (level.isLockedjoin == qfalse){
ADDRGP4 level+9108
INDIRI4
CNSTI4 0
NEI4 $388
line 587
;587:			level.isLockedjoin = qtrue;
ADDRGP4 level+9108
CNSTI4 1
ASGNI4
line 588
;588:			G_LogPrintf("LockTeam admin command executed by SERVER on Join Team. (locking)\n");
ADDRGP4 $392
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 589
;589:			trap_SendServerCommand( -1, va("cp \"^7The ^2Join ^7team is now ^1Locked^7.\n\""));
ADDRGP4 $393
ARGP4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 590
;590:			trap_SendServerCommand( -1, va("print \"^7The ^2Join ^7team is now ^1Locked^7.\n\""));
ADDRGP4 $394
ARGP4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 92
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 591
;591:			}
ADDRGP4 $319
JUMPV
LABELV $388
line 592
;592:			else {
line 593
;593:			level.isLockedjoin = qfalse;
ADDRGP4 level+9108
CNSTI4 0
ASGNI4
line 594
;594:			G_LogPrintf("LockTeam admin command executed by SERVER on Join Team. (unlocking)\n");
ADDRGP4 $396
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 595
;595:			trap_SendServerCommand( -1, va("cp \"^7The ^2Join ^7team is now ^2unLocked^7.\n\""));
ADDRGP4 $397
ARGP4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 596
;596:			trap_SendServerCommand( -1, va("print \"^7The ^2Join ^7team is now ^2unLocked^7.\n\""));
ADDRGP4 $398
ARGP4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 92
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 597
;597:			}
line 598
;598:		}
ADDRGP4 $319
JUMPV
LABELV $377
line 599
;599:		else {
line 600
;600:			G_Printf("Usage: /lockteam (team)\nTEAMS = Spectator, Blue, Red, Free\n");
ADDRGP4 $325
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 601
;601:			return;
ADDRGP4 $317
JUMPV
line 603
;602:			}
;603:		}
LABELV $318
line 605
;604:		else
;605:		{
line 606
;606:			G_Printf("You cant lock the teams in this gameplay\n");
ADDRGP4 $399
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 607
;607:			return;
LABELV $319
line 609
;608:		}
;609:	}
LABELV $317
endproc Svcmd_LockTeam 96 12
export Svcmd_Slap
proc Svcmd_Slap 1044 12
line 611
;610:	void	Svcmd_Slap( void )
;611:	{
line 612
;612:		int client_id = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 614
;613:		char arg1[MAX_STRING_CHARS];
;614:		if (g_gametype.integer == GT_TOURNAMENT || g_gametype.integer == GT_TEAM ||
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $413
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
EQI4 $413
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $413
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
EQI4 $413
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $413
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $401
LABELV $413
line 616
;615:				g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY || 
;616:				g_gametype.integer == GT_JEDIMASTER || g_gametype.integer == GT_HOLOCRON) {
line 617
;617:			G_Printf("Cannot use this admin command in this gametype.\n");
ADDRGP4 $414
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 618
;618:			return;
ADDRGP4 $400
JUMPV
LABELV $401
line 620
;619:		}
;620:		if ( trap_Argc() != 2 )
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $415
line 621
;621:		{
line 622
;622:			G_Printf("Usage: /slap (client)\n");
ADDRGP4 $417
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 623
;623:			return; 
ADDRGP4 $400
JUMPV
LABELV $415
line 625
;624:		}
;625:		trap_Argv( 1,  arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 626
;626:		client_id = G_ClientNumberFromArg( arg1 );
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 G_ClientNumberFromArg
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1032
INDIRI4
ASGNI4
line 627
;627:        if (client_id == -1) 
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $418
line 628
;628:        {
line 629
;629:			G_Printf("Can't find client ID\n");
ADDRGP4 $420
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 630
;630:			return;
ADDRGP4 $400
JUMPV
LABELV $418
line 632
;631:        }
;632:        if (client_id == -2) 
ADDRLP4 0
INDIRI4
CNSTI4 -2
NEI4 $421
line 633
;633:        {
line 634
;634:			G_Printf("Ambiguous client ID\n");
ADDRGP4 $423
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 635
;635:			return;
ADDRGP4 $400
JUMPV
LABELV $421
line 637
;636:        }
;637:        if (!g_entities[client_id].inuse) 
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $424
line 638
;638:        {
line 639
;639:			G_Printf("Client is not active\n");
ADDRGP4 $427
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 640
;640:            return; 
ADDRGP4 $400
JUMPV
LABELV $424
line 642
;641:        }
;642:		if (g_entities[client_id].client->ps.duelInProgress){
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $428
line 643
;643:			G_Printf("Client is in a duel\n");
ADDRGP4 $431
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 644
;644:            return;
ADDRGP4 $400
JUMPV
LABELV $428
line 646
;645:		}
;646:		g_entities[client_id].client->ps.forceHandExtend = HANDEXTEND_KNOCKDOWN;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 8
ASGNI4
line 647
;647:		g_entities[client_id].client->ps.forceDodgeAnim = 0;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1260
ADDP4
CNSTI4 0
ASGNI4
line 648
;648:		g_entities[client_id].client->ps.velocity[2] = 600;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1142292480
ASGNF4
line 649
;649:		g_entities[client_id].client->ps.forceHandExtendTime = level.time + 2400;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2400
ADDI4
ASGNI4
line 650
;650:		g_entities[client_id].client->ps.quickerGetup = qfalse;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1264
ADDP4
CNSTI4 0
ASGNI4
line 651
;651:		trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_slap_saying.string ) );
ADDRGP4 $438
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_slap_saying+16
ARGP4
ADDRLP4 1036
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 652
;652:		trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_slap_saying.string ) ); 
ADDRGP4 $441
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_slap_saying+16
ARGP4
ADDRLP4 1040
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 653
;653:	}
LABELV $400
endproc Svcmd_Slap 1044 12
export Svcmd_Slay
proc Svcmd_Slay 1068 20
line 655
;654:	void	Svcmd_Slay( void )
;655:	{
line 656
;656:		int client_id = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 658
;657:		char arg1[MAX_STRING_CHARS];
;658:		if (g_gametype.integer == GT_TOURNAMENT || g_gametype.integer == GT_TEAM ||
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $457
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
EQI4 $457
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $457
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
EQI4 $457
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $457
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $445
LABELV $457
line 660
;659:			g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY || 
;660:			g_gametype.integer == GT_JEDIMASTER || g_gametype.integer == GT_HOLOCRON) {
line 661
;661:				G_Printf("Cannot use this admin command in this gametype.\n");
ADDRGP4 $414
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 662
;662:				return;
ADDRGP4 $444
JUMPV
LABELV $445
line 664
;663:		}
;664:		if ( trap_Argc() != 2 )
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $458
line 665
;665:		{
line 666
;666:			G_Printf("Usage: /slay (client)\n");
ADDRGP4 $460
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 667
;667:			return; 
ADDRGP4 $444
JUMPV
LABELV $458
line 669
;668:		}
;669:		trap_Argv( 1,  arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 670
;670:		client_id = G_ClientNumberFromArg( arg1 );
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 G_ClientNumberFromArg
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1032
INDIRI4
ASGNI4
line 671
;671:        if (client_id == -1) 
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $461
line 672
;672:        {
line 673
;673:			G_Printf("Can't find client ID\n");
ADDRGP4 $420
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 674
;674:            return;
ADDRGP4 $444
JUMPV
LABELV $461
line 676
;675:        }
;676:        if (client_id == -2) 
ADDRLP4 0
INDIRI4
CNSTI4 -2
NEI4 $463
line 677
;677:        {
line 678
;678:			G_Printf("Ambiguous client ID\n");
ADDRGP4 $423
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 679
;679:            return;
ADDRGP4 $444
JUMPV
LABELV $463
line 681
;680:        }
;681:        if (!g_entities[client_id].inuse) 
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $465
line 682
;682:        {
line 683
;683:			G_Printf("Client is not active\n");
ADDRGP4 $427
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 684
;684:            return; 
ADDRGP4 $444
JUMPV
LABELV $465
line 686
;685:        }
;686:		if (g_entities[client_id].client->ps.duelInProgress){
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $468
line 687
;687:			G_Printf("Client is in a duel\n");
ADDRGP4 $431
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 688
;688:            return;
ADDRGP4 $444
JUMPV
LABELV $468
line 690
;689:		}
;690:		if (client_id >= 0 && client_id < MAX_GENTITIES)
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $471
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $471
line 691
;691:			{
line 692
;692:				gentity_t *kEnt = &g_entities[client_id];
ADDRLP4 1040
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 694
;693:
;694:				if (kEnt->inuse && kEnt->client)
ADDRLP4 1040
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $473
ADDRLP4 1040
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $473
line 695
;695:				{
line 696
;696:					g_entities[client_id].flags &= ~FL_GODMODE;
ADDRLP4 1048
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+472
ADDP4
ASGNP4
ADDRLP4 1048
INDIRP4
ADDRLP4 1048
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 697
;697:					g_entities[client_id].client->ps.stats[STAT_HEALTH] = kEnt->health = -999;
ADDRLP4 1052
CNSTI4 -999
ASGNI4
ADDRLP4 1040
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 1052
INDIRI4
ASGNI4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 1052
INDIRI4
ASGNI4
line 698
;698:					player_die (kEnt, kEnt, kEnt, 100000, MOD_SUICIDE);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 35
ARGI4
ADDRGP4 player_die
CALLV
pop
line 699
;699:					G_LogPrintf("Slay admin command executed by SERVER on %s.\n", g_entities[client_id].client->pers.netname);
ADDRGP4 $477
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 700
;700:					trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_slay_saying.string ) );
ADDRGP4 $438
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_slay_saying+16
ARGP4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 701
;701:					trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_slay_saying.string ) ); 
ADDRGP4 $441
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_slay_saying+16
ARGP4
ADDRLP4 1064
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 702
;702:				}
LABELV $473
line 703
;703:			}
LABELV $471
line 704
;704:	}
LABELV $444
endproc Svcmd_Slay 1068 20
export Svcmd_Rename
proc Svcmd_Rename 2068 12
line 706
;705:	void	Svcmd_Rename( void )
;706:	{
line 707
;707:		int client_id = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 710
;708:		char arg1[MAX_STRING_CHARS];
;709:		char arg2[MAX_STRING_CHARS];
;710:		if ( trap_Argc() != 3 )
ADDRLP4 2052
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 2052
INDIRI4
CNSTI4 3
EQI4 $484
line 711
;711:		{
line 712
;712:			G_Printf("Usage: /rename (client) (new name)\n");
ADDRGP4 $486
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 713
;713:			return; 
ADDRGP4 $483
JUMPV
LABELV $484
line 715
;714:		}
;715:		trap_Argv( 1,  arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 716
;716:		client_id = G_ClientNumberFromArg( arg1 );
ADDRLP4 1028
ARGP4
ADDRLP4 2056
ADDRGP4 G_ClientNumberFromArg
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 2056
INDIRI4
ASGNI4
line 717
;717:        if (client_id == -1) 
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $487
line 718
;718:        {
line 719
;719:			G_Printf("Can't find client ID\n");
ADDRGP4 $420
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 720
;720:            return;
ADDRGP4 $483
JUMPV
LABELV $487
line 722
;721:        }
;722:        if (client_id == -2) 
ADDRLP4 0
INDIRI4
CNSTI4 -2
NEI4 $489
line 723
;723:        {
line 724
;724:			G_Printf("Ambiguous client ID\n");
ADDRGP4 $423
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 725
;725:            return;
ADDRGP4 $483
JUMPV
LABELV $489
line 727
;726:        }
;727:        if (!g_entities[client_id].inuse) 
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $491
line 728
;728:        {
line 729
;729:			G_Printf("Client is not active\n");
ADDRGP4 $427
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 730
;730:            return; 
ADDRGP4 $483
JUMPV
LABELV $491
line 732
;731:        }
;732:		trap_Argv( 2, arg2, sizeof( arg2 ) );
CNSTI4 2
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 733
;733:		uwRename(&g_entities[client_id], arg2);
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 uwRename
CALLV
pop
line 734
;734:		trap_SendServerCommand( client_id, va("cp \"^7You've been renamed to\n^7%s\n\"", arg2) );
ADDRGP4 $494
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2060
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2060
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 735
;735:		trap_SendServerCommand( -1, va("print \"%s ^7has been renamed by an admin.\n\"", g_entities[client_id].client->pers.netname ) ); 
ADDRGP4 $495
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 2064
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 736
;736:	}
LABELV $483
endproc Svcmd_Rename 2068 12
export Svcmd_Silence
proc Svcmd_Silence 1044 12
line 738
;737:	void	Svcmd_Silence( void )
;738:	{
line 739
;739:		int client_id = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 741
;740:		char arg1[MAX_STRING_CHARS];
;741:		if ( trap_Argc() != 2 )
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $498
line 742
;742:		{
line 743
;743:			G_Printf("Usage: /silence (client)\n");
ADDRGP4 $500
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 744
;744:			return; 
ADDRGP4 $497
JUMPV
LABELV $498
line 746
;745:		}
;746:		trap_Argv( 1,  arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 747
;747:		client_id = G_ClientNumberFromArg( arg1 );
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 G_ClientNumberFromArg
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1032
INDIRI4
ASGNI4
line 748
;748:        if (client_id == -1) 
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $501
line 749
;749:        {
line 750
;750:			G_Printf("Can't find client ID\n");
ADDRGP4 $420
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 751
;751:            return;
ADDRGP4 $497
JUMPV
LABELV $501
line 753
;752:        }
;753:        if (client_id == -2) 
ADDRLP4 0
INDIRI4
CNSTI4 -2
NEI4 $503
line 754
;754:        {
line 755
;755:			G_Printf("Ambiguous client ID\n");
ADDRGP4 $423
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 756
;756:            return;
ADDRGP4 $497
JUMPV
LABELV $503
line 758
;757:        }
;758:        if (!g_entities[client_id].inuse) 
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $505
line 759
;759:        {
line 760
;760:			G_Printf("Client is not active\n");
ADDRGP4 $427
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 761
;761:            return; 
ADDRGP4 $497
JUMPV
LABELV $505
line 763
;762:        }
;763:		if (g_entities[client_id].client->ps.duelInProgress){
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $508
line 764
;764:			G_Printf("Client is in a duel\n");
ADDRGP4 $431
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 765
;765:            return;
ADDRGP4 $497
JUMPV
LABELV $508
line 767
;766:		}
;767:		if (g_entities[client_id].client->pers.ampunish == qtrue){
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
CNSTI4 1
NEI4 $511
line 768
;768:			G_Printf("Client is currently being punished\n");
ADDRGP4 $514
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 769
;769:            return;
ADDRGP4 $497
JUMPV
LABELV $511
line 771
;770:		}
;771:		if (g_entities[client_id].client->pers.amsilence == qtrue){
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
INDIRI4
CNSTI4 1
NEI4 $515
line 772
;772:			g_entities[client_id].client->pers.amsilence = qfalse;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
CNSTI4 0
ASGNI4
line 773
;773:			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_silence_off_saying.string ) );
ADDRGP4 $438
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_silence_off_saying+16
ARGP4
ADDRLP4 1036
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 774
;774:			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_silence_off_saying.string ) ); 
ADDRGP4 $441
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_silence_off_saying+16
ARGP4
ADDRLP4 1040
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 775
;775:		} else {
ADDRGP4 $516
JUMPV
LABELV $515
line 776
;776:			g_entities[client_id].client->pers.amsilence = qtrue;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
CNSTI4 1
ASGNI4
line 777
;777:			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_silence_on_saying.string ) );
ADDRGP4 $438
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_silence_on_saying+16
ARGP4
ADDRLP4 1036
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 778
;778:			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_silence_on_saying.string ) ); 
ADDRGP4 $441
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_silence_on_saying+16
ARGP4
ADDRLP4 1040
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 779
;779:		}
LABELV $516
line 780
;780:	}
LABELV $497
endproc Svcmd_Silence 1044 12
export Svcmd_Punish
proc Svcmd_Punish 1052 12
line 782
;781:	void	Svcmd_Punish( void )
;782:	{
line 783
;783:		int client_id = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 785
;784:		char arg1[MAX_STRING_CHARS];
;785:		if ( trap_Argc() != 2 )
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $529
line 786
;786:		{
line 787
;787:			G_Printf("Usage: /punish (client)\n");
ADDRGP4 $531
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 788
;788:			return; 
ADDRGP4 $528
JUMPV
LABELV $529
line 790
;789:		}
;790:		trap_Argv( 1,  arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 791
;791:		client_id = G_ClientNumberFromArg( arg1 );
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 G_ClientNumberFromArg
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1032
INDIRI4
ASGNI4
line 792
;792:        if (client_id == -1) 
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $532
line 793
;793:        {
line 794
;794:			G_Printf("Can't find client ID\n");
ADDRGP4 $420
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 795
;795:            return;
ADDRGP4 $528
JUMPV
LABELV $532
line 797
;796:        }
;797:        if (client_id == -2) 
ADDRLP4 0
INDIRI4
CNSTI4 -2
NEI4 $534
line 798
;798:        {
line 799
;799:			G_Printf("Ambiguous client ID\n");
ADDRGP4 $423
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 800
;800:            return;
ADDRGP4 $528
JUMPV
LABELV $534
line 802
;801:        }
;802:        if (!g_entities[client_id].inuse) 
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $536
line 803
;803:        {
line 804
;804:			G_Printf("Client is not active\n");
ADDRGP4 $427
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 805
;805:            return; 
ADDRGP4 $528
JUMPV
LABELV $536
line 807
;806:        }
;807:		if (g_entities[client_id].client->ps.duelInProgress){
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $539
line 808
;808:			G_Printf("Client is in a duel\n");
ADDRGP4 $431
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 809
;809:            return;
ADDRGP4 $528
JUMPV
LABELV $539
line 812
;810:		}
;811:		//REMOVE
;812:		if (g_entities[client_id].client->pers.ampunish == qtrue){
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
CNSTI4 1
NEI4 $542
line 813
;813:			g_entities[client_id].client->pers.ampunish = qfalse;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
CNSTI4 0
ASGNI4
line 814
;814:			g_entities[client_id].client->ps.pm_type &= ~PM_FLOAT;
ADDRLP4 1036
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 1036
INDIRP4
ADDRLP4 1036
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 815
;815:			g_entities[client_id].flags &= ~FL_GODMODE;
ADDRLP4 1040
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+472
ADDP4
ASGNP4
ADDRLP4 1040
INDIRP4
ADDRLP4 1040
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 816
;816:			g_entities[client_id].client->ps.weaponTime = 0;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 817
;817:			g_entities[client_id].client->ps.forceRestricted = qfalse;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 608
ADDP4
CNSTI4 0
ASGNI4
line 818
;818:			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_punish_off_saying.string ) );
ADDRGP4 $438
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_punish_off_saying+16
ARGP4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 819
;819:			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_punish_off_saying.string ) ); 
ADDRGP4 $441
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_punish_off_saying+16
ARGP4
ADDRLP4 1048
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 821
;820:		//APPLY
;821:		} else {
ADDRGP4 $543
JUMPV
LABELV $542
line 822
;822:			g_entities[client_id].client->pers.ampunish = qtrue;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
CNSTI4 1
ASGNI4
line 823
;823:			g_entities[client_id].client->pers.amsilence = qfalse;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
CNSTI4 0
ASGNI4
line 824
;824:			g_entities[client_id].flags |= FL_GODMODE;
ADDRLP4 1036
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+472
ADDP4
ASGNP4
ADDRLP4 1036
INDIRP4
ADDRLP4 1036
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 825
;825:			g_entities[client_id].client->ps.forceRestricted = qtrue;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 608
ADDP4
CNSTI4 1
ASGNI4
line 826
;826:			g_entities[client_id].client->ps.saberHolstered = qtrue;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1312
ADDP4
CNSTI4 1
ASGNI4
line 827
;827:			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_punish_on_saying.string ) );
ADDRGP4 $438
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_punish_on_saying+16
ARGP4
ADDRLP4 1040
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 828
;828:			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_punish_on_saying.string ) ); 
ADDRGP4 $441
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_punish_on_saying+16
ARGP4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 829
;829:		}
LABELV $543
line 830
;830:	}
LABELV $528
endproc Svcmd_Punish 1052 12
export Svcmd_CSprint
proc Svcmd_CSprint 2080 12
line 833
;831:	char	*ConcatArgs( int start );
;832:	void	Svcmd_CSprint( void )
;833:	{
line 834
;834:		int client_id = -1;
ADDRLP4 1032
CNSTI4 -1
ASGNI4
line 836
;835:		char arg[MAX_STRING_CHARS];
;836:		int pos = 0;
ADDRLP4 1028
CNSTI4 0
ASGNI4
line 838
;837:		char real_msg[MAX_STRING_CHARS];
;838:		char *msg = ConcatArgs(2); 
CNSTI4 2
ARGI4
ADDRLP4 2060
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2060
INDIRP4
ASGNP4
ADDRGP4 $565
JUMPV
LABELV $564
line 839
;839:		while(*msg) { 
line 840
;840:			if(msg[0] == '\\' && msg[1] == 'n') { 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $567
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 110
NEI4 $567
line 841
;841:				msg++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 842
;842:				real_msg[pos++] = '\n'; 
ADDRLP4 2068
ADDRLP4 1028
INDIRI4
ASGNI4
ADDRLP4 1028
ADDRLP4 2068
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 2068
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 10
ASGNI1
line 843
;843:			} else { 
ADDRGP4 $568
JUMPV
LABELV $567
line 844
;844:				real_msg[pos++] = *msg;
ADDRLP4 2068
ADDRLP4 1028
INDIRI4
ASGNI4
ADDRLP4 1028
ADDRLP4 2068
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 2068
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
line 845
;845:			} 
LABELV $568
line 846
;846:				msg++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 847
;847:		}
LABELV $565
line 839
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $564
line 848
;848:		real_msg[pos] = 0;
ADDRLP4 1028
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 849
;849:		trap_Argv(1, arg, sizeof(arg));
CNSTI4 1
ARGI4
ADDRLP4 1036
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 850
;850:		if(Q_stricmp(arg, "all") == 0)
ADDRLP4 1036
ARGP4
ADDRGP4 $571
ARGP4
ADDRLP4 2064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2064
INDIRI4
CNSTI4 0
NEI4 $569
line 851
;851:		{
line 852
;852:			trap_SendServerCommand( -1, va("cp \"%s\"", real_msg) );
ADDRGP4 $572
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2068
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2068
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 853
;853:			return;
ADDRGP4 $563
JUMPV
LABELV $569
line 855
;854:		}
;855:		client_id = G_ClientNumberFromArg( arg );
ADDRLP4 1036
ARGP4
ADDRLP4 2068
ADDRGP4 G_ClientNumberFromArg
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 2068
INDIRI4
ASGNI4
line 856
;856:		if ( trap_Argc() <= 2 )
ADDRLP4 2072
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 2072
INDIRI4
CNSTI4 2
GTI4 $573
line 857
;857:		{ 
line 858
;858:			G_Printf ( "Usage: ^3/csprint (client) (message)\n/csprint all (message)\n", arg ); 
ADDRGP4 $575
ARGP4
ADDRLP4 1036
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 859
;859:			return; 
ADDRGP4 $563
JUMPV
LABELV $573
line 861
;860:		}
;861:		if (client_id == -1) 
ADDRLP4 1032
INDIRI4
CNSTI4 -1
NEI4 $576
line 862
;862:        { 
line 863
;863:           G_Printf ( "Can't find client ID for %s\n", arg ); 
ADDRGP4 $578
ARGP4
ADDRLP4 1036
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 864
;864:           return; 
ADDRGP4 $563
JUMPV
LABELV $576
line 866
;865:        } 
;866:        if (client_id == -2) 
ADDRLP4 1032
INDIRI4
CNSTI4 -2
NEI4 $579
line 867
;867:        { 
line 868
;868:           G_Printf ( "Ambiguous client ID for %s\n", arg ); 
ADDRGP4 $581
ARGP4
ADDRLP4 1036
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 869
;869:           return; 
ADDRGP4 $563
JUMPV
LABELV $579
line 871
;870:        }
;871:        if (!g_entities[client_id].inuse) 
CNSTI4 852
ADDRLP4 1032
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $582
line 872
;872:        {
line 873
;873:           G_Printf ( "Client %s is not active\n", arg ); 
ADDRGP4 $585
ARGP4
ADDRLP4 1036
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 874
;874:           return; 
ADDRGP4 $563
JUMPV
LABELV $582
line 876
;875:        }
;876:		trap_SendServerCommand(client_id, va("cp \"%s\"", real_msg) );
ADDRGP4 $572
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2076
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRI4
ARGI4
ADDRLP4 2076
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 877
;877:	}
LABELV $563
endproc Svcmd_CSprint 2080 12
export Svcmd_ChangeMode
proc Svcmd_ChangeMode 1068 12
line 879
;878:	void	Svcmd_ChangeMode( void )
;879:	{
line 883
;880:		int i;
;881:		char arg[MAX_STRING_CHARS];
;882:		gentity_t * targetplayer;
;883:		trap_Argv(1, arg, sizeof(arg));
CNSTI4 1
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 884
;884:		if ( trap_Argc() < 2 )
ADDRLP4 1032
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 2
GEI4 $587
line 885
;885:		{ 
line 886
;886:			G_Printf("Usage: /changemode (mode)\nmodes = clanmatch clanmeeting\n");
ADDRGP4 $589
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 887
;887:			return; 
ADDRGP4 $586
JUMPV
LABELV $587
line 889
;888:		}
;889:		if ( !Q_stricmp( arg, "clanmeeting" ) || !Q_stricmp( arg, "meeting" ) ) {
ADDRLP4 8
ARGP4
ADDRGP4 $592
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
EQI4 $594
ADDRLP4 8
ARGP4
ADDRGP4 $593
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $590
LABELV $594
line 890
;890:			if ( g_gametype.integer != GT_FFA ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
EQI4 $595
line 891
;891:				G_Printf("ClanMeeting mode can only be used during FFA gametype.\n");
ADDRGP4 $598
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 892
;892:				return;
ADDRGP4 $586
JUMPV
LABELV $595
line 894
;893:			}
;894:			if ((level.matchMode == qfalse) && (level.meetingMode == qfalse)){
ADDRLP4 1044
CNSTI4 0
ASGNI4
ADDRGP4 level+9116
INDIRI4
ADDRLP4 1044
INDIRI4
NEI4 $599
ADDRGP4 level+9112
INDIRI4
ADDRLP4 1044
INDIRI4
NEI4 $599
line 895
;895:				level.meetingMode = qtrue;
ADDRGP4 level+9112
CNSTI4 1
ASGNI4
line 896
;896:				G_LogPrintf("ChangeMode admin command executed by SERVER. (START: ClanMeeting)\n");
ADDRGP4 $604
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 897
;897:				trap_SendServerCommand( -1, va("cp \"^7A ^3clan meeting^7 has begun!\n\""));
ADDRGP4 $605
ARGP4
ADDRLP4 1048
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 898
;898:				trap_SendServerCommand( -1, va("print \"^7A ^3clan meeting^7 has begun!\n\""));
ADDRGP4 $606
ARGP4
ADDRLP4 1052
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 899
;899:			} else if (level.meetingMode == qtrue) {
ADDRGP4 $591
JUMPV
LABELV $599
ADDRGP4 level+9112
INDIRI4
CNSTI4 1
NEI4 $607
line 900
;900:				level.meetingMode = qfalse;
ADDRGP4 level+9112
CNSTI4 0
ASGNI4
line 901
;901:				for( i = 0; i < level.maxclients; i++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $614
JUMPV
LABELV $611
line 902
;902:					{
line 903
;903:						targetplayer = &g_entities[i];
ADDRLP4 0
CNSTI4 852
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 904
;904:						if( targetplayer->client && targetplayer->client->pers.connected ){
ADDRLP4 1048
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1048
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $616
ADDRLP4 1048
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 0
EQI4 $616
line 905
;905:							targetplayer->client->ps.forceRestricted = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 608
ADDP4
CNSTI4 0
ASGNI4
line 906
;906:						}
LABELV $616
line 907
;907:					}
LABELV $612
line 901
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $614
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $611
line 908
;908:				trap_SendServerCommand( -1, va("cp \"^7The ^1clan meeting^7 has stopped!\n\""));
ADDRGP4 $618
ARGP4
ADDRLP4 1048
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 909
;909:				trap_SendServerCommand( -1, va("print \"^7The ^1clan meeting^7 has stopped!\n\""));
ADDRGP4 $619
ARGP4
ADDRLP4 1052
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 910
;910:			} else {
ADDRGP4 $591
JUMPV
LABELV $607
line 911
;911:				G_Printf("A mode is already enabled\n");
ADDRGP4 $620
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 912
;912:				return;
ADDRGP4 $586
JUMPV
line 914
;913:			}
;914:		}
LABELV $590
line 915
;915:	else if ( !Q_stricmp( arg, "clanmatch" ) || !Q_stricmp( arg, "match" ) ) {
ADDRLP4 8
ARGP4
ADDRGP4 $623
ARGP4
ADDRLP4 1044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $625
ADDRLP4 8
ARGP4
ADDRGP4 $624
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $621
LABELV $625
line 916
;916:			if ( g_gametype.integer != GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
EQI4 $626
line 917
;917:				G_Printf("ClanMatch mode can only be used during TFFA gametype.\n");
ADDRGP4 $629
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 918
;918:				return;
ADDRGP4 $586
JUMPV
LABELV $626
line 920
;919:			}
;920:			if ((level.matchMode == qfalse) && (level.meetingMode == qfalse)){
ADDRLP4 1052
CNSTI4 0
ASGNI4
ADDRGP4 level+9116
INDIRI4
ADDRLP4 1052
INDIRI4
NEI4 $630
ADDRGP4 level+9112
INDIRI4
ADDRLP4 1052
INDIRI4
NEI4 $630
line 921
;921:				level.matchMode = qtrue;
ADDRGP4 level+9116
CNSTI4 1
ASGNI4
line 922
;922:				G_LogPrintf("ChangeMode admin command executed by SERVER. (START: ClanMatch)\n");
ADDRGP4 $635
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 923
;923:				trap_SendServerCommand( -1, va("cp \"^7A ^3clan match^7 has begun!\n\""));
ADDRGP4 $636
ARGP4
ADDRLP4 1056
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 924
;924:				trap_SendServerCommand( -1, va("print \"^7A ^3clan match^7 has begun!\n\""));
ADDRGP4 $637
ARGP4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 925
;925:			} else if (level.matchMode == qtrue) {
ADDRGP4 $631
JUMPV
LABELV $630
ADDRGP4 level+9116
INDIRI4
CNSTI4 1
NEI4 $638
line 926
;926:				level.matchMode = qfalse;
ADDRGP4 level+9116
CNSTI4 0
ASGNI4
line 927
;927:				for( i = 0; i < level.maxclients; i++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $645
JUMPV
LABELV $642
line 928
;928:					{
line 929
;929:						targetplayer = &g_entities[i];
ADDRLP4 0
CNSTI4 852
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 930
;930:						if( targetplayer->client && targetplayer->client->pers.connected && targetplayer->r.svFlags & SVF_BOT ){
ADDRLP4 1060
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1060
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $647
ADDRLP4 1064
CNSTI4 0
ASGNI4
ADDRLP4 1060
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
ADDRLP4 1064
INDIRI4
EQI4 $647
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 1064
INDIRI4
EQI4 $647
line 931
;931:								SetTeam(targetplayer, "free" );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $380
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 932
;932:						}
LABELV $647
line 933
;933:					}
LABELV $643
line 927
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $645
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $642
line 934
;934:				trap_SendServerCommand( -1, va("cp \"^7The ^1clan match^7 has stopped!\n\""));
ADDRGP4 $649
ARGP4
ADDRLP4 1056
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 935
;935:				trap_SendServerCommand( -1, va("print \"^7The ^1clan match^7 has stopped!\n\""));
ADDRGP4 $650
ARGP4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 936
;936:			}
ADDRGP4 $639
JUMPV
LABELV $638
line 937
;937:			else {
line 938
;938:				G_Printf("A mode is already enabled\n");
ADDRGP4 $620
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 939
;939:				return;
LABELV $639
LABELV $631
line 941
;940:			}
;941:		}
LABELV $621
LABELV $591
line 942
;942:	}
LABELV $586
endproc Svcmd_ChangeMode 1068 12
export Svcmd_Sleep
proc Svcmd_Sleep 1048 12
line 944
;943:	void	Svcmd_Sleep( void )
;944:	{
line 945
;945:		int client_id = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 947
;946:		char arg1[MAX_STRING_CHARS];
;947:		if ( trap_Argc() != 2 )
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $652
line 948
;948:		{
line 949
;949:			G_Printf("Usage: /sleep (client)\n");
ADDRGP4 $654
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 950
;950:			return; 
ADDRGP4 $651
JUMPV
LABELV $652
line 952
;951:		}
;952:		trap_Argv( 1,  arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 953
;953:		client_id = G_ClientNumberFromArg( arg1 );
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 G_ClientNumberFromArg
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1032
INDIRI4
ASGNI4
line 954
;954:        if (client_id == -1) 
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $655
line 955
;955:        {
line 956
;956:			G_Printf("Can't find client\n");
ADDRGP4 $657
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 957
;957:            return;
ADDRGP4 $651
JUMPV
LABELV $655
line 959
;958:        }
;959:        if (client_id == -2) 
ADDRLP4 0
INDIRI4
CNSTI4 -2
NEI4 $658
line 960
;960:        {
line 961
;961:			G_Printf("Ambiguous client ID\n");
ADDRGP4 $423
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 962
;962:            return;
ADDRGP4 $651
JUMPV
LABELV $658
line 964
;963:        }
;964:        if (!g_entities[client_id].inuse) 
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $660
line 965
;965:        {
line 966
;966:			G_Printf("Client is not active\n");
ADDRGP4 $427
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 967
;967:            return; 
ADDRGP4 $651
JUMPV
LABELV $660
line 969
;968:        }
;969:		if (g_entities[client_id].client->ps.duelInProgress){
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $663
line 970
;970:			G_Printf("Client is in a duel\n");
ADDRGP4 $431
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 971
;971:            return;
ADDRGP4 $651
JUMPV
LABELV $663
line 974
;972:		}
;973:		//REMOVE
;974:		if (g_entities[client_id].client->pers.amsleep == qtrue){
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1548
ADDP4
INDIRI4
CNSTI4 1
NEI4 $666
line 975
;975:			g_entities[client_id].client->pers.amsleep = qfalse;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1548
ADDP4
CNSTI4 0
ASGNI4
line 976
;976:			g_entities[client_id].client->ps.forceHandExtendTime = 100;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
CNSTI4 100
ASGNI4
line 977
;977:			g_entities[client_id].flags &= ~FL_GODMODE;
ADDRLP4 1036
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+472
ADDP4
ASGNP4
ADDRLP4 1036
INDIRP4
ADDRLP4 1036
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 978
;978:			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_sleep_off_saying.string ) );
ADDRGP4 $438
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_sleep_off_saying+16
ARGP4
ADDRLP4 1040
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 979
;979:			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_sleep_off_saying.string ) ); 
ADDRGP4 $441
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_sleep_off_saying+16
ARGP4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 981
;980:		//APPLY
;981:		} else {
ADDRGP4 $667
JUMPV
LABELV $666
line 982
;982:			g_entities[client_id].client->pers.amsleep = qtrue;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1548
ADDP4
CNSTI4 1
ASGNI4
line 983
;983:			g_entities[client_id].client->ps.forceHandExtend = HANDEXTEND_KNOCKDOWN;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 8
ASGNI4
line 984
;984:			g_entities[client_id].client->ps.forceDodgeAnim = 0;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1260
ADDP4
CNSTI4 0
ASGNI4
line 985
;985:			g_entities[client_id].client->ps.forceHandExtendTime = Q3_INFINITE;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
CNSTI4 16777216
ASGNI4
line 986
;986:			g_entities[client_id].client->ps.quickerGetup = qfalse;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1264
ADDP4
CNSTI4 0
ASGNI4
line 987
;987:			g_entities[client_id].client->ps.saberHolstered = qtrue;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1312
ADDP4
CNSTI4 1
ASGNI4
line 988
;988:			g_entities[client_id].flags |= FL_GODMODE;
ADDRLP4 1036
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+472
ADDP4
ASGNP4
ADDRLP4 1036
INDIRP4
ADDRLP4 1036
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 989
;989:			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_sleep_on_saying.string ) );
ADDRGP4 $438
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_sleep_on_saying+16
ARGP4
ADDRLP4 1040
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 990
;990:			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_sleep_on_saying.string ) ); 
ADDRGP4 $441
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_sleep_on_saying+16
ARGP4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 991
;991:		}
LABELV $667
line 992
;992:	}
LABELV $651
endproc Svcmd_Sleep 1048 12
export Svcmd_Empower
proc Svcmd_Empower 1080 20
line 994
;993:	void	Svcmd_Empower( void )
;994:	{
line 997
;995:		int f, i;
;996:		vec3_t v;
;997:		int client_id = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 999
;998:		char arg1[MAX_STRING_CHARS];
;999:		if (g_gametype.integer == GT_TOURNAMENT || g_gametype.integer == GT_TEAM ||
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $700
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
EQI4 $700
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $700
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
EQI4 $700
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $700
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $688
LABELV $700
line 1001
;1000:			g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY || 
;1001:			g_gametype.integer == GT_JEDIMASTER || g_gametype.integer == GT_HOLOCRON) {
line 1002
;1002:				G_Printf("Cannot use this admin command in this gametype.\n");
ADDRGP4 $414
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1003
;1003:				return;
ADDRGP4 $687
JUMPV
LABELV $688
line 1005
;1004:		}
;1005:		if ( trap_Argc() > 2 )
ADDRLP4 1048
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 2
LEI4 $701
line 1006
;1006:		{ 
line 1007
;1007:			G_Printf("Usage: /empower (client)\n");
ADDRGP4 $703
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1008
;1008:			return; 
ADDRGP4 $687
JUMPV
LABELV $701
line 1010
;1009:		}
;1010:		trap_Argv( 1,  arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1011
;1011:		client_id = G_ClientNumberFromArg( arg1 );
ADDRLP4 12
ARGP4
ADDRLP4 1052
ADDRGP4 G_ClientNumberFromArg
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1052
INDIRI4
ASGNI4
line 1012
;1012:        if (client_id == -1) 
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $704
line 1013
;1013:        {
line 1014
;1014:			G_Printf("Can't find client ID\n");
ADDRGP4 $420
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1015
;1015:            return;
ADDRGP4 $687
JUMPV
LABELV $704
line 1017
;1016:        }
;1017:        if (client_id == -2) 
ADDRLP4 0
INDIRI4
CNSTI4 -2
NEI4 $706
line 1018
;1018:        {
line 1019
;1019:			G_Printf("Ambiguous client ID\n");
ADDRGP4 $423
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1020
;1020:            return;
ADDRGP4 $687
JUMPV
LABELV $706
line 1022
;1021:        }
;1022:        if (!g_entities[client_id].inuse) 
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $708
line 1023
;1023:        {
line 1024
;1024:			G_Printf("Client is not active\n");
ADDRGP4 $427
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1025
;1025:            return; 
ADDRGP4 $687
JUMPV
LABELV $708
line 1027
;1026:        }
;1027:		if (g_entities[client_id].client->ps.duelInProgress){
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $711
line 1028
;1028:			G_Printf("Client is in a duel\n");
ADDRGP4 $431
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1029
;1029:            return;
ADDRGP4 $687
JUMPV
LABELV $711
line 1032
;1030:		}
;1031:		//REMOVE
;1032:		if (g_entities[client_id].client->pers.amempower == qtrue)
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 1
NEI4 $714
line 1033
;1033:		{
line 1034
;1034:			g_entities[client_id].client->ps.isJediMaster = qfalse;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 0
ASGNI4
line 1035
;1035:			g_entities[client_id].client->pers.amempower = qfalse;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
CNSTI4 0
ASGNI4
line 1036
;1036:			for( f = 0; f < NUM_FORCE_POWERS; f ++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $719
line 1037
;1037:				g_entities[client_id].client->ps.fd.forcePowerLevel[f] = g_entities[client_id].client->pers.forcePowerLevelSaved[f];
ADDRLP4 1056
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1060
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1056
INDIRI4
ADDRLP4 1060
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
ADDRLP4 1056
INDIRI4
ADDRLP4 1060
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1560
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1038
;1038:			}
LABELV $720
line 1036
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 18
LTI4 $719
line 1039
;1039:			g_entities[client_id].client->ps.fd.forcePowersKnown = g_entities[client_id].client->pers.forcePowersKnownSaved;
ADDRLP4 1056
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1056
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ADDRLP4 1056
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1556
ADDP4
INDIRI4
ASGNI4
line 1040
;1040:			G_LogPrintf("Empower admin command executed by SERVER on %s. (removing)\n", g_entities[client_id].client->pers.netname);
ADDRGP4 $727
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1041
;1041:			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_empower_off_saying.string ) );
ADDRGP4 $438
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_empower_off_saying+16
ARGP4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1042
;1042:			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_empower_off_saying.string ) );
ADDRGP4 $441
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_empower_off_saying+16
ARGP4
ADDRLP4 1064
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1043
;1043:		}
ADDRGP4 $715
JUMPV
LABELV $714
line 1045
;1044:		//APPLY
;1045:		else {
line 1046
;1046:			G_PlayEffect(EFFECT_SMOKE, g_entities[client_id].r.currentOrigin, v);
CNSTI4 1
ARGI4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+296+72
ADDP4
ARGP4
ADDRLP4 1036
ARGP4
ADDRGP4 G_PlayEffect
CALLP4
pop
line 1047
;1047:			G_ScreenShake(g_entities[client_id].client->ps.origin, NULL, 10.0f, 800, qtrue);
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTF4 1092616192
ARGF4
CNSTI4 800
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_ScreenShake
CALLP4
pop
line 1048
;1048:			G_LogPrintf("Empower admin command executed by SERVER on %s. (applying)\n", g_entities[client_id].client->pers.netname);
ADDRGP4 $736
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1049
;1049:			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_empower_on_saying.string ) );
ADDRGP4 $438
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_empower_on_saying+16
ARGP4
ADDRLP4 1056
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1050
;1050:			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_empower_on_saying.string ) ); 
ADDRGP4 $441
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_empower_on_saying+16
ARGP4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1051
;1051:			g_entities[client_id].client->pers.amempower = qtrue;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
CNSTI4 1
ASGNI4
line 1052
;1052:			g_entities[client_id].client->ps.isJediMaster = qtrue;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 1
ASGNI4
line 1053
;1053:			for( f = 0; f < NUM_FORCE_POWERS; f ++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $744
line 1054
;1054:				g_entities[client_id].client->pers.forcePowerLevelSaved[f] = g_entities[client_id].client->ps.fd.forcePowerLevel[f];
ADDRLP4 1064
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1068
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1064
INDIRI4
ADDRLP4 1068
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1560
ADDP4
ADDP4
ADDRLP4 1064
INDIRI4
ADDRLP4 1068
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1055
;1055:				g_entities[client_id].client->ps.fd.forcePowerLevel[f] = FORCE_LEVEL_3;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
CNSTI4 3
ASGNI4
line 1056
;1056:			}
LABELV $745
line 1053
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 18
LTI4 $744
line 1057
;1057:			g_entities[client_id].client->pers.forcePowersKnownSaved = g_entities[client_id].client->ps.fd.forcePowersKnown;
ADDRLP4 1064
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1064
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1556
ADDP4
ADDRLP4 1064
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
ASGNI4
line 1058
;1058:			if ( g_gametype.integer >= GT_TEAM) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $753
line 1059
;1059:				g_entities[client_id].client->ps.fd.forcePowersKnown = ( 1 << FP_HEAL | 1 << FP_SPEED | 1 << FP_PUSH | 1 << FP_PULL | 
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
CNSTI4 32765
ASGNI4
line 1063
;1060:												1 << FP_TELEPATHY | 1 << FP_GRIP | 1 << FP_LIGHTNING | 1 << FP_RAGE | 
;1061:												1 << FP_PROTECT | 1 << FP_ABSORB | 1 << FP_TEAM_HEAL | 1 << FP_TEAM_FORCE | 
;1062:												1 << FP_DRAIN | 1 << FP_SEE);
;1063:			}
ADDRGP4 $754
JUMPV
LABELV $753
line 1064
;1064:			else{
line 1065
;1065:				g_entities[client_id].client->ps.fd.forcePowersKnown = ( 1 << FP_HEAL | 1 << FP_SPEED | 1 << FP_PUSH | 1 << FP_PULL | 
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
CNSTI4 26621
ASGNI4
line 1068
;1066:												1 << FP_TELEPATHY | 1 << FP_GRIP | 1 << FP_LIGHTNING | 1 << FP_RAGE | 
;1067:												1 << FP_PROTECT | 1 << FP_ABSORB | 1 << FP_DRAIN | 1 << FP_SEE);
;1068:			}
LABELV $754
line 1069
;1069:			for( i = 0; i < NUM_FORCE_POWERS; i ++ ){
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $758
line 1070
;1070:				g_entities[client_id].client->ps.fd.forcePowerLevel[i] = FORCE_LEVEL_3;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
CNSTI4 3
ASGNI4
line 1071
;1071:			}
LABELV $759
line 1069
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 18
LTI4 $758
line 1073
;1072:			//REMOVE TERMINATOR
;1073:			if (g_entities[client_id].client->pers.amterminator == qtrue)
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
CNSTI4 1
NEI4 $763
line 1074
;1074:			{
line 1075
;1075:				for ( i = 0 ; i < MAX_WEAPONS ; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $766
line 1076
;1076:					g_entities[client_id].client->ps.ammo[i] = 0;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 408
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 1077
;1077:				}
LABELV $767
line 1075
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 16
LTI4 $766
line 1078
;1078:				g_entities[client_id].client->pers.amterminator = qfalse;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
CNSTI4 0
ASGNI4
line 1079
;1079:				g_entities[client_id].client->ps.weapon = WP_SABER;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 1080
;1080:				g_entities[client_id].client->ps.forceRestricted = qfalse;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 608
ADDP4
CNSTI4 0
ASGNI4
line 1081
;1081:				g_entities[client_id].client->ps.stats[STAT_WEAPONS] &= ~(1 << WP_STUN_BATON) & ~(1 << WP_BLASTER) & ~(1 << WP_DISRUPTOR)
ADDRLP4 1068
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 1068
INDIRP4
ADDRLP4 1068
INDIRP4
INDIRI4
CNSTI4 -16371
BANDI4
ASGNI4
line 1084
;1082:					 & ~(1 << WP_BOWCASTER) & ~(1 << WP_REPEATER) & ~(1 << WP_DEMP2) & ~(1 << WP_FLECHETTE) & ~(1 << WP_ROCKET_LAUNCHER) & ~(1 << WP_THERMAL)
;1083:					 & ~(1 << WP_TRIP_MINE) & ~(1 << WP_DET_PACK);
;1084:				g_entities[client_id].client->ps.stats[STAT_HOLDABLE_ITEMS] &= ~(1 << HI_BINOCULARS) & ~(1 << HI_SEEKER) & ~(1 << HI_MEDPAC) & ~(1 << HI_SHIELD) & ~(1 << HI_SENTRY_GUN);
ADDRLP4 1072
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 1072
INDIRP4
ADDRLP4 1072
INDIRP4
INDIRI4
CNSTI4 -111
BANDI4
ASGNI4
line 1085
;1085:				if (!(g_weaponDisable.integer & (1 << WP_BRYAR_PISTOL))) {
ADDRGP4 g_weaponDisable+12
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $776
line 1086
;1086:					g_entities[client_id].client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BRYAR_PISTOL );
ADDRLP4 1076
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 1076
INDIRP4
ADDRLP4 1076
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1087
;1087:				} else {
ADDRGP4 $777
JUMPV
LABELV $776
line 1088
;1088:					g_entities[client_id].client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_BRYAR_PISTOL );
ADDRLP4 1076
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 1076
INDIRP4
ADDRLP4 1076
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 1089
;1089:				}
LABELV $777
line 1090
;1090:			}
LABELV $763
line 1091
;1091:		}
LABELV $715
line 1092
;1092:	}
LABELV $687
endproc Svcmd_Empower 1080 20
export Svcmd_Who
proc Svcmd_Who 12 16
line 1094
;1093:	void	Svcmd_Who( void ) 
;1094:    {
line 1096
;1095:		int i;
;1096:		for(i = 0; i < level.maxclients; i++) { 
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $785
JUMPV
LABELV $782
line 1097
;1097:			if(g_entities[i].client->pers.connected == CON_CONNECTED) {
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
NEI4 $787
line 1098
;1098:				G_Printf("IP:%s #:%i CLIENT:%s", g_entities[i].client->sess.IPstring, i, g_entities[i].client->pers.netname);
ADDRGP4 $790
ARGP4
ADDRLP4 8
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1684
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1099
;1099:			}
LABELV $787
line 1100
;1100:		}
LABELV $783
line 1096
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $785
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $782
line 1101
;1101:	}
LABELV $781
endproc Svcmd_Who 12 16
export Svcmd_Terminator
proc Svcmd_Terminator 1088 20
line 1103
;1102:	void	Svcmd_Terminator( void )
;1103:	{
line 1106
;1104:		int i, f;
;1105:		vec3_t v;
;1106:		int	num = 999;
ADDRLP4 12
CNSTI4 999
ASGNI4
line 1107
;1107:		int client_id = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 1109
;1108:		char arg1[MAX_STRING_CHARS];
;1109:		if (g_gametype.integer == GT_TOURNAMENT || g_gametype.integer == GT_TEAM ||
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $806
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
EQI4 $806
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $806
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
EQI4 $806
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $806
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $794
LABELV $806
line 1111
;1110:			g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY || 
;1111:			g_gametype.integer == GT_JEDIMASTER || g_gametype.integer == GT_HOLOCRON) {
line 1112
;1112:				G_Printf("Cannot use this admin command in this gametype.\n");
ADDRGP4 $414
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1113
;1113:				return;
ADDRGP4 $793
JUMPV
LABELV $794
line 1115
;1114:		}
;1115:		if ( trap_Argc() > 2 )
ADDRLP4 1052
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 2
LEI4 $807
line 1116
;1116:		{
line 1117
;1117:			G_Printf("Usage: /terminator (client)\n");
ADDRGP4 $809
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1118
;1118:			return; 
ADDRGP4 $793
JUMPV
LABELV $807
line 1120
;1119:		}
;1120:		trap_Argv( 1,  arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1121
;1121:		client_id = G_ClientNumberFromArg( arg1 );
ADDRLP4 16
ARGP4
ADDRLP4 1056
ADDRGP4 G_ClientNumberFromArg
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1056
INDIRI4
ASGNI4
line 1122
;1122:        if (client_id == -1) 
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $810
line 1123
;1123:        {
line 1124
;1124:			G_Printf("Can't find client ID\n");
ADDRGP4 $420
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1125
;1125:            return;
ADDRGP4 $793
JUMPV
LABELV $810
line 1127
;1126:        }
;1127:        if (client_id == -2) 
ADDRLP4 0
INDIRI4
CNSTI4 -2
NEI4 $812
line 1128
;1128:        {
line 1129
;1129:			G_Printf("Ambiguous client\n");
ADDRGP4 $814
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1130
;1130:            return;
ADDRGP4 $793
JUMPV
LABELV $812
line 1132
;1131:        }
;1132:        if (!g_entities[client_id].inuse) 
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $815
line 1133
;1133:        {
line 1134
;1134:			G_Printf("Client is not active\n");
ADDRGP4 $427
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1135
;1135:            return; 
ADDRGP4 $793
JUMPV
LABELV $815
line 1137
;1136:        }
;1137:		if (g_entities[client_id].client->ps.duelInProgress){
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $818
line 1138
;1138:			G_Printf("Client is in a duel\n");
ADDRGP4 $431
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1139
;1139:            return;
ADDRGP4 $793
JUMPV
LABELV $818
line 1142
;1140:		}
;1141:		//REMOVE
;1142:		if (g_entities[client_id].client->pers.amterminator == qtrue)
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
CNSTI4 1
NEI4 $821
line 1143
;1143:		{
line 1144
;1144:			for ( i = 0 ; i < MAX_WEAPONS ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $824
line 1145
;1145:				g_entities[client_id].client->ps.ammo[i] = 0;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 408
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 1146
;1146:			}
LABELV $825
line 1144
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 16
LTI4 $824
line 1147
;1147:			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_terminator_off_saying.string ) );
ADDRGP4 $438
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_terminator_off_saying+16
ARGP4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1148
;1148:			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_terminator_off_saying.string ) ); 
ADDRGP4 $441
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_terminator_off_saying+16
ARGP4
ADDRLP4 1064
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1149
;1149:			g_entities[client_id].client->pers.amterminator = qfalse;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
CNSTI4 0
ASGNI4
line 1150
;1150:			g_entities[client_id].client->ps.forceRestricted = qfalse;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 608
ADDP4
CNSTI4 0
ASGNI4
line 1151
;1151:			g_entities[client_id].client->ps.weapon = WP_SABER;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 1152
;1152:			g_entities[client_id].client->ps.stats[STAT_WEAPONS] &= ~(1 << WP_STUN_BATON) & ~(1 << WP_BLASTER) & ~(1 << WP_DISRUPTOR)
ADDRLP4 1068
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 1068
INDIRP4
ADDRLP4 1068
INDIRP4
INDIRI4
CNSTI4 -16371
BANDI4
ASGNI4
line 1155
;1153:				 & ~(1 << WP_BOWCASTER) & ~(1 << WP_REPEATER) & ~(1 << WP_DEMP2) & ~(1 << WP_FLECHETTE) & ~(1 << WP_ROCKET_LAUNCHER) & ~(1 << WP_THERMAL)
;1154:				 & ~(1 << WP_TRIP_MINE) & ~(1 << WP_DET_PACK);
;1155:			g_entities[client_id].client->ps.stats[STAT_HOLDABLE_ITEMS] &= ~(1 << HI_BINOCULARS) & ~(1 << HI_SEEKER) & ~(1 << HI_MEDPAC) & ~(1 << HI_SHIELD) & ~(1 << HI_SENTRY_GUN);
ADDRLP4 1072
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 1072
INDIRP4
ADDRLP4 1072
INDIRP4
INDIRI4
CNSTI4 -111
BANDI4
ASGNI4
line 1156
;1156:			if (!(g_weaponDisable.integer & (1 << WP_BRYAR_PISTOL))) {
ADDRGP4 g_weaponDisable+12
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $838
line 1157
;1157:				g_entities[client_id].client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BRYAR_PISTOL );
ADDRLP4 1076
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 1076
INDIRP4
ADDRLP4 1076
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1158
;1158:			} else {
ADDRGP4 $822
JUMPV
LABELV $838
line 1159
;1159:				g_entities[client_id].client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_BRYAR_PISTOL );
ADDRLP4 1076
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 1076
INDIRP4
ADDRLP4 1076
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 1160
;1160:			}
line 1161
;1161:		}
ADDRGP4 $822
JUMPV
LABELV $821
line 1163
;1162:		//APPLY
;1163:		else {
line 1164
;1164:			for ( i = 0 ; i < MAX_WEAPONS ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $843
line 1165
;1165:				g_entities[client_id].client->ps.ammo[i] = num;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 408
ADDP4
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1166
;1166:			}
LABELV $844
line 1164
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 16
LTI4 $843
line 1167
;1167:			G_PlayEffect(EFFECT_SPARK_EXPLOSION, g_entities[client_id].r.currentOrigin, v);
CNSTI4 4
ARGI4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+296+72
ADDP4
ARGP4
ADDRLP4 1040
ARGP4
ADDRGP4 G_PlayEffect
CALLP4
pop
line 1168
;1168:			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_terminator_on_saying.string ) );
ADDRGP4 $438
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_terminator_on_saying+16
ARGP4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1169
;1169:			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_terminator_on_saying.string ) ); 
ADDRGP4 $441
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_terminator_on_saying+16
ARGP4
ADDRLP4 1064
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1170
;1170:			G_ScreenShake(g_entities[client_id].client->ps.origin, NULL, 10.0f, 800, qtrue);
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTF4 1092616192
ARGF4
CNSTI4 800
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_ScreenShake
CALLP4
pop
line 1171
;1171:			g_entities[client_id].client->pers.amterminator = qtrue;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
CNSTI4 1
ASGNI4
line 1172
;1172:			g_entities[client_id].client->ps.forceRestricted = qtrue;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 608
ADDP4
CNSTI4 1
ASGNI4
line 1173
;1173:			g_entities[client_id].client->ps.weapon = WP_STUN_BATON;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1
ASGNI4
line 1174
;1174:			g_entities[client_id].client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_SABER );
ADDRLP4 1068
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 1068
INDIRP4
ADDRLP4 1068
INDIRP4
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 1175
;1175:			g_entities[client_id].client->ps.stats[STAT_WEAPONS] |= (1 << WP_STUN_BATON) | (1 << WP_BRYAR_PISTOL) | (1 << WP_BLASTER) | (1 << WP_DISRUPTOR)
ADDRLP4 1072
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 1072
INDIRP4
ADDRLP4 1072
INDIRP4
INDIRI4
CNSTI4 16378
BORI4
ASGNI4
line 1178
;1176:				 | (1 << WP_BOWCASTER) | (1 << WP_REPEATER) | (1 << WP_DEMP2) | (1 << WP_FLECHETTE) | (1 << WP_ROCKET_LAUNCHER) | (1 << WP_THERMAL)
;1177:				 | (1 << WP_TRIP_MINE) | (1 << WP_DET_PACK);
;1178:			g_entities[client_id].client->ps.stats[STAT_HOLDABLE_ITEMS] |= (1 << HI_BINOCULARS) | (1 << HI_SEEKER) | (1 << HI_MEDPAC) | (1 << HI_SHIELD) | (1 << HI_SENTRY_GUN);
ADDRLP4 1076
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 1076
INDIRP4
ADDRLP4 1076
INDIRP4
INDIRI4
CNSTI4 110
BORI4
ASGNI4
line 1180
;1179:			//REMOVE EMPOWER
;1180:			if (g_entities[client_id].client->pers.amempower == qtrue)
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 1
NEI4 $861
line 1181
;1181:				{
line 1182
;1182:					g_entities[client_id].client->ps.isJediMaster = qfalse;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 0
ASGNI4
line 1183
;1183:					g_entities[client_id].client->pers.amempower = qfalse;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
CNSTI4 0
ASGNI4
line 1184
;1184:					for( f = 0; f < NUM_FORCE_POWERS; f ++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $866
line 1185
;1185:						g_entities[client_id].client->ps.fd.forcePowerLevel[f] = g_entities[client_id].client->pers.forcePowerLevelSaved[f];
ADDRLP4 1080
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1084
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1080
INDIRI4
ADDRLP4 1084
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
ADDRLP4 1080
INDIRI4
ADDRLP4 1084
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1560
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1186
;1186:					}
LABELV $867
line 1184
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 18
LTI4 $866
line 1187
;1187:					g_entities[client_id].client->ps.fd.forcePowersKnown = g_entities[client_id].client->pers.forcePowersKnownSaved;
ADDRLP4 1080
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1080
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ADDRLP4 1080
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1556
ADDP4
INDIRI4
ASGNI4
line 1188
;1188:				}
LABELV $861
line 1189
;1189:		}
LABELV $822
line 1190
;1190:	}
LABELV $793
endproc Svcmd_Terminator 1088 20
export Svcmd_Protect
proc Svcmd_Protect 1048 20
line 1192
;1191:	void	Svcmd_Protect( void )
;1192:	{
line 1193
;1193:		int client_id = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 1195
;1194:		char arg1[MAX_STRING_CHARS];
;1195:		if (g_gametype.integer == GT_TOURNAMENT || g_gametype.integer == GT_TEAM ||
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $883
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
EQI4 $883
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $883
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $875
LABELV $883
line 1196
;1196:			g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY) {
line 1197
;1197:				G_Printf("Cannot use this admin command in this gametype.\n");
ADDRGP4 $414
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1198
;1198:				return;
ADDRGP4 $874
JUMPV
LABELV $875
line 1200
;1199:		}
;1200:		if ( trap_Argc() > 2 )
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
LEI4 $884
line 1201
;1201:		{
line 1202
;1202:			G_Printf("Usage: /protect (client)\n");
ADDRGP4 $886
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1203
;1203:			return; 
ADDRGP4 $874
JUMPV
LABELV $884
line 1205
;1204:		}
;1205:		trap_Argv( 1,  arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1206
;1206:		client_id = G_ClientNumberFromArg( arg1 );
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 G_ClientNumberFromArg
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1032
INDIRI4
ASGNI4
line 1207
;1207:        if (client_id == -1) 
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $887
line 1208
;1208:        { 
line 1209
;1209:			G_Printf("Can't find client ID\n");
ADDRGP4 $420
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1210
;1210:            return;
ADDRGP4 $874
JUMPV
LABELV $887
line 1212
;1211:        }
;1212:        if (client_id == -2) 
ADDRLP4 0
INDIRI4
CNSTI4 -2
NEI4 $889
line 1213
;1213:        { 
line 1214
;1214:			G_Printf("Ambiguous client ID\n");
ADDRGP4 $423
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1215
;1215:            return;
ADDRGP4 $874
JUMPV
LABELV $889
line 1217
;1216:        }
;1217:        if (!g_entities[client_id].inuse) 
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $891
line 1218
;1218:        {
line 1219
;1219:			G_Printf("Client is not active\n");
ADDRGP4 $427
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1220
;1220:            return; 
ADDRGP4 $874
JUMPV
LABELV $891
line 1222
;1221:        }
;1222:		if (g_entities[client_id].client->ps.duelInProgress){
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $894
line 1223
;1223:			G_Printf("Client is in a duel\n");
ADDRGP4 $431
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1224
;1224:            return;
ADDRGP4 $874
JUMPV
LABELV $894
line 1227
;1225:		}
;1226:		//REMOVE
;1227:		if (g_entities[client_id].client->ps.eFlags & EF_INVULNERABLE)
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 67108864
BANDI4
CNSTI4 0
EQI4 $897
line 1228
;1228:		{
line 1229
;1229:			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_protect_off_saying.string ) );
ADDRGP4 $438
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_protect_off_saying+16
ARGP4
ADDRLP4 1036
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1230
;1230:			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_protect_off_saying.string ) ); 
ADDRGP4 $441
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_protect_off_saying+16
ARGP4
ADDRLP4 1040
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1231
;1231:			g_entities[client_id].client->ps.eFlags &= ~EF_INVULNERABLE;
ADDRLP4 1044
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 1044
INDIRP4
ADDRLP4 1044
INDIRP4
INDIRI4
CNSTI4 -67108865
BANDI4
ASGNI4
line 1232
;1232:			g_entities[client_id].client->invulnerableTimer = 0;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1700
ADDP4
CNSTI4 0
ASGNI4
line 1233
;1233:		}
ADDRGP4 $898
JUMPV
LABELV $897
line 1235
;1234:		//APPLY
;1235:		else {
line 1236
;1236:			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_protect_on_saying.string ) );
ADDRGP4 $438
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_protect_on_saying+16
ARGP4
ADDRLP4 1036
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1237
;1237:			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_protect_on_saying.string ) ); 
ADDRGP4 $441
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_protect_on_saying+16
ARGP4
ADDRLP4 1040
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1238
;1238:			G_ScreenShake(g_entities[client_id].client->ps.origin, NULL, 10.0f, 800, qtrue);
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTF4 1092616192
ARGF4
CNSTI4 800
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_ScreenShake
CALLP4
pop
line 1239
;1239:			g_entities[client_id].client->ps.eFlags |= EF_INVULNERABLE;
ADDRLP4 1044
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 1044
INDIRP4
ADDRLP4 1044
INDIRP4
INDIRI4
CNSTI4 67108864
BORI4
ASGNI4
line 1240
;1240:			g_entities[client_id].client->invulnerableTimer = level.time + Q3_INFINITE;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1700
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 16777216
ADDI4
ASGNI4
line 1241
;1241:		}
LABELV $898
line 1242
;1242:	}
LABELV $874
endproc Svcmd_Protect 1048 20
export Svcmd_ChangeMap
proc Svcmd_ChangeMap 1036 12
line 1244
;1243:	void	Svcmd_ChangeMap( void ) 
;1244:	{
line 1246
;1245:		char arg1[MAX_STRING_CHARS];
;1246:		if ( trap_Argc() != 3 )
ADDRLP4 1024
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 3
EQI4 $915
line 1247
;1247:		{
line 1248
;1248:			G_Printf("Usage: /changemap (gametype) (map)\n");
ADDRGP4 $917
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1249
;1249:			return; 
ADDRGP4 $914
JUMPV
LABELV $915
line 1251
;1250:		}
;1251:		trap_Argv( 1, arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1252
;1252:		trap_SendConsoleCommand( EXEC_APPEND, va("g_gametype %s\n", arg1));
ADDRGP4 $918
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1028
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1253
;1253:		G_LogPrintf("ChangeMap admin command executed by SERVER to GAMETYPE:%s", arg1);
ADDRGP4 $919
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1254
;1254:		trap_Argv( 2, arg1, sizeof( arg1 ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1255
;1255:		trap_SendConsoleCommand( EXEC_APPEND, va("map %s\n", arg1));
ADDRGP4 $920
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1032
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1256
;1256:		G_LogPrintf(" MAP:%s.\n", arg1);
ADDRGP4 $921
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1257
;1257:	}
LABELV $914
endproc Svcmd_ChangeMap 1036 12
export Svcmd_Teleport
proc Svcmd_Teleport 2132 16
line 1259
;1258:	void	Svcmd_Teleport( void )
;1259:	{ // teleport to specific location
line 1262
;1260:		vec3_t location;
;1261:		vec3_t forward;
;1262:		if ( trap_Argc() <= 2 || trap_Argc() > 4 )
ADDRLP4 24
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 2
LEI4 $925
ADDRLP4 28
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 4
LEI4 $923
LABELV $925
line 1263
;1263:		{
line 1264
;1264:			G_Printf("Usage: Usage: /teleport (client)\n/teleport (X Y Z)\n/teleport (client) (client)\n/teleport (client) (X Y Z)\n");
ADDRGP4 $926
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1265
;1265:			return;
ADDRGP4 $922
JUMPV
LABELV $923
line 1268
;1266:		}
;1267:		//Teleport player to player
;1268:		if ( trap_Argc() == 3 )
ADDRLP4 32
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 3
NEI4 $927
line 1269
;1269:		{
line 1270
;1270:			int	client_id = -1;
ADDRLP4 40
CNSTI4 -1
ASGNI4
line 1271
;1271:			int	client_id2 = -1;
ADDRLP4 36
CNSTI4 -1
ASGNI4
line 1274
;1272:			char	arg1[MAX_STRING_CHARS];
;1273:			char	arg2[MAX_STRING_CHARS];
;1274:			trap_Argv( 1, arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 44
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1275
;1275:			trap_Argv( 2, arg2, sizeof( arg2 ) );
CNSTI4 2
ARGI4
ADDRLP4 1068
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1276
;1276:			client_id = G_ClientNumberFromArg( arg1 );
ADDRLP4 44
ARGP4
ADDRLP4 2092
ADDRGP4 G_ClientNumberFromArg
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 2092
INDIRI4
ASGNI4
line 1277
;1277:			client_id2 = G_ClientNumberFromArg( arg2 );
ADDRLP4 1068
ARGP4
ADDRLP4 2096
ADDRGP4 G_ClientNumberFromArg
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 2096
INDIRI4
ASGNI4
line 1279
;1278:
;1279:			if (client_id == -1)
ADDRLP4 40
INDIRI4
CNSTI4 -1
NEI4 $929
line 1280
;1280:			{
line 1281
;1281:				G_Printf("Can't find client ID\n");
ADDRGP4 $420
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1282
;1282:				return;
ADDRGP4 $922
JUMPV
LABELV $929
line 1284
;1283:			}
;1284:			if (client_id == -2)
ADDRLP4 40
INDIRI4
CNSTI4 -2
NEI4 $931
line 1285
;1285:			{
line 1286
;1286:				G_Printf("Ambiguous client ID\n");
ADDRGP4 $423
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1287
;1287:				return;
ADDRGP4 $922
JUMPV
LABELV $931
line 1289
;1288:			}
;1289:			if (!g_entities[client_id].inuse)
CNSTI4 852
ADDRLP4 40
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $933
line 1290
;1290:			{
line 1291
;1291:				G_Printf("Client is not active\n");
ADDRGP4 $427
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1292
;1292:				return;
ADDRGP4 $922
JUMPV
LABELV $933
line 1294
;1293:			}
;1294:			if (client_id2 == -1)
ADDRLP4 36
INDIRI4
CNSTI4 -1
NEI4 $936
line 1295
;1295:			{
line 1296
;1296:				G_Printf("Can't find client ID\n");
ADDRGP4 $420
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1297
;1297:				return;
ADDRGP4 $922
JUMPV
LABELV $936
line 1299
;1298:			}
;1299:			if (client_id2 == -2)
ADDRLP4 36
INDIRI4
CNSTI4 -2
NEI4 $938
line 1300
;1300:			{
line 1301
;1301:				G_Printf("Ambiguous client ID\n");
ADDRGP4 $423
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1302
;1302:				return;
ADDRGP4 $922
JUMPV
LABELV $938
line 1304
;1303:			}
;1304:			if (!g_entities[client_id2].inuse)
CNSTI4 852
ADDRLP4 36
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $940
line 1305
;1305:			{
line 1306
;1306:				G_Printf("Client is not active\n");
ADDRGP4 $427
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1307
;1307:				return;
ADDRGP4 $922
JUMPV
LABELV $940
line 1309
;1308:			}
;1309:			if (g_entities[client_id].health <= 0)
CNSTI4 852
ADDRLP4 40
INDIRI4
MULI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $943
line 1310
;1310:			{
line 1311
;1311:				return;
ADDRGP4 $922
JUMPV
LABELV $943
line 1313
;1312:			}
;1313:			if (g_entities[client_id2].health <= 0)
CNSTI4 852
ADDRLP4 36
INDIRI4
MULI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $946
line 1314
;1314:			{
line 1315
;1315:				return;
ADDRGP4 $922
JUMPV
LABELV $946
line 1318
;1316:			}
;1317:
;1318:			VectorCopy(g_entities[client_id2].client->ps.origin, location);
ADDRLP4 0
CNSTI4 852
ADDRLP4 36
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1319
;1319:			AngleVectors(g_entities[client_id2].client->ps.viewangles, forward, NULL, NULL);
CNSTI4 852
ADDRLP4 36
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 2100
CNSTP4 0
ASGNP4
ADDRLP4 2100
INDIRP4
ARGP4
ADDRLP4 2100
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1320
;1320:			forward[2] = 0; //no elevation change
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 1321
;1321:			VectorNormalize(forward);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1322
;1322:			VectorMA(g_entities[client_id2].client->ps.origin, 100, forward, location);
ADDRLP4 2104
CNSTI4 852
ADDRLP4 36
INDIRI4
MULI4
ASGNI4
ADDRLP4 2108
CNSTF4 1120403456
ASGNF4
ADDRLP4 0
ADDRLP4 2104
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 2108
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 2104
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 2108
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
CNSTI4 852
ADDRLP4 36
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1120403456
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1323
;1323:			location[2] += 5; //add just a bit of height???
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1084227584
ADDF4
ASGNF4
line 1324
;1324:			TeleportPlayer(&g_entities[client_id], location, g_entities[client_id2].client->ps.viewangles);
ADDRLP4 2112
CNSTI4 852
ASGNI4
ADDRLP4 2112
INDIRI4
ADDRLP4 40
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 2112
INDIRI4
ADDRLP4 36
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 1325
;1325:			G_LogPrintf("Teleport admin command is executed by SERVER on %s.\n", g_entities[client_id].client->pers.netname);
ADDRGP4 $961
ARGP4
CNSTI4 852
ADDRLP4 40
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1326
;1326:			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_teleport_saying.string ) );
ADDRGP4 $438
ARGP4
CNSTI4 852
ADDRLP4 40
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_teleport_saying+16
ARGP4
ADDRLP4 2116
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2116
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1327
;1327:			trap_SendServerCommand( -1, va("print \"%s^7 %s\n\"", g_entities[client_id].client->pers.netname, cm_teleport_saying.string ) );
ADDRGP4 $965
ARGP4
CNSTI4 852
ADDRLP4 40
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_teleport_saying+16
ARGP4
ADDRLP4 2120
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2120
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1328
;1328:		}
LABELV $927
line 1330
;1329:		//Using manual coordinates
;1330:		if ( trap_Argc() == 5 )
ADDRLP4 36
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 5
NEI4 $968
line 1331
;1331:		{
line 1332
;1332:			int	client_id = -1;			
ADDRLP4 40
CNSTI4 -1
ASGNI4
line 1337
;1333:			char	arg1[MAX_STRING_CHARS];
;1334:			vec3_t		origin;
;1335:			char		buffer[MAX_TOKEN_CHARS];	
;1336:			
;1337:			trap_Argv( 1, arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 1080
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1338
;1338:			client_id = G_ClientNumberFromArg( arg1 );
ADDRLP4 1080
ARGP4
ADDRLP4 2104
ADDRGP4 G_ClientNumberFromArg
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 2104
INDIRI4
ASGNI4
line 1339
;1339:			if (client_id == -1)
ADDRLP4 40
INDIRI4
CNSTI4 -1
NEI4 $970
line 1340
;1340:			{
line 1341
;1341:				G_Printf("Can't find client ID\n");
ADDRGP4 $420
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1342
;1342:				return;
ADDRGP4 $922
JUMPV
LABELV $970
line 1344
;1343:			}
;1344:			if (client_id == -2)
ADDRLP4 40
INDIRI4
CNSTI4 -2
NEI4 $972
line 1345
;1345:			{
line 1346
;1346:				G_Printf("Ambiguous client ID\n");
ADDRGP4 $423
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1347
;1347:				return;
ADDRGP4 $922
JUMPV
LABELV $972
line 1349
;1348:			}
;1349:			if (!g_entities[client_id].inuse)
CNSTI4 852
ADDRLP4 40
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $974
line 1350
;1350:			{
line 1351
;1351:				G_Printf("Client is not active\n");
ADDRGP4 $427
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1352
;1352:				return;
ADDRGP4 $922
JUMPV
LABELV $974
line 1354
;1353:			}
;1354:			if (g_entities[client_id].health <= 0)
CNSTI4 852
ADDRLP4 40
INDIRI4
MULI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $977
line 1355
;1355:			{
line 1356
;1356:				return;
ADDRGP4 $922
JUMPV
LABELV $977
line 1359
;1357:			}
;1358:		
;1359:			trap_Argv(2, buffer, sizeof( buffer ) );
CNSTI4 2
ARGI4
ADDRLP4 44
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1360
;1360:			origin[0] = atof(buffer);
ADDRLP4 44
ARGP4
ADDRLP4 2108
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 1068
ADDRLP4 2108
INDIRF4
ASGNF4
line 1361
;1361:			trap_Argv(3, buffer, sizeof( buffer ) );
CNSTI4 3
ARGI4
ADDRLP4 44
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1362
;1362:			origin[1] = atof(buffer);
ADDRLP4 44
ARGP4
ADDRLP4 2112
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 1068+4
ADDRLP4 2112
INDIRF4
ASGNF4
line 1363
;1363:			trap_Argv(4, buffer, sizeof( buffer ) );
CNSTI4 4
ARGI4
ADDRLP4 44
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1364
;1364:			origin[2] = atof(buffer);			
ADDRLP4 44
ARGP4
ADDRLP4 2116
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 1068+8
ADDRLP4 2116
INDIRF4
ASGNF4
line 1366
;1365:
;1366:			TeleportPlayer( &g_entities[client_id], origin, g_entities[client_id].client->ps.viewangles );
ADDRLP4 2120
CNSTI4 852
ADDRLP4 40
INDIRI4
MULI4
ASGNI4
ADDRLP4 2120
INDIRI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1068
ARGP4
ADDRLP4 2120
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 1367
;1367:			G_LogPrintf("Teleport admin command is executed by SERVER on %s.\n", g_entities[client_id].client->pers.netname);
ADDRGP4 $961
ARGP4
CNSTI4 852
ADDRLP4 40
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1368
;1368:			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_teleport_saying.string ) );  
ADDRGP4 $438
ARGP4
CNSTI4 852
ADDRLP4 40
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_teleport_saying+16
ARGP4
ADDRLP4 2124
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2124
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1369
;1369:			trap_SendServerCommand( -1, va("print \"%s^7 %s\n\"", g_entities[client_id].client->pers.netname, cm_teleport_saying.string ) );  
ADDRGP4 $965
ARGP4
CNSTI4 852
ADDRLP4 40
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_teleport_saying+16
ARGP4
ADDRLP4 2128
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2128
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1370
;1370:		}
LABELV $968
line 1371
;1371:	}
LABELV $922
endproc Svcmd_Teleport 2132 16
export Svcmd_AdminKick
proc Svcmd_AdminKick 1040 12
line 1373
;1372:	void	Svcmd_AdminKick( void )
;1373:	{
line 1374
;1374:		int client_id = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 1376
;1375:		char arg1[MAX_STRING_CHARS];
;1376:		if ( trap_Argc() > 2 )
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
LEI4 $989
line 1377
;1377:		{
line 1378
;1378:			G_Printf("Usage: /adminkick (client)\n");
ADDRGP4 $991
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1379
;1379:			return; 
ADDRGP4 $988
JUMPV
LABELV $989
line 1381
;1380:		}
;1381:		trap_Argv( 1,  arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1382
;1382:		client_id = G_ClientNumberFromArg( arg1 );
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 G_ClientNumberFromArg
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1032
INDIRI4
ASGNI4
line 1383
;1383:        if (client_id == -1)
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $992
line 1384
;1384:			{
line 1385
;1385:				G_Printf("Can't find client ID\n");
ADDRGP4 $420
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1386
;1386:				return;
ADDRGP4 $988
JUMPV
LABELV $992
line 1388
;1387:			}
;1388:			if (client_id == -2)
ADDRLP4 0
INDIRI4
CNSTI4 -2
NEI4 $994
line 1389
;1389:			{
line 1390
;1390:				G_Printf("Ambiguous client ID\n");
ADDRGP4 $423
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1391
;1391:				return;
ADDRGP4 $988
JUMPV
LABELV $994
line 1393
;1392:			}
;1393:			if (!g_entities[client_id].inuse)
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $996
line 1394
;1394:			{
line 1395
;1395:				G_Printf("Client is not active\n");
ADDRGP4 $427
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1396
;1396:				return;
ADDRGP4 $988
JUMPV
LABELV $996
line 1398
;1397:			}
;1398:		trap_SendConsoleCommand( EXEC_APPEND, va("clientkick %d", client_id) );
ADDRGP4 $999
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1036
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1399
;1399:		G_LogPrintf("AdminKick command executed by SERVER on %s.\n", g_entities[client_id].client->pers.netname);
ADDRGP4 $1000
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1400
;1400:	}
LABELV $988
endproc Svcmd_AdminKick 1040 12
export Svcmd_AdminBan
proc Svcmd_AdminBan 1044 12
line 1402
;1401:	void	Svcmd_AdminBan( void ) 
;1402:	{
line 1403
;1403:		int client_id = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 1405
;1404:		char arg1[MAX_STRING_CHARS];
;1405:		if ( trap_Argc() > 2 )
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
LEI4 $1003
line 1406
;1406:		{
line 1407
;1407:			G_Printf("Usage: /adminban (client)\n"); 
ADDRGP4 $1005
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1408
;1408:			return; 
ADDRGP4 $1002
JUMPV
LABELV $1003
line 1410
;1409:		}
;1410:		trap_Argv( 1,  arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1411
;1411:		client_id = G_ClientNumberFromArg( arg1 );
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 G_ClientNumberFromArg
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1032
INDIRI4
ASGNI4
line 1412
;1412:        if (client_id == -1)
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $1006
line 1413
;1413:		{
line 1414
;1414:			G_Printf("Can't find client ID\n");
ADDRGP4 $420
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1415
;1415:			return;
ADDRGP4 $1002
JUMPV
LABELV $1006
line 1417
;1416:		}
;1417:		if (client_id == -2)
ADDRLP4 0
INDIRI4
CNSTI4 -2
NEI4 $1008
line 1418
;1418:		{
line 1419
;1419:			G_Printf("Ambiguous client ID\n");
ADDRGP4 $423
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1420
;1420:			return;
ADDRGP4 $1002
JUMPV
LABELV $1008
line 1422
;1421:		}
;1422:		if (!g_entities[client_id].inuse)
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1010
line 1423
;1423:		{
line 1424
;1424:			G_Printf("Client is not active\n");
ADDRGP4 $427
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1425
;1425:			return;
ADDRGP4 $1002
JUMPV
LABELV $1010
line 1427
;1426:		}
;1427:		trap_SendConsoleCommand( EXEC_APPEND, va("clientkick %d", client_id) );
ADDRGP4 $999
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1036
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1428
;1428:		G_LogPrintf("AdminBan admin command executed by SERVER on %s. (IP: %s)\n", g_entities[client_id].client->pers.netname, g_entities[client_id].client->sess.IPstring);
ADDRGP4 $1013
ARGP4
ADDRLP4 1040
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1040
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 1040
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1684
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1429
;1429:		AddIP( g_entities[client_id].client->sess.IPstring );
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1684
ADDP4
ARGP4
ADDRGP4 AddIP
CALLV
pop
line 1430
;1430:	}
LABELV $1002
endproc Svcmd_AdminBan 1044 12
export ConsoleCommand
proc ConsoleCommand 1132 12
line 1440
;1431:
;1432:char	*ConcatArgs( int start );
;1433:
;1434:/*
;1435:=================
;1436:ConsoleCommand
;1437:
;1438:=================
;1439:*/
;1440:qboolean	ConsoleCommand( void ) {
line 1443
;1441:	char	cmd[MAX_TOKEN_CHARS];
;1442:
;1443:	trap_Argv( 0, cmd, sizeof( cmd ) );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1445
;1444:
;1445:	if ( Q_stricmp (cmd, "entitylist") == 0 ) {
ADDRLP4 0
ARGP4
ADDRGP4 $1020
ARGP4
ADDRLP4 1024
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
NEI4 $1018
line 1446
;1446:		Svcmd_EntityList_f();
ADDRGP4 Svcmd_EntityList_f
CALLV
pop
line 1447
;1447:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1017
JUMPV
LABELV $1018
line 1450
;1448:	}
;1449:
;1450:	if ( Q_stricmp (cmd, "forceteam") == 0 ) {
ADDRLP4 0
ARGP4
ADDRGP4 $1023
ARGP4
ADDRLP4 1028
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $1021
line 1451
;1451:		Svcmd_ForceTeam_f();
ADDRGP4 Svcmd_ForceTeam_f
CALLV
pop
line 1452
;1452:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1017
JUMPV
LABELV $1021
line 1455
;1453:	}
;1454:
;1455:	if (Q_stricmp (cmd, "game_memory") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1026
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $1024
line 1456
;1456:		Svcmd_GameMem_f();
ADDRGP4 Svcmd_GameMem_f
CALLV
pop
line 1457
;1457:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1017
JUMPV
LABELV $1024
line 1460
;1458:	}
;1459:
;1460:	if (Q_stricmp (cmd, "addbot") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1029
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $1027
line 1461
;1461:		Svcmd_AddBot_f();
ADDRGP4 Svcmd_AddBot_f
CALLV
pop
line 1462
;1462:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1017
JUMPV
LABELV $1027
line 1465
;1463:	}
;1464:
;1465:	if (Q_stricmp (cmd, "botlist") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1032
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $1030
line 1466
;1466:		Svcmd_BotList_f();
ADDRGP4 Svcmd_BotList_f
CALLV
pop
line 1467
;1467:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1017
JUMPV
LABELV $1030
line 1475
;1468:	}
;1469:
;1470:/*	if (Q_stricmp (cmd, "abort_podium") == 0) {
;1471:		Svcmd_AbortPodium_f();
;1472:		return qtrue;
;1473:	}
;1474:*/
;1475:	if (Q_stricmp (cmd, "addip") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1035
ARGP4
ADDRLP4 1044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $1033
line 1476
;1476:		Svcmd_AddIP_f();
ADDRGP4 Svcmd_AddIP_f
CALLV
pop
line 1477
;1477:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1017
JUMPV
LABELV $1033
line 1480
;1478:	}
;1479:
;1480:	if (Q_stricmp (cmd, "removeip") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1038
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $1036
line 1481
;1481:		Svcmd_RemoveIP_f();
ADDRGP4 Svcmd_RemoveIP_f
CALLV
pop
line 1482
;1482:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1017
JUMPV
LABELV $1036
line 1485
;1483:	}
;1484:
;1485:	if (Q_stricmp (cmd, "listip") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1041
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $1039
line 1486
;1486:		trap_SendConsoleCommand( EXEC_NOW, "g_banIPs\n" );
CNSTI4 0
ARGI4
ADDRGP4 $1042
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1487
;1487:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1017
JUMPV
LABELV $1039
line 1490
;1488:	}
;1489:
;1490:	if (Q_stricmp (cmd, "punish") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1045
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $1043
line 1491
;1491:		Svcmd_Punish();
ADDRGP4 Svcmd_Punish
CALLV
pop
line 1492
;1492:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1017
JUMPV
LABELV $1043
line 1495
;1493:	}
;1494:
;1495:	if (Q_stricmp (cmd, "sleep") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1048
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $1046
line 1496
;1496:		Svcmd_Sleep();
ADDRGP4 Svcmd_Sleep
CALLV
pop
line 1497
;1497:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1017
JUMPV
LABELV $1046
line 1500
;1498:	}
;1499:
;1500:	if (Q_stricmp (cmd, "csprint") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1051
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $1049
line 1501
;1501:		Svcmd_CSprint();
ADDRGP4 Svcmd_CSprint
CALLV
pop
line 1502
;1502:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1017
JUMPV
LABELV $1049
line 1505
;1503:	}
;1504:
;1505:	if (Q_stricmp (cmd, "changemode") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1054
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $1052
line 1506
;1506:		Svcmd_ChangeMode();
ADDRGP4 Svcmd_ChangeMode
CALLV
pop
line 1507
;1507:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1017
JUMPV
LABELV $1052
line 1510
;1508:	}
;1509:
;1510:	if (Q_stricmp (cmd, "silence") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1057
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $1055
line 1511
;1511:		Svcmd_Silence();
ADDRGP4 Svcmd_Silence
CALLV
pop
line 1512
;1512:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1017
JUMPV
LABELV $1055
line 1515
;1513:	}
;1514:
;1515:	if (Q_stricmp (cmd, "empower") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1060
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $1058
line 1516
;1516:		Svcmd_Empower();
ADDRGP4 Svcmd_Empower
CALLV
pop
line 1517
;1517:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1017
JUMPV
LABELV $1058
line 1520
;1518:	}
;1519:
;1520:	if (Q_stricmp (cmd, "rename") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1063
ARGP4
ADDRLP4 1080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $1061
line 1521
;1521:		Svcmd_Rename();
ADDRGP4 Svcmd_Rename
CALLV
pop
line 1522
;1522:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1017
JUMPV
LABELV $1061
line 1525
;1523:	}
;1524:
;1525:	if (Q_stricmp (cmd, "kick") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1066
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $1064
line 1526
;1526:		Svcmd_AdminKick();
ADDRGP4 Svcmd_AdminKick
CALLV
pop
line 1527
;1527:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1017
JUMPV
LABELV $1064
line 1530
;1528:	}
;1529:
;1530:	if (Q_stricmp (cmd, "changemap") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1069
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $1067
line 1531
;1531:		Svcmd_ChangeMap();
ADDRGP4 Svcmd_ChangeMap
CALLV
pop
line 1532
;1532:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1017
JUMPV
LABELV $1067
line 1535
;1533:	}
;1534:
;1535:	if (Q_stricmp (cmd, "lockteam") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1072
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $1070
line 1536
;1536:		Svcmd_LockTeam();
ADDRGP4 Svcmd_LockTeam
CALLV
pop
line 1537
;1537:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1017
JUMPV
LABELV $1070
line 1540
;1538:	}
;1539:
;1540:	if (Q_stricmp (cmd, "slap") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1075
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $1073
line 1541
;1541:		Svcmd_Slap();
ADDRGP4 Svcmd_Slap
CALLV
pop
line 1542
;1542:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1017
JUMPV
LABELV $1073
line 1545
;1543:	}
;1544:
;1545:	if (Q_stricmp (cmd, "protect") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1078
ARGP4
ADDRLP4 1100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $1076
line 1546
;1546:		Svcmd_Protect();
ADDRGP4 Svcmd_Protect
CALLV
pop
line 1547
;1547:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1017
JUMPV
LABELV $1076
line 1550
;1548:	}
;1549:
;1550:	if (Q_stricmp (cmd, "slay") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1081
ARGP4
ADDRLP4 1104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $1079
line 1551
;1551:		Svcmd_Slay();
ADDRGP4 Svcmd_Slay
CALLV
pop
line 1552
;1552:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1017
JUMPV
LABELV $1079
line 1555
;1553:	}
;1554:
;1555:	if (Q_stricmp (cmd, "terminator") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1084
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $1082
line 1556
;1556:		Svcmd_Terminator();
ADDRGP4 Svcmd_Terminator
CALLV
pop
line 1557
;1557:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1017
JUMPV
LABELV $1082
line 1560
;1558:	}
;1559:
;1560:	if (Q_stricmp (cmd, "who") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1087
ARGP4
ADDRLP4 1112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $1085
line 1561
;1561:		Svcmd_Who();
ADDRGP4 Svcmd_Who
CALLV
pop
line 1562
;1562:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1017
JUMPV
LABELV $1085
line 1565
;1563:	}
;1564:
;1565:	if (g_dedicated.integer) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $1088
line 1567
;1566:        // JediDog: Better looking when server talks.
;1567:		if (Q_stricmp (cmd, "say") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1093
ARGP4
ADDRLP4 1116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $1091
line 1568
;1568:			trap_SendServerCommand( -1, va("print \"^5[^7Server^5]^7: %s\n\"", ConcatArgs(1) ) );
CNSTI4 1
ARGI4
ADDRLP4 1120
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $1094
ARGP4
ADDRLP4 1120
INDIRP4
ARGP4
ADDRLP4 1124
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1569
;1569:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1017
JUMPV
LABELV $1091
line 1571
;1570:        }// JediDog: added csay to make msgs appear in the middle of the screen without the "[Server]" infront of it.
;1571:        else if (Q_stricmp (cmd, "csay") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1097
ARGP4
ADDRLP4 1120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $1095
line 1572
;1572:             trap_SendServerCommand( -1, va("cp \"%s\n\"", ConcatArgs(1) ) );
CNSTI4 1
ARGI4
ADDRLP4 1124
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $1098
ARGP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRLP4 1128
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1573
;1573:             return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1017
JUMPV
LABELV $1095
line 1576
;1574:        }
;1575:		// everything else will also be printed as a say command
;1576:		trap_SendServerCommand( -1, va("print \"^5[^7Server^5]^7: %s\n\"", ConcatArgs(0) ) );
CNSTI4 0
ARGI4
ADDRLP4 1124
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $1094
ARGP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRLP4 1128
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1577
;1577:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1017
JUMPV
LABELV $1088
line 1581
;1578:		
;1579:	}
;1580:
;1581:	return qfalse;
CNSTI4 0
RETI4
LABELV $1017
endproc ConsoleCommand 1132 12
import ConcatArgs
import uwRename
import G_ClientNumberFromArg
bss
align 4
LABELV numIPFilters
skip 4
align 4
LABELV ipFilters
skip 8192
import trap_ROFF_Purge_Ent
import trap_ROFF_Play
import trap_ROFF_Cache
import trap_ROFF_UpdateEntities
import trap_ROFF_Clean
import trap_SP_GetStringTextString
import trap_SP_Register
import trap_SP_RegisterServer
import trap_SnapVector
import trap_GeneticParentsAndChildSelection
import trap_BotResetWeaponState
import trap_BotFreeWeaponState
import trap_BotAllocWeaponState
import trap_BotLoadWeaponWeights
import trap_BotGetWeaponInfo
import trap_BotChooseBestFightWeapon
import trap_BotAddAvoidSpot
import trap_BotInitMoveState
import trap_BotFreeMoveState
import trap_BotAllocMoveState
import trap_BotPredictVisiblePosition
import trap_BotMovementViewTarget
import trap_BotReachabilityArea
import trap_BotResetLastAvoidReach
import trap_BotResetAvoidReach
import trap_BotMoveInDirection
import trap_BotMoveToGoal
import trap_BotResetMoveState
import trap_BotFreeGoalState
import trap_BotAllocGoalState
import trap_BotMutateGoalFuzzyLogic
import trap_BotSaveGoalFuzzyLogic
import trap_BotInterbreedGoalFuzzyLogic
import trap_BotFreeItemWeights
import trap_BotLoadItemWeights
import trap_BotUpdateEntityItems
import trap_BotInitLevelItems
import trap_BotSetAvoidGoalTime
import trap_BotAvoidGoalTime
import trap_BotGetLevelItemGoal
import trap_BotGetMapLocationGoal
import trap_BotGetNextCampSpotGoal
import trap_BotItemGoalInVisButNotVisible
import trap_BotTouchingGoal
import trap_BotChooseNBGItem
import trap_BotChooseLTGItem
import trap_BotGetSecondGoal
import trap_BotGetTopGoal
import trap_BotGoalName
import trap_BotDumpGoalStack
import trap_BotDumpAvoidGoals
import trap_BotEmptyGoalStack
import trap_BotPopGoal
import trap_BotPushGoal
import trap_BotResetAvoidGoals
import trap_BotRemoveFromAvoidGoals
import trap_BotResetGoalState
import trap_BotSetChatName
import trap_BotSetChatGender
import trap_BotLoadChatFile
import trap_BotReplaceSynonyms
import trap_UnifyWhiteSpaces
import trap_BotMatchVariable
import trap_BotFindMatch
import trap_StringContains
import trap_BotGetChatMessage
import trap_BotEnterChat
import trap_BotChatLength
import trap_BotReplyChat
import trap_BotNumInitialChats
import trap_BotInitialChat
import trap_BotNumConsoleMessages
import trap_BotNextConsoleMessage
import trap_BotRemoveConsoleMessage
import trap_BotQueueConsoleMessage
import trap_BotFreeChatState
import trap_BotAllocChatState
import trap_Characteristic_String
import trap_Characteristic_BInteger
import trap_Characteristic_Integer
import trap_Characteristic_BFloat
import trap_Characteristic_Float
import trap_BotFreeCharacter
import trap_BotLoadCharacter
import trap_EA_ResetInput
import trap_EA_GetInput
import trap_EA_EndRegular
import trap_EA_ForcePower
import trap_EA_Alt_Attack
import trap_EA_View
import trap_EA_Move
import trap_EA_DelayedJump
import trap_EA_Jump
import trap_EA_SelectWeapon
import trap_EA_MoveRight
import trap_EA_MoveLeft
import trap_EA_MoveBack
import trap_EA_MoveForward
import trap_EA_MoveDown
import trap_EA_MoveUp
import trap_EA_Crouch
import trap_EA_Respawn
import trap_EA_Use
import trap_EA_Attack
import trap_EA_Talk
import trap_EA_Gesture
import trap_EA_Action
import trap_EA_Command
import trap_EA_SayTeam
import trap_EA_Say
import trap_AAS_PredictClientMovement
import trap_AAS_Swimming
import trap_AAS_AlternativeRouteGoals
import trap_AAS_PredictRoute
import trap_AAS_EnableRoutingArea
import trap_AAS_AreaTravelTimeToGoalArea
import trap_AAS_AreaReachability
import trap_AAS_IntForBSPEpairKey
import trap_AAS_FloatForBSPEpairKey
import trap_AAS_VectorForBSPEpairKey
import trap_AAS_ValueForBSPEpairKey
import trap_AAS_NextBSPEntity
import trap_AAS_PointContents
import trap_AAS_TraceAreas
import trap_AAS_PointReachabilityAreaIndex
import trap_AAS_PointAreaNum
import trap_AAS_Time
import trap_AAS_PresenceTypeBoundingBox
import trap_AAS_Initialized
import trap_AAS_EntityInfo
import trap_AAS_AreaInfo
import trap_AAS_BBoxAreas
import trap_BotUserCommand
import trap_BotGetServerCommand
import trap_BotGetSnapshotEntity
import trap_BotLibTest
import trap_BotLibUpdateEntity
import trap_BotLibLoadMap
import trap_BotLibStartFrame
import trap_BotLibDefine
import trap_BotLibVarGet
import trap_BotLibVarSet
import trap_BotLibShutdown
import trap_BotLibSetup
import trap_DebugPolygonDelete
import trap_DebugPolygonCreate
import trap_GetEntityToken
import trap_GetUsercmd
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_EntityContact
import trap_EntitiesInBox
import trap_UnlinkEntity
import trap_LinkEntity
import trap_AreasConnected
import trap_AdjustAreaPortalState
import trap_InPVSIgnorePortals
import trap_InPVS
import trap_PointContents
import trap_Trace
import trap_SetBrushModel
import trap_GetServerinfo
import trap_SetUserinfo
import trap_GetUserinfo
import trap_GetConfigstring
import trap_SetConfigstring
import trap_SendServerCommand
import trap_DropClient
import trap_LocateGameData
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_VariableIntegerValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_SendConsoleCommand
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Milliseconds
import trap_Error
import trap_Printf
import jd_CloseServer
import jd_FakePlayerDetection
import jd_antiForceCrash
import jd_antiNameCrash
import jd_antiFlood
import cm_clanLogout_saying
import cm_clanLogin_saying
import cm_teleport_saying
import cm_slay_saying
import cm_sleep_off_saying
import cm_sleep_on_saying
import cm_punish_off_saying
import cm_punish_on_saying
import cm_slap_saying
import cm_silence_off_saying
import cm_silence_on_saying
import cm_protect_off_saying
import cm_protect_on_saying
import cm_terminator_off_saying
import cm_terminator_on_saying
import cm_empower_off_saying
import cm_empower_on_saying
import cm_AdminLogout3_saying
import cm_AdminLogout2_saying
import cm_AdminLogout1_saying
import cm_AdminLogin3_saying
import cm_AdminLogin2_saying
import cm_AdminLogin1_saying
import cm_adminPassword3
import cm_adminPassword2
import cm_adminPassword1
import cm_clanPassword
import cm_voteControl
import cm_emoteControl
import cm_adminControl3
import cm_adminControl2
import cm_adminControl1
import cm_adminLevel3
import cm_adminLevel2
import cm_adminLevel1
import cm_report
import cm_clanTag
import cm_badwords
import sv_maxConnections
import cm_autoprotecttime
import cm_knockmedown
import cm_blacknames
import cm_duelshield
import cm_duelhealth
import cm_duelradius
import cm_duelstatus
import mod_pushall
import cm_samenames
import cm_duelbeginsaberoff
import cm_multiduels
import cm_dualblade
import cm_motd_time
import cm_motd
import cm_console_motd
import g_austrian
import g_saberDebugPrint
import g_saberDmgDelay_Wound
import g_saberDmgDelay_Idle
import g_saberDmgVelocityScale
import g_timeouttospec
import g_forceDodge
import g_dismember
import g_singlePlayer
import g_enableBreath
import g_enableDust
import g_rankings
import pmove_msec
import pmove_fixed
import g_smoothClients
import g_blueteam
import g_redteam
import g_debugUp
import g_debugRight
import g_debugForward
import g_filterBan
import g_banIPs
import g_teamForceBalance
import g_teamAutoJoin
import g_allowVote
import g_blood
import g_doWarmup
import g_warmup
import g_motd
import g_synchronousClients
import g_adaptRespawn
import g_weaponTeamRespawn
import g_weaponRespawn
import g_debugDamage
import g_debugAlloc
import g_debugMove
import g_inactivity
import g_forcerespawn
import g_quadfactor
import g_knockback
import g_speed
import g_gravity
import g_needpass
import g_password
import g_friendlySaber
import g_friendlyFire
import g_saberInterpolate
import g_capturelimit
import g_timelimit
import g_duel_fraglimit
import g_fraglimit
import g_duelWeaponDisable
import g_fraglimitVoteCorrection
import g_allowDuelSuicide
import g_weaponDisable
import g_forcePowerDisable
import g_spawnInvulnerability
import g_forceRegenTime
import g_saberDamageScale
import g_slowmoDuelEnd
import g_logClientInfo
import g_saberBoxTraceSize
import g_saberAlwaysBoxTrace
import g_saberGhoul2Collision
import g_saberTraceSaberFirst
import g_saberLockFactor
import g_saberLocking
import g_privateDuel
import g_forceBasedTeams
import g_maxForceRank
import g_dmflags
import g_autoMapCycle
import g_trueJedi
import g_restarted
import g_maxGameClients
import g_maxclients
import g_cheats
import g_dedicated
import g_gametype
import g_entities
import level
import Pickup_Team
import CheckTeamStatus
import TeamplayInfoMessage
import Team_GetLocationMsg
import Team_GetLocation
import SelectSagaSpawnPoint
import SelectCTFSpawnPoint
import Team_FreeEntity
import Team_ReturnFlag
import Team_InitGame
import Team_CheckHurtCarrier
import Team_FragBonuses
import Team_DroppedFlagThink
import AddTeamScore
import TeamColorString
import OtherTeamName
import TeamName
import OtherTeam
import BotAIStartFrame
import BotAIShutdownClient
import BotAISetupClient
import BotAILoadMap
import BotAIShutdown
import BotAISetup
import B_CleanupAlloc
import B_InitAlloc
import InFieldOfVision
import BotOrder
import OrgVisible
import InitSagaMode
import G_ClearClientLog
import G_LogExit
import G_LogWeaponOutput
import G_LogWeaponInit
import G_LogWeaponItem
import G_LogWeaponPowerup
import G_LogWeaponFrag
import G_LogWeaponDeath
import G_LogWeaponKill
import G_LogWeaponDamage
import G_LogWeaponFire
import G_LogWeaponPickup
import Jedi_DodgeEvasion
import ForceTelepathy
import ForceThrow
import ForceSeeing
import ForceTeamForceReplenish
import ForceTeamHeal
import ForceAbsorb
import ForceProtect
import ForceGrip
import ForceRage
import ForceSpeed
import ForceHeal
import ForcePowerUsableOn
import WP_ForcePowersUpdate
import WP_SpawnInitForcePowers
import WP_InitForcePowers
import WP_SaberInitBladeData
import WP_SaberCanBlock
import WP_SaberPositionUpdate
import WP_ForcePowerStop
import HasSetSaberOnly
import G_PreDefSound
import G_RefreshNextMap
import G_DoesMapSupportGametype
import BotInterbreedEndMatch
import Svcmd_BotList_f
import Svcmd_AddBot_f
import G_BotConnect
import G_RemoveQueuedBotBegin
import G_CheckBotSpawn
import G_GetBotInfoByName
import G_GetBotInfoByNumber
import G_InitBots
import UpdateTournamentInfo
import G_WriteSessionData
import G_InitWorldSession
import G_InitSessionData
import G_ReadSessionData
import Svcmd_GameMem_f
import G_InitMemory
import G_Alloc
import Team_CheckDroppedItem
import OnSameTeam
import G_RunClient
import ClientEndFrame
import ClientThink
import G_CheckClientTimeouts
import ClientCommand
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
import G_GetStripEdString
import G_Error
import G_Printf
import SendScoreboardMessageToAllClients
import G_LogPrintf
import G_RunThink
import CheckTeamLeader
import SetLeader
import FindIntermissionPoint
import gSlowMoDuelTime
import gDoSlowMoDuel
import g_ff_objectives
import DeathmatchScoreboardMessage
import G_SetStats
import MoveClientToIntermission
import BlowDetpacks
import FireWeapon
import gJMSaberEnt
import SpotWouldTelefrag
import CalculateRanks
import AddScore
import player_die
import ClientSpawn
import InitBodyQue
import BeginIntermission
import respawn
import CopyToBodyQue
import SelectSpawnPoint
import SetClientViewAngle
import PickTeam
import TeamLeader
import TeamCount
import CheckGauntletAttack
import SnapVectorTowards
import CalcMuzzlePoint
import LogAccuracyHit
import WP_FireGenericBlasterMissile
import WP_FireTurretMissile
import G_CreateExampleAnimEnt
import G_PlayerBecomeATST
import ATST_ManageDamageBoxes
import TeleportPlayer
import trigger_teleporter_touch
import Touch_DoorTrigger
import G_RunMover
import WP_FireBlasterMissile
import G_ExplodeMissile
import G_BounceProjectile
import CreateMissile
import G_RunMissile
import G_ReflectMissile
import gGAvoidDismember
import G_CheckForDismemberment
import ExplodeDeath
import TossClientCubes
import TossClientItems
import TossClientWeapon
import body_die
import G_RadiusDamage
import G_Damage
import CanDamage
import trap_G2API_SetBoneAnim
import trap_G2API_GetGLAName
import trap_G2API_SetBoneAngles
import trap_G2API_CollisionDetect
import trap_G2API_CleanGhoul2Models
import trap_G2API_RemoveGhoul2Model
import trap_G2API_HasGhoul2ModelOnIndex
import trap_G2API_DuplicateGhoul2Instance
import trap_G2API_CopySpecificGhoul2Model
import trap_G2API_CopyGhoul2Instance
import trap_G2API_SetBoltInfo
import trap_G2API_AddBolt
import trap_G2API_InitGhoul2Model
import trap_G2API_GetBoltMatrix_NoRecNoRot
import trap_G2API_GetBoltMatrix_NoReconstruct
import trap_G2API_GetBoltMatrix
import trap_G2_HaveWeGhoul2Models
import trap_G2_SetGhoul2ModelIndexes
import trap_G2_ListModelBones
import trap_G2_ListModelSurfaces
import G_SkinIndex
import BuildShaderStateConfig
import AddRemap
import G_SetOrigin
import G_AddEvent
import G_AddPredictableEvent
import vtos
import tv
import G_RunObject
import G_TouchSolids
import G_TouchTriggers
import G_EntitiesFree
import G_FreeEntity
import G_KillG2Queue
import G_SendG2KillQueue
import TryUse
import G_EntitySound
import G_SoundAtLoc
import G_Sound
import G_MuteSound
import G_ScreenShake
import G_PlayEffect
import G_TempEntity
import G_Spawn
import G_InitGentity
import G_SetAngles
import G_SetMovedir
import G_UseTargets
import G_PickTarget
import G_RadiusList
import G_Find
import G_KillBox
import G_TeamCommand
import G_EffectIndex
import G_SoundIndex
import G_ModelIndex
import SaveRegisteredItems
import RegisterItem
import ClearRegisteredItems
import Touch_Item
import Add_Ammo
import ArmorIndex
import Think_Weapon
import FinishSpawningItem
import G_SpawnItem
import SetRespawn
import LaunchItem
import Drop_Item
import PrecacheItem
import UseHoldableItem
import ResetItem
import RespawnItem
import G_RunItem
import G_CheckTeamItems
import ItemUse_MedPack
import ItemUse_Seeker
import ItemUse_Sentry
import ItemUse_Shield
import ItemUse_Binoculars
import G_GetDuelWinner
import Cmd_EngageDuel_f
import Cmd_ToggleSaber_f
import G_ItemUsable
import Cmd_SaberAttackCycle_f
import Cmd_FollowCycle_f
import SetTeam
import BroadcastTeamChange
import StopFollowing
import Cmd_Score_f
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
import gEscapeTime
import gEscaping
import g2SaberInstance
import precachedKyle
import forcePowerDarkLight
import WeaponAttackAnim
import WeaponReadyAnim
import BG_OutOfMemory
import BG_StringAlloc
import BG_TempFree
import BG_TempAlloc
import BG_AllocUnaligned
import BG_Alloc
import BG_CanUseFPNow
import BG_HasYsalamiri
import BG_GetItemIndexByTag
import BG_ParseAnimationFile
import BG_PlayerTouchesItem
import BG_PlayerStateToEntityStateExtraPolate
import BG_PlayerStateToEntityState
import BG_TouchJumpPad
import BG_AddPredictableEventToPlayerstate
import BG_EvaluateTrajectoryDelta
import BG_EvaluateTrajectory
import BG_ForcePowerDrain
import BG_SaberStartTransAnim
import BG_InDeathAnim
import BG_InRoll
import BG_KnockawayForParry
import BG_BrokenParryForParry
import BG_BrokenParryForAttack
import BG_SaberInSpecialAttack
import BG_SpinningSaberAnim
import BG_FlippingAnim
import BG_SaberInIdle
import BG_SaberInSpecial
import BG_SaberInAttack
import BG_DirectFlippingAnim
import BG_InSaberStandAnim
import BG_InSpecialJump
import BG_LegalizedForcePowers
import saberMoveData
import BG_CanItemBeGrabbed
import BG_FindItemForHoldable
import BG_FindItemForPowerup
import BG_FindItemForWeapon
import BG_FindItem
import vectoyaw
import bg_numItems
import bg_itemlist
import Pmove
import PM_UpdateViewAngles
import pm
import bgForcePowerCost
import forceMasteryPoints
import forceMasteryLevels
import bgGlobalAnimations
import BGPAFtextLoaded
import forcePowerSorted
import WP_MuzzlePoint
import ammoData
import weaponData
import GetStringForID
import GetIDForString
import Q_irand
import irand
import flrand
import Rand_Init
import Com_Printf
import Com_Error
import Info_NextPair
import Info_Validate
import Info_SetValueForKey_Big
import Info_SetValueForKey
import Info_RemoveKey_big
import Info_RemoveKey
import Info_ValueForKey
import va
import Q_CleanStr
import Q_PrintStrlen
import Q_strcat
import Q_strncpyz
import Q_strrchr
import Q_strupr
import Q_strlwr
import Q_stricmpn
import Q_strncmp
import Q_stricmp
import Q_isalpha
import Q_isupper
import Q_islower
import Q_isprint
import Com_sprintf
import Parse3DMatrix
import Parse2DMatrix
import Parse1DMatrix
import SkipRestOfLine
import SkipBracedSection
import COM_MatchToken
import COM_ParseVec4
import COM_ParseFloat
import COM_ParseInt
import COM_ParseString
import COM_ParseWarning
import COM_ParseError
import COM_Compress
import COM_ParseExt
import COM_Parse
import SkipWhitespace
import COM_GetCurrentParseLine
import COM_BeginParseSession
import COM_DefaultExtension
import COM_StripExtension
import COM_SkipPath
import Com_Clamp
import PerpendicularVector
import AngleVectors
import MatrixMultiply
import MakeNormalVectors
import RotateAroundDirection
import RotatePointAroundVector
import ProjectPointOnPlane
import PlaneFromPoints
import AngleDelta
import AngleNormalize180
import AngleNormalize360
import AnglesSubtract
import AngleSubtract
import LerpAngle
import AngleMod
import BoxOnPlaneSide
import SetPlaneSignbits
import AxisCopy
import AxisClear
import AnglesToAxis
import vectoangles
import Q_crandom
import Q_random
import Q_rand
import Q_acos
import Q_log2
import VectorRotate
import Vector4Scale
import VectorNormalize2
import VectorNormalize
import CrossProduct
import VectorInverse
import VectorNormalizeFast
import DistanceSquared
import Distance
import VectorLengthSquared
import VectorLength
import VectorCompare
import AddPointToBounds
import ClearBounds
import RadiusFromBounds
import NormalizeColor
import ColorBytes4
import ColorBytes3
import _VectorMA
import _VectorScale
import _VectorCopy
import _VectorAdd
import _VectorSubtract
import _DotProduct
import ByteToDir
import DirToByte
import powf
import ClampShort
import ClampChar
import Q_rsqrt
import Q_fabs
import axisDefault
import vec3_origin
import g_color_table
import colorDkBlue
import colorLtBlue
import colorDkGrey
import colorMdGrey
import colorLtGrey
import colorWhite
import colorCyan
import colorMagenta
import colorYellow
import colorBlue
import colorGreen
import colorRed
import colorBlack
import colorTable
import bytedirs
import Com_Memcpy
import Com_Memset
import Hunk_Alloc
import forceSpeedLevels
import FloatSwap
import LongSwap
import ShortSwap
import acos
import fabs
import abs
import tan
import atan2
import cos
import sin
import sqrt
import floor
import ceil
import memcpy
import memset
import memmove
import sscanf
import vsprintf
import _atoi
import atoi
import _atof
import atof
import toupper
import tolower
import strncpy
import strstr
import strchr
import strcmp
import strcpy
import strcat
import strlen
import rand
import srand
import qsort
lit
align 1
LABELV $1098
char 1 99
char 1 112
char 1 32
char 1 34
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $1097
char 1 99
char 1 115
char 1 97
char 1 121
char 1 0
align 1
LABELV $1094
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 94
char 1 53
char 1 91
char 1 94
char 1 55
char 1 83
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 94
char 1 53
char 1 93
char 1 94
char 1 55
char 1 58
char 1 32
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $1093
char 1 115
char 1 97
char 1 121
char 1 0
align 1
LABELV $1087
char 1 119
char 1 104
char 1 111
char 1 0
align 1
LABELV $1084
char 1 116
char 1 101
char 1 114
char 1 109
char 1 105
char 1 110
char 1 97
char 1 116
char 1 111
char 1 114
char 1 0
align 1
LABELV $1081
char 1 115
char 1 108
char 1 97
char 1 121
char 1 0
align 1
LABELV $1078
char 1 112
char 1 114
char 1 111
char 1 116
char 1 101
char 1 99
char 1 116
char 1 0
align 1
LABELV $1075
char 1 115
char 1 108
char 1 97
char 1 112
char 1 0
align 1
LABELV $1072
char 1 108
char 1 111
char 1 99
char 1 107
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $1069
char 1 99
char 1 104
char 1 97
char 1 110
char 1 103
char 1 101
char 1 109
char 1 97
char 1 112
char 1 0
align 1
LABELV $1066
char 1 107
char 1 105
char 1 99
char 1 107
char 1 0
align 1
LABELV $1063
char 1 114
char 1 101
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $1060
char 1 101
char 1 109
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 0
align 1
LABELV $1057
char 1 115
char 1 105
char 1 108
char 1 101
char 1 110
char 1 99
char 1 101
char 1 0
align 1
LABELV $1054
char 1 99
char 1 104
char 1 97
char 1 110
char 1 103
char 1 101
char 1 109
char 1 111
char 1 100
char 1 101
char 1 0
align 1
LABELV $1051
char 1 99
char 1 115
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 0
align 1
LABELV $1048
char 1 115
char 1 108
char 1 101
char 1 101
char 1 112
char 1 0
align 1
LABELV $1045
char 1 112
char 1 117
char 1 110
char 1 105
char 1 115
char 1 104
char 1 0
align 1
LABELV $1042
char 1 103
char 1 95
char 1 98
char 1 97
char 1 110
char 1 73
char 1 80
char 1 115
char 1 10
char 1 0
align 1
LABELV $1041
char 1 108
char 1 105
char 1 115
char 1 116
char 1 105
char 1 112
char 1 0
align 1
LABELV $1038
char 1 114
char 1 101
char 1 109
char 1 111
char 1 118
char 1 101
char 1 105
char 1 112
char 1 0
align 1
LABELV $1035
char 1 97
char 1 100
char 1 100
char 1 105
char 1 112
char 1 0
align 1
LABELV $1032
char 1 98
char 1 111
char 1 116
char 1 108
char 1 105
char 1 115
char 1 116
char 1 0
align 1
LABELV $1029
char 1 97
char 1 100
char 1 100
char 1 98
char 1 111
char 1 116
char 1 0
align 1
LABELV $1026
char 1 103
char 1 97
char 1 109
char 1 101
char 1 95
char 1 109
char 1 101
char 1 109
char 1 111
char 1 114
char 1 121
char 1 0
align 1
LABELV $1023
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $1020
char 1 101
char 1 110
char 1 116
char 1 105
char 1 116
char 1 121
char 1 108
char 1 105
char 1 115
char 1 116
char 1 0
align 1
LABELV $1013
char 1 65
char 1 100
char 1 109
char 1 105
char 1 110
char 1 66
char 1 97
char 1 110
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 101
char 1 120
char 1 101
char 1 99
char 1 117
char 1 116
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 32
char 1 111
char 1 110
char 1 32
char 1 37
char 1 115
char 1 46
char 1 32
char 1 40
char 1 73
char 1 80
char 1 58
char 1 32
char 1 37
char 1 115
char 1 41
char 1 10
char 1 0
align 1
LABELV $1005
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 47
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 98
char 1 97
char 1 110
char 1 32
char 1 40
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 41
char 1 10
char 1 0
align 1
LABELV $1000
char 1 65
char 1 100
char 1 109
char 1 105
char 1 110
char 1 75
char 1 105
char 1 99
char 1 107
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 101
char 1 120
char 1 101
char 1 99
char 1 117
char 1 116
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 32
char 1 111
char 1 110
char 1 32
char 1 37
char 1 115
char 1 46
char 1 10
char 1 0
align 1
LABELV $999
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 107
char 1 105
char 1 99
char 1 107
char 1 32
char 1 37
char 1 100
char 1 0
align 1
LABELV $991
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 47
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 107
char 1 105
char 1 99
char 1 107
char 1 32
char 1 40
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 41
char 1 10
char 1 0
align 1
LABELV $965
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 37
char 1 115
char 1 94
char 1 55
char 1 32
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $961
char 1 84
char 1 101
char 1 108
char 1 101
char 1 112
char 1 111
char 1 114
char 1 116
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 105
char 1 115
char 1 32
char 1 101
char 1 120
char 1 101
char 1 99
char 1 117
char 1 116
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 32
char 1 111
char 1 110
char 1 32
char 1 37
char 1 115
char 1 46
char 1 10
char 1 0
align 1
LABELV $926
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 47
char 1 116
char 1 101
char 1 108
char 1 101
char 1 112
char 1 111
char 1 114
char 1 116
char 1 32
char 1 40
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 41
char 1 10
char 1 47
char 1 116
char 1 101
char 1 108
char 1 101
char 1 112
char 1 111
char 1 114
char 1 116
char 1 32
char 1 40
char 1 88
char 1 32
char 1 89
char 1 32
char 1 90
char 1 41
char 1 10
char 1 47
char 1 116
char 1 101
char 1 108
char 1 101
char 1 112
char 1 111
char 1 114
char 1 116
char 1 32
char 1 40
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 41
char 1 32
char 1 40
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 41
char 1 10
char 1 47
char 1 116
char 1 101
char 1 108
char 1 101
char 1 112
char 1 111
char 1 114
char 1 116
char 1 32
char 1 40
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 41
char 1 32
char 1 40
char 1 88
char 1 32
char 1 89
char 1 32
char 1 90
char 1 41
char 1 10
char 1 0
align 1
LABELV $921
char 1 32
char 1 77
char 1 65
char 1 80
char 1 58
char 1 37
char 1 115
char 1 46
char 1 10
char 1 0
align 1
LABELV $920
char 1 109
char 1 97
char 1 112
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $919
char 1 67
char 1 104
char 1 97
char 1 110
char 1 103
char 1 101
char 1 77
char 1 97
char 1 112
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 101
char 1 120
char 1 101
char 1 99
char 1 117
char 1 116
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 32
char 1 116
char 1 111
char 1 32
char 1 71
char 1 65
char 1 77
char 1 69
char 1 84
char 1 89
char 1 80
char 1 69
char 1 58
char 1 37
char 1 115
char 1 0
align 1
LABELV $918
char 1 103
char 1 95
char 1 103
char 1 97
char 1 109
char 1 101
char 1 116
char 1 121
char 1 112
char 1 101
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $917
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 47
char 1 99
char 1 104
char 1 97
char 1 110
char 1 103
char 1 101
char 1 109
char 1 97
char 1 112
char 1 32
char 1 40
char 1 103
char 1 97
char 1 109
char 1 101
char 1 116
char 1 121
char 1 112
char 1 101
char 1 41
char 1 32
char 1 40
char 1 109
char 1 97
char 1 112
char 1 41
char 1 10
char 1 0
align 1
LABELV $886
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 47
char 1 112
char 1 114
char 1 111
char 1 116
char 1 101
char 1 99
char 1 116
char 1 32
char 1 40
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 41
char 1 10
char 1 0
align 1
LABELV $814
char 1 65
char 1 109
char 1 98
char 1 105
char 1 103
char 1 117
char 1 111
char 1 117
char 1 115
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 10
char 1 0
align 1
LABELV $809
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 47
char 1 116
char 1 101
char 1 114
char 1 109
char 1 105
char 1 110
char 1 97
char 1 116
char 1 111
char 1 114
char 1 32
char 1 40
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 41
char 1 10
char 1 0
align 1
LABELV $790
char 1 73
char 1 80
char 1 58
char 1 37
char 1 115
char 1 32
char 1 35
char 1 58
char 1 37
char 1 105
char 1 32
char 1 67
char 1 76
char 1 73
char 1 69
char 1 78
char 1 84
char 1 58
char 1 37
char 1 115
char 1 0
align 1
LABELV $736
char 1 69
char 1 109
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 101
char 1 120
char 1 101
char 1 99
char 1 117
char 1 116
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 32
char 1 111
char 1 110
char 1 32
char 1 37
char 1 115
char 1 46
char 1 32
char 1 40
char 1 97
char 1 112
char 1 112
char 1 108
char 1 121
char 1 105
char 1 110
char 1 103
char 1 41
char 1 10
char 1 0
align 1
LABELV $727
char 1 69
char 1 109
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 101
char 1 120
char 1 101
char 1 99
char 1 117
char 1 116
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 32
char 1 111
char 1 110
char 1 32
char 1 37
char 1 115
char 1 46
char 1 32
char 1 40
char 1 114
char 1 101
char 1 109
char 1 111
char 1 118
char 1 105
char 1 110
char 1 103
char 1 41
char 1 10
char 1 0
align 1
LABELV $703
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 47
char 1 101
char 1 109
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 32
char 1 40
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 41
char 1 10
char 1 0
align 1
LABELV $657
char 1 67
char 1 97
char 1 110
char 1 39
char 1 116
char 1 32
char 1 102
char 1 105
char 1 110
char 1 100
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 10
char 1 0
align 1
LABELV $654
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 47
char 1 115
char 1 108
char 1 101
char 1 101
char 1 112
char 1 32
char 1 40
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 41
char 1 10
char 1 0
align 1
LABELV $650
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 49
char 1 99
char 1 108
char 1 97
char 1 110
char 1 32
char 1 109
char 1 97
char 1 116
char 1 99
char 1 104
char 1 94
char 1 55
char 1 32
char 1 104
char 1 97
char 1 115
char 1 32
char 1 115
char 1 116
char 1 111
char 1 112
char 1 112
char 1 101
char 1 100
char 1 33
char 1 10
char 1 34
char 1 0
align 1
LABELV $649
char 1 99
char 1 112
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 49
char 1 99
char 1 108
char 1 97
char 1 110
char 1 32
char 1 109
char 1 97
char 1 116
char 1 99
char 1 104
char 1 94
char 1 55
char 1 32
char 1 104
char 1 97
char 1 115
char 1 32
char 1 115
char 1 116
char 1 111
char 1 112
char 1 112
char 1 101
char 1 100
char 1 33
char 1 10
char 1 34
char 1 0
align 1
LABELV $637
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 94
char 1 55
char 1 65
char 1 32
char 1 94
char 1 51
char 1 99
char 1 108
char 1 97
char 1 110
char 1 32
char 1 109
char 1 97
char 1 116
char 1 99
char 1 104
char 1 94
char 1 55
char 1 32
char 1 104
char 1 97
char 1 115
char 1 32
char 1 98
char 1 101
char 1 103
char 1 117
char 1 110
char 1 33
char 1 10
char 1 34
char 1 0
align 1
LABELV $636
char 1 99
char 1 112
char 1 32
char 1 34
char 1 94
char 1 55
char 1 65
char 1 32
char 1 94
char 1 51
char 1 99
char 1 108
char 1 97
char 1 110
char 1 32
char 1 109
char 1 97
char 1 116
char 1 99
char 1 104
char 1 94
char 1 55
char 1 32
char 1 104
char 1 97
char 1 115
char 1 32
char 1 98
char 1 101
char 1 103
char 1 117
char 1 110
char 1 33
char 1 10
char 1 34
char 1 0
align 1
LABELV $635
char 1 67
char 1 104
char 1 97
char 1 110
char 1 103
char 1 101
char 1 77
char 1 111
char 1 100
char 1 101
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 101
char 1 120
char 1 101
char 1 99
char 1 117
char 1 116
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 46
char 1 32
char 1 40
char 1 83
char 1 84
char 1 65
char 1 82
char 1 84
char 1 58
char 1 32
char 1 67
char 1 108
char 1 97
char 1 110
char 1 77
char 1 97
char 1 116
char 1 99
char 1 104
char 1 41
char 1 10
char 1 0
align 1
LABELV $629
char 1 67
char 1 108
char 1 97
char 1 110
char 1 77
char 1 97
char 1 116
char 1 99
char 1 104
char 1 32
char 1 109
char 1 111
char 1 100
char 1 101
char 1 32
char 1 99
char 1 97
char 1 110
char 1 32
char 1 111
char 1 110
char 1 108
char 1 121
char 1 32
char 1 98
char 1 101
char 1 32
char 1 117
char 1 115
char 1 101
char 1 100
char 1 32
char 1 100
char 1 117
char 1 114
char 1 105
char 1 110
char 1 103
char 1 32
char 1 84
char 1 70
char 1 70
char 1 65
char 1 32
char 1 103
char 1 97
char 1 109
char 1 101
char 1 116
char 1 121
char 1 112
char 1 101
char 1 46
char 1 10
char 1 0
align 1
LABELV $624
char 1 109
char 1 97
char 1 116
char 1 99
char 1 104
char 1 0
align 1
LABELV $623
char 1 99
char 1 108
char 1 97
char 1 110
char 1 109
char 1 97
char 1 116
char 1 99
char 1 104
char 1 0
align 1
LABELV $620
char 1 65
char 1 32
char 1 109
char 1 111
char 1 100
char 1 101
char 1 32
char 1 105
char 1 115
char 1 32
char 1 97
char 1 108
char 1 114
char 1 101
char 1 97
char 1 100
char 1 121
char 1 32
char 1 101
char 1 110
char 1 97
char 1 98
char 1 108
char 1 101
char 1 100
char 1 10
char 1 0
align 1
LABELV $619
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 49
char 1 99
char 1 108
char 1 97
char 1 110
char 1 32
char 1 109
char 1 101
char 1 101
char 1 116
char 1 105
char 1 110
char 1 103
char 1 94
char 1 55
char 1 32
char 1 104
char 1 97
char 1 115
char 1 32
char 1 115
char 1 116
char 1 111
char 1 112
char 1 112
char 1 101
char 1 100
char 1 33
char 1 10
char 1 34
char 1 0
align 1
LABELV $618
char 1 99
char 1 112
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 49
char 1 99
char 1 108
char 1 97
char 1 110
char 1 32
char 1 109
char 1 101
char 1 101
char 1 116
char 1 105
char 1 110
char 1 103
char 1 94
char 1 55
char 1 32
char 1 104
char 1 97
char 1 115
char 1 32
char 1 115
char 1 116
char 1 111
char 1 112
char 1 112
char 1 101
char 1 100
char 1 33
char 1 10
char 1 34
char 1 0
align 1
LABELV $606
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 94
char 1 55
char 1 65
char 1 32
char 1 94
char 1 51
char 1 99
char 1 108
char 1 97
char 1 110
char 1 32
char 1 109
char 1 101
char 1 101
char 1 116
char 1 105
char 1 110
char 1 103
char 1 94
char 1 55
char 1 32
char 1 104
char 1 97
char 1 115
char 1 32
char 1 98
char 1 101
char 1 103
char 1 117
char 1 110
char 1 33
char 1 10
char 1 34
char 1 0
align 1
LABELV $605
char 1 99
char 1 112
char 1 32
char 1 34
char 1 94
char 1 55
char 1 65
char 1 32
char 1 94
char 1 51
char 1 99
char 1 108
char 1 97
char 1 110
char 1 32
char 1 109
char 1 101
char 1 101
char 1 116
char 1 105
char 1 110
char 1 103
char 1 94
char 1 55
char 1 32
char 1 104
char 1 97
char 1 115
char 1 32
char 1 98
char 1 101
char 1 103
char 1 117
char 1 110
char 1 33
char 1 10
char 1 34
char 1 0
align 1
LABELV $604
char 1 67
char 1 104
char 1 97
char 1 110
char 1 103
char 1 101
char 1 77
char 1 111
char 1 100
char 1 101
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 101
char 1 120
char 1 101
char 1 99
char 1 117
char 1 116
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 46
char 1 32
char 1 40
char 1 83
char 1 84
char 1 65
char 1 82
char 1 84
char 1 58
char 1 32
char 1 67
char 1 108
char 1 97
char 1 110
char 1 77
char 1 101
char 1 101
char 1 116
char 1 105
char 1 110
char 1 103
char 1 41
char 1 10
char 1 0
align 1
LABELV $598
char 1 67
char 1 108
char 1 97
char 1 110
char 1 77
char 1 101
char 1 101
char 1 116
char 1 105
char 1 110
char 1 103
char 1 32
char 1 109
char 1 111
char 1 100
char 1 101
char 1 32
char 1 99
char 1 97
char 1 110
char 1 32
char 1 111
char 1 110
char 1 108
char 1 121
char 1 32
char 1 98
char 1 101
char 1 32
char 1 117
char 1 115
char 1 101
char 1 100
char 1 32
char 1 100
char 1 117
char 1 114
char 1 105
char 1 110
char 1 103
char 1 32
char 1 70
char 1 70
char 1 65
char 1 32
char 1 103
char 1 97
char 1 109
char 1 101
char 1 116
char 1 121
char 1 112
char 1 101
char 1 46
char 1 10
char 1 0
align 1
LABELV $593
char 1 109
char 1 101
char 1 101
char 1 116
char 1 105
char 1 110
char 1 103
char 1 0
align 1
LABELV $592
char 1 99
char 1 108
char 1 97
char 1 110
char 1 109
char 1 101
char 1 101
char 1 116
char 1 105
char 1 110
char 1 103
char 1 0
align 1
LABELV $589
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 47
char 1 99
char 1 104
char 1 97
char 1 110
char 1 103
char 1 101
char 1 109
char 1 111
char 1 100
char 1 101
char 1 32
char 1 40
char 1 109
char 1 111
char 1 100
char 1 101
char 1 41
char 1 10
char 1 109
char 1 111
char 1 100
char 1 101
char 1 115
char 1 32
char 1 61
char 1 32
char 1 99
char 1 108
char 1 97
char 1 110
char 1 109
char 1 97
char 1 116
char 1 99
char 1 104
char 1 32
char 1 99
char 1 108
char 1 97
char 1 110
char 1 109
char 1 101
char 1 101
char 1 116
char 1 105
char 1 110
char 1 103
char 1 10
char 1 0
align 1
LABELV $585
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 37
char 1 115
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 97
char 1 99
char 1 116
char 1 105
char 1 118
char 1 101
char 1 10
char 1 0
align 1
LABELV $581
char 1 65
char 1 109
char 1 98
char 1 105
char 1 103
char 1 117
char 1 111
char 1 117
char 1 115
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 73
char 1 68
char 1 32
char 1 102
char 1 111
char 1 114
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $578
char 1 67
char 1 97
char 1 110
char 1 39
char 1 116
char 1 32
char 1 102
char 1 105
char 1 110
char 1 100
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 73
char 1 68
char 1 32
char 1 102
char 1 111
char 1 114
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $575
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 94
char 1 51
char 1 47
char 1 99
char 1 115
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 40
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 41
char 1 32
char 1 40
char 1 109
char 1 101
char 1 115
char 1 115
char 1 97
char 1 103
char 1 101
char 1 41
char 1 10
char 1 47
char 1 99
char 1 115
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 97
char 1 108
char 1 108
char 1 32
char 1 40
char 1 109
char 1 101
char 1 115
char 1 115
char 1 97
char 1 103
char 1 101
char 1 41
char 1 10
char 1 0
align 1
LABELV $572
char 1 99
char 1 112
char 1 32
char 1 34
char 1 37
char 1 115
char 1 34
char 1 0
align 1
LABELV $571
char 1 97
char 1 108
char 1 108
char 1 0
align 1
LABELV $531
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 47
char 1 112
char 1 117
char 1 110
char 1 105
char 1 115
char 1 104
char 1 32
char 1 40
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 41
char 1 10
char 1 0
align 1
LABELV $514
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 105
char 1 115
char 1 32
char 1 99
char 1 117
char 1 114
char 1 114
char 1 101
char 1 110
char 1 116
char 1 108
char 1 121
char 1 32
char 1 98
char 1 101
char 1 105
char 1 110
char 1 103
char 1 32
char 1 112
char 1 117
char 1 110
char 1 105
char 1 115
char 1 104
char 1 101
char 1 100
char 1 10
char 1 0
align 1
LABELV $500
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 47
char 1 115
char 1 105
char 1 108
char 1 101
char 1 110
char 1 99
char 1 101
char 1 32
char 1 40
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 41
char 1 10
char 1 0
align 1
LABELV $495
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 37
char 1 115
char 1 32
char 1 94
char 1 55
char 1 104
char 1 97
char 1 115
char 1 32
char 1 98
char 1 101
char 1 101
char 1 110
char 1 32
char 1 114
char 1 101
char 1 110
char 1 97
char 1 109
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 97
char 1 110
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $494
char 1 99
char 1 112
char 1 32
char 1 34
char 1 94
char 1 55
char 1 89
char 1 111
char 1 117
char 1 39
char 1 118
char 1 101
char 1 32
char 1 98
char 1 101
char 1 101
char 1 110
char 1 32
char 1 114
char 1 101
char 1 110
char 1 97
char 1 109
char 1 101
char 1 100
char 1 32
char 1 116
char 1 111
char 1 10
char 1 94
char 1 55
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $486
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 47
char 1 114
char 1 101
char 1 110
char 1 97
char 1 109
char 1 101
char 1 32
char 1 40
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 41
char 1 32
char 1 40
char 1 110
char 1 101
char 1 119
char 1 32
char 1 110
char 1 97
char 1 109
char 1 101
char 1 41
char 1 10
char 1 0
align 1
LABELV $477
char 1 83
char 1 108
char 1 97
char 1 121
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 101
char 1 120
char 1 101
char 1 99
char 1 117
char 1 116
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 32
char 1 111
char 1 110
char 1 32
char 1 37
char 1 115
char 1 46
char 1 10
char 1 0
align 1
LABELV $460
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 47
char 1 115
char 1 108
char 1 97
char 1 121
char 1 32
char 1 40
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 41
char 1 10
char 1 0
align 1
LABELV $441
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 37
char 1 115
char 1 32
char 1 94
char 1 55
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $438
char 1 99
char 1 112
char 1 32
char 1 34
char 1 37
char 1 115
char 1 94
char 1 55
char 1 10
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $431
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 105
char 1 115
char 1 32
char 1 105
char 1 110
char 1 32
char 1 97
char 1 32
char 1 100
char 1 117
char 1 101
char 1 108
char 1 10
char 1 0
align 1
LABELV $427
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 97
char 1 99
char 1 116
char 1 105
char 1 118
char 1 101
char 1 10
char 1 0
align 1
LABELV $423
char 1 65
char 1 109
char 1 98
char 1 105
char 1 103
char 1 117
char 1 111
char 1 117
char 1 115
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 73
char 1 68
char 1 10
char 1 0
align 1
LABELV $420
char 1 67
char 1 97
char 1 110
char 1 39
char 1 116
char 1 32
char 1 102
char 1 105
char 1 110
char 1 100
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 73
char 1 68
char 1 10
char 1 0
align 1
LABELV $417
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 47
char 1 115
char 1 108
char 1 97
char 1 112
char 1 32
char 1 40
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 41
char 1 10
char 1 0
align 1
LABELV $414
char 1 67
char 1 97
char 1 110
char 1 110
char 1 111
char 1 116
char 1 32
char 1 117
char 1 115
char 1 101
char 1 32
char 1 116
char 1 104
char 1 105
char 1 115
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 105
char 1 110
char 1 32
char 1 116
char 1 104
char 1 105
char 1 115
char 1 32
char 1 103
char 1 97
char 1 109
char 1 101
char 1 116
char 1 121
char 1 112
char 1 101
char 1 46
char 1 10
char 1 0
align 1
LABELV $399
char 1 89
char 1 111
char 1 117
char 1 32
char 1 99
char 1 97
char 1 110
char 1 116
char 1 32
char 1 108
char 1 111
char 1 99
char 1 107
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 116
char 1 101
char 1 97
char 1 109
char 1 115
char 1 32
char 1 105
char 1 110
char 1 32
char 1 116
char 1 104
char 1 105
char 1 115
char 1 32
char 1 103
char 1 97
char 1 109
char 1 101
char 1 112
char 1 108
char 1 97
char 1 121
char 1 10
char 1 0
align 1
LABELV $398
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 50
char 1 74
char 1 111
char 1 105
char 1 110
char 1 32
char 1 94
char 1 55
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 119
char 1 32
char 1 94
char 1 50
char 1 117
char 1 110
char 1 76
char 1 111
char 1 99
char 1 107
char 1 101
char 1 100
char 1 94
char 1 55
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $397
char 1 99
char 1 112
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 50
char 1 74
char 1 111
char 1 105
char 1 110
char 1 32
char 1 94
char 1 55
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 119
char 1 32
char 1 94
char 1 50
char 1 117
char 1 110
char 1 76
char 1 111
char 1 99
char 1 107
char 1 101
char 1 100
char 1 94
char 1 55
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $396
char 1 76
char 1 111
char 1 99
char 1 107
char 1 84
char 1 101
char 1 97
char 1 109
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 101
char 1 120
char 1 101
char 1 99
char 1 117
char 1 116
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 32
char 1 111
char 1 110
char 1 32
char 1 74
char 1 111
char 1 105
char 1 110
char 1 32
char 1 84
char 1 101
char 1 97
char 1 109
char 1 46
char 1 32
char 1 40
char 1 117
char 1 110
char 1 108
char 1 111
char 1 99
char 1 107
char 1 105
char 1 110
char 1 103
char 1 41
char 1 10
char 1 0
align 1
LABELV $394
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 50
char 1 74
char 1 111
char 1 105
char 1 110
char 1 32
char 1 94
char 1 55
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 119
char 1 32
char 1 94
char 1 49
char 1 76
char 1 111
char 1 99
char 1 107
char 1 101
char 1 100
char 1 94
char 1 55
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $393
char 1 99
char 1 112
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 50
char 1 74
char 1 111
char 1 105
char 1 110
char 1 32
char 1 94
char 1 55
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 119
char 1 32
char 1 94
char 1 49
char 1 76
char 1 111
char 1 99
char 1 107
char 1 101
char 1 100
char 1 94
char 1 55
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $392
char 1 76
char 1 111
char 1 99
char 1 107
char 1 84
char 1 101
char 1 97
char 1 109
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 101
char 1 120
char 1 101
char 1 99
char 1 117
char 1 116
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 32
char 1 111
char 1 110
char 1 32
char 1 74
char 1 111
char 1 105
char 1 110
char 1 32
char 1 84
char 1 101
char 1 97
char 1 109
char 1 46
char 1 32
char 1 40
char 1 108
char 1 111
char 1 99
char 1 107
char 1 105
char 1 110
char 1 103
char 1 41
char 1 10
char 1 0
align 1
LABELV $383
char 1 106
char 1 0
align 1
LABELV $382
char 1 102
char 1 0
align 1
LABELV $381
char 1 101
char 1 110
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $380
char 1 102
char 1 114
char 1 101
char 1 101
char 1 0
align 1
LABELV $379
char 1 106
char 1 111
char 1 105
char 1 110
char 1 0
align 1
LABELV $376
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 51
char 1 83
char 1 112
char 1 101
char 1 99
char 1 116
char 1 97
char 1 116
char 1 111
char 1 114
char 1 32
char 1 94
char 1 55
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 119
char 1 32
char 1 94
char 1 50
char 1 117
char 1 110
char 1 76
char 1 111
char 1 99
char 1 107
char 1 101
char 1 100
char 1 94
char 1 55
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $375
char 1 99
char 1 112
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 51
char 1 83
char 1 112
char 1 101
char 1 99
char 1 116
char 1 97
char 1 116
char 1 111
char 1 114
char 1 32
char 1 94
char 1 55
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 119
char 1 32
char 1 94
char 1 50
char 1 117
char 1 110
char 1 76
char 1 111
char 1 99
char 1 107
char 1 101
char 1 100
char 1 94
char 1 55
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $373
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 51
char 1 83
char 1 112
char 1 101
char 1 99
char 1 116
char 1 97
char 1 116
char 1 111
char 1 114
char 1 32
char 1 94
char 1 55
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 119
char 1 32
char 1 94
char 1 49
char 1 76
char 1 111
char 1 99
char 1 107
char 1 101
char 1 100
char 1 94
char 1 55
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $372
char 1 99
char 1 112
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 51
char 1 83
char 1 112
char 1 101
char 1 99
char 1 116
char 1 97
char 1 116
char 1 111
char 1 114
char 1 32
char 1 94
char 1 55
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 119
char 1 32
char 1 94
char 1 49
char 1 76
char 1 111
char 1 99
char 1 107
char 1 101
char 1 100
char 1 94
char 1 55
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $371
char 1 76
char 1 111
char 1 99
char 1 107
char 1 84
char 1 101
char 1 97
char 1 109
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 101
char 1 120
char 1 101
char 1 99
char 1 117
char 1 116
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 32
char 1 111
char 1 110
char 1 32
char 1 83
char 1 112
char 1 101
char 1 99
char 1 116
char 1 97
char 1 116
char 1 111
char 1 114
char 1 32
char 1 84
char 1 101
char 1 97
char 1 109
char 1 46
char 1 32
char 1 40
char 1 108
char 1 111
char 1 99
char 1 107
char 1 105
char 1 110
char 1 103
char 1 41
char 1 10
char 1 0
align 1
LABELV $363
char 1 115
char 1 112
char 1 101
char 1 99
char 1 116
char 1 97
char 1 116
char 1 101
char 1 0
align 1
LABELV $362
char 1 115
char 1 112
char 1 101
char 1 99
char 1 0
align 1
LABELV $361
char 1 115
char 1 0
align 1
LABELV $360
char 1 115
char 1 112
char 1 101
char 1 99
char 1 116
char 1 97
char 1 116
char 1 111
char 1 114
char 1 0
align 1
LABELV $357
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 52
char 1 66
char 1 108
char 1 117
char 1 101
char 1 32
char 1 94
char 1 55
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 119
char 1 32
char 1 94
char 1 50
char 1 117
char 1 110
char 1 76
char 1 111
char 1 99
char 1 107
char 1 101
char 1 100
char 1 94
char 1 55
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $356
char 1 99
char 1 112
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 52
char 1 66
char 1 108
char 1 117
char 1 101
char 1 32
char 1 94
char 1 55
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 119
char 1 32
char 1 94
char 1 50
char 1 117
char 1 110
char 1 76
char 1 111
char 1 99
char 1 107
char 1 101
char 1 100
char 1 94
char 1 55
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $355
char 1 76
char 1 111
char 1 99
char 1 107
char 1 84
char 1 101
char 1 97
char 1 109
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 101
char 1 120
char 1 101
char 1 99
char 1 117
char 1 116
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 32
char 1 111
char 1 110
char 1 32
char 1 66
char 1 108
char 1 117
char 1 101
char 1 32
char 1 84
char 1 101
char 1 97
char 1 109
char 1 46
char 1 32
char 1 40
char 1 117
char 1 110
char 1 108
char 1 111
char 1 99
char 1 107
char 1 105
char 1 110
char 1 103
char 1 41
char 1 10
char 1 0
align 1
LABELV $353
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 52
char 1 66
char 1 108
char 1 117
char 1 101
char 1 32
char 1 94
char 1 55
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 119
char 1 32
char 1 94
char 1 49
char 1 76
char 1 111
char 1 99
char 1 107
char 1 101
char 1 100
char 1 94
char 1 55
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $352
char 1 99
char 1 112
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 52
char 1 66
char 1 108
char 1 117
char 1 101
char 1 32
char 1 94
char 1 55
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 119
char 1 32
char 1 94
char 1 49
char 1 76
char 1 111
char 1 99
char 1 107
char 1 101
char 1 100
char 1 94
char 1 55
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $351
char 1 76
char 1 111
char 1 99
char 1 107
char 1 84
char 1 101
char 1 97
char 1 109
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 101
char 1 120
char 1 101
char 1 99
char 1 117
char 1 116
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 32
char 1 111
char 1 110
char 1 32
char 1 66
char 1 108
char 1 117
char 1 101
char 1 32
char 1 84
char 1 101
char 1 97
char 1 109
char 1 46
char 1 32
char 1 40
char 1 108
char 1 111
char 1 99
char 1 107
char 1 105
char 1 110
char 1 103
char 1 41
char 1 10
char 1 0
align 1
LABELV $345
char 1 98
char 1 0
align 1
LABELV $344
char 1 98
char 1 108
char 1 117
char 1 101
char 1 0
align 1
LABELV $341
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 49
char 1 82
char 1 101
char 1 100
char 1 32
char 1 94
char 1 55
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 119
char 1 32
char 1 94
char 1 50
char 1 117
char 1 110
char 1 76
char 1 111
char 1 99
char 1 107
char 1 101
char 1 100
char 1 94
char 1 55
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $340
char 1 99
char 1 112
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 49
char 1 82
char 1 101
char 1 100
char 1 32
char 1 94
char 1 55
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 119
char 1 32
char 1 94
char 1 50
char 1 117
char 1 110
char 1 76
char 1 111
char 1 99
char 1 107
char 1 101
char 1 100
char 1 94
char 1 55
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $339
char 1 76
char 1 111
char 1 99
char 1 107
char 1 84
char 1 101
char 1 97
char 1 109
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 101
char 1 120
char 1 101
char 1 99
char 1 117
char 1 116
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 32
char 1 111
char 1 110
char 1 32
char 1 82
char 1 101
char 1 100
char 1 32
char 1 84
char 1 101
char 1 97
char 1 109
char 1 46
char 1 32
char 1 40
char 1 117
char 1 110
char 1 108
char 1 111
char 1 99
char 1 107
char 1 105
char 1 110
char 1 103
char 1 41
char 1 10
char 1 0
align 1
LABELV $337
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 49
char 1 82
char 1 101
char 1 100
char 1 32
char 1 94
char 1 55
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 119
char 1 32
char 1 94
char 1 49
char 1 76
char 1 111
char 1 99
char 1 107
char 1 101
char 1 100
char 1 94
char 1 55
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $336
char 1 99
char 1 112
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 49
char 1 82
char 1 101
char 1 100
char 1 32
char 1 94
char 1 55
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 119
char 1 32
char 1 94
char 1 49
char 1 76
char 1 111
char 1 99
char 1 107
char 1 101
char 1 100
char 1 94
char 1 55
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $335
char 1 76
char 1 111
char 1 99
char 1 107
char 1 84
char 1 101
char 1 97
char 1 109
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 101
char 1 120
char 1 101
char 1 99
char 1 117
char 1 116
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 32
char 1 111
char 1 110
char 1 32
char 1 82
char 1 101
char 1 100
char 1 32
char 1 84
char 1 101
char 1 97
char 1 109
char 1 46
char 1 32
char 1 40
char 1 108
char 1 111
char 1 99
char 1 107
char 1 105
char 1 110
char 1 103
char 1 41
char 1 10
char 1 0
align 1
LABELV $329
char 1 114
char 1 0
align 1
LABELV $328
char 1 114
char 1 101
char 1 100
char 1 0
align 1
LABELV $325
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 47
char 1 108
char 1 111
char 1 99
char 1 107
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 40
char 1 116
char 1 101
char 1 97
char 1 109
char 1 41
char 1 10
char 1 84
char 1 69
char 1 65
char 1 77
char 1 83
char 1 32
char 1 61
char 1 32
char 1 83
char 1 112
char 1 101
char 1 99
char 1 116
char 1 97
char 1 116
char 1 111
char 1 114
char 1 44
char 1 32
char 1 66
char 1 108
char 1 117
char 1 101
char 1 44
char 1 32
char 1 82
char 1 101
char 1 100
char 1 44
char 1 32
char 1 70
char 1 114
char 1 101
char 1 101
char 1 10
char 1 0
align 1
LABELV $313
char 1 85
char 1 115
char 1 101
char 1 114
char 1 32
char 1 37
char 1 115
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 111
char 1 110
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 10
char 1 0
align 1
LABELV $303
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 37
char 1 105
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 99
char 1 111
char 1 110
char 1 110
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 10
char 1 0
align 1
LABELV $300
char 1 66
char 1 97
char 1 100
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 115
char 1 108
char 1 111
char 1 116
char 1 58
char 1 32
char 1 37
char 1 105
char 1 10
char 1 0
align 1
LABELV $292
char 1 10
char 1 0
align 1
LABELV $291
char 1 37
char 1 115
char 1 0
align 1
LABELV $287
char 1 37
char 1 51
char 1 105
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 0
align 1
LABELV $286
char 1 69
char 1 84
char 1 95
char 1 71
char 1 82
char 1 65
char 1 80
char 1 80
char 1 76
char 1 69
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 0
align 1
LABELV $284
char 1 69
char 1 84
char 1 95
char 1 73
char 1 78
char 1 86
char 1 73
char 1 83
char 1 73
char 1 66
char 1 76
char 1 69
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 0
align 1
LABELV $282
char 1 69
char 1 84
char 1 95
char 1 84
char 1 69
char 1 76
char 1 69
char 1 80
char 1 79
char 1 82
char 1 84
char 1 95
char 1 84
char 1 82
char 1 73
char 1 71
char 1 71
char 1 69
char 1 82
char 1 32
char 1 0
align 1
LABELV $280
char 1 69
char 1 84
char 1 95
char 1 80
char 1 85
char 1 83
char 1 72
char 1 95
char 1 84
char 1 82
char 1 73
char 1 71
char 1 71
char 1 69
char 1 82
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 0
align 1
LABELV $278
char 1 69
char 1 84
char 1 95
char 1 83
char 1 80
char 1 69
char 1 65
char 1 75
char 1 69
char 1 82
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 0
align 1
LABELV $276
char 1 69
char 1 84
char 1 95
char 1 80
char 1 79
char 1 82
char 1 84
char 1 65
char 1 76
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 0
align 1
LABELV $274
char 1 69
char 1 84
char 1 95
char 1 66
char 1 69
char 1 65
char 1 77
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 0
align 1
LABELV $272
char 1 69
char 1 84
char 1 95
char 1 77
char 1 79
char 1 86
char 1 69
char 1 82
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 0
align 1
LABELV $270
char 1 69
char 1 84
char 1 95
char 1 77
char 1 73
char 1 83
char 1 83
char 1 73
char 1 76
char 1 69
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 0
align 1
LABELV $268
char 1 69
char 1 84
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 0
align 1
LABELV $266
char 1 69
char 1 84
char 1 95
char 1 80
char 1 76
char 1 65
char 1 89
char 1 69
char 1 82
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 0
align 1
LABELV $264
char 1 69
char 1 84
char 1 95
char 1 71
char 1 69
char 1 78
char 1 69
char 1 82
char 1 65
char 1 76
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 0
align 1
LABELV $259
char 1 37
char 1 51
char 1 105
char 1 58
char 1 0
align 1
LABELV $249
char 1 68
char 1 105
char 1 100
char 1 110
char 1 39
char 1 116
char 1 32
char 1 102
char 1 105
char 1 110
char 1 100
char 1 32
char 1 37
char 1 115
char 1 46
char 1 10
char 1 0
align 1
LABELV $248
char 1 82
char 1 101
char 1 109
char 1 111
char 1 118
char 1 101
char 1 100
char 1 46
char 1 10
char 1 0
align 1
LABELV $236
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 32
char 1 115
char 1 118
char 1 32
char 1 114
char 1 101
char 1 109
char 1 111
char 1 118
char 1 101
char 1 105
char 1 112
char 1 32
char 1 60
char 1 105
char 1 112
char 1 45
char 1 109
char 1 97
char 1 115
char 1 107
char 1 62
char 1 10
char 1 0
align 1
LABELV $232
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 32
char 1 97
char 1 100
char 1 100
char 1 105
char 1 112
char 1 32
char 1 60
char 1 105
char 1 112
char 1 45
char 1 109
char 1 97
char 1 115
char 1 107
char 1 62
char 1 10
char 1 0
align 1
LABELV $213
char 1 66
char 1 65
char 1 78
char 1 32
char 1 87
char 1 97
char 1 114
char 1 110
char 1 105
char 1 110
char 1 103
char 1 58
char 1 32
char 1 102
char 1 105
char 1 108
char 1 101
char 1 32
char 1 99
char 1 97
char 1 110
char 1 110
char 1 111
char 1 116
char 1 32
char 1 98
char 1 101
char 1 32
char 1 111
char 1 112
char 1 101
char 1 110
char 1 101
char 1 100
char 1 32
char 1 102
char 1 111
char 1 114
char 1 32
char 1 114
char 1 101
char 1 97
char 1 100
char 1 105
char 1 110
char 1 103
char 1 58
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $191
char 1 73
char 1 80
char 1 32
char 1 102
char 1 105
char 1 108
char 1 116
char 1 101
char 1 114
char 1 32
char 1 108
char 1 105
char 1 115
char 1 116
char 1 32
char 1 105
char 1 115
char 1 32
char 1 102
char 1 117
char 1 108
char 1 108
char 1 10
char 1 0
align 1
LABELV $161
char 1 0
align 1
LABELV $158
char 1 108
char 1 111
char 1 99
char 1 97
char 1 108
char 1 104
char 1 111
char 1 115
char 1 116
char 1 0
align 1
LABELV $112
char 1 37
char 1 105
char 1 46
char 1 37
char 1 105
char 1 46
char 1 37
char 1 105
char 1 46
char 1 37
char 1 105
char 1 32
char 1 0
align 1
LABELV $103
char 1 66
char 1 65
char 1 78
char 1 32
char 1 69
char 1 114
char 1 114
char 1 111
char 1 114
char 1 58
char 1 32
char 1 102
char 1 105
char 1 108
char 1 101
char 1 32
char 1 99
char 1 97
char 1 110
char 1 110
char 1 111
char 1 116
char 1 32
char 1 98
char 1 101
char 1 32
char 1 111
char 1 112
char 1 101
char 1 110
char 1 101
char 1 100
char 1 32
char 1 102
char 1 111
char 1 114
char 1 32
char 1 119
char 1 114
char 1 105
char 1 116
char 1 105
char 1 110
char 1 103
char 1 58
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $100
char 1 98
char 1 97
char 1 110
char 1 73
char 1 80
char 1 46
char 1 116
char 1 120
char 1 116
char 1 0
align 1
LABELV $90
char 1 66
char 1 97
char 1 100
char 1 32
char 1 102
char 1 105
char 1 108
char 1 116
char 1 101
char 1 114
char 1 32
char 1 97
char 1 100
char 1 100
char 1 114
char 1 101
char 1 115
char 1 115
char 1 58
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
