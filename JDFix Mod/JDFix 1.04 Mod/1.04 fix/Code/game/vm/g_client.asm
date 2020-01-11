data
align 4
LABELV playerMins
byte 4 3245342720
byte 4 3245342720
byte 4 3250585600
align 4
LABELV playerMaxs
byte 4 1097859072
byte 4 1097859072
byte 4 1109393408
export SP_info_player_deathmatch
code
proc SP_info_player_deathmatch 8 12
file "../g_client.c"
line 20
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:#include "..\ghoul2\g2.h"
;5:
;6:// g_client.c -- client functions that don't happen every frame
;7:
;8:static vec3_t	playerMins = {-15, -15, DEFAULT_MINS_2};
;9:static vec3_t	playerMaxs = {15, 15, DEFAULT_MAXS_2};
;10:
;11:forcedata_t Client_Force[MAX_CLIENTS];
;12:
;13:/*QUAKED info_player_deathmatch (1 0 1) (-16 -16 -24) (16 16 32) initial
;14:potential spawning position for deathmatch games.
;15:The first time a player enters the game, they will be at an 'initial' spot.
;16:Targets will be fired when someone spawns in on them.
;17:"nobots" will prevent bots from using this spot.
;18:"nohumans" will prevent non-bots from using this spot.
;19:*/
;20:void SP_info_player_deathmatch( gentity_t *ent ) {
line 23
;21:	int		i;
;22:
;23:	G_SpawnInt( "nobots", "0", &i);
ADDRGP4 $79
ARGP4
ADDRGP4 $80
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 24
;24:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $81
line 25
;25:		ent->flags |= FL_NO_BOTS;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 26
;26:	}
LABELV $81
line 27
;27:	G_SpawnInt( "nohumans", "0", &i );
ADDRGP4 $83
ARGP4
ADDRGP4 $80
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 28
;28:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $84
line 29
;29:		ent->flags |= FL_NO_HUMANS;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 30
;30:	}
LABELV $84
line 31
;31:}
LABELV $78
endproc SP_info_player_deathmatch 8 12
export SP_info_player_start
proc SP_info_player_start 0 4
line 36
;32:
;33:/*QUAKED info_player_start (1 0 0) (-16 -16 -24) (16 16 32)
;34:equivelant to info_player_deathmatch
;35:*/
;36:void SP_info_player_start(gentity_t *ent) {
line 37
;37:	ent->classname = "info_player_deathmatch";
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $87
ASGNP4
line 38
;38:	SP_info_player_deathmatch( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SP_info_player_deathmatch
CALLV
pop
line 39
;39:}
LABELV $86
endproc SP_info_player_start 0 4
export SP_info_player_imperial
proc SP_info_player_imperial 0 4
line 44
;40:
;41:/*QUAKED info_player_imperial (1 0 0) (-16 -16 -24) (16 16 32)
;42:saga start point - imperial
;43:*/
;44:void SP_info_player_imperial(gentity_t *ent) {
line 45
;45:	if (g_gametype.integer != GT_SAGA)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
EQI4 $89
line 46
;46:	{ //turn into a DM spawn if not in saga game mode
line 47
;47:		ent->classname = "info_player_deathmatch";
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $87
ASGNP4
line 48
;48:		SP_info_player_deathmatch( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SP_info_player_deathmatch
CALLV
pop
line 49
;49:	}
LABELV $89
line 50
;50:}
LABELV $88
endproc SP_info_player_imperial 0 4
export SP_info_player_rebel
proc SP_info_player_rebel 0 4
line 55
;51:
;52:/*QUAKED info_player_rebel (1 0 0) (-16 -16 -24) (16 16 32)
;53:saga start point - rebel
;54:*/
;55:void SP_info_player_rebel(gentity_t *ent) {
line 56
;56:	if (g_gametype.integer != GT_SAGA)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
EQI4 $93
line 57
;57:	{ //turn into a DM spawn if not in saga game mode
line 58
;58:		ent->classname = "info_player_deathmatch";
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $87
ASGNP4
line 59
;59:		SP_info_player_deathmatch( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SP_info_player_deathmatch
CALLV
pop
line 60
;60:	}
LABELV $93
line 61
;61:}
LABELV $92
endproc SP_info_player_rebel 0 4
export SP_info_player_intermission
proc SP_info_player_intermission 0 0
line 66
;62:
;63:/*QUAKED info_player_intermission (1 0 1) (-16 -16 -24) (16 16 32)
;64:The intermission will be viewed from this point.  Target an info_notnull for the view direction.
;65:*/
;66:void SP_info_player_intermission( gentity_t *ent ) {
line 68
;67:
;68:}
LABELV $96
endproc SP_info_player_intermission 0 0
export ThrowSaberToAttacker
proc ThrowSaberToAttacker 68 8
line 73
;69:
;70:#define JMSABER_RESPAWN_TIME 20000 //in case it gets stuck somewhere no one can reach
;71:
;72:void ThrowSaberToAttacker(gentity_t *self, gentity_t *attacker)
;73:{
line 74
;74:	gentity_t *ent = &g_entities[self->client->ps.saberIndex];
ADDRLP4 0
CNSTI4 832
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 76
;75:	vec3_t a;
;76:	int altVelocity = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 78
;77:
;78:	if (!ent || ent->enemy != self)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $100
ADDRLP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $98
LABELV $100
line 79
;79:	{ //something has gone very wrong (this should never happen)
line 84
;80:		//but in case it does.. find the saber manually
;81:#ifdef _DEBUG
;82:		Com_Printf("Lost the saber! Attempting to use global pointer..\n");
;83:#endif
;84:		ent = gJMSaberEnt;
ADDRLP4 0
ADDRGP4 gJMSaberEnt
INDIRP4
ASGNP4
line 86
;85:
;86:		if (!ent)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $101
line 87
;87:		{
line 91
;88:#ifdef _DEBUG
;89:			Com_Printf("The global pointer was NULL. This is a bad thing.\n");
;90:#endif
;91:			return;
ADDRGP4 $97
JUMPV
LABELV $101
line 98
;92:		}
;93:
;94:#ifdef _DEBUG
;95:		Com_Printf("Got it (%i). Setting enemy to client %i.\n", ent->s.number, self->s.number);
;96:#endif
;97:
;98:		ent->enemy = self;
ADDRLP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 99
;99:		self->client->ps.saberIndex = ent->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 620
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 100
;100:	}
LABELV $98
line 102
;101:
;102:	trap_SetConfigstring ( CS_CLIENT_JEDIMASTER, "-1" );
CNSTI4 28
ARGI4
ADDRGP4 $103
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 104
;103:
;104:	if (attacker && attacker->client && self->client->ps.saberInFlight)
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
CNSTU4 0
ASGNU4
ADDRLP4 24
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $104
ADDRLP4 32
CNSTI4 408
ASGNI4
ADDRLP4 24
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $104
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
EQI4 $104
line 105
;105:	{ //someone killed us and we had the saber thrown, so actually move this saber to the saber location
line 108
;106:	  //if we killed ourselves with saber thrown, however, same suicide rules of respawning at spawn spot still
;107:	  //apply.
;108:		gentity_t *flyingsaber = &g_entities[self->client->ps.saberEntityNum];
ADDRLP4 36
CNSTI4 832
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 110
;109:
;110:		if (flyingsaber && flyingsaber->inuse)
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $106
ADDRLP4 36
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $106
line 111
;111:		{
line 112
;112:			VectorCopy(flyingsaber->s.pos.trBase, ent->s.pos.trBase);
ADDRLP4 44
CNSTI4 24
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ADDRLP4 36
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 113
;113:			VectorCopy(flyingsaber->s.pos.trDelta, ent->s.pos.trDelta);
ADDRLP4 48
CNSTI4 36
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
ADDRLP4 36
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 114
;114:			VectorCopy(flyingsaber->s.apos.trBase, ent->s.apos.trBase);
ADDRLP4 52
CNSTI4 60
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
ADDRLP4 36
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 115
;115:			VectorCopy(flyingsaber->s.apos.trDelta, ent->s.apos.trDelta);
ADDRLP4 56
CNSTI4 72
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDRLP4 36
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 117
;116:
;117:			VectorCopy(flyingsaber->r.currentOrigin, ent->r.currentOrigin);
ADDRLP4 60
CNSTI4 368
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ADDRLP4 36
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 118
;118:			VectorCopy(flyingsaber->r.currentAngles, ent->r.currentAngles);
ADDRLP4 64
CNSTI4 380
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
ADDRLP4 36
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 119
;119:			altVelocity = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 120
;120:		}
LABELV $106
line 121
;121:	}
LABELV $104
line 123
;122:
;123:	self->client->ps.saberInFlight = qtrue; //say he threw it anyway in order to properly remove from dead body
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 1
ASGNI4
line 125
;124:
;125:	ent->s.modelindex = G_ModelIndex("models/weapons2/saber/saber_w.glm");
ADDRGP4 $108
ARGP4
ADDRLP4 36
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 126
;126:	ent->s.eFlags &= ~(EF_NODRAW);
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 127
;127:	ent->s.modelGhoul2 = 1;
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 128
;128:	ent->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 129
;129:	ent->enemy = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTP4 0
ASGNP4
line 131
;130:
;131:	if (!attacker || !attacker->client)
ADDRLP4 44
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 48
CNSTU4 0
ASGNU4
ADDRLP4 44
INDIRP4
CVPU4 4
ADDRLP4 48
INDIRU4
EQU4 $111
ADDRLP4 44
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 48
INDIRU4
NEU4 $109
LABELV $111
line 132
;132:	{
line 133
;133:		VectorCopy(ent->s.origin2, ent->s.pos.trBase);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 134
;134:		VectorCopy(ent->s.origin2, ent->s.origin);
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 135
;135:		VectorCopy(ent->s.origin2, ent->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 136
;136:		ent->pos2[0] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTF4 0
ASGNF4
line 137
;137:		trap_LinkEntity(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 138
;138:		return;
ADDRGP4 $97
JUMPV
LABELV $109
line 141
;139:	}
;140:
;141:	if (!altVelocity)
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $112
line 142
;142:	{
line 143
;143:		VectorCopy(self->s.pos.trBase, ent->s.pos.trBase);
ADDRLP4 52
CNSTI4 24
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 144
;144:		VectorCopy(self->s.pos.trBase, ent->s.origin);
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 145
;145:		VectorCopy(self->s.pos.trBase, ent->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 147
;146:
;147:		VectorSubtract(attacker->client->ps.origin, ent->s.pos.trBase, a);
ADDRLP4 56
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 64
CNSTI4 24
ASGNI4
ADDRLP4 4
ADDRLP4 56
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 56
INDIRP4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
line 149
;148:
;149:		VectorNormalize(a);
ADDRLP4 4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 151
;150:
;151:		ent->s.pos.trDelta[0] = a[0]*256;
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1132462080
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 152
;152:		ent->s.pos.trDelta[1] = a[1]*256;
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1132462080
ADDRLP4 4+4
INDIRF4
MULF4
ASGNF4
line 153
;153:		ent->s.pos.trDelta[2] = 256;
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1132462080
ASGNF4
line 154
;154:	}
LABELV $112
line 156
;155:
;156:	trap_LinkEntity(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 157
;157:}
LABELV $97
endproc ThrowSaberToAttacker 68 8
export JMSaberThink
proc JMSaberThink 28 4
line 160
;158:
;159:void JMSaberThink(gentity_t *ent)
;160:{
line 161
;161:	gJMSaberEnt = ent;
ADDRGP4 gJMSaberEnt
ADDRFP4 0
INDIRP4
ASGNP4
line 163
;162:
;163:	if (ent->enemy)
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $118
line 164
;164:	{
line 165
;165:		if (!ent->enemy->client || !ent->enemy->inuse)
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $122
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $120
LABELV $122
line 166
;166:		{ //disconnected?
line 167
;167:			VectorCopy(ent->enemy->s.pos.trBase, ent->s.pos.trBase);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 24
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 168
;168:			VectorCopy(ent->enemy->s.pos.trBase, ent->s.origin);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 169
;169:			VectorCopy(ent->enemy->s.pos.trBase, ent->r.currentOrigin);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 170
;170:			ent->s.modelindex = G_ModelIndex("models/weapons2/saber/saber_w.glm");
ADDRGP4 $108
ARGP4
ADDRLP4 20
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 171
;171:			ent->s.eFlags &= ~(EF_NODRAW);
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 172
;172:			ent->s.modelGhoul2 = 1;
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 173
;173:			ent->s.eType = ET_MISSILE;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 174
;174:			ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTP4 0
ASGNP4
line 176
;175:
;176:			ent->pos2[0] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTF4 1065353216
ASGNF4
line 177
;177:			ent->pos2[1] = 0; //respawn next think
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTF4 0
ASGNF4
line 178
;178:			trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 179
;179:		}
ADDRGP4 $119
JUMPV
LABELV $120
line 181
;180:		else
;181:		{
line 182
;182:			ent->pos2[1] = level.time + JMSABER_RESPAWN_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 20000
ADDI4
CVIF4 4
ASGNF4
line 183
;183:		}
line 184
;184:	}
ADDRGP4 $119
JUMPV
LABELV $118
line 185
;185:	else if (ent->pos2[0] && ent->pos2[1] < level.time)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRF4
CNSTF4 0
EQF4 $124
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $124
line 186
;186:	{
line 187
;187:		VectorCopy(ent->s.origin2, ent->s.pos.trBase);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 188
;188:		VectorCopy(ent->s.origin2, ent->s.origin);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 189
;189:		VectorCopy(ent->s.origin2, ent->r.currentOrigin);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 190
;190:		ent->pos2[0] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTF4 0
ASGNF4
line 191
;191:		trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 192
;192:	}
LABELV $124
LABELV $119
line 194
;193:
;194:	ent->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 195
;195:	G_RunObject(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunObject
CALLV
pop
line 196
;196:}
LABELV $117
endproc JMSaberThink 28 4
export JMSaberTouch
proc JMSaberTouch 36 12
line 199
;197:
;198:void JMSaberTouch(gentity_t *self, gentity_t *other, trace_t *trace)
;199:{
line 200
;200:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 203
;201://	gentity_t *te;
;202:
;203:	if (!other || !other->client || other->health < 1)
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $132
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $132
ADDRLP4 4
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 1
GEI4 $129
LABELV $132
line 204
;204:	{
line 205
;205:		return;
ADDRGP4 $128
JUMPV
LABELV $129
line 208
;206:	}
;207:
;208:	if (self->enemy)
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $133
line 209
;209:	{
line 210
;210:		return;
ADDRGP4 $128
JUMPV
LABELV $133
line 213
;211:	}
;212:
;213:	if (!self->s.modelindex)
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 0
NEI4 $135
line 214
;214:	{
line 215
;215:		return;
ADDRGP4 $128
JUMPV
LABELV $135
line 218
;216:	}
;217:
;218:	if (other->client->ps.stats[STAT_WEAPONS] & (1 << WP_SABER))
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $137
line 219
;219:	{
line 220
;220:		return;
ADDRGP4 $128
JUMPV
LABELV $137
line 223
;221:	}
;222:
;223:	if (other->client->ps.isJediMaster)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $139
line 224
;224:	{
line 225
;225:		return;
ADDRGP4 $128
JUMPV
LABELV $139
line 228
;226:	}
;227:
;228:	self->enemy = other;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 229
;229:	other->client->ps.stats[STAT_WEAPONS] = (1 << WP_SABER);
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
CNSTI4 4
ASGNI4
line 230
;230:	other->client->ps.weapon = WP_SABER;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 231
;231:	other->s.weapon = WP_SABER;
ADDRFP4 4
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 2
ASGNI4
line 232
;232:	G_AddEvent(other, EV_BECOME_JEDIMASTER, 0);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 30
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 235
;233:
;234:	// Track the jedi master 
;235:	trap_SetConfigstring ( CS_CLIENT_JEDIMASTER, va("%i", other->s.number ) );
ADDRGP4 $141
ARGP4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 28
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 237
;236:
;237:	if (g_spawnInvulnerability.integer)
ADDRGP4 g_spawnInvulnerability+12
INDIRI4
CNSTI4 0
EQI4 $142
line 238
;238:	{
line 239
;239:		other->client->ps.eFlags |= EF_INVULNERABLE;
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 67108864
BORI4
ASGNI4
line 240
;240:		other->client->invulnerableTimer = level.time + g_spawnInvulnerability.integer;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1580
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 g_spawnInvulnerability+12
INDIRI4
ADDI4
ASGNI4
line 241
;241:	}
LABELV $142
line 243
;242:
;243:	trap_SendServerCommand( -1, va("cp \"%s %s\n\"", other->client->pers.netname, G_GetStripEdString("SVINGAME", "BECOMEJM")) );
ADDRGP4 $148
ARGP4
ADDRGP4 $149
ARGP4
ADDRLP4 16
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $147
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 245
;244:
;245:	other->client->ps.isJediMaster = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 1
ASGNI4
line 246
;246:	other->client->ps.saberIndex = self->s.number;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 620
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 248
;247:
;248:	if (other->health < 200 && other->health > 0)
ADDRLP4 24
ADDRFP4 4
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 200
GEI4 $150
ADDRLP4 24
INDIRI4
CNSTI4 0
LEI4 $150
line 249
;249:	{ //full health when you become the Jedi Master
line 250
;250:		other->client->ps.stats[STAT_HEALTH] = other->health = 200;
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 32
CNSTI4 200
ASGNI4
ADDRLP4 28
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
ADDRLP4 28
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 251
;251:	}
LABELV $150
line 253
;252:
;253:	if (other->client->ps.fd.forcePower < 100)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 100
GEI4 $155
line 254
;254:	{
line 255
;255:		other->client->ps.fd.forcePower = 100;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
CNSTI4 100
ASGNI4
line 256
;256:	}
ADDRGP4 $155
JUMPV
LABELV $154
line 259
;257:
;258:	while (i < NUM_FORCE_POWERS)
;259:	{
line 260
;260:		other->client->ps.fd.forcePowersKnown |= (1 << i);
ADDRLP4 28
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 261
;261:		other->client->ps.fd.forcePowerLevel[i] = FORCE_LEVEL_3;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
CNSTI4 3
ASGNI4
line 263
;262:
;263:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 264
;264:	}
LABELV $155
line 258
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $154
line 266
;265:
;266:	self->pos2[0] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTF4 1065353216
ASGNF4
line 267
;267:	self->pos2[1] = level.time + JMSABER_RESPAWN_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 20000
ADDI4
CVIF4 4
ASGNF4
line 269
;268:
;269:	self->s.modelindex = 0;
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 0
ASGNI4
line 270
;270:	self->s.eFlags |= EF_NODRAW;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 271
;271:	self->s.modelGhoul2 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 0
ASGNI4
line 272
;272:	self->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 279
;273:
;274:	/*
;275:	te = G_TempEntity( vec3_origin, EV_DESTROY_GHOUL2_INSTANCE );
;276:	te->r.svFlags |= SVF_BROADCAST;
;277:	te->s.eventParm = self->s.number;
;278:	*/
;279:	G_KillG2Queue(self->s.number);
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 G_KillG2Queue
CALLV
pop
line 281
;280:
;281:	return;
LABELV $128
endproc JMSaberTouch 36 12
data
export gJMSaberEnt
align 4
LABELV gJMSaberEnt
byte 4 0
export SP_info_jedimaster_start
code
proc SP_info_jedimaster_start 8 4
line 290
;282:}
;283:
;284:gentity_t *gJMSaberEnt = NULL;
;285:
;286:/*QUAKED info_jedimaster_start (1 0 0) (-16 -16 -24) (16 16 32)
;287:"jedi master" saber spawn point
;288:*/
;289:void SP_info_jedimaster_start(gentity_t *ent)
;290:{
line 291
;291:	if (g_gametype.integer != GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $159
line 292
;292:	{
line 293
;293:		gJMSaberEnt = NULL;
ADDRGP4 gJMSaberEnt
CNSTP4 0
ASGNP4
line 294
;294:		G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 295
;295:		return;
ADDRGP4 $158
JUMPV
LABELV $159
line 298
;296:	}
;297:
;298:	ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTP4 0
ASGNP4
line 300
;299:
;300:	ent->s.eFlags = EF_BOUNCE_HALF;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 32
ASGNI4
line 302
;301:
;302:	ent->s.modelindex = G_ModelIndex("models/weapons2/saber/saber_w.glm");
ADDRGP4 $108
ARGP4
ADDRLP4 0
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 303
;303:	ent->s.modelGhoul2 = 1;
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 304
;304:	ent->s.g2radius = 20;
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 20
ASGNI4
line 306
;305:	//ent->s.eType = ET_GENERAL;
;306:	ent->s.eType = ET_MISSILE;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 307
;307:	ent->s.weapon = WP_SABER;
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 2
ASGNI4
line 308
;308:	ent->s.pos.trType = TR_GRAVITY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 309
;309:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 310
;310:	VectorSet( ent->r.maxs, 3, 3, 3 );
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1077936128
ASGNF4
line 311
;311:	VectorSet( ent->r.mins, -3, -3, -3 );
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3225419776
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3225419776
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3225419776
ASGNF4
line 312
;312:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1024
ASGNI4
line 313
;313:	ent->clipmask = MASK_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 1
ASGNI4
line 315
;314:
;315:	ent->isSaberEntity = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
CNSTI4 1
ASGNI4
line 317
;316:
;317:	ent->bounceCount = -5;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 -5
ASGNI4
line 319
;318:
;319:	ent->physicsObject = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1
ASGNI4
line 321
;320:
;321:	VectorCopy(ent->s.pos.trBase, ent->s.origin2); //remember the spawn spot
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 323
;322:
;323:	ent->touch = JMSaberTouch;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 JMSaberTouch
ASGNP4
line 325
;324:
;325:	trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 327
;326:
;327:	ent->think = JMSaberThink;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 JMSaberThink
ASGNP4
line 328
;328:	ent->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 329
;329:}
LABELV $158
endproc SP_info_jedimaster_start 8 4
export SpotWouldTelefrag
proc SpotWouldTelefrag 4144 16
line 345
;330:
;331:/*
;332:=======================================================================
;333:
;334:  SelectSpawnPoint
;335:
;336:=======================================================================
;337:*/
;338:
;339:/*
;340:================
;341:SpotWouldTelefrag
;342:
;343:================
;344:*/
;345:qboolean SpotWouldTelefrag( gentity_t *spot ) {
line 351
;346:	int			i, num;
;347:	int			touch[MAX_GENTITIES];
;348:	gentity_t	*hit;
;349:	vec3_t		mins, maxs;
;350:
;351:	VectorAdd( spot->s.origin, playerMins, mins );
ADDRLP4 4132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4108
ADDRLP4 4132
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRGP4 playerMins
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4108+4
ADDRLP4 4132
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRGP4 playerMins+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4108+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRGP4 playerMins+8
INDIRF4
ADDF4
ASGNF4
line 352
;352:	VectorAdd( spot->s.origin, playerMaxs, maxs );
ADDRLP4 4136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4120
ADDRLP4 4136
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRGP4 playerMaxs
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4120+4
ADDRLP4 4136
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRGP4 playerMaxs+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4120+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRGP4 playerMaxs+8
INDIRF4
ADDF4
ASGNF4
line 353
;353:	num = trap_EntitiesInBox( mins, maxs, touch, MAX_GENTITIES );
ADDRLP4 4108
ARGP4
ADDRLP4 4120
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4140
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 4140
INDIRI4
ASGNI4
line 355
;354:
;355:	for (i=0 ; i<num ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $176
JUMPV
LABELV $173
line 356
;356:		hit = &g_entities[touch[i]];
ADDRLP4 4
CNSTI4 832
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 358
;357:		//if ( hit->client && hit->client->ps.stats[STAT_HEALTH] > 0 ) {
;358:		if ( hit->client) {
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $177
line 359
;359:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $164
JUMPV
LABELV $177
line 362
;360:		}
;361:
;362:	}
LABELV $174
line 355
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $176
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $173
line 364
;363:
;364:	return qfalse;
CNSTI4 0
RETI4
LABELV $164
endproc SpotWouldTelefrag 4144 16
export SelectNearestDeathmatchSpawnPoint
proc SelectNearestDeathmatchSpawnPoint 40 12
line 375
;365:}
;366:
;367:/*
;368:================
;369:SelectNearestDeathmatchSpawnPoint
;370:
;371:Find the spot that we DON'T want to use
;372:================
;373:*/
;374:#define	MAX_SPAWN_POINTS	128
;375:gentity_t *SelectNearestDeathmatchSpawnPoint( vec3_t from ) {
line 381
;376:	gentity_t	*spot;
;377:	vec3_t		delta;
;378:	float		dist, nearestDist;
;379:	gentity_t	*nearestSpot;
;380:
;381:	nearestDist = 999999;
ADDRLP4 20
CNSTF4 1232348144
ASGNF4
line 382
;382:	nearestSpot = NULL;
ADDRLP4 24
CNSTP4 0
ASGNP4
line 383
;383:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $181
JUMPV
LABELV $180
line 385
;384:
;385:	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
line 387
;386:
;387:		VectorSubtract( spot->s.origin, from, delta );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 388
;388:		dist = VectorLength( delta );
ADDRLP4 4
ARGP4
ADDRLP4 36
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 36
INDIRF4
ASGNF4
line 389
;389:		if ( dist < nearestDist ) {
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
GEF4 $185
line 390
;390:			nearestDist = dist;
ADDRLP4 20
ADDRLP4 16
INDIRF4
ASGNF4
line 391
;391:			nearestSpot = spot;
ADDRLP4 24
ADDRLP4 0
INDIRP4
ASGNP4
line 392
;392:		}
LABELV $185
line 393
;393:	}
LABELV $181
line 385
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 416
ARGI4
ADDRGP4 $87
ARGP4
ADDRLP4 28
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $180
line 395
;394:
;395:	return nearestSpot;
ADDRLP4 24
INDIRP4
RETP4
LABELV $179
endproc SelectNearestDeathmatchSpawnPoint 40 12
export SelectRandomDeathmatchSpawnPoint
proc SelectRandomDeathmatchSpawnPoint 532 12
line 407
;396:}
;397:
;398:
;399:/*
;400:================
;401:SelectRandomDeathmatchSpawnPoint
;402:
;403:go to a random point that doesn't telefrag
;404:================
;405:*/
;406:#define	MAX_SPAWN_POINTS	128
;407:gentity_t *SelectRandomDeathmatchSpawnPoint( void ) {
line 413
;408:	gentity_t	*spot;
;409:	int			count;
;410:	int			selection;
;411:	gentity_t	*spots[MAX_SPAWN_POINTS];
;412:
;413:	count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 414
;414:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $189
JUMPV
LABELV $188
line 416
;415:
;416:	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
line 417
;417:		if ( SpotWouldTelefrag( spot ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 524
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 524
INDIRI4
CNSTI4 0
EQI4 $191
line 418
;418:			continue;
ADDRGP4 $189
JUMPV
LABELV $191
line 420
;419:		}
;420:		spots[ count ] = spot;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 421
;421:		count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 422
;422:	}
LABELV $189
line 416
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 416
ARGI4
ADDRGP4 $87
ARGP4
ADDRLP4 524
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 524
INDIRP4
ASGNP4
ADDRLP4 524
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $188
line 424
;423:
;424:	if ( !count ) {	// no spots that won't telefrag
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $193
line 425
;425:		return G_Find( NULL, FOFS(classname), "info_player_deathmatch");
CNSTP4 0
ARGP4
CNSTI4 416
ARGI4
ADDRGP4 $87
ARGP4
ADDRLP4 528
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 528
INDIRP4
RETP4
ADDRGP4 $187
JUMPV
LABELV $193
line 428
;426:	}
;427:
;428:	selection = rand() % count;
ADDRLP4 528
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 520
ADDRLP4 528
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
ASGNI4
line 429
;429:	return spots[ selection ];
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
RETP4
LABELV $187
endproc SelectRandomDeathmatchSpawnPoint 532 12
export SelectRandomFurthestSpawnPoint
proc SelectRandomFurthestSpawnPoint 572 12
line 439
;430:}
;431:
;432:/*
;433:===========
;434:SelectRandomFurthestSpawnPoint
;435:
;436:Chooses a player start, deathmatch start, etc
;437:============
;438:*/
;439:gentity_t *SelectRandomFurthestSpawnPoint ( vec3_t avoidPoint, vec3_t origin, vec3_t angles ) {
line 447
;440:	gentity_t	*spot;
;441:	vec3_t		delta;
;442:	float		dist;
;443:	float		list_dist[64];
;444:	gentity_t	*list_spot[64];
;445:	int			numSpots, rnd, i, j;
;446:
;447:	numSpots = 0;
ADDRLP4 520
CNSTI4 0
ASGNI4
line 448
;448:	spot = NULL;
ADDRLP4 528
CNSTP4 0
ASGNP4
ADDRGP4 $197
JUMPV
LABELV $196
line 450
;449:
;450:	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
line 451
;451:		if ( SpotWouldTelefrag( spot ) ) {
ADDRLP4 528
INDIRP4
ARGP4
ADDRLP4 548
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 548
INDIRI4
CNSTI4 0
EQI4 $199
line 452
;452:			continue;
ADDRGP4 $197
JUMPV
LABELV $199
line 454
;453:		}
;454:		VectorSubtract( spot->s.origin, avoidPoint, delta );
ADDRLP4 556
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 532
ADDRLP4 528
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 556
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 532+4
ADDRLP4 528
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 556
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 532+8
ADDRLP4 528
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 455
;455:		dist = VectorLength( delta );
ADDRLP4 532
ARGP4
ADDRLP4 560
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 524
ADDRLP4 560
INDIRF4
ASGNF4
line 456
;456:		for (i = 0; i < numSpots; i++) {
ADDRLP4 516
CNSTI4 0
ASGNI4
ADDRGP4 $206
JUMPV
LABELV $203
line 457
;457:			if ( dist > list_dist[i] ) {
ADDRLP4 524
INDIRF4
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
LEF4 $207
line 458
;458:				if ( numSpots >= 64 )
ADDRLP4 520
INDIRI4
CNSTI4 64
LTI4 $209
line 459
;459:					numSpots = 64-1;
ADDRLP4 520
CNSTI4 63
ASGNI4
LABELV $209
line 460
;460:				for (j = numSpots; j > i; j--) {
ADDRLP4 0
ADDRLP4 520
INDIRI4
ASGNI4
ADDRGP4 $214
JUMPV
LABELV $211
line 461
;461:					list_dist[j] = list_dist[j-1];
ADDRLP4 564
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 564
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 564
INDIRI4
ADDRLP4 4-4
ADDP4
INDIRF4
ASGNF4
line 462
;462:					list_spot[j] = list_spot[j-1];
ADDRLP4 568
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 568
INDIRI4
ADDRLP4 260
ADDP4
ADDRLP4 568
INDIRI4
ADDRLP4 260-4
ADDP4
INDIRP4
ASGNP4
line 463
;463:				}
LABELV $212
line 460
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $214
ADDRLP4 0
INDIRI4
ADDRLP4 516
INDIRI4
GTI4 $211
line 464
;464:				list_dist[i] = dist;
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
line 465
;465:				list_spot[i] = spot;
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 528
INDIRP4
ASGNP4
line 466
;466:				numSpots++;
ADDRLP4 520
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 467
;467:				if (numSpots > 64)
ADDRLP4 520
INDIRI4
CNSTI4 64
LEI4 $205
line 468
;468:					numSpots = 64;
ADDRLP4 520
CNSTI4 64
ASGNI4
line 469
;469:				break;
ADDRGP4 $205
JUMPV
LABELV $207
line 471
;470:			}
;471:		}
LABELV $204
line 456
ADDRLP4 516
ADDRLP4 516
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $206
ADDRLP4 516
INDIRI4
ADDRLP4 520
INDIRI4
LTI4 $203
LABELV $205
line 472
;472:		if (i >= numSpots && numSpots < 64) {
ADDRLP4 516
INDIRI4
ADDRLP4 520
INDIRI4
LTI4 $219
ADDRLP4 520
INDIRI4
CNSTI4 64
GEI4 $219
line 473
;473:			list_dist[numSpots] = dist;
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
line 474
;474:			list_spot[numSpots] = spot;
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 528
INDIRP4
ASGNP4
line 475
;475:			numSpots++;
ADDRLP4 520
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 476
;476:		}
LABELV $219
line 477
;477:	}
LABELV $197
line 450
ADDRLP4 528
INDIRP4
ARGP4
CNSTI4 416
ARGI4
ADDRGP4 $87
ARGP4
ADDRLP4 548
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 528
ADDRLP4 548
INDIRP4
ASGNP4
ADDRLP4 548
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $196
line 478
;478:	if (!numSpots) {
ADDRLP4 520
INDIRI4
CNSTI4 0
NEI4 $221
line 479
;479:		spot = G_Find( NULL, FOFS(classname), "info_player_deathmatch");
CNSTP4 0
ARGP4
CNSTI4 416
ARGI4
ADDRGP4 $87
ARGP4
ADDRLP4 552
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 528
ADDRLP4 552
INDIRP4
ASGNP4
line 480
;480:		if (!spot)
ADDRLP4 528
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $223
line 481
;481:			G_Error( "Couldn't find a spawn point" );
ADDRGP4 $225
ARGP4
ADDRGP4 G_Error
CALLV
pop
LABELV $223
line 482
;482:		VectorCopy (spot->s.origin, origin);
ADDRFP4 4
INDIRP4
ADDRLP4 528
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 483
;483:		origin[2] += 9;
ADDRLP4 556
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 556
INDIRP4
ADDRLP4 556
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 484
;484:		VectorCopy (spot->s.angles, angles);
ADDRFP4 8
INDIRP4
ADDRLP4 528
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 485
;485:		return spot;
ADDRLP4 528
INDIRP4
RETP4
ADDRGP4 $195
JUMPV
LABELV $221
line 489
;486:	}
;487:
;488:	// select a random spot from the spawn points furthest away
;489:	rnd = random() * (numSpots / 2);
ADDRLP4 552
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 544
ADDRLP4 552
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 520
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 491
;490:
;491:	VectorCopy (list_spot[rnd]->s.origin, origin);
ADDRFP4 4
INDIRP4
ADDRLP4 544
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 492
;492:	origin[2] += 9;
ADDRLP4 556
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 556
INDIRP4
ADDRLP4 556
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 493
;493:	VectorCopy (list_spot[rnd]->s.angles, angles);
ADDRFP4 8
INDIRP4
ADDRLP4 544
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 495
;494:
;495:	return list_spot[rnd];
ADDRLP4 544
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
INDIRP4
RETP4
LABELV $195
endproc SelectRandomFurthestSpawnPoint 572 12
export SelectSpawnPoint
proc SelectSpawnPoint 4 12
line 505
;496:}
;497:
;498:/*
;499:===========
;500:SelectSpawnPoint
;501:
;502:Chooses a player start, deathmatch start, etc
;503:============
;504:*/
;505:gentity_t *SelectSpawnPoint ( vec3_t avoidPoint, vec3_t origin, vec3_t angles ) {
line 506
;506:	return SelectRandomFurthestSpawnPoint( avoidPoint, origin, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 SelectRandomFurthestSpawnPoint
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $226
endproc SelectSpawnPoint 4 12
export SelectInitialSpawnPoint
proc SelectInitialSpawnPoint 20 12
line 545
;507:
;508:	/*
;509:	gentity_t	*spot;
;510:	gentity_t	*nearestSpot;
;511:
;512:	nearestSpot = SelectNearestDeathmatchSpawnPoint( avoidPoint );
;513:
;514:	spot = SelectRandomDeathmatchSpawnPoint ( );
;515:	if ( spot == nearestSpot ) {
;516:		// roll again if it would be real close to point of death
;517:		spot = SelectRandomDeathmatchSpawnPoint ( );
;518:		if ( spot == nearestSpot ) {
;519:			// last try
;520:			spot = SelectRandomDeathmatchSpawnPoint ( );
;521:		}		
;522:	}
;523:
;524:	// find a single player start spot
;525:	if (!spot) {
;526:		G_Error( "Couldn't find a spawn point" );
;527:	}
;528:
;529:	VectorCopy (spot->s.origin, origin);
;530:	origin[2] += 9;
;531:	VectorCopy (spot->s.angles, angles);
;532:
;533:	return spot;
;534:	*/
;535:}
;536:
;537:/*
;538:===========
;539:SelectInitialSpawnPoint
;540:
;541:Try to find a spawn point marked 'initial', otherwise
;542:use normal spawn selection.
;543:============
;544:*/
;545:gentity_t *SelectInitialSpawnPoint( vec3_t origin, vec3_t angles ) {
line 548
;546:	gentity_t	*spot;
;547:
;548:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $229
JUMPV
LABELV $228
line 549
;549:	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
line 550
;550:		if ( spot->spawnflags & 1 ) {
ADDRLP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $231
line 551
;551:			break;
ADDRGP4 $230
JUMPV
LABELV $231
line 553
;552:		}
;553:	}
LABELV $229
line 549
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 416
ARGI4
ADDRGP4 $87
ARGP4
ADDRLP4 4
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $228
LABELV $230
line 555
;554:
;555:	if ( !spot || SpotWouldTelefrag( spot ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $235
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $233
LABELV $235
line 556
;556:		return SelectSpawnPoint( vec3_origin, origin, angles );
ADDRGP4 vec3_origin
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
RETP4
ADDRGP4 $227
JUMPV
LABELV $233
line 559
;557:	}
;558:
;559:	VectorCopy (spot->s.origin, origin);
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 560
;560:	origin[2] += 9;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 561
;561:	VectorCopy (spot->s.angles, angles);
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 563
;562:
;563:	return spot;
ADDRLP4 0
INDIRP4
RETP4
LABELV $227
endproc SelectInitialSpawnPoint 20 12
export SelectSpectatorSpawnPoint
proc SelectSpectatorSpawnPoint 0 0
line 572
;564:}
;565:
;566:/*
;567:===========
;568:SelectSpectatorSpawnPoint
;569:
;570:============
;571:*/
;572:gentity_t *SelectSpectatorSpawnPoint( vec3_t origin, vec3_t angles ) {
line 573
;573:	FindIntermissionPoint();
ADDRGP4 FindIntermissionPoint
CALLV
pop
line 575
;574:
;575:	VectorCopy( level.intermission_origin, origin );
ADDRFP4 0
INDIRP4
ADDRGP4 level+9024
INDIRB
ASGNB 12
line 576
;576:	VectorCopy( level.intermission_angle, angles );
ADDRFP4 4
INDIRP4
ADDRGP4 level+9036
INDIRB
ASGNB 12
line 578
;577:
;578:	return NULL;
CNSTP4 0
RETP4
LABELV $236
endproc SelectSpectatorSpawnPoint 0 0
export InitBodyQue
proc InitBodyQue 12 0
line 604
;579:}
;580:
;581:/*
;582:=======================================================================
;583:
;584:BODYQUE
;585:
;586:=======================================================================
;587:*/
;588:
;589:/*
;590:=======================================================================
;591:
;592:BODYQUE
;593:
;594:=======================================================================
;595:*/
;596:
;597:#define BODY_SINK_TIME		45000
;598:
;599:/*
;600:===============
;601:InitBodyQue
;602:===============
;603:*/
;604:void InitBodyQue (void) {
line 608
;605:	int		i;
;606:	gentity_t	*ent;
;607:
;608:	level.bodyQueIndex = 0;
ADDRGP4 level+9056
CNSTI4 0
ASGNI4
line 609
;609:	for (i=0; i<BODY_QUEUE_SIZE ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $241
line 610
;610:		ent = G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 611
;611:		ent->classname = "bodyque";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $245
ASGNP4
line 612
;612:		ent->neverFree = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 1
ASGNI4
line 613
;613:		level.bodyQue[i] = ent;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+9060
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 614
;614:	}
LABELV $242
line 609
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 8
LTI4 $241
line 615
;615:}
LABELV $239
endproc InitBodyQue 12 0
export BodySink
proc BodySink 4 4
line 624
;616:
;617:/*
;618:=============
;619:BodySink
;620:
;621:After sitting around for five seconds, fall into the ground and dissapear
;622:=============
;623:*/
;624:void BodySink( gentity_t *ent ) {
line 625
;625:	if ( level.time - ent->timestamp > BODY_SINK_TIME + 1500 ) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
SUBI4
CNSTI4 46500
LEI4 $248
line 627
;626:		// the body ques are never actually freed, they are just unlinked
;627:		trap_UnlinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 628
;628:		ent->physicsObject = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 0
ASGNI4
line 629
;629:		return;	
ADDRGP4 $247
JUMPV
LABELV $248
line 631
;630:	}
;631:	ent->nextthink = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 632
;632:	ent->s.pos.trBase[2] -= 1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 633
;633:}
LABELV $247
endproc BodySink 4 4
export CopyToBodyQue
proc CopyToBodyQue 64 12
line 643
;634:
;635:/*
;636:=============
;637:CopyToBodyQue
;638:
;639:A player is respawning, so make an entity that looks
;640:just like the existing corpse to leave behind.
;641:=============
;642:*/
;643:void CopyToBodyQue( gentity_t *ent ) {
line 647
;644:	gentity_t		*body;
;645:	int			contents;
;646:
;647:	if (level.intermissiontime)
ADDRGP4 level+9008
INDIRI4
CNSTI4 0
EQI4 $253
line 648
;648:	{
line 649
;649:		return;
ADDRGP4 $252
JUMPV
LABELV $253
line 652
;650:	}
;651:
;652:	trap_UnlinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 655
;653:
;654:	// if client is in a nodrop area, don't leave the body
;655:	contents = trap_PointContents( ent->s.origin, -1 );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 8
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 656
;656:	if ( contents & CONTENTS_NODROP ) {
ADDRLP4 4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $256
line 657
;657:		return;
ADDRGP4 $252
JUMPV
LABELV $256
line 660
;658:	}
;659:
;660:	if (ent->client && (ent->client->ps.eFlags & EF_DISINTEGRATION))
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $258
ADDRLP4 12
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 33554432
BANDI4
CNSTI4 0
EQI4 $258
line 661
;661:	{ //for now, just don't spawn a body if you got disint'd
line 662
;662:		return;
ADDRGP4 $252
JUMPV
LABELV $258
line 666
;663:	}
;664:
;665:	// grab a body que and cycle to the next one
;666:	body = level.bodyQue[ level.bodyQueIndex ];
ADDRLP4 0
ADDRGP4 level+9056
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+9060
ADDP4
INDIRP4
ASGNP4
line 667
;667:	level.bodyQueIndex = (level.bodyQueIndex + 1) % BODY_QUEUE_SIZE;
ADDRGP4 level+9056
ADDRGP4 level+9056
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 8
MODI4
ASGNI4
line 669
;668:
;669:	trap_UnlinkEntity (body);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 670
;670:	body->s = ent->s;
ADDRLP4 0
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 296
line 673
;671:
;672:	//avoid oddly angled corpses floating around
;673:	body->s.angles[PITCH] = body->s.angles[ROLL] = body->s.apos.trBase[PITCH] = body->s.apos.trBase[ROLL] = 0;
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
line 675
;674:
;675:	body->s.g2radius = 100;
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 100
ASGNI4
line 677
;676:
;677:	body->s.eType = ET_BODY;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 15
ASGNI4
line 678
;678:	body->s.eFlags = EF_DEAD;		// clear EF_TALK, etc
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 1
ASGNI4
line 680
;679:
;680:	if (ent->client && (ent->client->ps.eFlags & EF_DISINTEGRATION))
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $264
ADDRLP4 24
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 33554432
BANDI4
CNSTI4 0
EQI4 $264
line 681
;681:	{
line 682
;682:		body->s.eFlags |= EF_DISINTEGRATION;
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 33554432
BORI4
ASGNI4
line 683
;683:	}
LABELV $264
line 685
;684:
;685:	VectorCopy(ent->client->ps.lastHitLoc, body->s.origin2);
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1368
ADDP4
INDIRB
ASGNB 12
line 687
;686:
;687:	body->s.powerups = 0;	// clear powerups
ADDRLP4 0
INDIRP4
CNSTI4 272
ADDP4
CNSTI4 0
ASGNI4
line 688
;688:	body->s.loopSound = 0;	// clear lava burning
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 689
;689:	body->s.number = body - g_entities;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 832
DIVI4
ASGNI4
line 690
;690:	body->timestamp = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 576
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 691
;691:	body->physicsObject = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1
ASGNI4
line 692
;692:	body->physicsBounce = 0;		// don't bounce
ADDRLP4 0
INDIRP4
CNSTI4 504
ADDP4
CNSTF4 0
ASGNF4
line 693
;693:	if ( body->s.groundEntityNum == ENTITYNUM_NONE ) {
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $267
line 694
;694:		body->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 695
;695:		body->s.pos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 696
;696:		VectorCopy( ent->client->ps.velocity, body->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 697
;697:	} else {
ADDRGP4 $268
JUMPV
LABELV $267
line 698
;698:		body->s.pos.trType = TR_STATIONARY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 699
;699:	}
LABELV $268
line 700
;700:	body->s.event = 0;
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
CNSTI4 0
ASGNI4
line 702
;701:
;702:	body->s.weapon = ent->s.bolt2;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 704
;703:
;704:	if (body->s.weapon == WP_SABER && ent->client->ps.saberInFlight)
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
NEI4 $270
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
EQI4 $270
line 705
;705:	{
line 706
;706:		body->s.weapon = WP_BLASTER; //lie to keep from putting a saber on the corpse, because it was thrown at death
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 4
ASGNI4
line 707
;707:	}
LABELV $270
line 709
;708:
;709:	G_AddEvent(body, EV_BODY_QUEUE_COPY, ent->s.clientNum);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 109
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 711
;710:
;711:	body->r.svFlags = ent->r.svFlags | SVF_BROADCAST;
ADDRLP4 32
CNSTI4 304
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 712
;712:	VectorCopy (ent->r.mins, body->r.mins);
ADDRLP4 36
CNSTI4 316
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 713
;713:	VectorCopy (ent->r.maxs, body->r.maxs);
ADDRLP4 40
CNSTI4 328
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 714
;714:	VectorCopy (ent->r.absmin, body->r.absmin);
ADDRLP4 44
CNSTI4 344
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 715
;715:	VectorCopy (ent->r.absmax, body->r.absmax);
ADDRLP4 48
CNSTI4 356
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 717
;716:
;717:	body->s.torsoAnim = body->s.legsAnim = ent->client->ps.legsAnim & ~ANIM_TOGGLEBIT;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 280
ADDP4
ADDRLP4 56
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 284
ADDP4
ADDRLP4 56
INDIRI4
ASGNI4
line 719
;718:
;719:	body->clipmask = CONTENTS_SOLID | CONTENTS_PLAYERCLIP;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 17
ASGNI4
line 720
;720:	body->r.contents = CONTENTS_CORPSE;
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 512
ASGNI4
line 721
;721:	body->r.ownerNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 723
;722:
;723:	body->nextthink = level.time + BODY_SINK_TIME;
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 45000
ADDI4
ASGNI4
line 724
;724:	body->think = BodySink;
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 BodySink
ASGNP4
line 726
;725:
;726:	body->die = body_die;
ADDRLP4 0
INDIRP4
CNSTI4 660
ADDP4
ADDRGP4 body_die
ASGNP4
line 729
;727:
;728:	// don't take more damage if already gibbed
;729:	if ( ent->health <= GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $273
line 730
;730:		body->takedamage = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 0
ASGNI4
line 731
;731:	} else {
ADDRGP4 $274
JUMPV
LABELV $273
line 732
;732:		body->takedamage = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 1
ASGNI4
line 733
;733:	}
LABELV $274
line 735
;734:
;735:	VectorCopy ( body->s.pos.trBase, body->r.currentOrigin );
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 736
;736:	trap_LinkEntity (body);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 737
;737:}
LABELV $252
endproc CopyToBodyQue 64 12
export SetClientViewAngle
proc SetClientViewAngle 16 0
line 748
;738:
;739://======================================================================
;740:
;741:
;742:/*
;743:==================
;744:SetClientViewAngle
;745:
;746:==================
;747:*/
;748:void SetClientViewAngle( gentity_t *ent, vec3_t angle ) {
line 752
;749:	int			i;
;750:
;751:	// set the delta angle
;752:	for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $276
line 755
;753:		int		cmdAngle;
;754:
;755:		cmdAngle = ANGLE2SHORT(angle[i]);
ADDRLP4 4
CNSTF4 1199570944
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 756
;756:		ent->client->ps.delta_angles[i] = cmdAngle - ent->client->pers.cmd.angles[i];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 68
ADDP4
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 1388
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 757
;757:	}
LABELV $277
line 752
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $276
line 758
;758:	VectorCopy( angle, ent->s.angles );
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 759
;759:	VectorCopy (ent->s.angles, ent->client->ps.viewangles);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 760
;760:}
LABELV $275
endproc SetClientViewAngle 16 0
export respawn
proc respawn 12 8
line 767
;761:
;762:/*
;763:================
;764:respawn
;765:================
;766:*/
;767:void respawn( gentity_t *ent ) {
line 770
;768:	gentity_t	*tent;
;769:
;770:	CopyToBodyQue (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CopyToBodyQue
CALLV
pop
line 772
;771:
;772:	if (gEscaping)
ADDRGP4 gEscaping
INDIRI4
CNSTI4 0
EQI4 $281
line 773
;773:	{
line 774
;774:		ent->client->sess.sessionTeam = TEAM_SPECTATOR;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
CNSTI4 3
ASGNI4
line 775
;775:		ent->client->sess.spectatorState = SPECTATOR_FREE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
CNSTI4 1
ASGNI4
line 776
;776:		ent->client->sess.spectatorClient = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1548
ADDP4
CNSTI4 0
ASGNI4
line 778
;777:
;778:		ent->client->pers.teamState.state = TEAM_BEGIN;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1472
ADDP4
CNSTI4 0
ASGNI4
line 779
;779:	}
LABELV $281
line 781
;780:
;781:	trap_UnlinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 782
;782:	ClientSpawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 785
;783:
;784:	// add a teleportation effect
;785:	tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_IN );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 786
;786:	tent->s.clientNum = ent->s.clientNum;
ADDRLP4 8
CNSTI4 220
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 789
;787:
;788:	//JediDog: sleep
;789:	if (ent->client->pers.Sleep == qtrue) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 1
NEI4 $283
line 790
;790:		ent->client->ps.forceHandExtend = HANDEXTEND_KNOCKDOWN;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 8
ASGNI4
line 791
;791:		ent->client->ps.forceDodgeAnim = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1260
ADDP4
CNSTI4 0
ASGNI4
line 792
;792:		ent->client->ps.forceHandExtendTime = Q3_INFINITE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
CNSTI4 16777216
ASGNI4
line 793
;793:		ent->client->ps.quickerGetup = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1264
ADDP4
CNSTI4 0
ASGNI4
line 794
;794:		ent->client->ps.saberHolstered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1312
ADDP4
CNSTI4 1
ASGNI4
line 796
;795://		ent->flags |= FL_GODMODE;
;796:	}
LABELV $283
line 797
;797:}
LABELV $280
endproc respawn 12 8
export TeamCount
proc TeamCount 8 0
line 806
;798:
;799:/*
;800:================
;801:TeamCount
;802:
;803:Returns number of players on a team
;804:================
;805:*/
;806:team_t TeamCount( int ignoreClientNum, int team ) {
line 808
;807:	int		i;
;808:	int		count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 810
;809:
;810:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $289
JUMPV
LABELV $286
line 811
;811:		if ( i == ignoreClientNum ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $291
line 812
;812:			continue;
ADDRGP4 $287
JUMPV
LABELV $291
line 814
;813:		}
;814:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 1812
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 0
NEI4 $293
line 815
;815:			continue;
ADDRGP4 $287
JUMPV
LABELV $293
line 817
;816:		}
;817:		if ( level.clients[i].sess.sessionTeam == team ) {
CNSTI4 1812
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1536
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $295
line 818
;818:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 819
;819:		}
LABELV $295
line 820
;820:	}
LABELV $287
line 810
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $289
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $286
line 822
;821:
;822:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $285
endproc TeamCount 8 0
export TeamLeader
proc TeamLeader 4 0
line 832
;823:}
;824:
;825:/*
;826:================
;827:TeamLeader
;828:
;829:Returns the client number of the team leader
;830:================
;831:*/
;832:int TeamLeader( int team ) {
line 835
;833:	int		i;
;834:
;835:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $301
JUMPV
LABELV $298
line 836
;836:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 1812
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 0
NEI4 $303
line 837
;837:			continue;
ADDRGP4 $299
JUMPV
LABELV $303
line 839
;838:		}
;839:		if ( level.clients[i].sess.sessionTeam == team ) {
CNSTI4 1812
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1536
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $305
line 840
;840:			if ( level.clients[i].sess.teamLeader )
CNSTI4 1812
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1576
ADDP4
INDIRI4
CNSTI4 0
EQI4 $307
line 841
;841:				return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $297
JUMPV
LABELV $307
line 842
;842:		}
LABELV $305
line 843
;843:	}
LABELV $299
line 835
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $301
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $298
line 845
;844:
;845:	return -1;
CNSTI4 -1
RETI4
LABELV $297
endproc TeamLeader 4 0
export PickTeam
proc PickTeam 24 8
line 855
;846:}
;847:
;848:
;849:/*
;850:================
;851:PickTeam
;852:
;853:================
;854:*/
;855:team_t PickTeam( int ignoreClientNum ) {
line 858
;856:	int		counts[TEAM_NUM_TEAMS];
;857:
;858:	counts[TEAM_BLUE] = TeamCount( ignoreClientNum, TEAM_BLUE );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 16
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 16
INDIRI4
ASGNI4
line 859
;859:	counts[TEAM_RED] = TeamCount( ignoreClientNum, TEAM_RED );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 20
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 0+4
ADDRLP4 20
INDIRI4
ASGNI4
line 861
;860:
;861:	if ( counts[TEAM_BLUE] > counts[TEAM_RED] ) {
ADDRLP4 0+8
INDIRI4
ADDRLP4 0+4
INDIRI4
LEI4 $312
line 862
;862:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $309
JUMPV
LABELV $312
line 864
;863:	}
;864:	if ( counts[TEAM_RED] > counts[TEAM_BLUE] ) {
ADDRLP4 0+4
INDIRI4
ADDRLP4 0+8
INDIRI4
LEI4 $316
line 865
;865:		return TEAM_BLUE;
CNSTI4 2
RETI4
ADDRGP4 $309
JUMPV
LABELV $316
line 868
;866:	}
;867:	// equal team count, so join the team with the lowest score
;868:	if ( level.teamScores[TEAM_BLUE] > level.teamScores[TEAM_RED] ) {
ADDRGP4 level+44+8
INDIRI4
ADDRGP4 level+44+4
INDIRI4
LEI4 $320
line 869
;869:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $309
JUMPV
LABELV $320
line 871
;870:	}
;871:	return TEAM_BLUE;
CNSTI4 2
RETI4
LABELV $309
endproc PickTeam 24 8
proc ClientCleanName 40 12
line 899
;872:}
;873:
;874:/*
;875:===========
;876:ForceClientSkin
;877:
;878:Forces a client's skin (for teamplay)
;879:===========
;880:*/
;881:/*
;882:static void ForceClientSkin( gclient_t *client, char *model, const char *skin ) {
;883:	char *p;
;884:
;885:	if ((p = Q_strrchr(model, '/')) != 0) {
;886:		*p = 0;
;887:	}
;888:
;889:	Q_strcat(model, MAX_QPATH, "/");
;890:	Q_strcat(model, MAX_QPATH, skin);
;891:}
;892:*/
;893:
;894:/*
;895:===========
;896:ClientCheckName
;897:============
;898:*/
;899:static void ClientCleanName( const char *in, char *out, int outSize ) {
line 906
;900:	int		len, colorlessLen;
;901:	char	ch;
;902:	char	*p;
;903:	int		spaces;
;904:
;905:	//save room for trailing null byte
;906:	outSize--;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 908
;907:
;908:	len = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 909
;909:	colorlessLen = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 910
;910:	p = out;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
line 911
;911:	*p = 0;
ADDRLP4 12
INDIRP4
CNSTI1 0
ASGNI1
line 912
;912:	spaces = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $328
JUMPV
LABELV $327
line 914
;913:
;914:	while( 1 ) {
line 915
;915:		ch = *in++;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 20
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
INDIRI1
ASGNI1
line 916
;916:		if( !ch ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $330
line 917
;917:			break;
ADDRGP4 $329
JUMPV
LABELV $330
line 921
;918:		}
;919:
;920:		// don't allow leading spaces
;921:		if( !*p && ch == ' ' ) {
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $332
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $332
line 922
;922:			continue;
ADDRGP4 $328
JUMPV
LABELV $332
line 926
;923:		}
;924:
;925:		// check colors
;926:		if( ch == Q_COLOR_ESCAPE ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $334
line 928
;927:			// solo trailing carat is not a color prefix
;928:			if( !*in ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $336
line 929
;929:				break;
ADDRGP4 $329
JUMPV
LABELV $336
line 933
;930:			}
;931:
;932:			// don't allow black in a name, period
;933:			if( ColorIndex(*in) == 0 ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
CNSTI4 7
BANDI4
CNSTI4 0
NEI4 $338
line 934
;934:				in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 935
;935:				continue;
ADDRGP4 $328
JUMPV
LABELV $338
line 939
;936:			}
;937:
;938:			// make sure room in dest for both chars
;939:			if( len > outSize - 2 ) {
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
CNSTI4 2
SUBI4
LEI4 $340
line 940
;940:				break;
ADDRGP4 $329
JUMPV
LABELV $340
line 943
;941:			}
;942:
;943:			*out++ = ch;
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 24
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 0
INDIRI1
ASGNI1
line 944
;944:			*out++ = *in++;
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 1
ASGNI4
ADDRFP4 4
ADDRLP4 28
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ASGNP4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI1
ASGNI1
line 945
;945:			len += 2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 946
;946:			continue;
ADDRGP4 $328
JUMPV
LABELV $334
line 950
;947:		}
;948:
;949:		// don't allow too many consecutive spaces
;950:		if( ch == ' ' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $342
line 951
;951:			spaces++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 952
;952:			if( spaces > 3 ) {
ADDRLP4 8
INDIRI4
CNSTI4 3
LEI4 $343
line 953
;953:				continue;
ADDRGP4 $328
JUMPV
line 955
;954:			}
;955:		}
LABELV $342
line 956
;956:		else {
line 957
;957:			spaces = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 958
;958:		}
LABELV $343
line 960
;959:
;960:		if( len > outSize - 1 ) {
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
LEI4 $346
line 961
;961:			break;
ADDRGP4 $329
JUMPV
LABELV $346
line 964
;962:		}
;963:
;964:		*out++ = ch;
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 24
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 0
INDIRI1
ASGNI1
line 965
;965:		colorlessLen++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 966
;966:		len++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 967
;967:	}
LABELV $328
line 914
ADDRGP4 $327
JUMPV
LABELV $329
line 968
;968:	*out = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 971
;969:
;970:	// don't allow empty names
;971:	if( *p == 0 || colorlessLen == 0 ) {
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 20
INDIRI4
EQI4 $350
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $348
LABELV $350
line 972
;972:		Q_strncpyz( p, "Padawan", outSize );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $351
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 973
;973:	}
LABELV $348
line 974
;974:}
LABELV $326
endproc ClientCleanName 40 12
data
export g2SaberInstance
align 4
LABELV g2SaberInstance
byte 4 0
lit
align 4
LABELV $353
byte 4 0
byte 4 0
byte 4 0
export SetupGameGhoul2Model
code
proc SetupGameGhoul2Model 188 44
line 999
;975:
;976:#ifdef _DEBUG
;977:void G_DebugWrite(const char *path, const char *text)
;978:{
;979:	fileHandle_t f;
;980:
;981:	trap_FS_FOpenFile( path, &f, FS_APPEND );
;982:	trap_FS_Write(text, strlen(text), f);
;983:	trap_FS_FCloseFile(f);
;984:}
;985:#endif
;986:
;987:/*
;988:===========
;989:SetupGameGhoul2Model
;990:
;991:There are two ghoul2 model instances per player (actually three).  One is on the clientinfo (the base for the client side 
;992:player, and copied for player spawns and for corpses).  One is attached to the centity itself, which is the model acutally 
;993:animated and rendered by the system.  The final is the game ghoul2 model.  This is animated by pmove on the server, and
;994:is used for determining where the lightsaber should be, and for per-poly collision tests.
;995:===========
;996:*/
;997:void *g2SaberInstance = NULL;
;998:void SetupGameGhoul2Model(gclient_t *client, char *modelname)
;999:{
line 1004
;1000:	int handle;
;1001:	char		afilename[MAX_QPATH];
;1002:	char		/**GLAName,*/ *slash;
;1003:	char		GLAName[MAX_QPATH];
;1004:	vec3_t	tempVec = {0,0,0};
ADDRLP4 64
ADDRGP4 $353
INDIRB
ASGNB 12
line 1007
;1005:
;1006:	// First things first.  If this is a ghoul2 model, then let's make sure we demolish this first.
;1007:	if (client->ghoul2 && trap_G2_HaveWeGhoul2Models(client->ghoul2))
ADDRLP4 148
ADDRFP4 0
INDIRP4
CNSTI4 1732
ADDP4
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $354
ADDRLP4 148
INDIRP4
ARGP4
ADDRLP4 152
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $354
line 1008
;1008:	{
line 1009
;1009:		trap_G2API_CleanGhoul2Models(&(client->ghoul2));
ADDRFP4 0
INDIRP4
CNSTI4 1732
ADDP4
ARGP4
ADDRGP4 trap_G2API_CleanGhoul2Models
CALLV
pop
line 1010
;1010:	}
LABELV $354
line 1028
;1011:
;1012:	/*
;1013:	Com_sprintf( afilename, sizeof( afilename ), "models/players/%s/model.glm", modelname );
;1014:	handle = trap_G2API_InitGhoul2Model(&client->ghoul2, afilename, 0, 0, -20, 0, 0);
;1015:	if (handle<0)
;1016:	{
;1017:		Com_sprintf( afilename, sizeof( afilename ), "models/players/kyle/model.glm" );
;1018:		handle = trap_G2API_InitGhoul2Model(&client->ghoul2, afilename, 0, 0, -20, 0, 0);
;1019:
;1020:		if (handle<0)
;1021:		{
;1022:			return;
;1023:		}
;1024:	}
;1025:	*/
;1026:
;1027:	//rww - just load the "standard" model for the server"
;1028:	if (!precachedKyle)
ADDRGP4 precachedKyle
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $356
line 1029
;1029:	{
line 1030
;1030:		Com_sprintf( afilename, sizeof( afilename ), "models/players/kyle/model.glm" );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $358
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1031
;1031:		handle = trap_G2API_InitGhoul2Model(&precachedKyle, afilename, 0, 0, -20, 0, 0);
ADDRGP4 precachedKyle
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 156
CNSTI4 0
ASGNI4
ADDRLP4 156
INDIRI4
ARGI4
ADDRLP4 156
INDIRI4
ARGI4
CNSTI4 -20
ARGI4
ADDRLP4 156
INDIRI4
ARGI4
ADDRLP4 156
INDIRI4
ARGI4
ADDRLP4 160
ADDRGP4 trap_G2API_InitGhoul2Model
CALLI4
ASGNI4
ADDRLP4 144
ADDRLP4 160
INDIRI4
ASGNI4
line 1033
;1032:
;1033:		if (handle<0)
ADDRLP4 144
INDIRI4
CNSTI4 0
GEI4 $359
line 1034
;1034:		{
line 1035
;1035:			return;
ADDRGP4 $352
JUMPV
LABELV $359
line 1037
;1036:		}
;1037:	}
LABELV $356
line 1039
;1038:
;1039:	if (precachedKyle && trap_G2_HaveWeGhoul2Models(precachedKyle))
ADDRLP4 156
ADDRGP4 precachedKyle
INDIRP4
ASGNP4
ADDRLP4 156
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $352
ADDRLP4 156
INDIRP4
ARGP4
ADDRLP4 160
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
EQI4 $352
line 1040
;1040:	{
line 1041
;1041:		trap_G2API_DuplicateGhoul2Instance(precachedKyle, &client->ghoul2);
ADDRGP4 precachedKyle
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1732
ADDP4
ARGP4
ADDRGP4 trap_G2API_DuplicateGhoul2Instance
CALLV
pop
line 1042
;1042:	}
line 1044
;1043:	else
;1044:	{
line 1045
;1045:		return;
LABELV $362
line 1050
;1046:	}
;1047:
;1048:	// The model is now loaded.
;1049:
;1050:	GLAName[0] = 0;
ADDRLP4 76
CNSTI1 0
ASGNI1
line 1052
;1051:
;1052:	if (!BGPAFtextLoaded)
ADDRGP4 BGPAFtextLoaded
INDIRI4
CNSTI4 0
NEI4 $363
line 1053
;1053:	{
line 1056
;1054:		//get the location of the animation.cfg
;1055:		//GLAName = trap_G2API_GetGLAName( client->ghoul2, 0);
;1056:		trap_G2API_GetGLAName( client->ghoul2, 0, GLAName);
ADDRFP4 0
INDIRP4
CNSTI4 1732
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 76
ARGP4
ADDRGP4 trap_G2API_GetGLAName
CALLV
pop
line 1058
;1057:
;1058:		if (!GLAName[0])
ADDRLP4 76
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $365
line 1059
;1059:		{
line 1060
;1060:			if (!BG_ParseAnimationFile("models/players/_humanoid/animation.cfg"))
ADDRGP4 $369
ARGP4
ADDRLP4 164
ADDRGP4 BG_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
NEI4 $352
line 1061
;1061:			{
line 1062
;1062:				Com_Printf( "Failed to load animation file %s\n", afilename );
ADDRGP4 $370
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1063
;1063:				return;
ADDRGP4 $352
JUMPV
line 1065
;1064:			}
;1065:			return;
LABELV $365
line 1067
;1066:		}
;1067:		Q_strncpyz( afilename, GLAName, sizeof( afilename ));
ADDRLP4 0
ARGP4
ADDRLP4 76
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1068
;1068:		slash = Q_strrchr( afilename, '/' );
ADDRLP4 0
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 164
ADDRGP4 Q_strrchr
CALLP4
ASGNP4
ADDRLP4 140
ADDRLP4 164
INDIRP4
ASGNP4
line 1069
;1069:		if ( slash )
ADDRLP4 140
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $352
line 1070
;1070:		{
line 1071
;1071:			strcpy(slash, "/animation.cfg");
ADDRLP4 140
INDIRP4
ARGP4
ADDRGP4 $373
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1072
;1072:		}	// Now afilename holds just the path to the animation.cfg
line 1074
;1073:		else 
;1074:		{	// Didn't find any slashes, this is a raw filename right in base (whish isn't a good thing)
line 1075
;1075:			return;
LABELV $372
line 1079
;1076:		}
;1077:
;1078:		// Try to load the animation.cfg for this model then.
;1079:		if ( !BG_ParseAnimationFile( afilename ) )
ADDRLP4 0
ARGP4
ADDRLP4 168
ADDRGP4 BG_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 0
NEI4 $374
line 1080
;1080:		{	// The GLA's animations failed
line 1081
;1081:			if (!BG_ParseAnimationFile("models/players/_humanoid/animation.cfg"))
ADDRGP4 $369
ARGP4
ADDRLP4 172
ADDRGP4 BG_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
NEI4 $376
line 1082
;1082:			{
line 1083
;1083:				Com_Printf( "Failed to load animation file %s\n", afilename );
ADDRGP4 $370
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1084
;1084:				return;
ADDRGP4 $352
JUMPV
LABELV $376
line 1086
;1085:			}
;1086:		}
LABELV $374
line 1087
;1087:	}
LABELV $363
line 1089
;1088:
;1089:	trap_G2API_AddBolt(client->ghoul2, 0, "*r_hand");
ADDRFP4 0
INDIRP4
CNSTI4 1732
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $378
ARGP4
ADDRGP4 trap_G2API_AddBolt
CALLI4
pop
line 1090
;1090:	trap_G2API_AddBolt(client->ghoul2, 0, "*l_hand");
ADDRFP4 0
INDIRP4
CNSTI4 1732
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $379
ARGP4
ADDRGP4 trap_G2API_AddBolt
CALLI4
pop
line 1093
;1091:
;1092:	// NOTE - ensure this sequence of bolt and bone accessing are always the same because the client expects them in a certain order
;1093:	trap_G2API_SetBoneAnim(client->ghoul2, 0, "model_root", 0, 12, BONE_ANIM_OVERRIDE_LOOP, 1.0f, level.time, -1, -1);
ADDRFP4 0
INDIRP4
CNSTI4 1732
ADDP4
INDIRP4
ARGP4
ADDRLP4 164
CNSTI4 0
ASGNI4
ADDRLP4 164
INDIRI4
ARGI4
ADDRGP4 $380
ARGP4
ADDRLP4 164
INDIRI4
ARGI4
CNSTI4 12
ARGI4
CNSTI4 16
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 level+32
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 -1
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 1094
;1094:	trap_G2API_SetBoneAngles(client->ghoul2, 0, "upper_lumbar", tempVec, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, NULL, 0, level.time);
ADDRFP4 0
INDIRP4
CNSTI4 1732
ADDP4
INDIRP4
ARGP4
ADDRLP4 168
CNSTI4 0
ASGNI4
ADDRLP4 168
INDIRI4
ARGI4
ADDRGP4 $382
ARGP4
ADDRLP4 64
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 168
INDIRI4
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 1095
;1095:	trap_G2API_SetBoneAngles(client->ghoul2, 0, "cranium", tempVec, BONE_ANGLES_POSTMULT, POSITIVE_Z, NEGATIVE_Y, POSITIVE_X, NULL, 0, level.time);
ADDRFP4 0
INDIRP4
CNSTI4 1732
ADDP4
INDIRP4
ARGP4
ADDRLP4 172
CNSTI4 0
ASGNI4
ADDRLP4 172
INDIRI4
ARGI4
ADDRGP4 $384
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 176
CNSTI4 2
ASGNI4
ADDRLP4 176
INDIRI4
ARGI4
ADDRLP4 176
INDIRI4
ARGI4
CNSTI4 6
ARGI4
CNSTI4 1
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 172
INDIRI4
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 1097
;1096:
;1097:	if (!g2SaberInstance)
ADDRGP4 g2SaberInstance
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $386
line 1098
;1098:	{
line 1099
;1099:		trap_G2API_InitGhoul2Model(&g2SaberInstance, "models/weapons2/saber/saber_w.glm", 0, 0, -20, 0, 0);
ADDRGP4 g2SaberInstance
ARGP4
ADDRGP4 $108
ARGP4
ADDRLP4 180
CNSTI4 0
ASGNI4
ADDRLP4 180
INDIRI4
ARGI4
ADDRLP4 180
INDIRI4
ARGI4
CNSTI4 -20
ARGI4
ADDRLP4 180
INDIRI4
ARGI4
ADDRLP4 180
INDIRI4
ARGI4
ADDRGP4 trap_G2API_InitGhoul2Model
CALLI4
pop
line 1101
;1100:
;1101:		if (g2SaberInstance)
ADDRGP4 g2SaberInstance
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $388
line 1102
;1102:		{
line 1104
;1103:			// indicate we will be bolted to model 0 (ie the player) on bolt 0 (always the right hand) when we get copied
;1104:			trap_G2API_SetBoltInfo(g2SaberInstance, 0, 0);
ADDRGP4 g2SaberInstance
INDIRP4
ARGP4
ADDRLP4 184
CNSTI4 0
ASGNI4
ADDRLP4 184
INDIRI4
ARGI4
ADDRLP4 184
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoltInfo
CALLV
pop
line 1106
;1105:			// now set up the gun bolt on it
;1106:			trap_G2API_AddBolt(g2SaberInstance, 0, "*flash");
ADDRGP4 g2SaberInstance
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $390
ARGP4
ADDRGP4 trap_G2API_AddBolt
CALLI4
pop
line 1107
;1107:		}
LABELV $388
line 1108
;1108:	}
LABELV $386
line 1110
;1109:
;1110:	if (g2SaberInstance)
ADDRGP4 g2SaberInstance
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $391
line 1111
;1111:	{
line 1112
;1112:		trap_G2API_CopySpecificGhoul2Model(g2SaberInstance, 0, client->ghoul2, 1); 
ADDRGP4 g2SaberInstance
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 1732
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_G2API_CopySpecificGhoul2Model
CALLV
pop
line 1113
;1113:	}
LABELV $391
line 1114
;1114:}
LABELV $352
endproc SetupGameGhoul2Model 188 44
lit
align 1
LABELV $394
char 1 32
char 1 126
char 1 81
char 1 113
char 1 87
char 1 119
char 1 69
char 1 101
char 1 82
char 1 114
char 1 84
char 1 116
char 1 89
char 1 121
char 1 85
char 1 117
char 1 73
char 1 105
char 1 79
char 1 111
char 1 80
char 1 112
char 1 65
char 1 97
char 1 83
char 1 115
char 1 68
char 1 100
char 1 70
char 1 102
char 1 71
char 1 103
char 1 72
char 1 104
char 1 74
char 1 106
char 1 75
char 1 107
char 1 76
char 1 108
char 1 90
char 1 122
char 1 88
char 1 120
char 1 67
char 1 99
char 1 86
char 1 118
char 1 66
char 1 98
char 1 78
char 1 110
char 1 77
char 1 109
char 1 49
char 1 50
char 1 51
char 1 52
char 1 53
char 1 54
char 1 55
char 1 56
char 1 57
char 1 48
char 1 60
char 1 62
char 1 63
char 1 44
char 1 46
char 1 47
char 1 39
char 1 59
char 1 58
char 1 93
char 1 91
char 1 123
char 1 125
char 1 96
char 1 45
char 1 61
char 1 33
char 1 64
char 1 35
char 1 36
char 1 94
char 1 38
char 1 42
char 1 40
char 1 41
char 1 95
char 1 43
char 1 124
char 1 127
char 1 1
char 1 11
char 1 0
align 1
LABELV $395
char 1 46
char 1 0
export ClientUserinfoChanged
code
proc ClientUserinfoChanged 6396 52
line 1127
;1115:
;1116:/*
;1117:===========
;1118:ClientUserInfoChanged
;1119:
;1120:Called from ClientConnect when the player first connects and
;1121:directly by the server system when the player updates a userinfo variable.
;1122:
;1123:The game can override any of the settings and call trap_SetUserinfo
;1124:if desired.
;1125:============
;1126:*/
;1127:void ClientUserinfoChanged( int clientNum ) {
line 1146
;1128:	gentity_t *ent;
;1129:	int		teamTask, teamLeader, team, health;
;1130:	char	*s;
;1131:	char	model[MAX_QPATH];
;1132:	//char	headModel[MAX_QPATH];
;1133:	char	forcePowers[MAX_QPATH];
;1134:	char	oldname[MAX_STRING_CHARS];
;1135:	gclient_t	*client;
;1136:	char	c1[MAX_INFO_STRING];
;1137:	char	c2[MAX_INFO_STRING];
;1138:	char	redTeam[MAX_INFO_STRING];
;1139:	char	blueTeam[MAX_INFO_STRING];
;1140:	char	userinfo[MAX_INFO_STRING];
;1141:	//JediDog: Anti Name Crash declarations
;1142:	static const char validChars[]  = " ~QqWwEeRrTtYyUuIiOoPpAaSsDdFfGgHhJjKkLlZzXxCcVvBbNnMm1234567890<>?,./';:][{}`-=!@#$^&*()_+|";
;1143:	static const char Replacement[] = ".";
;1144:	int i, c, j, jdIllegalName;
;1145:
;1146:	ent = g_entities + clientNum;
ADDRLP4 1048
CNSTI4 832
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1147
;1147:	client = ent->client;
ADDRLP4 20
ADDRLP4 1048
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 1149
;1148:
;1149:	trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 1152
;1150:
;1151:	//JediDog: This is the anti saber, model and name flood...
;1152:	if (ent->client->TimeReswitch < level.time && ent->client->TimeReswitch > 0 && ent->client->TimeReswitch > level.time-500) {
ADDRLP4 6316
ADDRLP4 1048
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1808
ADDP4
INDIRI4
ASGNI4
ADDRLP4 6316
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $396
ADDRLP4 6316
INDIRI4
CNSTI4 0
LEI4 $396
ADDRLP4 6316
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
SUBI4
LEI4 $396
line 1153
;1153:		return;
ADDRGP4 $393
JUMPV
LABELV $396
line 1155
;1154:	}
;1155:	ent->client->TimeReswitch = level.time;
ADDRLP4 1048
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1808
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1160
;1156:	//End of the anti flood.
;1157:
;1158:
;1159:	// check for malformed or illegal info strings
;1160:	if ( !Info_Validate(userinfo) ) {
ADDRLP4 24
ARGP4
ADDRLP4 6320
ADDRGP4 Info_Validate
CALLI4
ASGNI4
ADDRLP4 6320
INDIRI4
CNSTI4 0
NEI4 $401
line 1161
;1161:		strcpy (userinfo, "\\name\\badinfo");
ADDRLP4 24
ARGP4
ADDRGP4 $403
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1162
;1162:	}
LABELV $401
line 1165
;1163:
;1164:	// check for local client
;1165:	s = Info_ValueForKey( userinfo, "ip" );
ADDRLP4 24
ARGP4
ADDRGP4 $404
ARGP4
ADDRLP4 6324
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 6324
INDIRP4
ASGNP4
line 1166
;1166:	if ( !strcmp( s, "localhost" ) ) {
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $407
ARGP4
ADDRLP4 6328
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 6328
INDIRI4
CNSTI4 0
NEI4 $405
line 1167
;1167:		client->pers.localClient = qtrue;
ADDRLP4 20
INDIRP4
CNSTI4 1412
ADDP4
CNSTI4 1
ASGNI4
line 1168
;1168:	}
LABELV $405
line 1171
;1169:
;1170:	// check the item prediction
;1171:	s = Info_ValueForKey( userinfo, "cg_predictItems" );
ADDRLP4 24
ARGP4
ADDRGP4 $408
ARGP4
ADDRLP4 6332
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 6332
INDIRP4
ASGNP4
line 1172
;1172:	if ( !atoi( s ) ) {
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 6336
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 6336
INDIRI4
CNSTI4 0
NEI4 $409
line 1173
;1173:		client->pers.predictItemPickup = qfalse;
ADDRLP4 20
INDIRP4
CNSTI4 1420
ADDP4
CNSTI4 0
ASGNI4
line 1174
;1174:	} else {
ADDRGP4 $410
JUMPV
LABELV $409
line 1175
;1175:		client->pers.predictItemPickup = qtrue;
ADDRLP4 20
INDIRP4
CNSTI4 1420
ADDP4
CNSTI4 1
ASGNI4
line 1176
;1176:	}
LABELV $410
line 1179
;1177:
;1178:	// set name
;1179:	Q_strncpyz ( oldname, client->pers.netname, sizeof( oldname ) );
ADDRLP4 1116
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1180
;1180:	s = Info_ValueForKey (userinfo, "name");
ADDRLP4 24
ARGP4
ADDRGP4 $411
ARGP4
ADDRLP4 6340
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 6340
INDIRP4
ASGNP4
line 1182
;1181:	//JediDog: Anti Name Crash
;1182:	for(i = 0; (c = s[i]); i++) { 
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $415
JUMPV
LABELV $412
line 1183
;1183:		jdIllegalName = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1184
;1184:		for(j = 0; validChars[j]; j++) { 
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $419
JUMPV
LABELV $416
line 1185
;1185:			if(c == validChars[j]) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
ADDRGP4 $394
ADDP4
INDIRI1
CVII4 1
NEI4 $420
line 1186
;1186:				jdIllegalName = 1;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 1187
;1187:			}
LABELV $420
line 1188
;1188:        }  
LABELV $417
line 1184
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $419
ADDRLP4 0
INDIRI4
ADDRGP4 $394
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $416
line 1189
;1189:		if (jdIllegalName == 0) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $422
line 1190
;1190:				s[i] = Replacement[0];
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRP4
ADDP4
ADDRGP4 $395
INDIRI1
ASGNI1
line 1191
;1191:		}
LABELV $422
line 1192
;1192:    }
LABELV $413
line 1182
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $415
ADDRLP4 6344
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
ADDRLP4 6344
INDIRI4
ASGNI4
ADDRLP4 6344
INDIRI4
CNSTI4 0
NEI4 $412
line 1194
;1193:	//End of Anti Name Crash
;1194:	ClientCleanName( s, client->pers.netname, sizeof(client->pers.netname) );
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientCleanName
CALLV
pop
line 1196
;1195:
;1196:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 20
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
CNSTI4 3
NEI4 $424
line 1197
;1197:		if ( client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRLP4 20
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
CNSTI4 3
NEI4 $426
line 1198
;1198:			Q_strncpyz( client->pers.netname, "scoreboard", sizeof(client->pers.netname) );
ADDRLP4 20
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 $428
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1199
;1199:		}
LABELV $426
line 1200
;1200:	}
LABELV $424
line 1202
;1201:
;1202:	if ( client->pers.connected == CON_CONNECTED ) {
ADDRLP4 20
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
NEI4 $429
line 1203
;1203:		if ( strcmp( oldname, client->pers.netname ) ) {
ADDRLP4 1116
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 6348
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 6348
INDIRI4
CNSTI4 0
EQI4 $431
line 1204
;1204:			trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " %s %s\n\"", oldname, G_GetStripEdString("SVINGAME", "PLRENAME"),
ADDRGP4 $148
ARGP4
ADDRGP4 $434
ARGP4
ADDRLP4 6352
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $433
ARGP4
ADDRLP4 1116
ARGP4
ADDRLP4 6352
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 6356
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 6356
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1206
;1205:				client->pers.netname) );
;1206:		}
LABELV $431
line 1207
;1207:	}
LABELV $429
line 1210
;1208:
;1209:	// set max health
;1210:	health = 100; //atoi( Info_ValueForKey( userinfo, "handicap" ) );
ADDRLP4 2148
CNSTI4 100
ASGNI4
line 1211
;1211:	client->pers.maxHealth = health;
ADDRLP4 20
INDIRP4
CNSTI4 1464
ADDP4
ADDRLP4 2148
INDIRI4
ASGNI4
line 1212
;1212:	if ( client->pers.maxHealth < 1 || client->pers.maxHealth > 100 ) {
ADDRLP4 6348
ADDRLP4 20
INDIRP4
CNSTI4 1464
ADDP4
INDIRI4
ASGNI4
ADDRLP4 6348
INDIRI4
CNSTI4 1
LTI4 $437
ADDRLP4 6348
INDIRI4
CNSTI4 100
LEI4 $435
LABELV $437
line 1213
;1213:		client->pers.maxHealth = 100;
ADDRLP4 20
INDIRP4
CNSTI4 1464
ADDP4
CNSTI4 100
ASGNI4
line 1214
;1214:	}
LABELV $435
line 1215
;1215:	client->ps.stats[STAT_MAX_HEALTH] = client->pers.maxHealth;
ADDRLP4 20
INDIRP4
CNSTI4 248
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 1464
ADDP4
INDIRI4
ASGNI4
line 1218
;1216:
;1217:	// set model
;1218:	if( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $438
line 1219
;1219:		Q_strncpyz( model, Info_ValueForKey (userinfo, "team_model"), sizeof( model ) );
ADDRLP4 24
ARGP4
ADDRGP4 $441
ARGP4
ADDRLP4 6356
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1052
ARGP4
ADDRLP4 6356
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1221
;1220:		//Q_strncpyz( headModel, Info_ValueForKey (userinfo, "team_headmodel"), sizeof( headModel ) );
;1221:	} else {
ADDRGP4 $439
JUMPV
LABELV $438
line 1222
;1222:		Q_strncpyz( model, Info_ValueForKey (userinfo, "model"), sizeof( model ) );
ADDRLP4 24
ARGP4
ADDRGP4 $442
ARGP4
ADDRLP4 6356
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1052
ARGP4
ADDRLP4 6356
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1224
;1223:		//Q_strncpyz( headModel, Info_ValueForKey (userinfo, "headmodel"), sizeof( headModel ) );
;1224:	}
LABELV $439
line 1240
;1225:	//JediDog: Galak_Mech kicker
;1226:/*	ModelCrash = Info_ValueForKey (userinfo, "name");
;1227:	if (strcmp(Info_ValueForKey (userinfo, "model"), "galak_mech") == 0) {
;1228:		trap_SendConsoleCommand(EXEC_INSERT, va("clientkick \"%d\"\n", clientNum));
;1229:		trap_SendServerCommand(-1, va("print\"%s ^5is being kicked for using the galak_mech model exploit.\n", ModelCrash));
;1230:		G_LogPrintf("%s was kicked because the client used the model galak_mech.", ModelCrash);
;1231:	}
;1232:*/
;1233:/*	//JediDog: Galak Mech Fix
;1234:	if (strcmp(Info_ValueForKey (userinfo, "model"), "galak_mech")== 0) {
;1235:		return;
;1236:	}
;1237:	//end
;1238:*/
;1239:	// set forcepowers
;1240:	Q_strncpyz( forcePowers, Info_ValueForKey (userinfo, "forcepowers"), sizeof( forcePowers ) );
ADDRLP4 24
ARGP4
ADDRGP4 $443
ARGP4
ADDRLP4 6356
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2152
ARGP4
ADDRLP4 6356
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1243
;1241:
;1242:	// bots set their team a few frames later
;1243:	if (g_gametype.integer >= GT_TEAM && g_entities[clientNum].r.svFlags & SVF_BOT) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $444
CNSTI4 832
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+296+8
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $444
line 1244
;1244:		s = Info_ValueForKey( userinfo, "team" );
ADDRLP4 24
ARGP4
ADDRGP4 $449
ARGP4
ADDRLP4 6360
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 6360
INDIRP4
ASGNP4
line 1245
;1245:		if ( !Q_stricmp( s, "red" ) || !Q_stricmp( s, "r" ) ) {
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $452
ARGP4
ADDRLP4 6364
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6364
INDIRI4
CNSTI4 0
EQI4 $454
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $453
ARGP4
ADDRLP4 6368
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6368
INDIRI4
CNSTI4 0
NEI4 $450
LABELV $454
line 1246
;1246:			team = TEAM_RED;
ADDRLP4 4264
CNSTI4 1
ASGNI4
line 1247
;1247:		} else if ( !Q_stricmp( s, "blue" ) || !Q_stricmp( s, "b" ) ) {
ADDRGP4 $445
JUMPV
LABELV $450
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $457
ARGP4
ADDRLP4 6372
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6372
INDIRI4
CNSTI4 0
EQI4 $459
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $458
ARGP4
ADDRLP4 6376
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6376
INDIRI4
CNSTI4 0
NEI4 $455
LABELV $459
line 1248
;1248:			team = TEAM_BLUE;
ADDRLP4 4264
CNSTI4 2
ASGNI4
line 1249
;1249:		} else {
ADDRGP4 $445
JUMPV
LABELV $455
line 1251
;1250:			// pick the team with the least number of players
;1251:			team = PickTeam( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 6380
ADDRGP4 PickTeam
CALLI4
ASGNI4
ADDRLP4 4264
ADDRLP4 6380
INDIRI4
ASGNI4
line 1252
;1252:		}
line 1253
;1253:	}
ADDRGP4 $445
JUMPV
LABELV $444
line 1254
;1254:	else {
line 1255
;1255:		team = client->sess.sessionTeam;
ADDRLP4 4264
ADDRLP4 20
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
ASGNI4
line 1256
;1256:	}
LABELV $445
line 1279
;1257:
;1258:/*	NOTE: all client side now
;1259:
;1260:	// team
;1261:	switch( team ) {
;1262:	case TEAM_RED:
;1263:		ForceClientSkin(client, model, "red");
;1264://		ForceClientSkin(client, headModel, "red");
;1265:		break;
;1266:	case TEAM_BLUE:
;1267:		ForceClientSkin(client, model, "blue");
;1268://		ForceClientSkin(client, headModel, "blue");
;1269:		break;
;1270:	}
;1271:	// don't ever use a default skin in teamplay, it would just waste memory
;1272:	// however bots will always join a team but they spawn in as spectator
;1273:	if ( g_gametype.integer >= GT_TEAM && team == TEAM_SPECTATOR) {
;1274:		ForceClientSkin(client, model, "red");
;1275://		ForceClientSkin(client, headModel, "red");
;1276:	}
;1277:*/
;1278:
;1279:	if (g_gametype.integer >= GT_TEAM) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $460
line 1280
;1280:		client->pers.teamInfo = qtrue;
ADDRLP4 20
INDIRP4
CNSTI4 1528
ADDP4
CNSTI4 1
ASGNI4
line 1281
;1281:	} else {
ADDRGP4 $461
JUMPV
LABELV $460
line 1282
;1282:		s = Info_ValueForKey( userinfo, "teamoverlay" );
ADDRLP4 24
ARGP4
ADDRGP4 $463
ARGP4
ADDRLP4 6360
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 6360
INDIRP4
ASGNP4
line 1283
;1283:		if ( ! *s || atoi( s ) != 0 ) {
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $466
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 6368
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 6368
INDIRI4
CNSTI4 0
EQI4 $464
LABELV $466
line 1284
;1284:			client->pers.teamInfo = qtrue;
ADDRLP4 20
INDIRP4
CNSTI4 1528
ADDP4
CNSTI4 1
ASGNI4
line 1285
;1285:		} else {
ADDRGP4 $465
JUMPV
LABELV $464
line 1286
;1286:			client->pers.teamInfo = qfalse;
ADDRLP4 20
INDIRP4
CNSTI4 1528
ADDP4
CNSTI4 0
ASGNI4
line 1287
;1287:		}
LABELV $465
line 1288
;1288:	}
LABELV $461
line 1300
;1289:	/*
;1290:	s = Info_ValueForKey( userinfo, "cg_pmove_fixed" );
;1291:	if ( !*s || atoi( s ) == 0 ) {
;1292:		client->pers.pmoveFixed = qfalse;
;1293:	}
;1294:	else {
;1295:		client->pers.pmoveFixed = qtrue;
;1296:	}
;1297:	*/
;1298:
;1299:	// team task (0 = none, 1 = offence, 2 = defence)
;1300:	teamTask = atoi(Info_ValueForKey(userinfo, "teamtask"));
ADDRLP4 24
ARGP4
ADDRGP4 $467
ARGP4
ADDRLP4 6360
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 6360
INDIRP4
ARGP4
ADDRLP4 6364
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2140
ADDRLP4 6364
INDIRI4
ASGNI4
line 1302
;1301:	// team Leader (1 = leader, 0 is normal player)
;1302:	teamLeader = client->sess.teamLeader;
ADDRLP4 2144
ADDRLP4 20
INDIRP4
CNSTI4 1576
ADDP4
INDIRI4
ASGNI4
line 1305
;1303:
;1304:	// colors
;1305:	strcpy(c1, Info_ValueForKey( userinfo, "color1" ));
ADDRLP4 24
ARGP4
ADDRGP4 $468
ARGP4
ADDRLP4 6368
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2216
ARGP4
ADDRLP4 6368
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1306
;1306:	strcpy(c2, Info_ValueForKey( userinfo, "color2" ));
ADDRLP4 24
ARGP4
ADDRGP4 $469
ARGP4
ADDRLP4 6372
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 3240
ARGP4
ADDRLP4 6372
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1308
;1307:
;1308:	strcpy(redTeam, Info_ValueForKey( userinfo, "g_redteam" ));
ADDRLP4 24
ARGP4
ADDRGP4 $470
ARGP4
ADDRLP4 6376
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4268
ARGP4
ADDRLP4 6376
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1309
;1309:	strcpy(blueTeam, Info_ValueForKey( userinfo, "g_blueteam" ));
ADDRLP4 24
ARGP4
ADDRGP4 $471
ARGP4
ADDRLP4 6380
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 5292
ARGP4
ADDRLP4 6380
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1313
;1310:
;1311:	// send over a subset of the userinfo keys so other clients can
;1312:	// print scoreboards, display models, and play custom sounds
;1313:	if ( ent->r.svFlags & SVF_BOT ) {
ADDRLP4 1048
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $472
line 1314
;1314:		s = va("n\\%s\\t\\%i\\model\\%s\\c1\\%s\\c2\\%s\\hc\\%i\\w\\%i\\l\\%i\\skill\\%s\\tt\\%d\\tl\\%d",
ADDRLP4 24
ARGP4
ADDRGP4 $475
ARGP4
ADDRLP4 6384
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $474
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 4264
INDIRI4
ARGI4
ADDRLP4 1052
ARGP4
ADDRLP4 2216
ARGP4
ADDRLP4 3240
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 1464
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
CNSTI4 1552
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
CNSTI4 1556
ADDP4
INDIRI4
ARGI4
ADDRLP4 6384
INDIRP4
ARGP4
ADDRLP4 2140
INDIRI4
ARGI4
ADDRLP4 2144
INDIRI4
ARGI4
ADDRLP4 6392
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 6392
INDIRP4
ASGNP4
line 1318
;1315:			client->pers.netname, team, model,  c1, c2, 
;1316:			client->pers.maxHealth, client->sess.wins, client->sess.losses,
;1317:			Info_ValueForKey( userinfo, "skill" ), teamTask, teamLeader );
;1318:	} else {
ADDRGP4 $473
JUMPV
LABELV $472
line 1319
;1319:		s = va("n\\%s\\t\\%i\\model\\%s\\g_redteam\\%s\\g_blueteam\\%s\\c1\\%s\\c2\\%s\\hc\\%i\\w\\%i\\l\\%i\\tt\\%d\\tl\\%d",
ADDRGP4 $476
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
ARGI4
ADDRLP4 1052
ARGP4
ADDRLP4 4268
ARGP4
ADDRLP4 5292
ARGP4
ADDRLP4 2216
ARGP4
ADDRLP4 3240
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 1464
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
CNSTI4 1552
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
CNSTI4 1556
ADDP4
INDIRI4
ARGI4
ADDRLP4 2140
INDIRI4
ARGI4
ADDRLP4 2144
INDIRI4
ARGI4
ADDRLP4 6388
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 6388
INDIRP4
ASGNP4
line 1322
;1320:			client->pers.netname, client->sess.sessionTeam, model, redTeam, blueTeam, c1, c2, 
;1321:			client->pers.maxHealth, client->sess.wins, client->sess.losses, teamTask, teamLeader);
;1322:	}
LABELV $473
line 1324
;1323:
;1324:	trap_SetConfigstring( CS_PLAYERS+clientNum, s );
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1326
;1325:
;1326:	if (g_logClientInfo.integer)
ADDRGP4 g_logClientInfo+12
INDIRI4
CNSTI4 0
EQI4 $477
line 1327
;1327:	{
line 1328
;1328:		G_LogPrintf( "ClientUserinfoChanged: %i %s\n", clientNum, s );
ADDRGP4 $480
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1329
;1329:	}
LABELV $477
line 1330
;1330:}
LABELV $393
endproc ClientUserinfoChanged 6396 52
bss
align 1
LABELV $508
skip 1024
export ClientConnect
code
proc ClientConnect 1132 12
line 1352
;1331:
;1332:/*
;1333:===========
;1334:ClientConnect
;1335:
;1336:Called when a player begins connecting to the server.
;1337:Called again for every map change or tournement restart.
;1338:
;1339:The session information will be valid after exit.
;1340:
;1341:Return NULL if the client should be allowed, otherwise return
;1342:a string with the reason for denial.
;1343:
;1344:Otherwise, the client will be sent the current gamestate
;1345:and will eventually get to ClientBegin.
;1346:
;1347:firstTime will be qtrue the very first time a client connects
;1348:to the server machine, but qfalse on map changes and tournement
;1349:restarts.
;1350:============
;1351:*/
;1352:char *ClientConnect( int clientNum, qboolean firstTime, qboolean isBot ) {
line 1369
;1353:	char		*value;
;1354://	char		*areabits;
;1355:	gclient_t	*client;
;1356:	char		userinfo[MAX_INFO_STRING];
;1357:	gentity_t	*ent;
;1358:	gentity_t	*te;
;1359:
;1360://	static const unsigned char validChars[] = " ~QqWwEeRrTtYyUuIiOoPpAaSsDdFfGgHhJjKkLlZzXxCcVvBbNnMm1234567890<>?,./';:][{}`-=!@#$^&*()_+|";
;1361://	unsigned char jdIllegalName[24];
;1362:	char jdPortlessIP[24];
;1363://	#define jdPB "cl_punkbuster"
;1364://	#define jdCLG "cl_guid"
;1365://	int i;
;1366://	int c;
;1367://	int j;
;1368:
;1369:	ent = &g_entities[ clientNum ];
ADDRLP4 1028
CNSTI4 832
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1371
;1370:
;1371:	trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 1373
;1372:
;1373:	G_LogPrintf( "Connect request from: %s\n", userinfo );
ADDRGP4 $482
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1376
;1374:
;1375:	// check to see if they are on the banned IP list
;1376:	value = Info_ValueForKey (userinfo, "ip");
ADDRLP4 0
ARGP4
ADDRGP4 $404
ARGP4
ADDRLP4 1064
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1032
ADDRLP4 1064
INDIRP4
ASGNP4
line 1377
;1377:	if ( G_FilterPacket( value ) ) {
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1068
ADDRGP4 G_FilterPacket
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
EQI4 $483
line 1378
;1378:		return "Banned.";
ADDRGP4 $485
RETP4
ADDRGP4 $481
JUMPV
LABELV $483
line 1382
;1379:	}
;1380:
;1381:	//JediDog: Added this from my mod & Gamall mod, I like this idea too much to deny it :D
;1382:	if (jd_CloseServer.integer !=0 && firstTime) {
ADDRLP4 1072
CNSTI4 0
ASGNI4
ADDRGP4 jd_CloseServer+12
INDIRI4
ADDRLP4 1072
INDIRI4
EQI4 $486
ADDRFP4 4
INDIRI4
ADDRLP4 1072
INDIRI4
EQI4 $486
line 1383
;1383:		G_LogPrintf("Access denied because the server is closed\n");
ADDRGP4 $489
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1384
;1384:		if (jd_CloseServer.integer !=0) {
ADDRGP4 jd_CloseServer+12
INDIRI4
CNSTI4 0
EQI4 $490
line 1385
;1385:			value = Info_ValueForKey (userinfo, "name");
ADDRLP4 0
ARGP4
ADDRGP4 $411
ARGP4
ADDRLP4 1076
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1032
ADDRLP4 1076
INDIRP4
ASGNP4
line 1386
;1386:			if (jd_Messages.integer !=0) {
ADDRGP4 jd_Messages+12
INDIRI4
CNSTI4 0
EQI4 $493
line 1387
;1387:				trap_SendServerCommand(-1, va("print\"^2Closed server: ^5Client ^7<^7%s^7>^5 was denied access^2.\n\"", value));
ADDRGP4 $496
ARGP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1080
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1080
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1388
;1388:			}
LABELV $493
line 1389
;1389:		}
LABELV $490
line 1390
;1390:		return "The server is closed right now, come back later. :)";
ADDRGP4 $497
RETP4
ADDRGP4 $481
JUMPV
LABELV $486
line 1393
;1391:	}//JediDog: End.
;1392:
;1393:	if ( !( ent->r.svFlags & SVF_BOT ) && !isBot && g_needpass.integer ) {
ADDRLP4 1076
CNSTI4 0
ASGNI4
ADDRLP4 1028
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 1076
INDIRI4
NEI4 $498
ADDRFP4 8
INDIRI4
ADDRLP4 1076
INDIRI4
NEI4 $498
ADDRGP4 g_needpass+12
INDIRI4
ADDRLP4 1076
INDIRI4
EQI4 $498
line 1395
;1394:		// check for a password
;1395:		value = Info_ValueForKey (userinfo, "password");
ADDRLP4 0
ARGP4
ADDRGP4 $501
ARGP4
ADDRLP4 1080
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1032
ADDRLP4 1080
INDIRP4
ASGNP4
line 1396
;1396:		if ( g_password.string[0] && Q_stricmp( g_password.string, "none" ) &&
ADDRGP4 g_password+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $502
ADDRGP4 g_password+16
ARGP4
ADDRGP4 $506
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
EQI4 $502
ADDRGP4 g_password+16
ARGP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1088
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
EQI4 $502
line 1397
;1397:			strcmp( g_password.string, value) != 0) {
line 1399
;1398:			static char sTemp[1024];
;1399:			Q_strncpyz(sTemp, G_GetStripEdString("SVINGAME","INVALID_PASSWORD"), sizeof (sTemp) );
ADDRGP4 $148
ARGP4
ADDRGP4 $509
ARGP4
ADDRLP4 1092
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $508
ARGP4
ADDRLP4 1092
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1400
;1400:			return sTemp;// return "Invalid password";
ADDRGP4 $508
RETP4
ADDRGP4 $481
JUMPV
LABELV $502
line 1402
;1401:		}
;1402:	}
LABELV $498
line 1430
;1403:	/* BEGINNING OF JEDIDOG FIXES */
;1404:	//JediDog: get ip address
;1405:	//JEDIDOG: NOTE: DISABLED THIS PORTLESS IP CORE BECAUSE WE DON'T NEED IT
;1406:/*	strcpy(jdPortlessIP, Info_ValueForKey (userinfo, "ip"));
;1407:	for (i = 0 ; i < 24 ; i++) {
;1408:		if (jdPortlessIP[i] == ':') {
;1409:			jdPortlessIP[i] = 0;
;1410:			break;
;1411:		}
;1412:	}//end of fake player core
;1413:	// JediDog: beginning of illegal name fix
;1414:	//JEDIDOG: NOTE: DISABLED THIS ANTI NAME CRASH TO SUBSTITUTE IT FOR THE ONE IN USERINFO
;1415:	strcpy((char*)jdIllegalName, Info_ValueForKey (userinfo, "name"));
;1416:	for(i = 0; (c = jdIllegalName[i]); i++) {
;1417:		for(j = 0; validChars[j]; j++) {
;1418:			if(c == validChars[j]) break;
;1419:		}// if illegal character name glitch detection is activated, check user info
;1420://		if (jd_antiNameCrash.integer != 0) {
;1421:			if (!validChars[j]) {
;1422://				G_LogPrintf("JEDIDOG FIX: The IP Address %s has Illegal Characters in their name. Possible name glitch/crash attempt. The client has been denied access.\n", jdPortlessIP);
;1423:				return "Illegal characters detected in name, reconnect as a different name.";
;1424:			}
;1425:	}
;1426://	}// END OF ILLEGAL NAME FIX
;1427:*/
;1428:	// Begin Fake Players Detection
;1429://	if (jd_FakePlayerDetection.integer != 0) {
;1430:	if (!(ent->r.svFlags & SVF_BOT) && !isBot) {
ADDRLP4 1080
CNSTI4 0
ASGNI4
ADDRLP4 1028
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 1080
INDIRI4
NEI4 $510
ADDRFP4 8
INDIRI4
ADDRLP4 1080
INDIRI4
NEI4 $510
line 1431
;1431:		if (strcmp(Info_ValueForKey (userinfo, "cl_punkbuster"), "") != 0 || strcmp(Info_ValueForKey (userinfo, "cl_guid"), "") != 0
ADDRLP4 0
ARGP4
ADDRGP4 $514
ARGP4
ADDRLP4 1084
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1084
INDIRP4
ARGP4
ADDRGP4 $515
ARGP4
ADDRLP4 1088
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $521
ADDRLP4 0
ARGP4
ADDRGP4 $516
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRGP4 $515
ARGP4
ADDRLP4 1096
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $521
ADDRLP4 0
ARGP4
ADDRGP4 $408
ARGP4
ADDRLP4 1100
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRGP4 $515
ARGP4
ADDRLP4 1104
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
EQI4 $521
ADDRLP4 0
ARGP4
ADDRGP4 $468
ARGP4
ADDRLP4 1108
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRGP4 $515
ARGP4
ADDRLP4 1112
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
EQI4 $521
ADDRLP4 0
ARGP4
ADDRGP4 $443
ARGP4
ADDRLP4 1116
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1116
INDIRP4
ARGP4
ADDRGP4 $515
ARGP4
ADDRLP4 1120
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
EQI4 $521
ADDRLP4 0
ARGP4
ADDRGP4 $469
ARGP4
ADDRLP4 1124
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRGP4 $515
ARGP4
ADDRLP4 1128
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1128
INDIRI4
CNSTI4 0
NEI4 $512
LABELV $521
line 1434
;1432:			|| strcmp(Info_ValueForKey (userinfo, "cg_predictItems"), "") ==0 || strcmp(Info_ValueForKey (userinfo, "color1"), "") ==0
;1433:			|| strcmp(Info_ValueForKey (userinfo, "forcepowers"), "") ==0 || strcmp(Info_ValueForKey (userinfo, "color2"), "") ==0
;1434:			/*|| strcmp(Info_ValueForKey (userinfo, "model\none"), "") != 0*/) {
line 1435
;1435:			return "Fake Player Settings Detected.";
ADDRGP4 $522
RETP4
ADDRGP4 $481
JUMPV
LABELV $512
line 1437
;1436:		}
;1437:	}
LABELV $510
line 1443
;1438://		}
;1439://	}// end of fake players detection
;1440:	/* END OF JEDIDOG FIXES */
;1441:
;1442:	// they can connect
;1443:	ent->client = level.clients + clientNum;
ADDRLP4 1028
INDIRP4
CNSTI4 408
ADDP4
CNSTI4 1812
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1444
;1444:	client = ent->client;
ADDRLP4 1024
ADDRLP4 1028
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 1448
;1445:
;1446://	areabits = client->areabits;
;1447:
;1448:	memset( client, 0, sizeof(*client) );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1812
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1450
;1449:
;1450:	client->pers.connected = CON_CONNECTING;
ADDRLP4 1024
INDIRP4
CNSTI4 1380
ADDP4
CNSTI4 1
ASGNI4
line 1453
;1451:
;1452:	// read or initialize the session data
;1453:	if ( firstTime || level.newSession ) {
ADDRLP4 1084
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 1084
INDIRI4
NEI4 $526
ADDRGP4 level+64
INDIRI4
ADDRLP4 1084
INDIRI4
EQI4 $523
LABELV $526
line 1454
;1454:		G_InitSessionData( client, userinfo, isBot );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 G_InitSessionData
CALLV
pop
line 1455
;1455:	}
LABELV $523
line 1456
;1456:	G_ReadSessionData( client );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 G_ReadSessionData
CALLV
pop
line 1458
;1457:
;1458:	if( isBot ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $527
line 1459
;1459:		ent->r.svFlags |= SVF_BOT;
ADDRLP4 1088
ADDRLP4 1028
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 1088
INDIRP4
ADDRLP4 1088
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1460
;1460:		ent->inuse = qtrue;
ADDRLP4 1028
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 1
ASGNI4
line 1461
;1461:		if( !G_BotConnect( clientNum, !firstTime ) ) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $532
ADDRLP4 1092
CNSTI4 1
ASGNI4
ADDRGP4 $533
JUMPV
LABELV $532
ADDRLP4 1092
CNSTI4 0
ASGNI4
LABELV $533
ADDRLP4 1092
INDIRI4
ARGI4
ADDRLP4 1096
ADDRGP4 G_BotConnect
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $529
line 1462
;1462:			return "BotConnectfailed";
ADDRGP4 $534
RETP4
ADDRGP4 $481
JUMPV
LABELV $529
line 1464
;1463:		}
;1464:	}
LABELV $527
line 1467
;1465:
;1466:	// get and distribute relevent paramters
;1467:	G_LogPrintf( "ClientConnect: %i\n", clientNum );
ADDRGP4 $535
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1468
;1468:	ClientUserinfoChanged( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 1471
;1469:
;1470:	// don't do the "xxx connected" messages if they were caried over from previous level
;1471:	if ( firstTime ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $536
line 1472
;1472:		trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " %s\n\"", client->pers.netname, G_GetStripEdString("SVINGAME", "PLCONNECT")) );
ADDRGP4 $148
ARGP4
ADDRGP4 $539
ARGP4
ADDRLP4 1088
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $538
ARGP4
ADDRLP4 1024
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 1088
INDIRP4
ARGP4
ADDRLP4 1092
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1473
;1473:	}
LABELV $536
line 1474
;1474:	if ( g_gametype.integer >= GT_TEAM &&
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $540
ADDRLP4 1024
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
CNSTI4 3
EQI4 $540
line 1475
;1475:		client->sess.sessionTeam != TEAM_SPECTATOR ) {
line 1476
;1476:		BroadcastTeamChange( client, -1 );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 BroadcastTeamChange
CALLV
pop
line 1477
;1477:	}
LABELV $540
line 1480
;1478:
;1479:	// count current clients and rank for scoreboard
;1480:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1482
;1481:
;1482:	te = G_TempEntity( vec3_origin, EV_CLIENTJOIN );
ADDRGP4 vec3_origin
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1088
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1036
ADDRLP4 1088
INDIRP4
ASGNP4
line 1483
;1483:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 1092
ADDRLP4 1036
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 1092
INDIRP4
ADDRLP4 1092
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1484
;1484:	te->s.eventParm = clientNum;
ADDRLP4 1036
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 1491
;1485:
;1486:	// for statistics
;1487://	client->areabits = areabits;
;1488://	if ( !client->areabits )
;1489://		client->areabits = G_Alloc( (trap_AAS_PointReachabilityAreaIndex( NULL ) + 7) / 8 );
;1490:
;1491:	return NULL;
CNSTP4 0
RETP4
LABELV $481
endproc ClientConnect 1132 12
export ClientBegin
proc ClientBegin 1108 12
line 1505
;1492:}
;1493:
;1494:void G_WriteClientSessionData( gclient_t *client );
;1495:
;1496:/*
;1497:===========
;1498:ClientBegin
;1499:
;1500:called when a client has finished connecting, and is ready
;1501:to be placed into the level.  This will happen every level load,
;1502:and on transition between teams, but doesn't happen on respawns
;1503:============
;1504:*/
;1505:void ClientBegin( int clientNum, qboolean allowTeamReset ) {
line 1512
;1506:	gentity_t	*ent;
;1507:	gclient_t	*client;
;1508:	gentity_t	*tent;
;1509:	int			flags, i;
;1510:	char		userinfo[MAX_INFO_VALUE], *modelname;
;1511:
;1512:	ent = g_entities + clientNum;
ADDRLP4 4
CNSTI4 832
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1514
;1513:
;1514:	if ((ent->r.svFlags & SVF_BOT) && g_gametype.integer >= GT_TEAM)
ADDRLP4 4
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $544
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $544
line 1515
;1515:	{
line 1516
;1516:		if (allowTeamReset)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $547
line 1517
;1517:		{
line 1518
;1518:			const char *team = "Red";
ADDRLP4 1048
ADDRGP4 $549
ASGNP4
line 1522
;1519:			int preSess;
;1520:
;1521:			//SetTeam(ent, "");
;1522:			ent->client->sess.sessionTeam = PickTeam(-1);
CNSTI4 -1
ARGI4
ADDRLP4 1056
ADDRGP4 PickTeam
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
ADDRLP4 1056
INDIRI4
ASGNI4
line 1523
;1523:			trap_GetUserinfo(clientNum, userinfo, MAX_INFO_STRING);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 1525
;1524:
;1525:			if (ent->client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
CNSTI4 3
NEI4 $550
line 1526
;1526:			{
line 1527
;1527:				ent->client->sess.sessionTeam = TEAM_RED;
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
CNSTI4 1
ASGNI4
line 1528
;1528:			}
LABELV $550
line 1530
;1529:
;1530:			if (ent->client->sess.sessionTeam == TEAM_RED)
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
CNSTI4 1
NEI4 $552
line 1531
;1531:			{
line 1532
;1532:				team = "Red";
ADDRLP4 1048
ADDRGP4 $549
ASGNP4
line 1533
;1533:			}
ADDRGP4 $553
JUMPV
LABELV $552
line 1535
;1534:			else
;1535:			{
line 1536
;1536:				team = "Blue";
ADDRLP4 1048
ADDRGP4 $554
ASGNP4
line 1537
;1537:			}
LABELV $553
line 1539
;1538:
;1539:			Info_SetValueForKey( userinfo, "team", team );
ADDRLP4 12
ARGP4
ADDRGP4 $449
ARGP4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1541
;1540:
;1541:			trap_SetUserinfo( clientNum, userinfo );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 1543
;1542:
;1543:			ent->client->ps.persistant[ PERS_TEAM ] = ent->client->sess.sessionTeam;
ADDRLP4 1060
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1060
INDIRP4
CNSTI4 292
ADDP4
ADDRLP4 1060
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
ASGNI4
line 1545
;1544:
;1545:			preSess = ent->client->sess.sessionTeam;
ADDRLP4 1052
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
ASGNI4
line 1546
;1546:			G_ReadSessionData( ent->client );
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_ReadSessionData
CALLV
pop
line 1547
;1547:			ent->client->sess.sessionTeam = preSess;
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
ADDRLP4 1052
INDIRI4
ASGNI4
line 1548
;1548:			G_WriteClientSessionData(ent->client);
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_WriteClientSessionData
CALLV
pop
line 1549
;1549:			ClientUserinfoChanged( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 1550
;1550:			ClientBegin(clientNum, qfalse);
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 1551
;1551:			return;
ADDRGP4 $543
JUMPV
LABELV $547
line 1553
;1552:		}
;1553:	}
LABELV $544
line 1555
;1554:
;1555:	client = level.clients + clientNum;
ADDRLP4 8
CNSTI4 1812
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1557
;1556:
;1557:	if ( ent->r.linked ) {
ADDRLP4 4
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
CNSTI4 0
EQI4 $555
line 1558
;1558:		trap_UnlinkEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1559
;1559:	}
LABELV $555
line 1560
;1560:	G_InitGentity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_InitGentity
CALLV
pop
line 1561
;1561:	ent->touch = 0;
ADDRLP4 4
INDIRP4
CNSTI4 648
ADDP4
CNSTP4 0
ASGNP4
line 1562
;1562:	ent->pain = 0;
ADDRLP4 4
INDIRP4
CNSTI4 656
ADDP4
CNSTP4 0
ASGNP4
line 1563
;1563:	ent->client = client;
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
ADDRLP4 8
INDIRP4
ASGNP4
line 1565
;1564:
;1565:	client->pers.connected = CON_CONNECTED;
ADDRLP4 8
INDIRP4
CNSTI4 1380
ADDP4
CNSTI4 2
ASGNI4
line 1566
;1566:	client->pers.enterTime = level.time;
ADDRLP4 8
INDIRP4
CNSTI4 1468
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1567
;1567:	client->pers.teamState.state = TEAM_BEGIN;
ADDRLP4 8
INDIRP4
CNSTI4 1472
ADDP4
CNSTI4 0
ASGNI4
line 1574
;1568:
;1569:	// save eflags around this, because changing teams will
;1570:	// cause this to happen with a valid entity, and we
;1571:	// want to make sure the teleport bit is set right
;1572:	// so the viewpoint doesn't interpolate through the
;1573:	// world to the new position
;1574:	flags = client->ps.eFlags;
ADDRLP4 1036
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 1576
;1575:
;1576:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $559
JUMPV
LABELV $558
line 1579
;1577:
;1578:	while (i < NUM_FORCE_POWERS)
;1579:	{
line 1580
;1580:		if (ent->client->ps.fd.forcePowersActive & (1 << i))
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $561
line 1581
;1581:		{
line 1582
;1582:			WP_ForcePowerStop(ent, i);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 1583
;1583:		}
LABELV $561
line 1584
;1584:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1585
;1585:	}
LABELV $559
line 1578
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $558
line 1587
;1586:
;1587:	i = TRACK_CHANNEL_1;
ADDRLP4 0
CNSTI4 51
ASGNI4
ADDRGP4 $564
JUMPV
LABELV $563
line 1590
;1588:
;1589:	while (i < NUM_TRACK_CHANNELS)
;1590:	{
line 1591
;1591:		if (ent->client->ps.fd.killSoundEntIndex[i-50] && ent->client->ps.fd.killSoundEntIndex[i-50] < MAX_GENTITIES && ent->client->ps.fd.killSoundEntIndex[i-50] > 0)
ADDRLP4 1048
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 200
SUBI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1200
ADDP4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1052
CNSTI4 0
ASGNI4
ADDRLP4 1048
INDIRI4
ADDRLP4 1052
INDIRI4
EQI4 $566
ADDRLP4 1048
INDIRI4
CNSTI4 1024
GEI4 $566
ADDRLP4 1048
INDIRI4
ADDRLP4 1052
INDIRI4
LEI4 $566
line 1592
;1592:		{
line 1593
;1593:			G_MuteSound(ent->client->ps.fd.killSoundEntIndex[i-50], CHAN_VOICE);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 200
SUBI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1200
ADDP4
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 1594
;1594:		}
LABELV $566
line 1595
;1595:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1596
;1596:	}
LABELV $564
line 1589
ADDRLP4 0
INDIRI4
CNSTI4 56
LTI4 $563
line 1597
;1597:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1599
;1598:
;1599:	memset( &client->ps, 0, sizeof( client->ps ) );
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1380
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1600
;1600:	client->ps.eFlags = flags;
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 1036
INDIRI4
ASGNI4
line 1602
;1601:
;1602:	client->ps.hasDetPackPlanted = qfalse;
ADDRLP4 8
INDIRP4
CNSTI4 640
ADDP4
CNSTI4 0
ASGNI4
line 1605
;1603:
;1604:	//first-time force power initialization
;1605:	WP_InitForcePowers( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 WP_InitForcePowers
CALLV
pop
line 1608
;1606:
;1607:	//init saber ent
;1608:	WP_SaberInitBladeData( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 WP_SaberInitBladeData
CALLV
pop
line 1611
;1609:
;1610:	// First time model setup for that player.
;1611:	trap_GetUserinfo( clientNum, userinfo, sizeof(userinfo) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 1612
;1612:	modelname = Info_ValueForKey (userinfo, "model");
ADDRLP4 12
ARGP4
ADDRGP4 $442
ARGP4
ADDRLP4 1048
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1040
ADDRLP4 1048
INDIRP4
ASGNP4
line 1613
;1613:	SetupGameGhoul2Model(client, modelname);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 SetupGameGhoul2Model
CALLV
pop
line 1615
;1614:
;1615:	if (ent->client->ghoul2)
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1732
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $568
line 1616
;1616:	{
line 1617
;1617:		ent->bolt_Head = trap_G2API_AddBolt(ent->client->ghoul2, 0, "cranium");
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1732
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $384
ARGP4
ADDRLP4 1056
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 784
ADDP4
ADDRLP4 1056
INDIRI4
ASGNI4
line 1618
;1618:		ent->bolt_Waist = trap_G2API_AddBolt(ent->client->ghoul2, 0, "thoracic");
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1732
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $570
ARGP4
ADDRLP4 1064
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 804
ADDP4
ADDRLP4 1064
INDIRI4
ASGNI4
line 1619
;1619:		ent->bolt_LArm = trap_G2API_AddBolt(ent->client->ghoul2, 0, "lradius");
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1732
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $571
ARGP4
ADDRLP4 1072
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 788
ADDP4
ADDRLP4 1072
INDIRI4
ASGNI4
line 1620
;1620:		ent->bolt_RArm = trap_G2API_AddBolt(ent->client->ghoul2, 0, "rradius");
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1732
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $572
ARGP4
ADDRLP4 1080
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 792
ADDP4
ADDRLP4 1080
INDIRI4
ASGNI4
line 1621
;1621:		ent->bolt_LLeg = trap_G2API_AddBolt(ent->client->ghoul2, 0, "ltibia");
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1732
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $573
ARGP4
ADDRLP4 1088
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 796
ADDP4
ADDRLP4 1088
INDIRI4
ASGNI4
line 1622
;1622:		ent->bolt_RLeg = trap_G2API_AddBolt(ent->client->ghoul2, 0, "rtibia");
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1732
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $574
ARGP4
ADDRLP4 1096
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 800
ADDP4
ADDRLP4 1096
INDIRI4
ASGNI4
line 1623
;1623:		ent->bolt_Motion = trap_G2API_AddBolt(ent->client->ghoul2, 0, "Motion");
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1732
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $575
ARGP4
ADDRLP4 1104
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 808
ADDP4
ADDRLP4 1104
INDIRI4
ASGNI4
line 1624
;1624:	}
LABELV $568
line 1627
;1625:
;1626:	// locate ent at a spawn point
;1627:	ClientSpawn( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 1629
;1628:
;1629:	if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 8
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
CNSTI4 3
EQI4 $576
line 1631
;1630:		// send event
;1631:		tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_IN );
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 1052
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1044
ADDRLP4 1052
INDIRP4
ASGNP4
line 1632
;1632:		tent->s.clientNum = ent->s.clientNum;
ADDRLP4 1056
CNSTI4 220
ASGNI4
ADDRLP4 1044
INDIRP4
ADDRLP4 1056
INDIRI4
ADDP4
ADDRLP4 4
INDIRP4
ADDRLP4 1056
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 1634
;1633:
;1634:		if ( g_gametype.integer != GT_TOURNAMENT  ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $578
line 1635
;1635:			trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " %s\n\"", client->pers.netname, G_GetStripEdString("SVINGAME", "PLENTER")) );
ADDRGP4 $148
ARGP4
ADDRGP4 $581
ARGP4
ADDRLP4 1060
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $538
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 1060
INDIRP4
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
line 1636
;1636:		}
LABELV $578
line 1637
;1637:	}
LABELV $576
line 1638
;1638:	G_LogPrintf( "ClientBegin: %i\n", clientNum );
ADDRGP4 $582
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1641
;1639:
;1640:	// count current clients and rank for scoreboard
;1641:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1644
;1642:
;1643:	// JediDog - motd display when client enters (not in the center of screen)
;1644:	if (client->sess.sessionTeam != TEAM_SPECTATOR) {
ADDRLP4 8
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
CNSTI4 3
EQI4 $583
line 1645
;1645:		if (jd_Messages.integer !=0) {
ADDRGP4 jd_Messages+12
INDIRI4
CNSTI4 0
EQI4 $585
line 1646
;1646:			trap_SendServerCommand(ent-g_entities, va("print\"\n\n^5^2J^5e^2d^5i^2D^5o^2g^5'^2s ^2F^5i^2x ^5v^24.6. ^5Type /help for more information.\n\""));
ADDRGP4 $588
ARGP4
ADDRLP4 1052
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 832
DIVI4
ARGI4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1647
;1647:		}
LABELV $585
line 1648
;1648:	}
LABELV $583
line 1649
;1649:	G_ClearClientLog(clientNum);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_ClearClientLog
CALLV
pop
line 1650
;1650:}
LABELV $543
endproc ClientBegin 1108 12
proc AllForceDisabled 4 0
line 1653
;1651:
;1652:static qboolean AllForceDisabled(int force)
;1653:{
line 1656
;1654:	int i;
;1655:
;1656:	if (force)
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $590
line 1657
;1657:	{
line 1658
;1658:		for (i=0;i<NUM_FORCE_POWERS;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $592
line 1659
;1659:		{
line 1660
;1660:			if (!(force & (1<<i)))
ADDRFP4 0
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $596
line 1661
;1661:			{
line 1662
;1662:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $589
JUMPV
LABELV $596
line 1664
;1663:			}
;1664:		}
LABELV $593
line 1658
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $592
line 1666
;1665:
;1666:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $589
JUMPV
LABELV $590
line 1669
;1667:	}
;1668:
;1669:	return qfalse;
CNSTI4 0
RETI4
LABELV $589
endproc AllForceDisabled 4 0
export ClientSpawn
proc ClientSpawn 876 16
line 1682
;1670:}
;1671:
;1672:/*
;1673:===========
;1674:ClientSpawn
;1675:
;1676:Called every time a client is placed fresh in the world:
;1677:after the first ClientBegin, and after each respawn
;1678:Initializes all non-persistant parts of playerState
;1679:============
;1680:*/
;1681:extern qboolean WP_HasForcePowers( const playerState_t *ps );
;1682:void ClientSpawn(gentity_t *ent) {
line 1699
;1683:	int		index;
;1684:	vec3_t	spawn_origin, spawn_angles;
;1685:	gclient_t	*client;
;1686:	int		i;
;1687:	clientPersistant_t	saved;
;1688:	clientSession_t		savedSess;
;1689:	int		persistant[MAX_PERSISTANT];
;1690:	gentity_t	*spawnPoint;
;1691:	int		flags;
;1692:	int		savedPing;
;1693://	char	*savedAreaBits;
;1694:	int		accuracy_hits, accuracy_shots;
;1695:	int		eventSequence;
;1696://	char	userinfo[MAX_INFO_STRING];
;1697:	forcedata_t			savedForce;
;1698:	void		*ghoul2save;
;1699:	int		saveSaberNum = ENTITYNUM_NONE;
ADDRLP4 112
CNSTI4 1023
ASGNI4
line 1700
;1700:	int		wDisable = 0;
ADDRLP4 76
CNSTI4 0
ASGNI4
line 1702
;1701:
;1702:	index = ent - g_entities;
ADDRLP4 104
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 832
DIVI4
ASGNI4
line 1703
;1703:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 1705
;1704:
;1705:	if (client->ps.fd.forceDoInit)
ADDRLP4 0
INDIRP4
CNSTI4 1184
ADDP4
INDIRI4
CNSTI4 0
EQI4 $599
line 1706
;1706:	{ //force a reread of force powers
line 1707
;1707:		WP_InitForcePowers( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_InitForcePowers
CALLV
pop
line 1708
;1708:		client->ps.fd.forceDoInit = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1184
ADDP4
CNSTI4 0
ASGNI4
line 1709
;1709:	}
LABELV $599
line 1713
;1710:	// find a spawn point
;1711:	// do it before setting health back up, so farthest
;1712:	// ranging doesn't count this client
;1713:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
CNSTI4 3
NEI4 $601
line 1714
;1714:		spawnPoint = SelectSpectatorSpawnPoint ( 
ADDRLP4 80
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 808
ADDRGP4 SelectSpectatorSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 808
INDIRP4
ASGNP4
line 1716
;1715:						spawn_origin, spawn_angles);
;1716:	} else if (g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY) {
ADDRGP4 $602
JUMPV
LABELV $601
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $607
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $603
LABELV $607
line 1718
;1717:		// all base oriented team games use the CTF spawn points
;1718:		spawnPoint = SelectCTFSpawnPoint ( 
ADDRLP4 0
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1472
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 812
ADDRGP4 SelectCTFSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 812
INDIRP4
ASGNP4
line 1722
;1719:						client->sess.sessionTeam, 
;1720:						client->pers.teamState.state, 
;1721:						spawn_origin, spawn_angles);
;1722:	}
ADDRGP4 $604
JUMPV
LABELV $603
line 1723
;1723:	else if (g_gametype.integer == GT_SAGA)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
NEI4 $608
line 1724
;1724:	{
line 1725
;1725:		spawnPoint = SelectSagaSpawnPoint ( 
ADDRLP4 0
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1472
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 812
ADDRGP4 SelectSagaSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 812
INDIRP4
ASGNP4
line 1729
;1726:						client->sess.sessionTeam, 
;1727:						client->pers.teamState.state, 
;1728:						spawn_origin, spawn_angles);
;1729:	}
ADDRGP4 $609
JUMPV
LABELV $608
line 1730
;1730:	else {
LABELV $611
line 1731
;1731:		do {
line 1733
;1732:			// the first spawn should be at a good looking spot
;1733:			if ( !client->pers.initialSpawn && client->pers.localClient ) {
ADDRLP4 812
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1416
ADDP4
INDIRI4
ADDRLP4 812
INDIRI4
NEI4 $614
ADDRLP4 0
INDIRP4
CNSTI4 1412
ADDP4
INDIRI4
ADDRLP4 812
INDIRI4
EQI4 $614
line 1734
;1734:				client->pers.initialSpawn = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 1416
ADDP4
CNSTI4 1
ASGNI4
line 1735
;1735:				spawnPoint = SelectInitialSpawnPoint( spawn_origin, spawn_angles );
ADDRLP4 80
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 816
ADDRGP4 SelectInitialSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 816
INDIRP4
ASGNP4
line 1736
;1736:			} else {
ADDRGP4 $615
JUMPV
LABELV $614
line 1738
;1737:				// don't spawn near existing origin if possible
;1738:				spawnPoint = SelectSpawnPoint ( 
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 816
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 816
INDIRP4
ASGNP4
line 1741
;1739:					client->ps.origin, 
;1740:					spawn_origin, spawn_angles);
;1741:			}
LABELV $615
line 1745
;1742:
;1743:			// Tim needs to prevent bots from spawning at the initial point
;1744:			// on q3dm0...
;1745:			if ( ( spawnPoint->flags & FL_NO_BOTS ) && ( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 816
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 816
INDIRI4
EQI4 $616
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 816
INDIRI4
EQI4 $616
line 1746
;1746:				continue;	// try again
ADDRGP4 $612
JUMPV
LABELV $616
line 1749
;1747:			}
;1748:			// just to be symetric, we have a nohumans option...
;1749:			if ( ( spawnPoint->flags & FL_NO_HUMANS ) && !( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 820
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 820
INDIRI4
EQI4 $613
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 820
INDIRI4
NEI4 $613
line 1750
;1750:				continue;	// try again
line 1753
;1751:			}
;1752:
;1753:			break;
LABELV $612
line 1755
;1754:
;1755:		} while ( 1 );
ADDRGP4 $611
JUMPV
LABELV $613
line 1756
;1756:	}
LABELV $609
LABELV $604
LABELV $602
line 1757
;1757:	client->pers.teamState.state = TEAM_ACTIVE;
ADDRLP4 0
INDIRP4
CNSTI4 1472
ADDP4
CNSTI4 1
ASGNI4
line 1761
;1758:
;1759:	// toggle the teleport bit so the client knows to not lerp
;1760:	// and never clear the voted flag
;1761:	flags = ent->client->ps.eFlags & (EF_TELEPORT_BIT | EF_VOTED | EF_TEAMVOTED);
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 540676
BANDI4
ASGNI4
line 1762
;1762:	flags ^= EF_TELEPORT_BIT;
ADDRLP4 108
ADDRLP4 108
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 1766
;1763:
;1764:	// clear everything but the persistant data
;1765:
;1766:	saved = client->pers;
ADDRLP4 116
ADDRLP4 0
INDIRP4
CNSTI4 1380
ADDP4
INDIRB
ASGNB 156
line 1767
;1767:	savedSess = client->sess;
ADDRLP4 272
ADDRLP4 0
INDIRP4
CNSTI4 1536
ADDP4
INDIRB
ASGNB 44
line 1768
;1768:	savedPing = client->ps.ping;
ADDRLP4 316
ADDRLP4 0
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
ASGNI4
line 1770
;1769://	savedAreaBits = client->areabits;
;1770:	accuracy_hits = client->accuracy_hits;
ADDRLP4 320
ADDRLP4 0
INDIRP4
CNSTI4 1672
ADDP4
INDIRI4
ASGNI4
line 1771
;1771:	accuracy_shots = client->accuracy_shots;
ADDRLP4 324
ADDRLP4 0
INDIRP4
CNSTI4 1668
ADDP4
INDIRI4
ASGNI4
line 1772
;1772:	for ( i = 0 ; i < MAX_PERSISTANT ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $620
line 1773
;1773:		persistant[i] = client->ps.persistant[i];
ADDRLP4 808
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 808
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 808
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 280
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1774
;1774:	}
LABELV $621
line 1772
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 16
LTI4 $620
line 1775
;1775:	eventSequence = client->ps.eventSequence;
ADDRLP4 328
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ASGNI4
line 1777
;1776:
;1777:	savedForce = client->ps.fd;
ADDRLP4 332
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
INDIRB
ASGNB 472
line 1779
;1778:
;1779:	ghoul2save = client->ghoul2;
ADDRLP4 804
ADDRLP4 0
INDIRP4
CNSTI4 1732
ADDP4
INDIRP4
ASGNP4
line 1781
;1780:
;1781:	saveSaberNum = client->ps.saberEntityNum;
ADDRLP4 112
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ASGNI4
line 1783
;1782:
;1783:	memset (client, 0, sizeof(*client)); // bk FIXME: Com_Memset?
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1812
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1786
;1784:
;1785:	//rww - Don't wipe the ghoul2 instance or the animation data
;1786:	client->ghoul2 = ghoul2save;
ADDRLP4 0
INDIRP4
CNSTI4 1732
ADDP4
ADDRLP4 804
INDIRP4
ASGNP4
line 1789
;1787:
;1788:	//or the saber ent num
;1789:	client->ps.saberEntityNum = saveSaberNum;
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
ADDRLP4 112
INDIRI4
ASGNI4
line 1791
;1790:
;1791:	client->ps.fd = savedForce;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRLP4 332
INDIRB
ASGNB 472
line 1793
;1792:
;1793:	client->ps.duelIndex = ENTITYNUM_NONE;
ADDRLP4 0
INDIRP4
CNSTI4 1296
ADDP4
CNSTI4 1023
ASGNI4
line 1795
;1794:
;1795:	client->pers = saved;
ADDRLP4 0
INDIRP4
CNSTI4 1380
ADDP4
ADDRLP4 116
INDIRB
ASGNB 156
line 1796
;1796:	client->sess = savedSess;
ADDRLP4 0
INDIRP4
CNSTI4 1536
ADDP4
ADDRLP4 272
INDIRB
ASGNB 44
line 1797
;1797:	client->ps.ping = savedPing;
ADDRLP4 0
INDIRP4
CNSTI4 484
ADDP4
ADDRLP4 316
INDIRI4
ASGNI4
line 1799
;1798://	client->areabits = savedAreaBits;
;1799:	client->accuracy_hits = accuracy_hits;
ADDRLP4 0
INDIRP4
CNSTI4 1672
ADDP4
ADDRLP4 320
INDIRI4
ASGNI4
line 1800
;1800:	client->accuracy_shots = accuracy_shots;
ADDRLP4 0
INDIRP4
CNSTI4 1668
ADDP4
ADDRLP4 324
INDIRI4
ASGNI4
line 1801
;1801:	client->lastkilled_client = -1;
ADDRLP4 0
INDIRP4
CNSTI4 1676
ADDP4
CNSTI4 -1
ASGNI4
line 1803
;1802:
;1803:	for ( i = 0 ; i < MAX_PERSISTANT ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $624
line 1804
;1804:		client->ps.persistant[i] = persistant[i];
ADDRLP4 808
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 808
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 280
ADDP4
ADDP4
ADDRLP4 808
INDIRI4
ADDRLP4 8
ADDP4
INDIRI4
ASGNI4
line 1805
;1805:	}
LABELV $625
line 1803
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 16
LTI4 $624
line 1806
;1806:	client->ps.eventSequence = eventSequence;
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 328
INDIRI4
ASGNI4
line 1808
;1807:	// increment the spawncount so the client will detect the respawn
;1808:	client->ps.persistant[PERS_SPAWN_COUNT]++;
ADDRLP4 808
ADDRLP4 0
INDIRP4
CNSTI4 296
ADDP4
ASGNP4
ADDRLP4 808
INDIRP4
ADDRLP4 808
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1809
;1809:	client->ps.persistant[PERS_TEAM] = client->sess.sessionTeam;
ADDRLP4 0
INDIRP4
CNSTI4 292
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
ASGNI4
line 1811
;1810:
;1811:	client->airOutTime = level.time + 12000;
ADDRLP4 0
INDIRP4
CNSTI4 1704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 1815
;1812:
;1813://	trap_GetUserinfo( index, userinfo, sizeof(userinfo) );
;1814:	// set max health
;1815:	client->pers.maxHealth = 100;//atoi( Info_ValueForKey( userinfo, "handicap" ) );
ADDRLP4 0
INDIRP4
CNSTI4 1464
ADDP4
CNSTI4 100
ASGNI4
line 1816
;1816:	if ( client->pers.maxHealth < 1 || client->pers.maxHealth > 100 ) {
ADDRLP4 816
ADDRLP4 0
INDIRP4
CNSTI4 1464
ADDP4
INDIRI4
ASGNI4
ADDRLP4 816
INDIRI4
CNSTI4 1
LTI4 $631
ADDRLP4 816
INDIRI4
CNSTI4 100
LEI4 $629
LABELV $631
line 1817
;1817:		client->pers.maxHealth = 100;
ADDRLP4 0
INDIRP4
CNSTI4 1464
ADDP4
CNSTI4 100
ASGNI4
line 1818
;1818:	}
LABELV $629
line 1820
;1819:	// clear entity values
;1820:	client->ps.stats[STAT_MAX_HEALTH] = client->pers.maxHealth;
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 1464
ADDP4
INDIRI4
ASGNI4
line 1821
;1821:	client->ps.eFlags = flags;
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 108
INDIRI4
ASGNI4
line 1823
;1822:
;1823:	ent->s.groundEntityNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 1023
ASGNI4
line 1824
;1824:	ent->client = &level.clients[index];
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
CNSTI4 1812
ADDRLP4 104
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1825
;1825:	ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 1
ASGNI4
line 1826
;1826:	ent->inuse = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 1
ASGNI4
line 1827
;1827:	ent->classname = "player";
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $632
ASGNP4
line 1828
;1828:	ent->r.contents = CONTENTS_BODY;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 256
ASGNI4
line 1829
;1829:	ent->clipmask = MASK_PLAYERSOLID;
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 273
ASGNI4
line 1830
;1830:	ent->die = player_die;
ADDRFP4 0
INDIRP4
CNSTI4 660
ADDP4
ADDRGP4 player_die
ASGNP4
line 1831
;1831:	ent->waterlevel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 0
ASGNI4
line 1832
;1832:	ent->watertype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTI4 0
ASGNI4
line 1833
;1833:	ent->flags = 0;
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
CNSTI4 0
ASGNI4
line 1835
;1834:	
;1835:	VectorCopy (playerMins, ent->r.mins);
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
ADDRGP4 playerMins
INDIRB
ASGNB 12
line 1836
;1836:	VectorCopy (playerMaxs, ent->r.maxs);
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
ADDRGP4 playerMaxs
INDIRB
ASGNB 12
line 1838
;1837:
;1838:	client->ps.clientNum = index;
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
line 1840
;1839:	//give default weapons
;1840:	client->ps.stats[STAT_WEAPONS] = ( 1 << WP_NONE );
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
CNSTI4 1
ASGNI4
line 1842
;1841:
;1842:	if (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $633
line 1843
;1843:	{
line 1844
;1844:		wDisable = g_duelWeaponDisable.integer;
ADDRLP4 76
ADDRGP4 g_duelWeaponDisable+12
INDIRI4
ASGNI4
line 1845
;1845:	}
ADDRGP4 $634
JUMPV
LABELV $633
line 1847
;1846:	else
;1847:	{
line 1848
;1848:		wDisable = g_weaponDisable.integer;
ADDRLP4 76
ADDRGP4 g_weaponDisable+12
INDIRI4
ASGNI4
line 1849
;1849:	}
LABELV $634
line 1853
;1850:
;1851:
;1852:
;1853:	if ( g_gametype.integer != GT_HOLOCRON 
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
EQI4 $638
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $638
ADDRLP4 824
ADDRGP4 HasSetSaberOnly
CALLI4
ASGNI4
ADDRLP4 824
INDIRI4
CNSTI4 0
NEI4 $638
ADDRGP4 g_forcePowerDisable+12
INDIRI4
ARGI4
ADDRLP4 828
ADDRGP4 AllForceDisabled
CALLI4
ASGNI4
ADDRLP4 832
CNSTI4 0
ASGNI4
ADDRLP4 828
INDIRI4
ADDRLP4 832
INDIRI4
NEI4 $638
ADDRGP4 g_trueJedi+12
INDIRI4
ADDRLP4 832
INDIRI4
EQI4 $638
line 1858
;1854:		&& g_gametype.integer != GT_JEDIMASTER 
;1855:		&& !HasSetSaberOnly()
;1856:		&& !AllForceDisabled( g_forcePowerDisable.integer )
;1857:		&& g_trueJedi.integer )
;1858:	{
line 1859
;1859:		if ( g_gametype.integer >= GT_TEAM && (client->sess.sessionTeam == TEAM_BLUE || client->sess.sessionTeam == TEAM_RED) )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $644
ADDRLP4 836
ADDRLP4 0
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
ASGNI4
ADDRLP4 836
INDIRI4
CNSTI4 2
EQI4 $647
ADDRLP4 836
INDIRI4
CNSTI4 1
NEI4 $644
LABELV $647
line 1860
;1860:		{//In Team games, force one side to be merc and other to be jedi
line 1861
;1861:			if ( level.numPlayingClients > 0 )
ADDRGP4 level+80
INDIRI4
CNSTI4 0
LEI4 $648
line 1862
;1862:			{//already someone in the game
line 1863
;1863:				int		i, forceTeam = TEAM_SPECTATOR;
ADDRLP4 844
CNSTI4 3
ASGNI4
line 1864
;1864:				for ( i = 0 ; i < level.maxclients ; i++ ) 
ADDRLP4 840
CNSTI4 0
ASGNI4
ADDRGP4 $654
JUMPV
LABELV $651
line 1865
;1865:				{
line 1866
;1866:					if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 1812
ADDRLP4 840
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 0
NEI4 $656
line 1867
;1867:						continue;
ADDRGP4 $652
JUMPV
LABELV $656
line 1869
;1868:					}
;1869:					if ( level.clients[i].sess.sessionTeam == TEAM_BLUE || level.clients[i].sess.sessionTeam == TEAM_RED ) 
ADDRLP4 848
CNSTI4 1812
ADDRLP4 840
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1536
ADDP4
INDIRI4
ASGNI4
ADDRLP4 848
INDIRI4
CNSTI4 2
EQI4 $660
ADDRLP4 848
INDIRI4
CNSTI4 1
NEI4 $658
LABELV $660
line 1870
;1870:					{//in-game
line 1871
;1871:						if ( WP_HasForcePowers( &level.clients[i].ps ) )
CNSTI4 1812
ADDRLP4 840
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ARGP4
ADDRLP4 852
ADDRGP4 WP_HasForcePowers
CALLI4
ASGNI4
ADDRLP4 852
INDIRI4
CNSTI4 0
EQI4 $661
line 1872
;1872:						{//this side is using force
line 1873
;1873:							forceTeam = level.clients[i].sess.sessionTeam;
ADDRLP4 844
CNSTI4 1812
ADDRLP4 840
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1536
ADDP4
INDIRI4
ASGNI4
line 1874
;1874:						}
ADDRGP4 $653
JUMPV
LABELV $661
line 1876
;1875:						else
;1876:						{//other team is using force
line 1877
;1877:							if ( level.clients[i].sess.sessionTeam == TEAM_BLUE )
CNSTI4 1812
ADDRLP4 840
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1536
ADDP4
INDIRI4
CNSTI4 2
NEI4 $663
line 1878
;1878:							{
line 1879
;1879:								forceTeam = TEAM_RED;
ADDRLP4 844
CNSTI4 1
ASGNI4
line 1880
;1880:							}
ADDRGP4 $653
JUMPV
LABELV $663
line 1882
;1881:							else
;1882:							{
line 1883
;1883:								forceTeam = TEAM_BLUE;
ADDRLP4 844
CNSTI4 2
ASGNI4
line 1884
;1884:							}
line 1885
;1885:						}
line 1886
;1886:						break;
ADDRGP4 $653
JUMPV
LABELV $658
line 1888
;1887:					}
;1888:				}
LABELV $652
line 1864
ADDRLP4 840
ADDRLP4 840
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $654
ADDRLP4 840
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $651
LABELV $653
line 1889
;1889:				if ( WP_HasForcePowers( &client->ps ) && client->sess.sessionTeam != forceTeam )
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 848
ADDRGP4 WP_HasForcePowers
CALLI4
ASGNI4
ADDRLP4 848
INDIRI4
CNSTI4 0
EQI4 $665
ADDRLP4 0
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
ADDRLP4 844
INDIRI4
EQI4 $665
line 1890
;1890:				{//using force but not on right team, switch him over
line 1891
;1891:					const char *teamName = TeamName( forceTeam );
ADDRLP4 844
INDIRI4
ARGI4
ADDRLP4 856
ADDRGP4 TeamName
CALLP4
ASGNP4
ADDRLP4 852
ADDRLP4 856
INDIRP4
ASGNP4
line 1893
;1892:					//client->sess.sessionTeam = forceTeam;
;1893:					SetTeam( ent, (char *)teamName );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 852
INDIRP4
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 1894
;1894:					return;
ADDRGP4 $598
JUMPV
LABELV $665
line 1896
;1895:				}
;1896:			}
LABELV $648
line 1897
;1897:		}
LABELV $644
line 1899
;1898:
;1899:		if ( WP_HasForcePowers( &client->ps ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 840
ADDRGP4 WP_HasForcePowers
CALLI4
ASGNI4
ADDRLP4 840
INDIRI4
CNSTI4 0
EQI4 $667
line 1900
;1900:		{
line 1901
;1901:			client->ps.trueNonJedi = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 0
ASGNI4
line 1902
;1902:			client->ps.trueJedi = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 1
ASGNI4
line 1904
;1903:			//make sure they only use the saber
;1904:			client->ps.weapon = WP_SABER;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 1905
;1905:			client->ps.stats[STAT_WEAPONS] = (1 << WP_SABER);
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
CNSTI4 4
ASGNI4
line 1906
;1906:		}
ADDRGP4 $639
JUMPV
LABELV $667
line 1908
;1907:		else
;1908:		{//no force powers set
line 1909
;1909:			client->ps.trueNonJedi = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 1
ASGNI4
line 1910
;1910:			client->ps.trueJedi = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 0
ASGNI4
line 1911
;1911:			if (!wDisable || !(wDisable & (1 << WP_BRYAR_PISTOL)))
ADDRLP4 848
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRI4
ADDRLP4 848
INDIRI4
EQI4 $671
ADDRLP4 76
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 848
INDIRI4
NEI4 $669
LABELV $671
line 1912
;1912:			{
line 1913
;1913:				client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BRYAR_PISTOL );
ADDRLP4 852
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 852
INDIRP4
ADDRLP4 852
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1914
;1914:			}
LABELV $669
line 1915
;1915:			if (!wDisable || !(wDisable & (1 << WP_BLASTER)))
ADDRLP4 856
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRI4
ADDRLP4 856
INDIRI4
EQI4 $674
ADDRLP4 76
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 856
INDIRI4
NEI4 $672
LABELV $674
line 1916
;1916:			{
line 1917
;1917:				client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BLASTER );
ADDRLP4 860
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 860
INDIRP4
ADDRLP4 860
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 1918
;1918:			}
LABELV $672
line 1919
;1919:			if (!wDisable || !(wDisable & (1 << WP_BOWCASTER)))
ADDRLP4 864
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRI4
ADDRLP4 864
INDIRI4
EQI4 $677
ADDRLP4 76
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 864
INDIRI4
NEI4 $675
LABELV $677
line 1920
;1920:			{
line 1921
;1921:				client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BOWCASTER );
ADDRLP4 868
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 868
INDIRP4
ADDRLP4 868
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 1922
;1922:			}
LABELV $675
line 1923
;1923:			client->ps.stats[STAT_WEAPONS] &= ~(1 << WP_SABER);
ADDRLP4 868
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 868
INDIRP4
ADDRLP4 868
INDIRP4
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 1924
;1924:			client->ps.stats[STAT_WEAPONS] |= (1 << WP_STUN_BATON);
ADDRLP4 872
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 872
INDIRP4
ADDRLP4 872
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1925
;1925:			client->ps.ammo[AMMO_POWERCELL] = ammoData[AMMO_POWERCELL].max;
ADDRLP4 0
INDIRP4
CNSTI4 420
ADDP4
ADDRGP4 ammoData+12
INDIRI4
ASGNI4
line 1926
;1926:			client->ps.weapon = WP_BRYAR_PISTOL;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 3
ASGNI4
line 1927
;1927:		}
line 1928
;1928:	}
ADDRGP4 $639
JUMPV
LABELV $638
line 1930
;1929:	else
;1930:	{//jediVmerc is incompatible with this gametype, turn it off!
line 1931
;1931:		trap_Cvar_Set( "g_jediVmerc", "0" );
ADDRGP4 $679
ARGP4
ADDRGP4 $80
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1932
;1932:		if (g_gametype.integer == GT_HOLOCRON)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $680
line 1933
;1933:		{
line 1935
;1934:			//always get free saber level 1 in holocron
;1935:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_SABER );	//these are precached in g_items, ClearRegisteredItems()
ADDRLP4 836
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 836
INDIRP4
ADDRLP4 836
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 1936
;1936:		}
ADDRGP4 $681
JUMPV
LABELV $680
line 1938
;1937:		else
;1938:		{
line 1939
;1939:			if (client->ps.fd.forcePowerLevel[FP_SABERATTACK])
ADDRLP4 0
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
CNSTI4 0
EQI4 $683
line 1940
;1940:			{
line 1941
;1941:				client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_SABER );	//these are precached in g_items, ClearRegisteredItems()
ADDRLP4 836
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 836
INDIRP4
ADDRLP4 836
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 1942
;1942:			}
ADDRGP4 $684
JUMPV
LABELV $683
line 1944
;1943:			else
;1944:			{ //if you don't have saber attack rank then you don't get a saber
line 1945
;1945:				client->ps.stats[STAT_WEAPONS] |= (1 << WP_STUN_BATON);
ADDRLP4 836
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 836
INDIRP4
ADDRLP4 836
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1946
;1946:			}
LABELV $684
line 1947
;1947:		}
LABELV $681
line 1949
;1948:
;1949:		if (!wDisable || !(wDisable & (1 << WP_BRYAR_PISTOL)))
ADDRLP4 840
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRI4
ADDRLP4 840
INDIRI4
EQI4 $687
ADDRLP4 76
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 840
INDIRI4
NEI4 $685
LABELV $687
line 1950
;1950:		{
line 1951
;1951:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BRYAR_PISTOL );
ADDRLP4 844
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 844
INDIRP4
ADDRLP4 844
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1952
;1952:		}
ADDRGP4 $686
JUMPV
LABELV $685
line 1953
;1953:		else if (g_gametype.integer == GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $688
line 1954
;1954:		{
line 1955
;1955:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BRYAR_PISTOL );
ADDRLP4 844
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 844
INDIRP4
ADDRLP4 844
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1956
;1956:		}
LABELV $688
LABELV $686
line 1958
;1957:
;1958:		if (g_gametype.integer == GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $691
line 1959
;1959:		{
line 1960
;1960:			client->ps.stats[STAT_WEAPONS] &= ~(1 << WP_SABER);
ADDRLP4 844
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 844
INDIRP4
ADDRLP4 844
INDIRP4
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 1961
;1961:			client->ps.stats[STAT_WEAPONS] |= (1 << WP_STUN_BATON);
ADDRLP4 848
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 848
INDIRP4
ADDRLP4 848
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1962
;1962:		}
LABELV $691
line 1964
;1963:
;1964:		if (client->ps.stats[STAT_WEAPONS] & (1 << WP_BRYAR_PISTOL))
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $694
line 1965
;1965:		{
line 1966
;1966:			client->ps.weapon = WP_BRYAR_PISTOL;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 3
ASGNI4
line 1967
;1967:		}
ADDRGP4 $695
JUMPV
LABELV $694
line 1968
;1968:		else if (client->ps.stats[STAT_WEAPONS] & (1 << WP_SABER))
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $696
line 1969
;1969:		{
line 1970
;1970:			client->ps.weapon = WP_SABER;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 1971
;1971:		}
ADDRGP4 $697
JUMPV
LABELV $696
line 1973
;1972:		else
;1973:		{
line 1974
;1974:			client->ps.weapon = WP_STUN_BATON;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1
ASGNI4
line 1975
;1975:		}
LABELV $697
LABELV $695
line 1976
;1976:	}
LABELV $639
line 1983
;1977:
;1978:	/*
;1979:	client->ps.stats[STAT_HOLDABLE_ITEMS] |= ( 1 << HI_BINOCULARS );
;1980:	client->ps.stats[STAT_HOLDABLE_ITEM] = BG_GetItemIndexByTag(HI_BINOCULARS, IT_HOLDABLE);
;1981:	*/
;1982:
;1983:	client->ps.stats[STAT_HOLDABLE_ITEMS] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 224
ADDP4
CNSTI4 0
ASGNI4
line 1984
;1984:	client->ps.stats[STAT_HOLDABLE_ITEM] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 220
ADDP4
CNSTI4 0
ASGNI4
line 1986
;1985:
;1986:	if ( client->sess.sessionTeam == TEAM_SPECTATOR )
ADDRLP4 0
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
CNSTI4 3
NEI4 $698
line 1987
;1987:	{
line 1988
;1988:		client->ps.stats[STAT_WEAPONS] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
CNSTI4 0
ASGNI4
line 1989
;1989:		client->ps.stats[STAT_HOLDABLE_ITEMS] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 224
ADDP4
CNSTI4 0
ASGNI4
line 1990
;1990:		client->ps.stats[STAT_HOLDABLE_ITEM] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 220
ADDP4
CNSTI4 0
ASGNI4
line 1991
;1991:	}
LABELV $698
line 1993
;1992:
;1993:	client->ps.ammo[AMMO_BLASTER] = 100; //ammoData[AMMO_BLASTER].max; //100 seems fair.
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 100
ASGNI4
line 2006
;1994://	client->ps.ammo[AMMO_POWERCELL] = ammoData[AMMO_POWERCELL].max;
;1995://	client->ps.ammo[AMMO_FORCE] = ammoData[AMMO_FORCE].max;
;1996://	client->ps.ammo[AMMO_METAL_BOLTS] = ammoData[AMMO_METAL_BOLTS].max;
;1997://	client->ps.ammo[AMMO_ROCKETS] = ammoData[AMMO_ROCKETS].max;
;1998:/*
;1999:	client->ps.stats[STAT_WEAPONS] = ( 1 << WP_BRYAR_PISTOL);
;2000:	if ( g_gametype.integer == GT_TEAM ) {
;2001:		client->ps.ammo[WP_BRYAR_PISTOL] = 50;
;2002:	} else {
;2003:		client->ps.ammo[WP_BRYAR_PISTOL] = 100;
;2004:	}
;2005:*/
;2006:	client->ps.rocketLockIndex = MAX_CLIENTS;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 32
ASGNI4
line 2007
;2007:	client->ps.rocketLockTime = 0;
ADDRLP4 0
INDIRP4
CNSTI4 588
ADDP4
CNSTF4 0
ASGNF4
line 2018
;2008:
;2009:	//rww - Set here to initialize the circling seeker drone to off.
;2010:	//A quick note about this so I don't forget how it works again:
;2011:	//ps.genericEnemyIndex is kept in sync between the server and client.
;2012:	//When it gets set then an entitystate value of the same name gets
;2013:	//set along with an entitystate flag in the shared bg code. Which
;2014:	//is why a value needs to be both on the player state and entity state.
;2015:	//(it doesn't seem to just carry over the entitystate value automatically
;2016:	//because entity state value is derived from player state data or some
;2017:	//such)
;2018:	client->ps.genericEnemyIndex = -1;
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 -1
ASGNI4
line 2020
;2019:
;2020:	client->ps.isJediMaster = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 0
ASGNI4
line 2022
;2021:
;2022:	client->ps.fallingToDeath = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1352
ADDP4
CNSTI4 0
ASGNI4
line 2025
;2023:
;2024:	//Do per-spawn force power initialization
;2025:	WP_SpawnInitForcePowers( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_SpawnInitForcePowers
CALLV
pop
line 2028
;2026:
;2027:	// health will count down towards max_health
;2028:	ent->health = client->ps.stats[STAT_HEALTH] = client->ps.stats[STAT_MAX_HEALTH] * 1.25;
ADDRLP4 840
CNSTF4 1067450368
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 840
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 840
INDIRI4
ASGNI4
line 2031
;2029:
;2030:	// Start with a small amount of armor as well.
;2031:	client->ps.stats[STAT_ARMOR] = client->ps.stats[STAT_MAX_HEALTH] * 0.25;
ADDRLP4 0
INDIRP4
CNSTI4 236
ADDP4
CNSTF4 1048576000
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 2033
;2032:
;2033:	G_SetOrigin( ent, spawn_origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 80
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 2034
;2034:	VectorCopy( spawn_origin, client->ps.origin );
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 80
INDIRB
ASGNB 12
line 2037
;2035:
;2036:	// the respawned flag will be cleared after the attack and jump keys come up
;2037:	client->ps.pm_flags |= PMF_RESPAWNED;
ADDRLP4 848
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 848
INDIRP4
ADDRLP4 848
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 2039
;2038:
;2039:	trap_GetUsercmd( client - level.clients, &ent->client->pers.cmd );
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1812
DIVI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
ARGP4
ADDRGP4 trap_GetUsercmd
CALLV
pop
line 2040
;2040:	SetClientViewAngle( ent, spawn_angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 92
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 2042
;2041:
;2042:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
CNSTI4 3
NEI4 $700
line 2044
;2043:
;2044:	} else {
ADDRGP4 $701
JUMPV
LABELV $700
line 2045
;2045:		G_KillBox( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_KillBox
CALLV
pop
line 2046
;2046:		trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2049
;2047:
;2048:		// force the base weapon up
;2049:		client->ps.weapon = WP_BRYAR_PISTOL;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 3
ASGNI4
line 2050
;2050:		client->ps.weaponstate = FIRST_WEAPON;
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 3
ASGNI4
line 2052
;2051:
;2052:	}
LABELV $701
line 2055
;2053:
;2054:	// don't allow full run speed for a bit
;2055:	client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 852
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 852
INDIRP4
ADDRLP4 852
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 2056
;2056:	client->ps.pm_time = 100;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 100
ASGNI4
line 2058
;2057:
;2058:	client->respawnTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 1688
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2059
;2059:	client->inactivityTime = level.time + g_inactivity.integer * 1000;
ADDRLP4 0
INDIRP4
CNSTI4 1692
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDRGP4 g_inactivity+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 2060
;2060:	client->latched_buttons = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1608
ADDP4
CNSTI4 0
ASGNI4
line 2063
;2061:
;2062:	// set default animations
;2063:	client->ps.torsoAnim = WeaponReadyAnim[client->ps.weapon];
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponReadyAnim
ADDP4
INDIRI4
ASGNI4
line 2064
;2064:	client->ps.legsAnim = WeaponReadyAnim[client->ps.weapon];
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponReadyAnim
ADDP4
INDIRI4
ASGNI4
line 2066
;2065:
;2066:	if ( level.intermissiontime ) {
ADDRGP4 level+9008
INDIRI4
CNSTI4 0
EQI4 $705
line 2067
;2067:		MoveClientToIntermission( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MoveClientToIntermission
CALLV
pop
line 2068
;2068:	} else {
ADDRGP4 $706
JUMPV
LABELV $705
line 2070
;2069:		// fire the targets of the spawn point
;2070:		G_UseTargets( spawnPoint, ent );
ADDRLP4 72
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 2074
;2071:
;2072:		// select the highest weapon number available, after any
;2073:		// spawn given items have fired
;2074:		client->ps.weapon = 1;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1
ASGNI4
line 2075
;2075:		for ( i = WP_NUM_WEAPONS - 1 ; i > 0 ; i-- ) {
ADDRLP4 4
CNSTI4 15
ASGNI4
LABELV $708
line 2076
;2076:			if ( client->ps.stats[STAT_WEAPONS] & ( 1 << i ) ) {
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $712
line 2077
;2077:				client->ps.weapon = i;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 2078
;2078:				break;
ADDRGP4 $710
JUMPV
LABELV $712
line 2080
;2079:			}
;2080:		}
LABELV $709
line 2075
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
GTI4 $708
LABELV $710
line 2081
;2081:	}
LABELV $706
line 2085
;2082:
;2083:	// run a client frame to drop exactly to the floor,
;2084:	// initialize animations and other things
;2085:	client->ps.commandTime = level.time - 100;
ADDRLP4 0
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
SUBI4
ASGNI4
line 2086
;2086:	ent->client->pers.cmd.serverTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2087
;2087:	ClientThink( ent-g_entities );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 832
DIVI4
ARGI4
ADDRGP4 ClientThink
CALLV
pop
line 2090
;2088:
;2089:	// positively link the client, even if the command times are weird
;2090:	if ( ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
CNSTI4 3
EQI4 $716
line 2091
;2091:		BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 2092
;2092:		VectorCopy( ent->client->ps.origin, ent->r.currentOrigin );
ADDRLP4 864
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 864
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 864
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2093
;2093:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2094
;2094:	}
LABELV $716
line 2096
;2095:
;2096:	if (g_spawnInvulnerability.integer)
ADDRGP4 g_spawnInvulnerability+12
INDIRI4
CNSTI4 0
EQI4 $718
line 2097
;2097:	{
line 2098
;2098:		ent->client->ps.eFlags |= EF_INVULNERABLE;
ADDRLP4 864
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 864
INDIRP4
ADDRLP4 864
INDIRP4
INDIRI4
CNSTI4 67108864
BORI4
ASGNI4
line 2099
;2099:		ent->client->invulnerableTimer = level.time + g_spawnInvulnerability.integer;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1580
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 g_spawnInvulnerability+12
INDIRI4
ADDI4
ASGNI4
line 2100
;2100:	}
LABELV $718
line 2103
;2101:
;2102:	// run the presend to set anything else
;2103:	ClientEndFrame( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientEndFrame
CALLV
pop
line 2106
;2104:
;2105:	// clear entity state values
;2106:	BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 2107
;2107:}
LABELV $598
endproc ClientSpawn 876 16
export ClientDisconnect
proc ClientDisconnect 24 8
line 2122
;2108:
;2109:
;2110:/*
;2111:===========
;2112:ClientDisconnect
;2113:
;2114:Called when a player drops from the server.
;2115:Will not be called between levels.
;2116:
;2117:This should NOT be called directly by any game logic,
;2118:call trap_DropClient(), which will call this and do
;2119:server system housekeeping.
;2120:============
;2121:*/
;2122:void ClientDisconnect( int clientNum ) {
line 2129
;2123:	gentity_t	*ent;
;2124:	gentity_t	*tent;
;2125:	int			i;
;2126:
;2127:	// cleanup if we are kicking a bot that
;2128:	// hasn't spawned yet
;2129:	G_RemoveQueuedBotBegin( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_RemoveQueuedBotBegin
CALLV
pop
line 2131
;2130:
;2131:	ent = g_entities + clientNum;
ADDRLP4 4
CNSTI4 832
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2132
;2132:	if ( !ent->client ) {
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $724
line 2133
;2133:		return;
ADDRGP4 $723
JUMPV
LABELV $724
line 2136
;2134:	}
;2135:
;2136:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $727
JUMPV
LABELV $726
line 2139
;2137:
;2138:	while (i < NUM_FORCE_POWERS)
;2139:	{
line 2140
;2140:		if (ent->client->ps.fd.forcePowersActive & (1 << i))
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $729
line 2141
;2141:		{
line 2142
;2142:			WP_ForcePowerStop(ent, i);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 2143
;2143:		}
LABELV $729
line 2144
;2144:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2145
;2145:	}
LABELV $727
line 2138
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $726
line 2147
;2146:
;2147:	i = TRACK_CHANNEL_1;
ADDRLP4 0
CNSTI4 51
ASGNI4
ADDRGP4 $732
JUMPV
LABELV $731
line 2150
;2148:
;2149:	while (i < NUM_TRACK_CHANNELS)
;2150:	{
line 2151
;2151:		if (ent->client->ps.fd.killSoundEntIndex[i-50] && ent->client->ps.fd.killSoundEntIndex[i-50] < MAX_GENTITIES && ent->client->ps.fd.killSoundEntIndex[i-50] > 0)
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 200
SUBI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1200
ADDP4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $734
ADDRLP4 12
INDIRI4
CNSTI4 1024
GEI4 $734
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $734
line 2152
;2152:		{
line 2153
;2153:			G_MuteSound(ent->client->ps.fd.killSoundEntIndex[i-50], CHAN_VOICE);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 200
SUBI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1200
ADDP4
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 2154
;2154:		}
LABELV $734
line 2155
;2155:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2156
;2156:	}
LABELV $732
line 2149
ADDRLP4 0
INDIRI4
CNSTI4 56
LTI4 $731
line 2157
;2157:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2160
;2158:
;2159:	// stop any following clients
;2160:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $739
JUMPV
LABELV $736
line 2161
;2161:		if ( level.clients[i].sess.sessionTeam == TEAM_SPECTATOR
ADDRLP4 12
CNSTI4 1812
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
CNSTI4 3
NEI4 $741
ADDRLP4 12
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
CNSTI4 2
NEI4 $741
ADDRLP4 12
INDIRP4
CNSTI4 1548
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $741
line 2163
;2162:			&& level.clients[i].sess.spectatorState == SPECTATOR_FOLLOW
;2163:			&& level.clients[i].sess.spectatorClient == clientNum ) {
line 2164
;2164:			StopFollowing( &g_entities[i] );
CNSTI4 832
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 StopFollowing
CALLV
pop
line 2165
;2165:		}
LABELV $741
line 2166
;2166:	}
LABELV $737
line 2160
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $739
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $736
line 2169
;2167:
;2168:	// send effect if they were completely connected
;2169:	if ( ent->client->pers.connected == CON_CONNECTED 
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
NEI4 $743
ADDRLP4 12
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
CNSTI4 3
EQI4 $743
line 2170
;2170:		&& ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
line 2171
;2171:		tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_OUT );
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 60
ARGI4
ADDRLP4 16
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 2172
;2172:		tent->s.clientNum = ent->s.clientNum;
ADDRLP4 20
CNSTI4 220
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDRLP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 2176
;2173:
;2174:		// They don't get to take powerups with them!
;2175:		// Especially important for stuff like CTF flags
;2176:		TossClientItems( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 TossClientItems
CALLV
pop
line 2177
;2177:	}
LABELV $743
line 2179
;2178:
;2179:	G_LogPrintf( "ClientDisconnect: %i\n", clientNum );
ADDRGP4 $745
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 2182
;2180:
;2181:	// if we are playing in tourney mode, give a win to the other player and clear his frags for this round
;2182:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $746
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 level+9008
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $746
ADDRGP4 level+16
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $746
line 2184
;2183:		&& !level.intermissiontime
;2184:		&& !level.warmupTime ) {
line 2185
;2185:		if ( level.sortedClients[1] == clientNum ) {
ADDRGP4 level+84+4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $751
line 2186
;2186:			level.clients[ level.sortedClients[0] ].ps.persistant[PERS_SCORE] = 0;
CNSTI4 1812
ADDRGP4 level+84
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 280
ADDP4
CNSTI4 0
ASGNI4
line 2187
;2187:			level.clients[ level.sortedClients[0] ].sess.wins++;
ADDRLP4 20
CNSTI4 1812
ADDRGP4 level+84
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1552
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2188
;2188:			ClientUserinfoChanged( level.sortedClients[0] );
ADDRGP4 level+84
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 2189
;2189:		}
ADDRGP4 $752
JUMPV
LABELV $751
line 2190
;2190:		else if ( level.sortedClients[0] == clientNum ) {
ADDRGP4 level+84
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $758
line 2191
;2191:			level.clients[ level.sortedClients[1] ].ps.persistant[PERS_SCORE] = 0;
CNSTI4 1812
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 280
ADDP4
CNSTI4 0
ASGNI4
line 2192
;2192:			level.clients[ level.sortedClients[1] ].sess.wins++;
ADDRLP4 20
CNSTI4 1812
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1552
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2193
;2193:			ClientUserinfoChanged( level.sortedClients[1] );
ADDRGP4 level+84+4
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 2194
;2194:		}
LABELV $758
LABELV $752
line 2195
;2195:	}
LABELV $746
line 2197
;2196:
;2197:	trap_UnlinkEntity (ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 2198
;2198:	ent->s.modelindex = 0;
ADDRLP4 4
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 0
ASGNI4
line 2199
;2199:	ent->inuse = qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 0
ASGNI4
line 2200
;2200:	ent->classname = "disconnected";
ADDRLP4 4
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $767
ASGNP4
line 2201
;2201:	ent->client->pers.connected = CON_DISCONNECTED;
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1380
ADDP4
CNSTI4 0
ASGNI4
line 2202
;2202:	ent->client->ps.persistant[PERS_TEAM] = TEAM_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 292
ADDP4
CNSTI4 0
ASGNI4
line 2203
;2203:	ent->client->sess.sessionTeam = TEAM_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
CNSTI4 0
ASGNI4
line 2206
;2204:
;2205:	//JediDog: sleep
;2206:	ent->client->pers.Sleep = qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
CNSTI4 0
ASGNI4
line 2209
;2207:	//end
;2208:
;2209:	trap_SetConfigstring( CS_PLAYERS + clientNum, "");
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRGP4 $515
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 2211
;2210:
;2211:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 2213
;2212:
;2213:	if ( ent->r.svFlags & SVF_BOT ) {
ADDRLP4 4
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $768
line 2214
;2214:		BotAIShutdownClient( clientNum, qfalse );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 BotAIShutdownClient
CALLI4
pop
line 2215
;2215:	}
LABELV $768
line 2217
;2216:
;2217:	G_ClearClientLog(clientNum);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_ClearClientLog
CALLV
pop
line 2218
;2218:}
LABELV $723
endproc ClientDisconnect 24 8
import WP_HasForcePowers
import G_WriteClientSessionData
bss
export Client_Force
align 4
LABELV Client_Force
skip 15104
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
import jd_Messages
import jd_CloseServer
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
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import CalculateRanks
import AddScore
import player_die
import BeginIntermission
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
LABELV $767
char 1 100
char 1 105
char 1 115
char 1 99
char 1 111
char 1 110
char 1 110
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 0
align 1
LABELV $745
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 68
char 1 105
char 1 115
char 1 99
char 1 111
char 1 110
char 1 110
char 1 101
char 1 99
char 1 116
char 1 58
char 1 32
char 1 37
char 1 105
char 1 10
char 1 0
align 1
LABELV $679
char 1 103
char 1 95
char 1 106
char 1 101
char 1 100
char 1 105
char 1 86
char 1 109
char 1 101
char 1 114
char 1 99
char 1 0
align 1
LABELV $632
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 0
align 1
LABELV $588
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 34
char 1 10
char 1 10
char 1 94
char 1 53
char 1 94
char 1 50
char 1 74
char 1 94
char 1 53
char 1 101
char 1 94
char 1 50
char 1 100
char 1 94
char 1 53
char 1 105
char 1 94
char 1 50
char 1 68
char 1 94
char 1 53
char 1 111
char 1 94
char 1 50
char 1 103
char 1 94
char 1 53
char 1 39
char 1 94
char 1 50
char 1 115
char 1 32
char 1 94
char 1 50
char 1 70
char 1 94
char 1 53
char 1 105
char 1 94
char 1 50
char 1 120
char 1 32
char 1 94
char 1 53
char 1 118
char 1 94
char 1 50
char 1 52
char 1 46
char 1 54
char 1 46
char 1 32
char 1 94
char 1 53
char 1 84
char 1 121
char 1 112
char 1 101
char 1 32
char 1 47
char 1 104
char 1 101
char 1 108
char 1 112
char 1 32
char 1 102
char 1 111
char 1 114
char 1 32
char 1 109
char 1 111
char 1 114
char 1 101
char 1 32
char 1 105
char 1 110
char 1 102
char 1 111
char 1 114
char 1 109
char 1 97
char 1 116
char 1 105
char 1 111
char 1 110
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $582
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 66
char 1 101
char 1 103
char 1 105
char 1 110
char 1 58
char 1 32
char 1 37
char 1 105
char 1 10
char 1 0
align 1
LABELV $581
char 1 80
char 1 76
char 1 69
char 1 78
char 1 84
char 1 69
char 1 82
char 1 0
align 1
LABELV $575
char 1 77
char 1 111
char 1 116
char 1 105
char 1 111
char 1 110
char 1 0
align 1
LABELV $574
char 1 114
char 1 116
char 1 105
char 1 98
char 1 105
char 1 97
char 1 0
align 1
LABELV $573
char 1 108
char 1 116
char 1 105
char 1 98
char 1 105
char 1 97
char 1 0
align 1
LABELV $572
char 1 114
char 1 114
char 1 97
char 1 100
char 1 105
char 1 117
char 1 115
char 1 0
align 1
LABELV $571
char 1 108
char 1 114
char 1 97
char 1 100
char 1 105
char 1 117
char 1 115
char 1 0
align 1
LABELV $570
char 1 116
char 1 104
char 1 111
char 1 114
char 1 97
char 1 99
char 1 105
char 1 99
char 1 0
align 1
LABELV $554
char 1 66
char 1 108
char 1 117
char 1 101
char 1 0
align 1
LABELV $549
char 1 82
char 1 101
char 1 100
char 1 0
align 1
LABELV $539
char 1 80
char 1 76
char 1 67
char 1 79
char 1 78
char 1 78
char 1 69
char 1 67
char 1 84
char 1 0
align 1
LABELV $538
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
LABELV $535
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 67
char 1 111
char 1 110
char 1 110
char 1 101
char 1 99
char 1 116
char 1 58
char 1 32
char 1 37
char 1 105
char 1 10
char 1 0
align 1
LABELV $534
char 1 66
char 1 111
char 1 116
char 1 67
char 1 111
char 1 110
char 1 110
char 1 101
char 1 99
char 1 116
char 1 102
char 1 97
char 1 105
char 1 108
char 1 101
char 1 100
char 1 0
align 1
LABELV $522
char 1 70
char 1 97
char 1 107
char 1 101
char 1 32
char 1 80
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 32
char 1 83
char 1 101
char 1 116
char 1 116
char 1 105
char 1 110
char 1 103
char 1 115
char 1 32
char 1 68
char 1 101
char 1 116
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 46
char 1 0
align 1
LABELV $516
char 1 99
char 1 108
char 1 95
char 1 103
char 1 117
char 1 105
char 1 100
char 1 0
align 1
LABELV $515
char 1 0
align 1
LABELV $514
char 1 99
char 1 108
char 1 95
char 1 112
char 1 117
char 1 110
char 1 107
char 1 98
char 1 117
char 1 115
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $509
char 1 73
char 1 78
char 1 86
char 1 65
char 1 76
char 1 73
char 1 68
char 1 95
char 1 80
char 1 65
char 1 83
char 1 83
char 1 87
char 1 79
char 1 82
char 1 68
char 1 0
align 1
LABELV $506
char 1 110
char 1 111
char 1 110
char 1 101
char 1 0
align 1
LABELV $501
char 1 112
char 1 97
char 1 115
char 1 115
char 1 119
char 1 111
char 1 114
char 1 100
char 1 0
align 1
LABELV $497
char 1 84
char 1 104
char 1 101
char 1 32
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 32
char 1 105
char 1 115
char 1 32
char 1 99
char 1 108
char 1 111
char 1 115
char 1 101
char 1 100
char 1 32
char 1 114
char 1 105
char 1 103
char 1 104
char 1 116
char 1 32
char 1 110
char 1 111
char 1 119
char 1 44
char 1 32
char 1 99
char 1 111
char 1 109
char 1 101
char 1 32
char 1 98
char 1 97
char 1 99
char 1 107
char 1 32
char 1 108
char 1 97
char 1 116
char 1 101
char 1 114
char 1 46
char 1 32
char 1 58
char 1 41
char 1 0
align 1
LABELV $496
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 34
char 1 94
char 1 50
char 1 67
char 1 108
char 1 111
char 1 115
char 1 101
char 1 100
char 1 32
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 58
char 1 32
char 1 94
char 1 53
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 94
char 1 55
char 1 60
char 1 94
char 1 55
char 1 37
char 1 115
char 1 94
char 1 55
char 1 62
char 1 94
char 1 53
char 1 32
char 1 119
char 1 97
char 1 115
char 1 32
char 1 100
char 1 101
char 1 110
char 1 105
char 1 101
char 1 100
char 1 32
char 1 97
char 1 99
char 1 99
char 1 101
char 1 115
char 1 115
char 1 94
char 1 50
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $489
char 1 65
char 1 99
char 1 99
char 1 101
char 1 115
char 1 115
char 1 32
char 1 100
char 1 101
char 1 110
char 1 105
char 1 101
char 1 100
char 1 32
char 1 98
char 1 101
char 1 99
char 1 97
char 1 117
char 1 115
char 1 101
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
char 1 32
char 1 105
char 1 115
char 1 32
char 1 99
char 1 108
char 1 111
char 1 115
char 1 101
char 1 100
char 1 10
char 1 0
align 1
LABELV $485
char 1 66
char 1 97
char 1 110
char 1 110
char 1 101
char 1 100
char 1 46
char 1 0
align 1
LABELV $482
char 1 67
char 1 111
char 1 110
char 1 110
char 1 101
char 1 99
char 1 116
char 1 32
char 1 114
char 1 101
char 1 113
char 1 117
char 1 101
char 1 115
char 1 116
char 1 32
char 1 102
char 1 114
char 1 111
char 1 109
char 1 58
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $480
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 85
char 1 115
char 1 101
char 1 114
char 1 105
char 1 110
char 1 102
char 1 111
char 1 67
char 1 104
char 1 97
char 1 110
char 1 103
char 1 101
char 1 100
char 1 58
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $476
char 1 110
char 1 92
char 1 37
char 1 115
char 1 92
char 1 116
char 1 92
char 1 37
char 1 105
char 1 92
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 92
char 1 37
char 1 115
char 1 92
char 1 103
char 1 95
char 1 114
char 1 101
char 1 100
char 1 116
char 1 101
char 1 97
char 1 109
char 1 92
char 1 37
char 1 115
char 1 92
char 1 103
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 116
char 1 101
char 1 97
char 1 109
char 1 92
char 1 37
char 1 115
char 1 92
char 1 99
char 1 49
char 1 92
char 1 37
char 1 115
char 1 92
char 1 99
char 1 50
char 1 92
char 1 37
char 1 115
char 1 92
char 1 104
char 1 99
char 1 92
char 1 37
char 1 105
char 1 92
char 1 119
char 1 92
char 1 37
char 1 105
char 1 92
char 1 108
char 1 92
char 1 37
char 1 105
char 1 92
char 1 116
char 1 116
char 1 92
char 1 37
char 1 100
char 1 92
char 1 116
char 1 108
char 1 92
char 1 37
char 1 100
char 1 0
align 1
LABELV $475
char 1 115
char 1 107
char 1 105
char 1 108
char 1 108
char 1 0
align 1
LABELV $474
char 1 110
char 1 92
char 1 37
char 1 115
char 1 92
char 1 116
char 1 92
char 1 37
char 1 105
char 1 92
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 92
char 1 37
char 1 115
char 1 92
char 1 99
char 1 49
char 1 92
char 1 37
char 1 115
char 1 92
char 1 99
char 1 50
char 1 92
char 1 37
char 1 115
char 1 92
char 1 104
char 1 99
char 1 92
char 1 37
char 1 105
char 1 92
char 1 119
char 1 92
char 1 37
char 1 105
char 1 92
char 1 108
char 1 92
char 1 37
char 1 105
char 1 92
char 1 115
char 1 107
char 1 105
char 1 108
char 1 108
char 1 92
char 1 37
char 1 115
char 1 92
char 1 116
char 1 116
char 1 92
char 1 37
char 1 100
char 1 92
char 1 116
char 1 108
char 1 92
char 1 37
char 1 100
char 1 0
align 1
LABELV $471
char 1 103
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $470
char 1 103
char 1 95
char 1 114
char 1 101
char 1 100
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $469
char 1 99
char 1 111
char 1 108
char 1 111
char 1 114
char 1 50
char 1 0
align 1
LABELV $468
char 1 99
char 1 111
char 1 108
char 1 111
char 1 114
char 1 49
char 1 0
align 1
LABELV $467
char 1 116
char 1 101
char 1 97
char 1 109
char 1 116
char 1 97
char 1 115
char 1 107
char 1 0
align 1
LABELV $463
char 1 116
char 1 101
char 1 97
char 1 109
char 1 111
char 1 118
char 1 101
char 1 114
char 1 108
char 1 97
char 1 121
char 1 0
align 1
LABELV $458
char 1 98
char 1 0
align 1
LABELV $457
char 1 98
char 1 108
char 1 117
char 1 101
char 1 0
align 1
LABELV $453
char 1 114
char 1 0
align 1
LABELV $452
char 1 114
char 1 101
char 1 100
char 1 0
align 1
LABELV $449
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $443
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 115
char 1 0
align 1
LABELV $442
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 0
align 1
LABELV $441
char 1 116
char 1 101
char 1 97
char 1 109
char 1 95
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 0
align 1
LABELV $434
char 1 80
char 1 76
char 1 82
char 1 69
char 1 78
char 1 65
char 1 77
char 1 69
char 1 0
align 1
LABELV $433
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
char 1 32
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $428
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 98
char 1 111
char 1 97
char 1 114
char 1 100
char 1 0
align 1
LABELV $411
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $408
char 1 99
char 1 103
char 1 95
char 1 112
char 1 114
char 1 101
char 1 100
char 1 105
char 1 99
char 1 116
char 1 73
char 1 116
char 1 101
char 1 109
char 1 115
char 1 0
align 1
LABELV $407
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
LABELV $404
char 1 105
char 1 112
char 1 0
align 1
LABELV $403
char 1 92
char 1 110
char 1 97
char 1 109
char 1 101
char 1 92
char 1 98
char 1 97
char 1 100
char 1 105
char 1 110
char 1 102
char 1 111
char 1 0
align 1
LABELV $390
char 1 42
char 1 102
char 1 108
char 1 97
char 1 115
char 1 104
char 1 0
align 1
LABELV $384
char 1 99
char 1 114
char 1 97
char 1 110
char 1 105
char 1 117
char 1 109
char 1 0
align 1
LABELV $382
char 1 117
char 1 112
char 1 112
char 1 101
char 1 114
char 1 95
char 1 108
char 1 117
char 1 109
char 1 98
char 1 97
char 1 114
char 1 0
align 1
LABELV $380
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 95
char 1 114
char 1 111
char 1 111
char 1 116
char 1 0
align 1
LABELV $379
char 1 42
char 1 108
char 1 95
char 1 104
char 1 97
char 1 110
char 1 100
char 1 0
align 1
LABELV $378
char 1 42
char 1 114
char 1 95
char 1 104
char 1 97
char 1 110
char 1 100
char 1 0
align 1
LABELV $373
char 1 47
char 1 97
char 1 110
char 1 105
char 1 109
char 1 97
char 1 116
char 1 105
char 1 111
char 1 110
char 1 46
char 1 99
char 1 102
char 1 103
char 1 0
align 1
LABELV $370
char 1 70
char 1 97
char 1 105
char 1 108
char 1 101
char 1 100
char 1 32
char 1 116
char 1 111
char 1 32
char 1 108
char 1 111
char 1 97
char 1 100
char 1 32
char 1 97
char 1 110
char 1 105
char 1 109
char 1 97
char 1 116
char 1 105
char 1 111
char 1 110
char 1 32
char 1 102
char 1 105
char 1 108
char 1 101
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $369
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 115
char 1 47
char 1 95
char 1 104
char 1 117
char 1 109
char 1 97
char 1 110
char 1 111
char 1 105
char 1 100
char 1 47
char 1 97
char 1 110
char 1 105
char 1 109
char 1 97
char 1 116
char 1 105
char 1 111
char 1 110
char 1 46
char 1 99
char 1 102
char 1 103
char 1 0
align 1
LABELV $358
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 115
char 1 47
char 1 107
char 1 121
char 1 108
char 1 101
char 1 47
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $351
char 1 80
char 1 97
char 1 100
char 1 97
char 1 119
char 1 97
char 1 110
char 1 0
align 1
LABELV $245
char 1 98
char 1 111
char 1 100
char 1 121
char 1 113
char 1 117
char 1 101
char 1 0
align 1
LABELV $225
char 1 67
char 1 111
char 1 117
char 1 108
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
char 1 97
char 1 32
char 1 115
char 1 112
char 1 97
char 1 119
char 1 110
char 1 32
char 1 112
char 1 111
char 1 105
char 1 110
char 1 116
char 1 0
align 1
LABELV $149
char 1 66
char 1 69
char 1 67
char 1 79
char 1 77
char 1 69
char 1 74
char 1 77
char 1 0
align 1
LABELV $148
char 1 83
char 1 86
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 0
align 1
LABELV $147
char 1 99
char 1 112
char 1 32
char 1 34
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $141
char 1 37
char 1 105
char 1 0
align 1
LABELV $108
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 95
char 1 119
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $103
char 1 45
char 1 49
char 1 0
align 1
LABELV $87
char 1 105
char 1 110
char 1 102
char 1 111
char 1 95
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 95
char 1 100
char 1 101
char 1 97
char 1 116
char 1 104
char 1 109
char 1 97
char 1 116
char 1 99
char 1 104
char 1 0
align 1
LABELV $83
char 1 110
char 1 111
char 1 104
char 1 117
char 1 109
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $80
char 1 48
char 1 0
align 1
LABELV $79
char 1 110
char 1 111
char 1 98
char 1 111
char 1 116
char 1 115
char 1 0
