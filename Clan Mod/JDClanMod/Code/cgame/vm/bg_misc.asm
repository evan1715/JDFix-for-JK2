data
export forceMasteryLevels
align 4
LABELV forceMasteryLevels
address $120
address $121
address $122
address $123
address $124
address $125
address $126
address $127
export forceMasteryPoints
align 4
LABELV forceMasteryPoints
byte 4 0
byte 4 5
byte 4 10
byte 4 20
byte 4 30
byte 4 50
byte 4 75
byte 4 100
export bgForcePowerCost
align 4
LABELV bgForcePowerCost
byte 4 0
byte 4 2
byte 4 4
byte 4 6
byte 4 0
byte 4 0
byte 4 2
byte 4 6
byte 4 0
byte 4 2
byte 4 4
byte 4 6
byte 4 0
byte 4 1
byte 4 3
byte 4 6
byte 4 0
byte 4 1
byte 4 3
byte 4 6
byte 4 0
byte 4 4
byte 4 6
byte 4 8
byte 4 0
byte 4 1
byte 4 3
byte 4 6
byte 4 0
byte 4 2
byte 4 5
byte 4 8
byte 4 0
byte 4 4
byte 4 6
byte 4 8
byte 4 0
byte 4 2
byte 4 5
byte 4 8
byte 4 0
byte 4 1
byte 4 3
byte 4 6
byte 4 0
byte 4 1
byte 4 3
byte 4 6
byte 4 0
byte 4 1
byte 4 3
byte 4 6
byte 4 0
byte 4 2
byte 4 4
byte 4 6
byte 4 0
byte 4 2
byte 4 5
byte 4 8
byte 4 0
byte 4 1
byte 4 5
byte 4 8
byte 4 0
byte 4 1
byte 4 5
byte 4 8
byte 4 0
byte 4 4
byte 4 6
byte 4 8
export forcePowerSorted
align 4
LABELV forcePowerSorted
byte 4 5
byte 4 0
byte 4 10
byte 4 9
byte 4 11
byte 4 1
byte 4 2
byte 4 3
byte 4 4
byte 4 14
byte 4 7
byte 4 13
byte 4 8
byte 4 6
byte 4 12
byte 4 15
byte 4 16
byte 4 17
export forcePowerDarkLight
align 4
LABELV forcePowerDarkLight
byte 4 1
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 1
byte 4 2
byte 4 2
byte 4 2
byte 4 1
byte 4 1
byte 4 1
byte 4 2
byte 4 2
byte 4 0
byte 4 0
byte 4 0
byte 4 0
export WeaponReadyAnim
align 4
LABELV WeaponReadyAnim
byte 4 1091
byte 4 1101
byte 4 573
byte 4 1100
byte 4 1101
byte 4 1101
byte 4 1101
byte 4 1101
byte 4 1101
byte 4 1101
byte 4 1101
byte 4 1108
byte 4 1108
byte 4 1108
byte 4 571
byte 4 1099
export WeaponAttackAnim
align 4
LABELV WeaponAttackAnim
byte 4 117
byte 4 120
byte 4 573
byte 4 118
byte 4 120
byte 4 120
byte 4 120
byte 4 120
byte 4 120
byte 4 120
byte 4 120
byte 4 137
byte 4 120
byte 4 120
byte 4 571
byte 4 117
export BG_LegalizedForcePowers
code
proc BG_LegalizedForcePowers 436 12
file "../../game/bg_misc.c"
line 177
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// bg_misc.c -- both games misc functions, all completely stateless
;4:
;5:#include "q_shared.h"
;6:#include "bg_public.h"
;7:
;8:#ifdef QAGAME
;9:#include "g_local.h"
;10:#endif
;11:
;12:#ifdef UI_EXPORTS
;13:#include "../ui/ui_local.h"
;14:#endif
;15:
;16:#ifndef UI_EXPORTS
;17:#ifndef QAGAME
;18:#include "../cgame/cg_local.h"
;19:#endif
;20:#endif
;21:
;22://rww - not putting @ in front of these because
;23://we don't need them in a cgame striped lookup.
;24://Let me know if this causes problems, pat.
;25:char *forceMasteryLevels[NUM_FORCE_MASTERY_LEVELS] = 
;26:{
;27:	"MASTERY0",	//"Uninitiated",	// FORCE_MASTERY_UNINITIATED,
;28:	"MASTERY1",	//"Initiate",		// FORCE_MASTERY_INITIATE,
;29:	"MASTERY2",	//"Padawan",		// FORCE_MASTERY_PADAWAN,
;30:	"MASTERY3",	//"Jedi",			// FORCE_MASTERY_JEDI,
;31:	"MASTERY4",	//"Jedi Adept",		// FORCE_MASTERY_JEDI_GUARDIAN,
;32:	"MASTERY5",	//"Jedi Guardian",	// FORCE_MASTERY_JEDI_ADEPT,
;33:	"MASTERY6",	//"Jedi Knight",	// FORCE_MASTERY_JEDI_KNIGHT,
;34:	"MASTERY7",	//"Jedi Master"		// FORCE_MASTERY_JEDI_MASTER,
;35:};
;36:
;37:int forceMasteryPoints[NUM_FORCE_MASTERY_LEVELS] =
;38:{
;39:	0,		// FORCE_MASTERY_UNINITIATED,
;40:	5,		// FORCE_MASTERY_INITIATE,
;41:	10,		// FORCE_MASTERY_PADAWAN,
;42:	20,		// FORCE_MASTERY_JEDI,
;43:	30,		// FORCE_MASTERY_JEDI_GUARDIAN,
;44:	50,		// FORCE_MASTERY_JEDI_ADEPT,
;45:	75,		// FORCE_MASTERY_JEDI_KNIGHT,
;46:	100		// FORCE_MASTERY_JEDI_MASTER,
;47:};
;48:
;49:int bgForcePowerCost[NUM_FORCE_POWERS][NUM_FORCE_POWER_LEVELS] = //0 == neutral
;50:{
;51:	{	0,	2,	4,	6	},	// Heal			// FP_HEAL
;52:	{	0,	0,	2,	6	},	// Jump			//FP_LEVITATION,//hold/duration
;53:	{	0,	2,	4,	6	},	// Speed		//FP_SPEED,//duration
;54:	{	0,	1,	3,	6	},	// Push			//FP_PUSH,//hold/duration
;55:	{	0,	1,	3,	6	},	// Pull			//FP_PULL,//hold/duration
;56:	{	0,	4,	6,	8	},	// Mind Trick	//FP_TELEPATHY,//instant
;57:	{	0,	1,	3,	6	},	// Grip			//FP_GRIP,//hold/duration
;58:	{	0,	2,	5,	8	},	// Lightning	//FP_LIGHTNING,//hold/duration
;59:	{	0,	4,	6,	8	},	// Dark Rage	//FP_RAGE,//duration
;60:	{	0,	2,	5,	8	},	// Protection	//FP_PROTECT,//duration
;61:	{	0,	1,	3,	6	},	// Absorb		//FP_ABSORB,//duration
;62:	{	0,	1,	3,	6	},	// Team Heal	//FP_TEAM_HEAL,//instant
;63:	{	0,	1,	3,	6	},	// Team Force	//FP_TEAM_FORCE,//instant
;64:	{	0,	2,	4,	6	},	// Drain		//FP_DRAIN,//hold/duration
;65:	{	0,	2,	5,	8	},	// Sight		//FP_SEE,//duration
;66:	{	0,	1,	5,	8	},	// Saber Attack	//FP_SABERATTACK,
;67:	{	0,	1,	5,	8	},	// Saber Defend	//FP_SABERDEFEND,
;68:	{	0,	4,	6,	8	}	// Saber Throw	//FP_SABERTHROW,
;69:	//NUM_FORCE_POWERS
;70:};
;71:
;72:int forcePowerSorted[NUM_FORCE_POWERS] = 
;73:{ //rww - always use this order when drawing force powers for any reason
;74:	FP_TELEPATHY,
;75:	FP_HEAL,
;76:	FP_ABSORB,
;77:	FP_PROTECT,
;78:	FP_TEAM_HEAL,
;79:	FP_LEVITATION,
;80:	FP_SPEED,
;81:	FP_PUSH,
;82:	FP_PULL,
;83:	FP_SEE,
;84:	FP_LIGHTNING,
;85:	FP_DRAIN,
;86:	FP_RAGE,
;87:	FP_GRIP,
;88:	FP_TEAM_FORCE,
;89:	FP_SABERATTACK,
;90:	FP_SABERDEFEND,
;91:	FP_SABERTHROW
;92:};
;93:
;94:int forcePowerDarkLight[NUM_FORCE_POWERS] = //0 == neutral
;95:{ //nothing should be usable at rank 0..
;96:	FORCE_LIGHTSIDE,//FP_HEAL,//instant
;97:	0,//FP_LEVITATION,//hold/duration
;98:	0,//FP_SPEED,//duration
;99:	0,//FP_PUSH,//hold/duration
;100:	0,//FP_PULL,//hold/duration
;101:	FORCE_LIGHTSIDE,//FP_TELEPATHY,//instant
;102:	FORCE_DARKSIDE,//FP_GRIP,//hold/duration
;103:	FORCE_DARKSIDE,//FP_LIGHTNING,//hold/duration
;104:	FORCE_DARKSIDE,//FP_RAGE,//duration
;105:	FORCE_LIGHTSIDE,//FP_PROTECT,//duration
;106:	FORCE_LIGHTSIDE,//FP_ABSORB,//duration
;107:	FORCE_LIGHTSIDE,//FP_TEAM_HEAL,//instant
;108:	FORCE_DARKSIDE,//FP_TEAM_FORCE,//instant
;109:	FORCE_DARKSIDE,//FP_DRAIN,//hold/duration
;110:	0,//FP_SEE,//duration
;111:	0,//FP_SABERATTACK,
;112:	0,//FP_SABERDEFEND,
;113:	0//FP_SABERTHROW,
;114:		//NUM_FORCE_POWERS
;115:};
;116:
;117:int WeaponReadyAnim[WP_NUM_WEAPONS] =
;118:{
;119:	TORSO_DROPWEAP1,//WP_NONE,
;120:
;121:	TORSO_WEAPONREADY3,//WP_STUN_BATON,
;122:	BOTH_STAND2,//WP_SABER,
;123:	TORSO_WEAPONREADY2,//WP_BRYAR_PISTOL,
;124:	TORSO_WEAPONREADY3,//WP_BLASTER,
;125:	TORSO_WEAPONREADY3,//TORSO_WEAPONREADY4,//WP_DISRUPTOR,
;126:	TORSO_WEAPONREADY3,//TORSO_WEAPONREADY5,//WP_BOWCASTER,
;127:	TORSO_WEAPONREADY3,//TORSO_WEAPONREADY6,//WP_REPEATER,
;128:	TORSO_WEAPONREADY3,//TORSO_WEAPONREADY7,//WP_DEMP2,
;129:	TORSO_WEAPONREADY3,//TORSO_WEAPONREADY8,//WP_FLECHETTE,
;130:	TORSO_WEAPONREADY3,//TORSO_WEAPONREADY9,//WP_ROCKET_LAUNCHER,
;131:	TORSO_WEAPONREADY10,//WP_THERMAL,
;132:	TORSO_WEAPONREADY10,//TORSO_WEAPONREADY11,//WP_TRIP_MINE,
;133:	TORSO_WEAPONREADY10,//TORSO_WEAPONREADY12,//WP_DET_PACK,
;134:
;135:	//NOT VALID (e.g. should never really be used):
;136:	BOTH_STAND1,//WP_EMPLACED_GUN,
;137:	TORSO_WEAPONREADY1//WP_TURRET,
;138:};
;139:
;140:int WeaponAttackAnim[WP_NUM_WEAPONS] =
;141:{
;142:	BOTH_ATTACK1,//WP_NONE, //(shouldn't happen)
;143:
;144:	BOTH_ATTACK3,//WP_STUN_BATON,
;145:	BOTH_STAND2,//WP_SABER, //(has its own handling)
;146:	BOTH_ATTACK2,//WP_BRYAR_PISTOL,
;147:	BOTH_ATTACK3,//WP_BLASTER,
;148:	BOTH_ATTACK3,//BOTH_ATTACK4,//WP_DISRUPTOR,
;149:	BOTH_ATTACK3,//BOTH_ATTACK5,//WP_BOWCASTER,
;150:	BOTH_ATTACK3,//BOTH_ATTACK6,//WP_REPEATER,
;151:	BOTH_ATTACK3,//BOTH_ATTACK7,//WP_DEMP2,
;152:	BOTH_ATTACK3,//BOTH_ATTACK8,//WP_FLECHETTE,
;153:	BOTH_ATTACK3,//BOTH_ATTACK9,//WP_ROCKET_LAUNCHER,
;154:	BOTH_THERMAL_THROW,//WP_THERMAL,
;155:	BOTH_ATTACK3,//BOTH_ATTACK11,//WP_TRIP_MINE,
;156:	BOTH_ATTACK3,//BOTH_ATTACK12,//WP_DET_PACK,
;157:
;158:	//NOT VALID (e.g. should never really be used):
;159:	BOTH_STAND1,//WP_EMPLACED_GUN,
;160:	BOTH_ATTACK1//WP_TURRET,
;161:};
;162:
;163:
;164:/*
;165:================
;166:BG_LegalizedForcePowers
;167:
;168:The magical function to end all functions.
;169:This will take the force power string in powerOut and parse through it, then legalize
;170:it based on the supposed rank and spit it into powerOut, returning true if it was legal
;171:to begin with and false if not.
;172:fpDisabled is actually only expected (needed) from the server, because the ui disables
;173:force power selection anyway when force powers are disabled on the server.
;174:================
;175:*/
;176:qboolean BG_LegalizedForcePowers(char *powerOut, int maxRank, qboolean freeSaber, int teamForce, int gametype, int fpDisabled)
;177:{
line 180
;178:	char powerBuf[128];
;179:	char readBuf[128];
;180:	qboolean maintainsValidity = qtrue;
ADDRLP4 352
CNSTI4 1
ASGNI4
line 181
;181:	int powerLen = strlen(powerOut);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 360
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 356
ADDRLP4 360
INDIRI4
ASGNI4
line 182
;182:	int i = 0;
ADDRLP4 76
CNSTI4 0
ASGNI4
line 183
;183:	int c = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 184
;184:	int allowedPoints = 0;
ADDRLP4 88
CNSTI4 0
ASGNI4
line 185
;185:	int usedPoints = 0;
ADDRLP4 80
CNSTI4 0
ASGNI4
line 186
;186:	int countDown = 0;
ADDRLP4 84
CNSTI4 0
ASGNI4
line 191
;187:	
;188:	int final_Side;
;189:	int final_Powers[NUM_FORCE_POWERS];
;190:
;191:	if (powerLen >= 128)
ADDRLP4 356
INDIRI4
CNSTI4 128
LTI4 $129
line 192
;192:	{ //This should not happen. If it does, this is obviously a bogus string.
line 194
;193:		//They can have this string. Because I said so.
;194:		strcpy(powerBuf, "7-1-032330000000001333");
ADDRLP4 92
ARGP4
ADDRGP4 $131
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 195
;195:		maintainsValidity = qfalse;
ADDRLP4 352
CNSTI4 0
ASGNI4
line 196
;196:	}
ADDRGP4 $130
JUMPV
LABELV $129
line 198
;197:	else
;198:	{
line 199
;199:		strcpy(powerBuf, powerOut); //copy it as the original
ADDRLP4 92
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 200
;200:	}
LABELV $130
line 203
;201:
;202:	//first of all, print the max rank into the string as the rank
;203:	strcpy(powerOut, va("%i-", maxRank));
ADDRGP4 $132
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 364
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 364
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $134
JUMPV
LABELV $133
line 206
;204:
;205:	while (i < 128 && powerBuf[i] && powerBuf[i] != '-')
;206:	{
line 207
;207:		i++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 208
;208:	}
LABELV $134
line 205
ADDRLP4 76
INDIRI4
CNSTI4 128
GEI4 $137
ADDRLP4 372
ADDRLP4 76
INDIRI4
ADDRLP4 92
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 372
INDIRI4
CNSTI4 0
EQI4 $137
ADDRLP4 372
INDIRI4
CNSTI4 45
NEI4 $133
LABELV $137
line 209
;209:	i++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $139
JUMPV
LABELV $138
line 211
;210:	while (i < 128 && powerBuf[i] && powerBuf[i] != '-')
;211:	{
line 212
;212:		readBuf[c] = powerBuf[i];
ADDRLP4 0
INDIRI4
ADDRLP4 220
ADDP4
ADDRLP4 76
INDIRI4
ADDRLP4 92
ADDP4
INDIRI1
ASGNI1
line 213
;213:		c++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 214
;214:		i++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 215
;215:	}
LABELV $139
line 210
ADDRLP4 76
INDIRI4
CNSTI4 128
GEI4 $142
ADDRLP4 380
ADDRLP4 76
INDIRI4
ADDRLP4 92
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 380
INDIRI4
CNSTI4 0
EQI4 $142
ADDRLP4 380
INDIRI4
CNSTI4 45
NEI4 $138
LABELV $142
line 216
;216:	readBuf[c] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 220
ADDP4
CNSTI1 0
ASGNI1
line 217
;217:	i++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 219
;218:	//at this point, readBuf contains the intended side
;219:	final_Side = atoi(readBuf);
ADDRLP4 220
ARGP4
ADDRLP4 384
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 348
ADDRLP4 384
INDIRI4
ASGNI4
line 221
;220:
;221:	if (final_Side != FORCE_LIGHTSIDE &&
ADDRLP4 348
INDIRI4
CNSTI4 1
EQI4 $143
ADDRLP4 348
INDIRI4
CNSTI4 2
EQI4 $143
line 223
;222:		final_Side != FORCE_DARKSIDE)
;223:	{ //Not a valid side. You will be dark. Because I said so. (this is something that should never actually happen unless you purposely feed in an invalid config)
line 224
;224:		final_Side = FORCE_DARKSIDE;
ADDRLP4 348
CNSTI4 2
ASGNI4
line 225
;225:		maintainsValidity = qfalse;
ADDRLP4 352
CNSTI4 0
ASGNI4
line 226
;226:	}
LABELV $143
line 228
;227:
;228:	if (teamForce)
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $145
line 229
;229:	{ //If we are under force-aligned teams, make sure we're on the right side.
line 230
;230:		if (final_Side != teamForce)
ADDRLP4 348
INDIRI4
ADDRFP4 12
INDIRI4
EQI4 $147
line 231
;231:		{
line 232
;232:			final_Side = teamForce;
ADDRLP4 348
ADDRFP4 12
INDIRI4
ASGNI4
line 235
;233:			//maintainsValidity = qfalse;
;234:			//Not doing this, for now. Let them join the team with their filtered powers.
;235:		}
LABELV $147
line 236
;236:	}
LABELV $145
line 240
;237:
;238:	//Now we have established a valid rank, and a valid side.
;239:	//Read the force powers in, and cut them down based on the various rules supplied.
;240:	c = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $150
JUMPV
LABELV $149
line 242
;241:	while (i < 128 && powerBuf[i] && powerBuf[i] != '\n' && c < NUM_FORCE_POWERS)
;242:	{
line 243
;243:		readBuf[0] = powerBuf[i];
ADDRLP4 220
ADDRLP4 76
INDIRI4
ADDRLP4 92
ADDP4
INDIRI1
ASGNI1
line 244
;244:		readBuf[1] = 0;
ADDRLP4 220+1
CNSTI1 0
ASGNI1
line 245
;245:		final_Powers[c] = atoi(readBuf);
ADDRLP4 220
ARGP4
ADDRLP4 392
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 392
INDIRI4
ASGNI4
line 246
;246:		c++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 247
;247:		i++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 248
;248:	}
LABELV $150
line 241
ADDRLP4 76
INDIRI4
CNSTI4 128
GEI4 $155
ADDRLP4 396
ADDRLP4 76
INDIRI4
ADDRLP4 92
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 396
INDIRI4
CNSTI4 0
EQI4 $155
ADDRLP4 396
INDIRI4
CNSTI4 10
EQI4 $155
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $149
LABELV $155
line 252
;249:
;250:	//final_Powers now contains all the stuff from the string
;251:	//Set the maximum allowed points used based on the max rank level, and count the points actually used.
;252:	allowedPoints = forceMasteryPoints[maxRank];
ADDRLP4 88
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceMasteryPoints
ADDP4
INDIRI4
ASGNI4
line 254
;253:
;254:	i = 0;
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRGP4 $157
JUMPV
LABELV $156
line 256
;255:	while (i < NUM_FORCE_POWERS)
;256:	{ //if this power doesn't match the side we're on, then 0 it now.
line 257
;257:		if (final_Powers[i] &&
ADDRLP4 400
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 404
CNSTI4 0
ASGNI4
ADDRLP4 400
INDIRI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRLP4 404
INDIRI4
EQI4 $159
ADDRLP4 408
ADDRLP4 400
INDIRI4
ADDRGP4 forcePowerDarkLight
ADDP4
INDIRI4
ASGNI4
ADDRLP4 408
INDIRI4
ADDRLP4 404
INDIRI4
EQI4 $159
ADDRLP4 408
INDIRI4
ADDRLP4 348
INDIRI4
EQI4 $159
line 260
;258:			forcePowerDarkLight[i] &&
;259:			forcePowerDarkLight[i] != final_Side)
;260:		{
line 261
;261:			final_Powers[i] = 0;
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
CNSTI4 0
ASGNI4
line 263
;262:			//This is only likely to happen with g_forceBasedTeams. Let it slide.
;263:		}
LABELV $159
line 265
;264:
;265:		if ( final_Powers[i] &&
ADDRLP4 416
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRLP4 416
INDIRI4
EQI4 $161
ADDRFP4 20
INDIRI4
CNSTI4 1
ADDRLP4 76
INDIRI4
LSHI4
BANDI4
ADDRLP4 416
INDIRI4
EQI4 $161
line 267
;266:			(fpDisabled & (1 << i)) )
;267:		{ //if this power is disabled on the server via said server option, then we don't get it.
line 268
;268:			final_Powers[i] = 0;
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
CNSTI4 0
ASGNI4
line 269
;269:		}
LABELV $161
line 271
;270:
;271:		i++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 272
;272:	}
LABELV $157
line 255
ADDRLP4 76
INDIRI4
CNSTI4 18
LTI4 $156
line 274
;273:
;274:	if (gametype < GT_TEAM)
ADDRFP4 16
INDIRI4
CNSTI4 5
GEI4 $163
line 275
;275:	{ //don't bother with team powers then
line 276
;276:		final_Powers[FP_TEAM_HEAL] = 0;
ADDRLP4 4+44
CNSTI4 0
ASGNI4
line 277
;277:		final_Powers[FP_TEAM_FORCE] = 0;
ADDRLP4 4+48
CNSTI4 0
ASGNI4
line 278
;278:	}
LABELV $163
line 280
;279:
;280:	usedPoints = 0;
ADDRLP4 80
CNSTI4 0
ASGNI4
line 281
;281:	i = 0;
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRGP4 $168
JUMPV
LABELV $167
line 283
;282:	while (i < NUM_FORCE_POWERS)
;283:	{
line 284
;284:		countDown = 0;
ADDRLP4 84
CNSTI4 0
ASGNI4
line 286
;285:
;286:		countDown = final_Powers[i];
ADDRLP4 84
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ASGNI4
line 288
;287:		//JediDog: supposed fake players crash fix
;288:		if(countDown > 3) {
ADDRLP4 84
INDIRI4
CNSTI4 3
LEI4 $173
line 289
;289:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $128
JUMPV
LABELV $172
line 293
;290:		}
;291:		//End of fix
;292:		while (countDown > 0)
;293:		{
line 294
;294:			usedPoints += bgForcePowerCost[i][countDown]; //[fp index][fp level]
ADDRLP4 80
ADDRLP4 80
INDIRI4
ADDRLP4 84
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 76
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bgForcePowerCost
ADDP4
ADDP4
INDIRI4
ADDI4
ASGNI4
line 296
;295:			//if this is jump, or we have a free saber and it's offense or defense, take the level back down on level 1
;296:			if ( countDown == 1 &&
ADDRLP4 400
CNSTI4 1
ASGNI4
ADDRLP4 84
INDIRI4
ADDRLP4 400
INDIRI4
NEI4 $175
ADDRLP4 76
INDIRI4
ADDRLP4 400
INDIRI4
EQI4 $178
ADDRLP4 76
INDIRI4
CNSTI4 15
NEI4 $179
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $178
LABELV $179
ADDRLP4 76
INDIRI4
CNSTI4 16
NEI4 $175
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $175
LABELV $178
line 300
;297:				((i == FP_LEVITATION) ||
;298:				 (i == FP_SABERATTACK && freeSaber) ||
;299:				 (i == FP_SABERDEFEND && freeSaber)) )
;300:			{
line 301
;301:				usedPoints -= bgForcePowerCost[i][countDown];
ADDRLP4 80
ADDRLP4 80
INDIRI4
ADDRLP4 84
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 76
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bgForcePowerCost
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 302
;302:			}
LABELV $175
line 303
;303:			countDown--;
ADDRLP4 84
ADDRLP4 84
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 304
;304:		}
LABELV $173
line 292
ADDRLP4 84
INDIRI4
CNSTI4 0
GTI4 $172
line 306
;305:
;306:		i++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 307
;307:	}
LABELV $168
line 282
ADDRLP4 76
INDIRI4
CNSTI4 18
LTI4 $167
line 309
;308:
;309:	if (usedPoints > allowedPoints)
ADDRLP4 80
INDIRI4
ADDRLP4 88
INDIRI4
LEI4 $180
line 310
;310:	{ //Time to do the fancy stuff. (meaning, slowly cut parts off while taking a guess at what is most or least important in the config)
line 311
;311:		int attemptedCycles = 0;
ADDRLP4 408
CNSTI4 0
ASGNI4
line 312
;312:		int powerCycle = 2;
ADDRLP4 400
CNSTI4 2
ASGNI4
line 313
;313:		int minPow = 0;
ADDRLP4 404
CNSTI4 0
ASGNI4
line 315
;314:		
;315:		if (freeSaber)
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $182
line 316
;316:		{
line 317
;317:			minPow = 1;
ADDRLP4 404
CNSTI4 1
ASGNI4
line 318
;318:		}
LABELV $182
line 320
;319:
;320:		maintainsValidity = qfalse;
ADDRLP4 352
CNSTI4 0
ASGNI4
ADDRGP4 $185
JUMPV
LABELV $184
line 323
;321:
;322:		while (usedPoints > allowedPoints)
;323:		{
line 324
;324:			c = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $188
JUMPV
LABELV $187
line 327
;325:
;326:			while (c < NUM_FORCE_POWERS && usedPoints > allowedPoints)
;327:			{
line 328
;328:				if (final_Powers[c] && final_Powers[c] < powerCycle)
ADDRLP4 412
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 412
INDIRI4
CNSTI4 0
EQI4 $190
ADDRLP4 412
INDIRI4
ADDRLP4 400
INDIRI4
GEI4 $190
line 329
;329:				{ //kill in order of lowest powers, because the higher powers are probably more important
line 330
;330:					if (c == FP_SABERATTACK &&
ADDRLP4 0
INDIRI4
CNSTI4 15
NEI4 $209
ADDRLP4 4+64
INDIRI4
ADDRLP4 404
INDIRI4
GTI4 $196
ADDRLP4 4+68
INDIRI4
CNSTI4 0
LEI4 $209
LABELV $196
line 332
;331:						(final_Powers[FP_SABERDEFEND] > minPow || final_Powers[FP_SABERTHROW] > 0))
;332:					{ //if we're on saber attack, only suck it down if we have no def or throw either
line 333
;333:						int whichOne = FP_SABERTHROW; //first try throw
ADDRLP4 416
CNSTI4 17
ASGNI4
line 335
;334:
;335:						if (!final_Powers[whichOne])
ADDRLP4 416
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $200
line 336
;336:						{
line 337
;337:							whichOne = FP_SABERDEFEND; //if no throw, drain defense
ADDRLP4 416
CNSTI4 16
ASGNI4
line 338
;338:						}
ADDRGP4 $200
JUMPV
LABELV $199
line 341
;339:
;340:						while (final_Powers[whichOne] > 0 && usedPoints > allowedPoints)
;341:						{
line 342
;342:							if ( final_Powers[whichOne] > 1 ||
ADDRLP4 416
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
CNSTI4 1
GTI4 $206
ADDRLP4 416
INDIRI4
CNSTI4 15
NEI4 $205
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $193
LABELV $205
ADDRLP4 416
INDIRI4
CNSTI4 16
NEI4 $206
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $193
LABELV $206
line 345
;343:								( (whichOne != FP_SABERATTACK || !freeSaber) &&
;344:								  (whichOne != FP_SABERDEFEND || !freeSaber) ) )
;345:							{ //don't take attack or defend down on level 1 still, if it's free
line 346
;346:								usedPoints -= bgForcePowerCost[whichOne][final_Powers[whichOne]];
ADDRLP4 428
CNSTI4 2
ASGNI4
ADDRLP4 80
ADDRLP4 80
INDIRI4
ADDRLP4 416
INDIRI4
ADDRLP4 428
INDIRI4
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRLP4 428
INDIRI4
LSHI4
ADDRLP4 416
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bgForcePowerCost
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 347
;347:								final_Powers[whichOne]--;
ADDRLP4 432
ADDRLP4 416
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ASGNP4
ADDRLP4 432
INDIRP4
ADDRLP4 432
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 348
;348:							}
line 350
;349:							else
;350:							{
line 351
;351:								break;
LABELV $203
line 353
;352:							}
;353:						}
LABELV $200
line 340
ADDRLP4 416
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
CNSTI4 0
LEI4 $207
ADDRLP4 80
INDIRI4
ADDRLP4 88
INDIRI4
GTI4 $199
LABELV $207
line 354
;354:					}
ADDRGP4 $193
JUMPV
line 356
;355:					else
;356:					{
LABELV $208
line 358
;357:						while (final_Powers[c] > 0 && usedPoints > allowedPoints)
;358:						{
line 359
;359:							if ( final_Powers[c] > 1 ||
ADDRLP4 420
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRLP4 420
INDIRI4
GTI4 $215
ADDRLP4 0
INDIRI4
ADDRLP4 420
INDIRI4
EQI4 $210
ADDRLP4 0
INDIRI4
CNSTI4 15
NEI4 $214
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $210
LABELV $214
ADDRLP4 0
INDIRI4
CNSTI4 16
NEI4 $215
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $210
LABELV $215
line 363
;360:								((c != FP_LEVITATION) &&
;361:								(c != FP_SABERATTACK || !freeSaber) &&
;362:								(c != FP_SABERDEFEND || !freeSaber)) )
;363:							{
line 364
;364:								usedPoints -= bgForcePowerCost[c][final_Powers[c]];
ADDRLP4 428
CNSTI4 2
ASGNI4
ADDRLP4 80
ADDRLP4 80
INDIRI4
ADDRLP4 0
INDIRI4
ADDRLP4 428
INDIRI4
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRLP4 428
INDIRI4
LSHI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bgForcePowerCost
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 365
;365:								final_Powers[c]--;
ADDRLP4 432
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ASGNP4
ADDRLP4 432
INDIRP4
ADDRLP4 432
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 366
;366:							}
line 368
;367:							else
;368:							{
line 369
;369:								break;
LABELV $212
line 371
;370:							}
;371:						}
LABELV $209
line 357
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
CNSTI4 0
LEI4 $216
ADDRLP4 80
INDIRI4
ADDRLP4 88
INDIRI4
GTI4 $208
LABELV $216
LABELV $210
line 372
;372:					}
LABELV $193
line 373
;373:				}
LABELV $190
line 375
;374:
;375:				c++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 376
;376:			}
LABELV $188
line 326
ADDRLP4 0
INDIRI4
CNSTI4 18
GEI4 $217
ADDRLP4 80
INDIRI4
ADDRLP4 88
INDIRI4
GTI4 $187
LABELV $217
line 378
;377:
;378:			powerCycle++;
ADDRLP4 400
ADDRLP4 400
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 379
;379:			attemptedCycles++;
ADDRLP4 408
ADDRLP4 408
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 381
;380:
;381:			if (attemptedCycles > NUM_FORCE_POWERS)
ADDRLP4 408
INDIRI4
CNSTI4 18
LEI4 $218
line 382
;382:			{ //I think this should be impossible. But just in case.
line 383
;383:				break;
ADDRGP4 $186
JUMPV
LABELV $218
line 385
;384:			}
;385:		}
LABELV $185
line 322
ADDRLP4 80
INDIRI4
ADDRLP4 88
INDIRI4
GTI4 $184
LABELV $186
line 387
;386:
;387:		if (usedPoints > allowedPoints)
ADDRLP4 80
INDIRI4
ADDRLP4 88
INDIRI4
LEI4 $220
line 388
;388:		{ //Still? Fine then.. we will kill all of your powers, except the freebies.
line 389
;389:			i = 0;
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRGP4 $223
JUMPV
LABELV $222
line 392
;390:
;391:			while (i < NUM_FORCE_POWERS)
;392:			{
line 393
;393:				final_Powers[i] = 0;
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
CNSTI4 0
ASGNI4
line 394
;394:				if (i == FP_LEVITATION ||
ADDRLP4 76
INDIRI4
CNSTI4 1
EQI4 $228
ADDRLP4 76
INDIRI4
CNSTI4 15
NEI4 $229
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $228
LABELV $229
ADDRLP4 76
INDIRI4
CNSTI4 16
NEI4 $225
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $225
LABELV $228
line 397
;395:					(i == FP_SABERATTACK && freeSaber) ||
;396:					(i == FP_SABERDEFEND && freeSaber))
;397:				{
line 398
;398:					final_Powers[i] = 1;
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
CNSTI4 1
ASGNI4
line 399
;399:				}
LABELV $225
line 400
;400:				i++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 401
;401:			}
LABELV $223
line 391
ADDRLP4 76
INDIRI4
CNSTI4 18
LTI4 $222
line 402
;402:			usedPoints = 0;
ADDRLP4 80
CNSTI4 0
ASGNI4
line 403
;403:		}
LABELV $220
line 404
;404:	}
LABELV $180
line 406
;405:
;406:	if (freeSaber)
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $230
line 407
;407:	{
line 408
;408:		if (final_Powers[FP_SABERATTACK] < 1)
ADDRLP4 4+60
INDIRI4
CNSTI4 1
GEI4 $232
line 409
;409:		{
line 410
;410:			final_Powers[FP_SABERATTACK] = 1;
ADDRLP4 4+60
CNSTI4 1
ASGNI4
line 411
;411:		}
LABELV $232
line 412
;412:		if (final_Powers[FP_SABERDEFEND] < 1)
ADDRLP4 4+64
INDIRI4
CNSTI4 1
GEI4 $236
line 413
;413:		{
line 414
;414:			final_Powers[FP_SABERDEFEND] = 1;
ADDRLP4 4+64
CNSTI4 1
ASGNI4
line 415
;415:		}
LABELV $236
line 416
;416:	}
LABELV $230
line 417
;417:	if (final_Powers[FP_LEVITATION] < 1)
ADDRLP4 4+4
INDIRI4
CNSTI4 1
GEI4 $240
line 418
;418:	{
line 419
;419:		final_Powers[FP_LEVITATION] = 1;
ADDRLP4 4+4
CNSTI4 1
ASGNI4
line 420
;420:	}
LABELV $240
line 422
;421:
;422:	if (fpDisabled)
ADDRFP4 20
INDIRI4
CNSTI4 0
EQI4 $244
line 423
;423:	{ //If we specifically have attack or def disabled, force them up to level 3. It's the way
line 426
;424:	  //things work for the case of all powers disabled.
;425:	  //If jump is disabled, down-cap it to level 1. Otherwise don't do a thing.
;426:		if (fpDisabled & (1 << FP_LEVITATION))
ADDRFP4 20
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $246
line 427
;427:		{
line 428
;428:			final_Powers[FP_LEVITATION] = 1;
ADDRLP4 4+4
CNSTI4 1
ASGNI4
line 429
;429:		}
LABELV $246
line 430
;430:		if (fpDisabled & (1 << FP_SABERATTACK))
ADDRFP4 20
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $249
line 431
;431:		{
line 432
;432:			final_Powers[FP_SABERATTACK] = 3;
ADDRLP4 4+60
CNSTI4 3
ASGNI4
line 433
;433:		}
LABELV $249
line 434
;434:		if (fpDisabled & (1 << FP_SABERDEFEND))
ADDRFP4 20
INDIRI4
CNSTI4 65536
BANDI4
CNSTI4 0
EQI4 $252
line 435
;435:		{
line 436
;436:			final_Powers[FP_SABERDEFEND] = 3;
ADDRLP4 4+64
CNSTI4 3
ASGNI4
line 437
;437:		}
LABELV $252
line 438
;438:	}
LABELV $244
line 440
;439:
;440:	if (final_Powers[FP_SABERATTACK] < 1)
ADDRLP4 4+60
INDIRI4
CNSTI4 1
GEI4 $255
line 441
;441:	{
line 442
;442:		final_Powers[FP_SABERDEFEND] = 0;
ADDRLP4 4+64
CNSTI4 0
ASGNI4
line 443
;443:		final_Powers[FP_SABERTHROW] = 0;
ADDRLP4 4+68
CNSTI4 0
ASGNI4
line 444
;444:	}
LABELV $255
line 449
;445:
;446:	//We finally have all the force powers legalized and stored locally.
;447:	//Put them all into the string and return the result. We already have
;448:	//the rank there, so print the side and the powers now.
;449:	Q_strcat(powerOut, 128, va("%i-", final_Side));
ADDRGP4 $132
ARGP4
ADDRLP4 348
INDIRI4
ARGI4
ADDRLP4 400
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 400
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 451
;450:
;451:	i = strlen(powerOut);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 404
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 76
ADDRLP4 404
INDIRI4
ASGNI4
line 452
;452:	c = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $261
JUMPV
LABELV $260
line 454
;453:	while (c < NUM_FORCE_POWERS)
;454:	{
line 455
;455:		strcpy(readBuf, va("%i", final_Powers[c]));
ADDRGP4 $263
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 408
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 220
ARGP4
ADDRLP4 408
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 456
;456:		powerOut[i] = readBuf[0];
ADDRLP4 76
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
ADDRLP4 220
INDIRI1
ASGNI1
line 457
;457:		c++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 458
;458:		i++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 459
;459:	}
LABELV $261
line 453
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $260
line 460
;460:	powerOut[i] = 0;
ADDRLP4 76
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 462
;461:
;462:	return maintainsValidity;
ADDRLP4 352
INDIRI4
RETI4
LABELV $128
endproc BG_LegalizedForcePowers 436 12
data
export bg_itemlist
align 4
LABELV bg_itemlist
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $264
address $264
address $265
address $266
address $267
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $268
byte 4 25
byte 4 3
byte 4 1
address $264
address $264
address $269
address $266
address $270
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $271
byte 4 100
byte 4 3
byte 4 2
address $264
address $264
address $272
address $273
address $274
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $275
byte 4 25
byte 4 4
byte 4 0
address $264
address $264
address $276
address $277
address $278
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $279
byte 4 120
byte 4 6
byte 4 1
address $264
address $264
address $280
address $277
address $281
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $282
byte 4 120
byte 4 6
byte 4 2
address $264
address $283
address $284
address $277
address $285
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $286
byte 4 25
byte 4 6
byte 4 3
address $264
address $264
address $287
address $277
address $288
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 1
byte 4 6
byte 4 4
address $264
address $264
address $289
address $277
address $290
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $291
byte 4 60
byte 4 6
byte 4 5
address $264
address $264
address $292
address $277
address $293
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $294
byte 4 120
byte 4 6
byte 4 6
address $264
address $264
address $295
address $296
address $297
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $298
byte 4 25
byte 4 5
byte 4 12
address $264
address $264
address $299
address $296
address $300
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $301
byte 4 25
byte 4 5
byte 4 13
address $264
address $264
address $302
address $303
address $304
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $305
byte 4 25
byte 4 5
byte 4 14
address $264
address $264
address $306
address $307
address $308
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $309
byte 4 25
byte 4 5
byte 4 15
address $264
address $264
address $310
address $277
address $311
byte 4 0
byte 4 0
byte 4 0
address $312
address $313
byte 4 100
byte 4 1
byte 4 1
address $264
address $264
address $314
address $277
address $315
byte 4 0
byte 4 0
byte 4 0
address $316
address $317
byte 4 100
byte 4 1
byte 4 2
address $264
address $264
address $318
address $277
address $319
byte 4 0
byte 4 0
byte 4 0
address $320
address $321
byte 4 100
byte 4 1
byte 4 3
address $264
address $264
address $322
address $277
address $323
byte 4 0
byte 4 0
byte 4 0
address $324
address $325
byte 4 100
byte 4 1
byte 4 4
address $264
address $264
address $326
address $277
address $327
byte 4 0
byte 4 0
byte 4 0
address $328
address $329
byte 4 100
byte 4 1
byte 4 5
address $264
address $264
address $330
address $277
address $331
byte 4 0
byte 4 0
byte 4 0
address $332
address $333
byte 4 100
byte 4 1
byte 4 6
address $264
address $264
address $334
address $277
address $335
byte 4 0
byte 4 0
byte 4 0
address $336
address $337
byte 4 100
byte 4 1
byte 4 7
address $264
address $264
address $338
address $277
address $339
byte 4 0
byte 4 0
byte 4 0
address $340
address $341
byte 4 100
byte 4 1
byte 4 8
address $264
address $264
address $342
address $277
address $343
byte 4 0
byte 4 0
byte 4 0
address $344
address $345
byte 4 100
byte 4 1
byte 4 9
address $264
address $264
address $346
address $277
address $347
byte 4 0
byte 4 0
byte 4 0
address $348
address $349
byte 4 3
byte 4 1
byte 4 10
address $264
address $264
address $350
address $277
address $351
address $352
byte 4 0
byte 4 0
address $353
address $354
byte 4 4
byte 4 2
byte 4 7
address $264
address $264
address $355
address $277
address $356
address $357
byte 4 0
byte 4 0
address $358
address $359
byte 4 3
byte 4 2
byte 4 8
address $264
address $264
address $360
address $277
address $361
address $362
address $363
byte 4 0
address $364
address $365
byte 4 3
byte 4 2
byte 4 9
address $264
address $264
address $366
address $277
address $352
address $351
byte 4 0
byte 4 0
address $353
address $354
byte 4 4
byte 4 1
byte 4 11
address $264
address $264
address $367
address $277
address $357
address $356
byte 4 0
byte 4 0
address $358
address $359
byte 4 3
byte 4 1
byte 4 12
address $264
address $264
address $368
address $277
address $362
address $361
address $363
byte 4 0
address $364
address $365
byte 4 3
byte 4 1
byte 4 13
address $264
address $264
address $369
address $277
address $323
byte 4 0
byte 4 0
byte 4 0
address $324
address $325
byte 4 50
byte 4 1
byte 4 14
address $264
address $264
address $370
address $277
address $323
byte 4 0
byte 4 0
byte 4 0
address $324
address $325
byte 4 50
byte 4 1
byte 4 15
address $264
address $264
address $371
address $372
address $373
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $325
byte 4 100
byte 4 2
byte 4 1
address $264
address $264
address $374
address $372
address $373
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $375
byte 4 100
byte 4 2
byte 4 2
address $264
address $264
address $376
address $372
address $377
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $378
byte 4 100
byte 4 2
byte 4 3
address $264
address $264
address $379
address $372
address $380
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $381
byte 4 100
byte 4 2
byte 4 4
address $264
address $264
address $382
address $372
address $383
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $384
byte 4 3
byte 4 2
byte 4 5
address $264
address $264
address $385
byte 4 0
address $386
address $387
byte 4 0
byte 4 0
byte 4 0
address $388
byte 4 0
byte 4 8
byte 4 4
address $264
address $264
address $389
byte 4 0
address $390
address $391
byte 4 0
byte 4 0
byte 4 0
address $392
byte 4 0
byte 4 8
byte 4 5
address $264
address $264
address $393
byte 4 0
address $394
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $395
byte 4 0
byte 4 8
byte 4 6
address $264
address $264
address $396
address $372
address $397
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $398
byte 4 0
byte 4 8
byte 4 0
address $264
address $264
address $399
address $372
address $400
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $401
byte 4 0
byte 4 8
byte 4 0
address $264
address $264
byte 4 0
skip 48
export bg_numItems
align 4
LABELV bg_numItems
byte 4 42
export vectoyaw
code
proc vectoyaw 20 8
line 1254
;463:}
;464:
;465:/*QUAKED item_***** ( 0 0 0 ) (-16 -16 -16) (16 16 16) suspended
;466:DO NOT USE THIS CLASS, IT JUST HOLDS GENERAL INFORMATION.
;467:The suspended flag will allow items to hang in the air, otherwise they are dropped to the next surface.
;468:
;469:If an item is the target of another entity, it will not spawn in until fired.
;470:
;471:An item fires all of its targets when it is picked up.  If the toucher can't carry it, the targets won't be fired.
;472:
;473:"notfree" if set to 1, don't spawn in free for all games
;474:"notteam" if set to 1, don't spawn in team games
;475:"notsingle" if set to 1, don't spawn in single player games
;476:"wait"	override the default wait before respawning.  -1 = never respawn automatically, which can be used with targeted spawning.
;477:"random" random number of plus or minus seconds varied from the respawn time
;478:"count" override quantity or duration on most items.
;479:*/
;480:
;481:/*QUAKED misc_shield_floor_unit (1 0 0) (-16 -16 0) (16 16 40)
;482:#MODELNAME="/models/items/a_shield_converter.md3"
;483:Gives shield energy when used.
;484:
;485:"count" - max charge value (default 50)
;486:"chargerate" - rechage 1 point every this many milliseconds (default 3000)
;487:*/
;488:
;489:gitem_t	bg_itemlist[] = 
;490:{
;491:	{
;492:		NULL,				// classname	
;493:		NULL,				// pickup_sound
;494:		{	NULL,			// world_model[0]
;495:			NULL,			// world_model[1]
;496:			0, 0} ,			// world_model[2],[3]
;497:		NULL,				// view_model
;498:/* icon */		NULL,		// icon
;499:/* pickup */	//NULL,		// pickup_name
;500:		0,					// quantity
;501:		0,					// giType (IT_*)
;502:		0,					// giTag
;503:/* precache */ "",			// precaches
;504:/* sounds */ ""				// sounds
;505:	},	// leave index 0 alone
;506:
;507:	//
;508:	// Pickups
;509:	//
;510:
;511:/*QUAKED item_shield_sm_instant (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;512:Instant shield pickup, restores 25
;513:*/
;514:	{
;515:		"item_shield_sm_instant", 
;516:		"sound/player/pickupshield.wav",
;517:        { "models/map_objects/mp/psd_sm.md3",
;518:		0, 0, 0},
;519:/* view */		NULL,			
;520:/* icon */		"gfx/mp/small_shield",
;521:/* pickup *///	"Shield Small",
;522:		25,
;523:		IT_ARMOR,
;524:		1, //special for shield - max on pickup is maxhealth*tag, thus small shield goes up to 100 shield
;525:/* precache */ "",
;526:/* sounds */ ""
;527:	},
;528:
;529:/*QUAKED item_shield_lrg_instant (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;530:Instant shield pickup, restores 100
;531:*/
;532:	{
;533:		"item_shield_lrg_instant", 
;534:		"sound/player/pickupshield.wav",
;535:        { "models/map_objects/mp/psd.md3",
;536:		0, 0, 0},
;537:/* view */		NULL,			
;538:/* icon */		"gfx/mp/large_shield",
;539:/* pickup *///	"Shield Large",
;540:		100,
;541:		IT_ARMOR,
;542:		2, //special for shield - max on pickup is maxhealth*tag, thus large shield goes up to 200 shield
;543:/* precache */ "",
;544:/* sounds */ ""
;545:	},
;546:
;547:/*QUAKED item_medpak_instant (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;548:Instant medpack pickup, heals 25
;549:*/
;550:	{
;551:		"item_medpak_instant",
;552:		"sound/player/pickuphealth.wav",
;553:        { "models/map_objects/mp/medpac.md3", 
;554:		0, 0, 0 },
;555:/* view */		NULL,			
;556:/* icon */		"gfx/hud/i_icon_medkit",
;557:/* pickup *///	"Medpack",
;558:		25,
;559:		IT_HEALTH,
;560:		0,
;561:/* precache */ "",
;562:/* sounds */ ""
;563:	},
;564:
;565:
;566:	//
;567:	// ITEMS
;568:	//
;569:
;570:/*QUAKED item_seeker (.3 .3 1) (-8 -8 -0) (8 8 16) suspended
;571:30 seconds of seeker drone
;572:*/
;573:	{
;574:		"item_seeker", 
;575:		"sound/weapons/w_pkup.wav",
;576:		{ "models/items/remote.md3", 
;577:		0, 0, 0} ,
;578:/* view */		NULL,			
;579:/* icon */		"gfx/hud/i_icon_seeker",
;580:/* pickup *///	"Seeker Drone",
;581:		120,
;582:		IT_HOLDABLE,
;583:		HI_SEEKER,
;584:/* precache */ "",
;585:/* sounds */ ""
;586:	},
;587:
;588:/*QUAKED item_shield (.3 .3 1) (-8 -8 -0) (8 8 16) suspended
;589:Portable shield
;590:*/
;591:	{
;592:		"item_shield", 
;593:		"sound/weapons/w_pkup.wav",
;594:		{ "models/map_objects/mp/shield.md3", 
;595:		0, 0, 0} ,
;596:/* view */		NULL,			
;597:/* icon */		"gfx/hud/i_icon_shieldwall",
;598:/* pickup *///	"Forcefield",
;599:		120,
;600:		IT_HOLDABLE,
;601:		HI_SHIELD,
;602:/* precache */ "",
;603:/* sounds */ "sound/weapons/detpack/stick.wav sound/movers/doors/forcefield_on.wav sound/movers/doors/forcefield_off.wav sound/movers/doors/forcefield_lp.wav sound/effects/bumpfield.wav",
;604:	},
;605:
;606:/*QUAKED item_medpac (.3 .3 1) (-8 -8 -0) (8 8 16) suspended
;607:Bacta canister pickup, heals 25 on use
;608:*/
;609:	{
;610:		"item_medpac",	//should be item_bacta
;611:		"sound/weapons/w_pkup.wav",
;612:		{ "models/map_objects/mp/bacta.md3", 
;613:		0, 0, 0} ,
;614:/* view */		NULL,			
;615:/* icon */		"gfx/hud/i_icon_bacta",
;616:/* pickup *///	"Bacta Canister",
;617:		25,
;618:		IT_HOLDABLE,
;619:		HI_MEDPAC,
;620:/* precache */ "",
;621:/* sounds */ ""
;622:	},
;623:
;624:/*QUAKED item_datapad (.3 .3 1) (-8 -8 -0) (8 8 16) suspended
;625:Do not place this.
;626:*/
;627:	{
;628:		"item_datapad", 
;629:		"sound/weapons/w_pkup.wav",
;630:		{ "models/items/datapad.md3", 
;631:		0, 0, 0} ,
;632:/* view */		NULL,			
;633:/* icon */		NULL,
;634:/* pickup *///	"Datapad",
;635:		1,
;636:		IT_HOLDABLE,
;637:		HI_DATAPAD,
;638:/* precache */ "",
;639:/* sounds */ ""
;640:	},
;641:
;642:/*QUAKED item_binoculars (.3 .3 1) (-8 -8 -0) (8 8 16) suspended
;643:These will be standard equipment on the player - DO NOT PLACE
;644:*/
;645:	{
;646:		"item_binoculars", 
;647:		"sound/weapons/w_pkup.wav",
;648:		{ "models/items/binoculars.md3", 
;649:		0, 0, 0} ,
;650:/* view */		NULL,			
;651:/* icon */		"gfx/hud/i_icon_zoom",
;652:/* pickup *///	"Binoculars",
;653:		60,
;654:		IT_HOLDABLE,
;655:		HI_BINOCULARS,
;656:/* precache */ "",
;657:/* sounds */ ""
;658:	},
;659:
;660:/*QUAKED item_sentry_gun (.3 .3 1) (-8 -8 -0) (8 8 16) suspended
;661:Sentry gun inventory pickup.
;662:*/
;663:	{
;664:		"item_sentry_gun", 
;665:		"sound/weapons/w_pkup.wav",
;666:		{ "models/items/psgun.glm", 
;667:		0, 0, 0} ,
;668:/* view */		NULL,			
;669:/* icon */		"gfx/hud/i_icon_sentrygun",
;670:/* pickup *///	"Sentry Gun",
;671:		120,
;672:		IT_HOLDABLE,
;673:		HI_SENTRY_GUN,
;674:/* precache */ "",
;675:/* sounds */ ""
;676:	},
;677:
;678:/*QUAKED item_force_enlighten_light (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;679:Adds one rank to all Force powers temporarily. Only light jedi can use.
;680:*/
;681:	{
;682:		"item_force_enlighten_light",
;683:		"sound/player/enlightenment.wav",
;684:		{ "models/map_objects/mp/jedi_enlightenment.md3", 
;685:		0, 0, 0} ,
;686:/* view */		NULL,			
;687:/* icon */		"gfx/hud/mpi_jlight",
;688:/* pickup *///	"Light Force Enlightenment",
;689:		25,
;690:		IT_POWERUP,
;691:		PW_FORCE_ENLIGHTENED_LIGHT,
;692:/* precache */ "",
;693:/* sounds */ ""
;694:	},
;695:
;696:/*QUAKED item_force_enlighten_dark (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;697:Adds one rank to all Force powers temporarily. Only dark jedi can use.
;698:*/
;699:	{
;700:		"item_force_enlighten_dark",
;701:		"sound/player/enlightenment.wav",
;702:		{ "models/map_objects/mp/dk_enlightenment.md3", 
;703:		0, 0, 0} ,
;704:/* view */		NULL,			
;705:/* icon */		"gfx/hud/mpi_dklight",
;706:/* pickup *///	"Dark Force Enlightenment",
;707:		25,
;708:		IT_POWERUP,
;709:		PW_FORCE_ENLIGHTENED_DARK,
;710:/* precache */ "",
;711:/* sounds */ ""
;712:	},
;713:
;714:/*QUAKED item_force_boon (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;715:Unlimited Force Pool for a short time.
;716:*/
;717:	{
;718:		"item_force_boon",
;719:		"sound/player/boon.wav",
;720:		{ "models/map_objects/mp/force_boon.md3", 
;721:		0, 0, 0} ,
;722:/* view */		NULL,			
;723:/* icon */		"gfx/hud/mpi_fboon",
;724:/* pickup *///	"Force Boon",
;725:		25,
;726:		IT_POWERUP,
;727:		PW_FORCE_BOON,
;728:/* precache */ "",
;729:/* sounds */ ""
;730:	},
;731:
;732:/*QUAKED item_ysalimari (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;733:A small lizard carried on the player, which prevents the possessor from using any Force power.  However, he is unaffected by any Force power.
;734:*/
;735:	{
;736:		"item_ysalimari",
;737:		"sound/player/ysalimari.wav",
;738:		{ "models/map_objects/mp/ysalimari.md3", 
;739:		0, 0, 0} ,
;740:/* view */		NULL,			
;741:/* icon */		"gfx/hud/mpi_ysamari",
;742:/* pickup *///	"Ysalamiri",
;743:		25,
;744:		IT_POWERUP,
;745:		PW_YSALAMIRI,
;746:/* precache */ "",
;747:/* sounds */ ""
;748:	},
;749:
;750:	//
;751:	// WEAPONS 
;752:	//
;753:
;754:/*QUAKED weapon_stun_baton (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;755:Don't place this
;756:*/
;757:	{
;758:		"weapon_stun_baton", 
;759:		"sound/weapons/w_pkup.wav",
;760:        { "models/weapons2/stun_baton/baton_w.glm", 
;761:		0, 0, 0},
;762:/* view */		"models/weapons2/stun_baton/baton.md3", 
;763:/* icon */		"gfx/hud/w_icon_stunbaton",
;764:/* pickup *///	"Stun Baton",
;765:		100,
;766:		IT_WEAPON,
;767:		WP_STUN_BATON,
;768:/* precache */ "",
;769:/* sounds */ ""
;770:	},
;771:
;772:/*QUAKED weapon_saber (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;773:Don't place this
;774:*/
;775:	{
;776:		"weapon_saber", 
;777:		"sound/weapons/w_pkup.wav",
;778:        { "models/weapons2/saber/saber_w.glm",
;779:		0, 0, 0},
;780:/* view */		"models/weapons2/saber/saber_w.md3",
;781:/* icon */		"gfx/hud/w_icon_lightsaber",
;782:/* pickup *///	"Lightsaber",
;783:		100,
;784:		IT_WEAPON,
;785:		WP_SABER,
;786:/* precache */ "",
;787:/* sounds */ ""
;788:	},
;789:
;790:/*QUAKED weapon_bryar_pistol (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;791:Don't place this
;792:*/
;793:	{
;794:		"weapon_bryar_pistol", 
;795:		"sound/weapons/w_pkup.wav",
;796:        { "models/weapons2/briar_pistol/briar_pistol_w.glm", 
;797:		0, 0, 0},
;798:/* view */		"models/weapons2/briar_pistol/briar_pistol.md3", 
;799:/* icon */		"gfx/hud/w_icon_rifle",
;800:/* pickup *///	"Bryar Pistol",
;801:		100,
;802:		IT_WEAPON,
;803:		WP_BRYAR_PISTOL,
;804:/* precache */ "",
;805:/* sounds */ ""
;806:	},
;807:
;808:/*QUAKED weapon_blaster (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;809:*/
;810:	{
;811:		"weapon_blaster", 
;812:		"sound/weapons/w_pkup.wav",
;813:        { "models/weapons2/blaster_r/blaster_w.glm", 
;814:		0, 0, 0},
;815:/* view */		"models/weapons2/blaster_r/blaster.md3", 
;816:/* icon */		"gfx/hud/w_icon_blaster",
;817:/* pickup *///	"E11 Blaster Rifle",
;818:		100,
;819:		IT_WEAPON,
;820:		WP_BLASTER,
;821:/* precache */ "",
;822:/* sounds */ ""
;823:	},
;824:
;825:/*QUAKED weapon_disruptor (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;826:*/
;827:	{
;828:		"weapon_disruptor",
;829:		"sound/weapons/w_pkup.wav",
;830:        { "models/weapons2/disruptor/disruptor_w.glm", 
;831:		0, 0, 0},
;832:/* view */		"models/weapons2/disruptor/disruptor.md3", 
;833:/* icon */		"gfx/hud/w_icon_disruptor",
;834:/* pickup *///	"Tenloss Disruptor Rifle",
;835:		100,
;836:		IT_WEAPON,
;837:		WP_DISRUPTOR,
;838:/* precache */ "",
;839:/* sounds */ ""
;840:	},
;841:
;842:/*QUAKED weapon_bowcaster (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;843:*/
;844:	{
;845:		"weapon_bowcaster",
;846:		"sound/weapons/w_pkup.wav",
;847:        { "models/weapons2/bowcaster/bowcaster_w.glm", 
;848:		0, 0, 0},
;849:/* view */		"models/weapons2/bowcaster/bowcaster.md3", 
;850:/* icon */		"gfx/hud/w_icon_bowcaster",
;851:/* pickup *///	"Wookiee Bowcaster",
;852:		100,
;853:		IT_WEAPON,
;854:		WP_BOWCASTER,
;855:/* precache */ "",
;856:/* sounds */ ""
;857:	},
;858:
;859:/*QUAKED weapon_repeater (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;860:*/
;861:	{
;862:		"weapon_repeater", 
;863:		"sound/weapons/w_pkup.wav",
;864:        { "models/weapons2/heavy_repeater/heavy_repeater_w.glm", 
;865:		0, 0, 0},
;866:/* view */		"models/weapons2/heavy_repeater/heavy_repeater.md3", 
;867:/* icon */		"gfx/hud/w_icon_repeater",
;868:/* pickup *///	"Imperial Heavy Repeater",
;869:		100,
;870:		IT_WEAPON,
;871:		WP_REPEATER,
;872:/* precache */ "",
;873:/* sounds */ ""
;874:	},
;875:
;876:/*QUAKED weapon_demp2 (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;877:NOTENOTE This weapon is not yet complete.  Don't place it.
;878:*/
;879:	{
;880:		"weapon_demp2", 
;881:		"sound/weapons/w_pkup.wav",
;882:        { "models/weapons2/demp2/demp2_w.glm", 
;883:		0, 0, 0},
;884:/* view */		"models/weapons2/demp2/demp2.md3", 
;885:/* icon */		"gfx/hud/w_icon_demp2",
;886:/* pickup *///	"DEMP2",
;887:		100,
;888:		IT_WEAPON,
;889:		WP_DEMP2,
;890:/* precache */ "",
;891:/* sounds */ ""
;892:	},
;893:
;894:/*QUAKED weapon_flechette (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;895:*/
;896:	{
;897:		"weapon_flechette", 
;898:		"sound/weapons/w_pkup.wav",
;899:        { "models/weapons2/golan_arms/golan_arms_w.glm", 
;900:		0, 0, 0},
;901:/* view */		"models/weapons2/golan_arms/golan_arms.md3", 
;902:/* icon */		"gfx/hud/w_icon_flechette",
;903:/* pickup *///	"Golan Arms Flechette",
;904:		100,
;905:		IT_WEAPON,
;906:		WP_FLECHETTE,
;907:/* precache */ "",
;908:/* sounds */ ""
;909:	},
;910:
;911:/*QUAKED weapon_rocket_launcher (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;912:*/
;913:	{
;914:		"weapon_rocket_launcher",
;915:		"sound/weapons/w_pkup.wav",
;916:        { "models/weapons2/merr_sonn/merr_sonn_w.glm", 
;917:		0, 0, 0},
;918:/* view */		"models/weapons2/merr_sonn/merr_sonn.md3", 
;919:/* icon */		"gfx/hud/w_icon_merrsonn",
;920:/* pickup *///	"Merr-Sonn Missile System",
;921:		3,
;922:		IT_WEAPON,
;923:		WP_ROCKET_LAUNCHER,
;924:/* precache */ "",
;925:/* sounds */ ""
;926:	},
;927:
;928:/*QUAKED ammo_thermal (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;929:*/
;930:	{
;931:		"ammo_thermal",
;932:		"sound/weapons/w_pkup.wav",
;933:        { "models/weapons2/thermal/thermal_pu.md3", 
;934:		"models/weapons2/thermal/thermal_w.glm", 0, 0},
;935:/* view */		"models/weapons2/thermal/thermal.md3", 
;936:/* icon */		"gfx/hud/w_icon_thermal",
;937:/* pickup *///	"Thermal Detonators",
;938:		4,
;939:		IT_AMMO,
;940:		AMMO_THERMAL,
;941:/* precache */ "",
;942:/* sounds */ ""
;943:	},
;944:
;945:/*QUAKED ammo_tripmine (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;946:*/
;947:	{
;948:		"ammo_tripmine", 
;949:		"sound/weapons/w_pkup.wav",
;950:        { "models/weapons2/laser_trap/laser_trap_pu.md3", 
;951:		"models/weapons2/laser_trap/laser_trap_w.glm", 0, 0},
;952:/* view */		"models/weapons2/laser_trap/laser_trap.md3", 
;953:/* icon */		"gfx/hud/w_icon_tripmine",
;954:/* pickup *///	"Trip Mines",
;955:		3,
;956:		IT_AMMO,
;957:		AMMO_TRIPMINE,
;958:/* precache */ "",
;959:/* sounds */ ""
;960:	},
;961:
;962:/*QUAKED ammo_detpack (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;963:*/
;964:	{
;965:		"ammo_detpack", 
;966:		"sound/weapons/w_pkup.wav",
;967:        { "models/weapons2/detpack/det_pack_pu.md3", "models/weapons2/detpack/det_pack_proj.glm", "models/weapons2/detpack/det_pack_w.glm", 0},
;968:/* view */		"models/weapons2/detpack/det_pack.md3", 
;969:/* icon */		"gfx/hud/w_icon_detpack",
;970:/* pickup *///	"Det Packs",
;971:		3,
;972:		IT_AMMO,
;973:		AMMO_DETPACK,
;974:/* precache */ "",
;975:/* sounds */ ""
;976:	},
;977:
;978:/*QUAKED weapon_thermal (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;979:*/
;980:	{
;981:		"weapon_thermal",
;982:		"sound/weapons/w_pkup.wav",
;983:        { "models/weapons2/thermal/thermal_w.glm", "models/weapons2/thermal/thermal_pu.md3",
;984:		0, 0 },
;985:/* view */		"models/weapons2/thermal/thermal.md3", 
;986:/* icon */		"gfx/hud/w_icon_thermal",
;987:/* pickup *///	"Thermal Detonator",
;988:		4,
;989:		IT_WEAPON,
;990:		WP_THERMAL,
;991:/* precache */ "",
;992:/* sounds */ ""
;993:	},
;994:
;995:/*QUAKED weapon_trip_mine (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;996:*/
;997:	{
;998:		"weapon_trip_mine", 
;999:		"sound/weapons/w_pkup.wav",
;1000:        { "models/weapons2/laser_trap/laser_trap_w.glm", "models/weapons2/laser_trap/laser_trap_pu.md3",
;1001:		0, 0},
;1002:/* view */		"models/weapons2/laser_trap/laser_trap.md3", 
;1003:/* icon */		"gfx/hud/w_icon_tripmine",
;1004:/* pickup *///	"Trip Mine",
;1005:		3,
;1006:		IT_WEAPON,
;1007:		WP_TRIP_MINE,
;1008:/* precache */ "",
;1009:/* sounds */ ""
;1010:	},
;1011:
;1012:/*QUAKED weapon_det_pack (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;1013:*/
;1014:	{
;1015:		"weapon_det_pack", 
;1016:		"sound/weapons/w_pkup.wav",
;1017:        { "models/weapons2/detpack/det_pack_proj.glm", "models/weapons2/detpack/det_pack_pu.md3", "models/weapons2/detpack/det_pack_w.glm", 0},
;1018:/* view */		"models/weapons2/detpack/det_pack.md3", 
;1019:/* icon */		"gfx/hud/w_icon_detpack",
;1020:/* pickup *///	"Det Pack",
;1021:		3,
;1022:		IT_WEAPON,
;1023:		WP_DET_PACK,
;1024:/* precache */ "",
;1025:/* sounds */ ""
;1026:	},
;1027:
;1028:/*QUAKED weapon_emplaced (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;1029:*/
;1030:	{
;1031:		"weapon_emplaced", 
;1032:		"sound/weapons/w_pkup.wav",
;1033:        { "models/weapons2/blaster_r/blaster_w.glm", 
;1034:		0, 0, 0},
;1035:/* view */		"models/weapons2/blaster_r/blaster.md3", 
;1036:/* icon */		"gfx/hud/w_icon_blaster",
;1037:/* pickup *///	"Emplaced Gun",
;1038:		50,
;1039:		IT_WEAPON,
;1040:		WP_EMPLACED_GUN,
;1041:/* precache */ "",
;1042:/* sounds */ ""
;1043:	},
;1044:
;1045:
;1046://NOTE: This is to keep things from messing up because the turret weapon type isn't real
;1047:	{
;1048:		"weapon_turretwp", 
;1049:		"sound/weapons/w_pkup.wav",
;1050:        { "models/weapons2/blaster_r/blaster_w.glm", 
;1051:		0, 0, 0},
;1052:/* view */		"models/weapons2/blaster_r/blaster.md3", 
;1053:/* icon */		"gfx/hud/w_icon_blaster",
;1054:/* pickup *///	"Turret Gun",
;1055:		50,
;1056:		IT_WEAPON,
;1057:		WP_TURRET,
;1058:/* precache */ "",
;1059:/* sounds */ ""
;1060:	},
;1061:
;1062:	//
;1063:	// AMMO ITEMS
;1064:	//
;1065:
;1066:/*QUAKED ammo_force (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;1067:Don't place this
;1068:*/
;1069:	{
;1070:		"ammo_force",
;1071:		"sound/player/pickupenergy.wav",
;1072:        { "models/items/energy_cell.md3", 
;1073:		0, 0, 0},
;1074:/* view */		NULL,			
;1075:/* icon */		"gfx/hud/w_icon_blaster",
;1076:/* pickup *///	"Force??",
;1077:		100,
;1078:		IT_AMMO,
;1079:		AMMO_FORCE,
;1080:/* precache */ "",
;1081:/* sounds */ ""
;1082:	},
;1083:
;1084:/*QUAKED ammo_blaster (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;1085:Ammo for the Bryar and Blaster pistols.
;1086:*/
;1087:	{
;1088:		"ammo_blaster",
;1089:		"sound/player/pickupenergy.wav",
;1090:        { "models/items/energy_cell.md3", 
;1091:		0, 0, 0},
;1092:/* view */		NULL,			
;1093:/* icon */		"gfx/hud/i_icon_battery",
;1094:/* pickup *///	"Blaster Pack",
;1095:		100,
;1096:		IT_AMMO,
;1097:		AMMO_BLASTER,
;1098:/* precache */ "",
;1099:/* sounds */ ""
;1100:	},
;1101:
;1102:/*QUAKED ammo_powercell (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;1103:Ammo for Tenloss Disruptor, Wookie Bowcaster, and the Destructive Electro Magnetic Pulse (demp2 ) guns
;1104:*/
;1105:	{
;1106:		"ammo_powercell",
;1107:		"sound/player/pickupenergy.wav",
;1108:        { "models/items/power_cell.md3", 
;1109:		0, 0, 0},
;1110:/* view */		NULL,			
;1111:/* icon */		"gfx/mp/ammo_power_cell",
;1112:/* pickup *///	"Power Cell",
;1113:		100,
;1114:		IT_AMMO,
;1115:		AMMO_POWERCELL,
;1116:/* precache */ "",
;1117:/* sounds */ ""
;1118:	},
;1119:
;1120:/*QUAKED ammo_metallic_bolts (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;1121:Ammo for Imperial Heavy Repeater and the Golan Arms Flechette
;1122:*/
;1123:	{
;1124:		"ammo_metallic_bolts",
;1125:		"sound/player/pickupenergy.wav",
;1126:        { "models/items/metallic_bolts.md3", 
;1127:		0, 0, 0},
;1128:/* view */		NULL,			
;1129:/* icon */		"gfx/mp/ammo_metallic_bolts",
;1130:/* pickup *///	"Metallic Bolts",
;1131:		100,
;1132:		IT_AMMO,
;1133:		AMMO_METAL_BOLTS,
;1134:/* precache */ "",
;1135:/* sounds */ ""
;1136:	},
;1137:
;1138:/*QUAKED ammo_rockets (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;1139:Ammo for Merr-Sonn portable missile launcher
;1140:*/
;1141:	{
;1142:		"ammo_rockets",
;1143:		"sound/player/pickupenergy.wav",
;1144:        { "models/items/rockets.md3", 
;1145:		0, 0, 0},
;1146:/* view */		NULL,			
;1147:/* icon */		"gfx/mp/ammo_rockets",
;1148:/* pickup *///	"Rockets",
;1149:		3,
;1150:		IT_AMMO,
;1151:		AMMO_ROCKETS,
;1152:/* precache */ "",
;1153:/* sounds */ ""
;1154:	},
;1155:
;1156:
;1157:	//
;1158:	// POWERUP ITEMS
;1159:	//
;1160:/*QUAKED team_CTF_redflag (1 0 0) (-16 -16 -16) (16 16 16)
;1161:Only in CTF games
;1162:*/
;1163:	{
;1164:		"team_CTF_redflag",
;1165:		NULL,
;1166:        { "models/flags/r_flag.md3",
;1167:		"models/flags/r_flag_ysal.md3", 0, 0 },
;1168:/* view */		NULL,			
;1169:/* icon */		"gfx/hud/mpi_rflag",
;1170:/* pickup *///	"Red Flag",
;1171:		0,
;1172:		IT_TEAM,
;1173:		PW_REDFLAG,
;1174:/* precache */ "",
;1175:/* sounds */ ""
;1176:	},
;1177:
;1178:/*QUAKED team_CTF_blueflag (0 0 1) (-16 -16 -16) (16 16 16)
;1179:Only in CTF games
;1180:*/
;1181:	{
;1182:		"team_CTF_blueflag",
;1183:		NULL,
;1184:        { "models/flags/b_flag.md3",
;1185:		"models/flags/b_flag_ysal.md3", 0, 0 },
;1186:/* view */		NULL,			
;1187:/* icon */		"gfx/hud/mpi_bflag",
;1188:/* pickup *///	"Blue Flag",
;1189:		0,
;1190:		IT_TEAM,
;1191:		PW_BLUEFLAG,
;1192:/* precache */ "",
;1193:/* sounds */ ""
;1194:	},
;1195:
;1196:	//
;1197:	// PERSISTANT POWERUP ITEMS
;1198:	//
;1199:
;1200:	/*QUAKED team_CTF_neutralflag (0 0 1) (-16 -16 -16) (16 16 16)
;1201:Only in One Flag CTF games
;1202:*/
;1203:	{
;1204:		"team_CTF_neutralflag",
;1205:		NULL,
;1206:        { "models/flags/n_flag.md3",
;1207:		0, 0, 0 },
;1208:/* view */		NULL,			
;1209:/* icon */		"icons/iconf_neutral1",
;1210:/* pickup *///	"Neutral Flag",
;1211:		0,
;1212:		IT_TEAM,
;1213:		PW_NEUTRALFLAG,
;1214:/* precache */ "",
;1215:/* sounds */ ""
;1216:	},
;1217:
;1218:	{
;1219:		"item_redcube",
;1220:		"sound/player/pickupenergy.wav",
;1221:        { "models/powerups/orb/r_orb.md3",
;1222:		0, 0, 0 },
;1223:/* view */		NULL,			
;1224:/* icon */		"icons/iconh_rorb",
;1225:/* pickup *///	"Red Cube",
;1226:		0,
;1227:		IT_TEAM,
;1228:		0,
;1229:/* precache */ "",
;1230:/* sounds */ ""
;1231:	},
;1232:
;1233:	{
;1234:		"item_bluecube",
;1235:		"sound/player/pickupenergy.wav",
;1236:        { "models/powerups/orb/b_orb.md3",
;1237:		0, 0, 0 },
;1238:/* view */		NULL,			
;1239:/* icon */		"icons/iconh_borb",
;1240:/* pickup *///	"Blue Cube",
;1241:		0,
;1242:		IT_TEAM,
;1243:		0,
;1244:/* precache */ "",
;1245:/* sounds */ ""
;1246:	},
;1247:
;1248:	// end of list marker
;1249:	{NULL}
;1250:};
;1251:
;1252:int		bg_numItems = sizeof(bg_itemlist) / sizeof(bg_itemlist[0]) - 1;
;1253:
;1254:float vectoyaw( const vec3_t vec ) {
line 1257
;1255:	float	yaw;
;1256:	
;1257:	if (vec[YAW] == 0 && vec[PITCH] == 0) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
NEF4 $403
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
NEF4 $403
line 1258
;1258:		yaw = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1259
;1259:	} else {
ADDRGP4 $404
JUMPV
LABELV $403
line 1260
;1260:		if (vec[PITCH]) {
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 0
EQF4 $405
line 1261
;1261:			yaw = ( atan2( vec[YAW], vec[PITCH]) * 180 / M_PI );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRLP4 0
CNSTF4 1127481344
ADDRLP4 16
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
ASGNF4
line 1262
;1262:		} else if (vec[YAW] > 0) {
ADDRGP4 $406
JUMPV
LABELV $405
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 0
LEF4 $407
line 1263
;1263:			yaw = 90;
ADDRLP4 0
CNSTF4 1119092736
ASGNF4
line 1264
;1264:		} else {
ADDRGP4 $408
JUMPV
LABELV $407
line 1265
;1265:			yaw = 270;
ADDRLP4 0
CNSTF4 1132920832
ASGNF4
line 1266
;1266:		}
LABELV $408
LABELV $406
line 1267
;1267:		if (yaw < 0) {
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $409
line 1268
;1268:			yaw += 360;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 1269
;1269:		}
LABELV $409
line 1270
;1270:	}
LABELV $404
line 1272
;1271:
;1272:	return yaw;
ADDRLP4 0
INDIRF4
RETF4
LABELV $402
endproc vectoyaw 20 8
export BG_HasYsalamiri
proc BG_HasYsalamiri 8 0
line 1276
;1273:}
;1274:
;1275:qboolean BG_HasYsalamiri(int gametype, playerState_t *ps)
;1276:{
line 1277
;1277:	if (gametype == GT_CTY &&
ADDRFP4 0
INDIRI4
CNSTI4 8
NEI4 $412
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 360
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $414
ADDRLP4 0
INDIRP4
CNSTI4 364
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $412
LABELV $414
line 1279
;1278:		(ps->powerups[PW_REDFLAG] || ps->powerups[PW_BLUEFLAG]))
;1279:	{
line 1280
;1280:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $411
JUMPV
LABELV $412
line 1283
;1281:	}
;1282:
;1283:	if (ps->powerups[PW_YSALAMIRI])
ADDRFP4 4
INDIRP4
CNSTI4 404
ADDP4
INDIRI4
CNSTI4 0
EQI4 $415
line 1284
;1284:	{
line 1285
;1285:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $411
JUMPV
LABELV $415
line 1288
;1286:	}
;1287:
;1288:	return qfalse;
CNSTI4 0
RETI4
LABELV $411
endproc BG_HasYsalamiri 8 0
export BG_CanUseFPNow
proc BG_CanUseFPNow 16 8
line 1292
;1289:}
;1290:
;1291:qboolean BG_CanUseFPNow(int gametype, playerState_t *ps, int time, forcePowers_t power)
;1292:{
line 1293
;1293:	if (BG_HasYsalamiri(gametype, ps))
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BG_HasYsalamiri
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $418
line 1294
;1294:	{
line 1295
;1295:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $417
JUMPV
LABELV $418
line 1298
;1296:	}
;1297:
;1298:	if ( ps->forceRestricted || ps->trueNonJedi )
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 608
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $422
ADDRLP4 4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $420
LABELV $422
line 1299
;1299:	{
line 1300
;1300:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $417
JUMPV
LABELV $420
line 1303
;1301:	}
;1302:
;1303:	if (ps->duelInProgress)
ADDRFP4 4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $423
line 1304
;1304:	{//JediDog: In 1.04 they had gotten rid of saber throw in duels, enabled it back to 1.03 by removing the /**/ in /*power != FP_SABERTHROW &&*/ 
line 1305
;1305:		if (power != FP_SABERATTACK && power != FP_SABERDEFEND && power != FP_SABERTHROW && power != FP_LEVITATION)
ADDRLP4 12
ADDRFP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 15
EQI4 $425
ADDRLP4 12
INDIRI4
CNSTI4 16
EQI4 $425
ADDRLP4 12
INDIRI4
CNSTI4 17
EQI4 $425
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $425
line 1306
;1306:		{
line 1307
;1307:			if (!ps->saberLockFrame || power != FP_PUSH)
ADDRFP4 4
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
CNSTI4 0
EQI4 $429
ADDRFP4 12
INDIRI4
CNSTI4 3
EQI4 $427
LABELV $429
line 1308
;1308:			{
line 1309
;1309:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $417
JUMPV
LABELV $427
line 1311
;1310:			}
;1311:		}
LABELV $425
line 1312
;1312:	}
LABELV $423
line 1314
;1313:
;1314:	if (ps->saberLockFrame || ps->saberLockTime > time)
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
CNSTI4 0
NEI4 $432
ADDRLP4 12
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
ADDRFP4 8
INDIRI4
LEI4 $430
LABELV $432
line 1315
;1315:	{
line 1316
;1316:		if (power != FP_PUSH)
ADDRFP4 12
INDIRI4
CNSTI4 3
EQI4 $433
line 1317
;1317:		{
line 1318
;1318:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $417
JUMPV
LABELV $433
line 1320
;1319:		}
;1320:	}
LABELV $430
line 1322
;1321:
;1322:	if (ps->fallingToDeath)
ADDRFP4 4
INDIRP4
CNSTI4 1352
ADDP4
INDIRI4
CNSTI4 0
EQI4 $435
line 1323
;1323:	{
line 1324
;1324:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $417
JUMPV
LABELV $435
line 1327
;1325:	}
;1326:
;1327:	return qtrue;
CNSTI4 1
RETI4
LABELV $417
endproc BG_CanUseFPNow 16 8
export BG_FindItemForPowerup
proc BG_FindItemForPowerup 8 0
line 1335
;1328:}
;1329:
;1330:/*
;1331:==============
;1332:BG_FindItemForPowerup
;1333:==============
;1334:*/
;1335:gitem_t	*BG_FindItemForPowerup( powerup_t pw ) {
line 1338
;1336:	int		i;
;1337:
;1338:	for ( i = 0 ; i < bg_numItems ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $441
JUMPV
LABELV $438
line 1339
;1339:		if ( (bg_itemlist[i].giType == IT_POWERUP || 
ADDRLP4 4
CNSTI4 52
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
CNSTI4 5
EQI4 $447
ADDRLP4 4
INDIRI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $442
LABELV $447
CNSTI4 52
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $442
line 1341
;1340:					bg_itemlist[i].giType == IT_TEAM) && 
;1341:			bg_itemlist[i].giTag == pw ) {
line 1342
;1342:			return &bg_itemlist[i];
CNSTI4 52
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
RETP4
ADDRGP4 $437
JUMPV
LABELV $442
line 1344
;1343:		}
;1344:	}
LABELV $439
line 1338
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $441
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $438
line 1346
;1345:
;1346:	return NULL;
CNSTP4 0
RETP4
LABELV $437
endproc BG_FindItemForPowerup 8 0
export BG_FindItemForHoldable
proc BG_FindItemForHoldable 8 8
line 1355
;1347:}
;1348:
;1349:
;1350:/*
;1351:==============
;1352:BG_FindItemForHoldable
;1353:==============
;1354:*/
;1355:gitem_t	*BG_FindItemForHoldable( holdable_t pw ) {
line 1358
;1356:	int		i;
;1357:
;1358:	for ( i = 0 ; i < bg_numItems ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $452
JUMPV
LABELV $449
line 1359
;1359:		if ( bg_itemlist[i].giType == IT_HOLDABLE && bg_itemlist[i].giTag == pw ) {
ADDRLP4 4
CNSTI4 52
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
CNSTI4 6
NEI4 $453
ADDRLP4 4
INDIRI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $453
line 1360
;1360:			return &bg_itemlist[i];
CNSTI4 52
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
RETP4
ADDRGP4 $448
JUMPV
LABELV $453
line 1362
;1361:		}
;1362:	}
LABELV $450
line 1358
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $452
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $449
line 1364
;1363:
;1364:	Com_Error( ERR_DROP, "HoldableItem not found" );
CNSTI4 1
ARGI4
ADDRGP4 $457
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1366
;1365:
;1366:	return NULL;
CNSTP4 0
RETP4
LABELV $448
endproc BG_FindItemForHoldable 8 8
export BG_FindItemForWeapon
proc BG_FindItemForWeapon 8 12
line 1376
;1367:}
;1368:
;1369:
;1370:/*
;1371:===============
;1372:BG_FindItemForWeapon
;1373:
;1374:===============
;1375:*/
;1376:gitem_t	*BG_FindItemForWeapon( weapon_t weapon ) {
line 1379
;1377:	gitem_t	*it;
;1378:	
;1379:	for ( it = bg_itemlist + 1 ; it->classname ; it++) {
ADDRLP4 0
ADDRGP4 bg_itemlist+52
ASGNP4
ADDRGP4 $462
JUMPV
LABELV $459
line 1380
;1380:		if ( it->giType == IT_WEAPON && it->giTag == weapon ) {
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $464
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $464
line 1381
;1381:			return it;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $458
JUMPV
LABELV $464
line 1383
;1382:		}
;1383:	}
LABELV $460
line 1379
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
LABELV $462
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $459
line 1385
;1384:
;1385:	Com_Error( ERR_DROP, "Couldn't find item for weapon %i", weapon);
CNSTI4 1
ARGI4
ADDRGP4 $466
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Error
CALLV
pop
line 1386
;1386:	return NULL;
CNSTP4 0
RETP4
LABELV $458
endproc BG_FindItemForWeapon 8 12
export BG_FindItem
proc BG_FindItem 8 8
line 1395
;1387:}
;1388:
;1389:/*
;1390:===============
;1391:BG_FindItem
;1392:
;1393:===============
;1394:*/
;1395:gitem_t	*BG_FindItem( const char *classname ) {
line 1398
;1396:	gitem_t	*it;
;1397:	
;1398:	for ( it = bg_itemlist + 1 ; it->classname ; it++ ) {
ADDRLP4 0
ADDRGP4 bg_itemlist+52
ASGNP4
ADDRGP4 $471
JUMPV
LABELV $468
line 1399
;1399:		if ( !Q_stricmp( it->classname, classname) )
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $473
line 1400
;1400:			return it;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $467
JUMPV
LABELV $473
line 1401
;1401:	}
LABELV $469
line 1398
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
LABELV $471
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $468
line 1403
;1402:
;1403:	return NULL;
CNSTP4 0
RETP4
LABELV $467
endproc BG_FindItem 8 8
export BG_PlayerTouchesItem
proc BG_PlayerTouchesItem 36 12
line 1414
;1404:}
;1405:
;1406:/*
;1407:============
;1408:BG_PlayerTouchesItem
;1409:
;1410:Items can be picked up without actually touching their physical bounds to make
;1411:grabbing them easier
;1412:============
;1413:*/
;1414:qboolean	BG_PlayerTouchesItem( playerState_t *ps, entityState_t *item, int atTime ) {
line 1417
;1415:	vec3_t		origin;
;1416:
;1417:	BG_EvaluateTrajectory( &item->pos, atTime, origin );
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1420
;1418:
;1419:	// we are ignoring ducked differences here
;1420:	if ( ps->origin[0] - origin[0] > 44
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16
INDIRF4
CNSTF4 1110441984
GTF4 $486
ADDRLP4 16
INDIRF4
CNSTF4 3259498496
LTF4 $486
ADDRLP4 20
ADDRLP4 12
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
ADDRLP4 24
CNSTF4 1108344832
ASGNF4
ADDRLP4 20
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ADDRLP4 24
INDIRF4
GTF4 $486
ADDRLP4 28
CNSTF4 3255828480
ASGNF4
ADDRLP4 20
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ADDRLP4 28
INDIRF4
LTF4 $486
ADDRLP4 32
ADDRLP4 12
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ASGNF4
ADDRLP4 32
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ADDRLP4 24
INDIRF4
GTF4 $486
ADDRLP4 32
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ADDRLP4 28
INDIRF4
GEF4 $476
LABELV $486
line 1425
;1421:		|| ps->origin[0] - origin[0] < -50
;1422:		|| ps->origin[1] - origin[1] > 36
;1423:		|| ps->origin[1] - origin[1] < -36
;1424:		|| ps->origin[2] - origin[2] > 36
;1425:		|| ps->origin[2] - origin[2] < -36 ) {
line 1426
;1426:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $475
JUMPV
LABELV $476
line 1429
;1427:	}
;1428:
;1429:	return qtrue;
CNSTI4 1
RETI4
LABELV $475
endproc BG_PlayerTouchesItem 36 12
export BG_ProperForceIndex
proc BG_ProperForceIndex 4 0
line 1433
;1430:}
;1431:
;1432:int BG_ProperForceIndex(int power)
;1433:{
line 1434
;1434:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $489
JUMPV
LABELV $488
line 1437
;1435:
;1436:	while (i < NUM_FORCE_POWERS)
;1437:	{
line 1438
;1438:		if (forcePowerSorted[i] == power)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forcePowerSorted
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $491
line 1439
;1439:		{
line 1440
;1440:			return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $487
JUMPV
LABELV $491
line 1443
;1441:		}
;1442:
;1443:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1444
;1444:	}
LABELV $489
line 1436
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $488
line 1446
;1445:
;1446:	return -1;
CNSTI4 -1
RETI4
LABELV $487
endproc BG_ProperForceIndex 4 0
export BG_CycleForce
proc BG_CycleForce 40 4
line 1450
;1447:}
;1448:
;1449:void BG_CycleForce(playerState_t *ps, int direction)
;1450:{
line 1451
;1451:	int i = ps->fd.forcePowerSelected;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
ASGNI4
line 1452
;1452:	int x = i;
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1453
;1453:	int presel = i;
ADDRLP4 8
ADDRLP4 4
INDIRI4
ASGNI4
line 1454
;1454:	int foundnext = -1;
ADDRLP4 12
CNSTI4 -1
ASGNI4
line 1456
;1455:
;1456:	if (!ps->fd.forcePowersKnown & (1 << x) ||
ADDRFP4 0
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CNSTI4 0
NEI4 $498
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRGP4 $499
JUMPV
LABELV $498
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $499
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $500
ADDRLP4 0
INDIRI4
CNSTI4 18
GEI4 $500
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $494
LABELV $500
line 1459
;1457:		x >= NUM_FORCE_POWERS ||
;1458:		x == -1)
;1459:	{ //apparently we have no valid force powers
line 1460
;1460:		return;
ADDRGP4 $493
JUMPV
LABELV $494
line 1463
;1461:	}
;1462:
;1463:	x = BG_ProperForceIndex(x);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_ProperForceIndex
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 1464
;1464:	presel = x;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 1466
;1465:
;1466:	if (direction == 1)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $501
line 1467
;1467:	{ //get the next power
line 1468
;1468:		x++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1469
;1469:	}
ADDRGP4 $502
JUMPV
LABELV $501
line 1471
;1470:	else
;1471:	{ //get the previous power
line 1472
;1472:		x--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1473
;1473:	}
LABELV $502
line 1475
;1474:
;1475:	if (x >= NUM_FORCE_POWERS)
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $503
line 1476
;1476:	{ //cycled off the end.. cycle around to the first
line 1477
;1477:		x = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1478
;1478:	}
LABELV $503
line 1479
;1479:	if (x < 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $505
line 1480
;1480:	{ //cycled off the beginning.. cycle around to the last
line 1481
;1481:		x = NUM_FORCE_POWERS-1;
ADDRLP4 0
CNSTI4 17
ASGNI4
line 1482
;1482:	}
LABELV $505
line 1484
;1483:
;1484:	i = forcePowerSorted[x]; //the "sorted" value of this power
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forcePowerSorted
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $508
JUMPV
LABELV $507
line 1487
;1485:
;1486:	while (x != presel)
;1487:	{ //loop around to the current force power
line 1488
;1488:		if (ps->fd.forcePowersKnown & (1 << i) && i != ps->fd.forcePowerSelected)
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $510
ADDRLP4 4
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
EQI4 $510
line 1489
;1489:		{ //we have the force power
line 1490
;1490:			if (i != FP_LEVITATION &&
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $512
ADDRLP4 4
INDIRI4
CNSTI4 15
EQI4 $512
ADDRLP4 4
INDIRI4
CNSTI4 16
EQI4 $512
ADDRLP4 4
INDIRI4
CNSTI4 17
EQI4 $512
line 1494
;1491:				i != FP_SABERATTACK &&
;1492:				i != FP_SABERDEFEND &&
;1493:				i != FP_SABERTHROW)
;1494:			{ //it's selectable
line 1495
;1495:				foundnext = i;
ADDRLP4 12
ADDRLP4 4
INDIRI4
ASGNI4
line 1496
;1496:				break;
ADDRGP4 $509
JUMPV
LABELV $512
line 1498
;1497:			}
;1498:		}
LABELV $510
line 1500
;1499:
;1500:		if (direction == 1)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $514
line 1501
;1501:		{ //next
line 1502
;1502:			x++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1503
;1503:		}
ADDRGP4 $515
JUMPV
LABELV $514
line 1505
;1504:		else
;1505:		{ //previous
line 1506
;1506:			x--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1507
;1507:		}
LABELV $515
line 1509
;1508:	
;1509:		if (x >= NUM_FORCE_POWERS)
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $516
line 1510
;1510:		{ //loop around
line 1511
;1511:			x = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1512
;1512:		}
LABELV $516
line 1513
;1513:		if (x < 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $518
line 1514
;1514:		{ //loop around
line 1515
;1515:			x = NUM_FORCE_POWERS-1;
ADDRLP4 0
CNSTI4 17
ASGNI4
line 1516
;1516:		}
LABELV $518
line 1518
;1517:
;1518:		i = forcePowerSorted[x]; //set to the sorted value again
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forcePowerSorted
ADDP4
INDIRI4
ASGNI4
line 1519
;1519:	}
LABELV $508
line 1486
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $507
LABELV $509
line 1521
;1520:
;1521:	if (foundnext != -1)
ADDRLP4 12
INDIRI4
CNSTI4 -1
EQI4 $520
line 1522
;1522:	{ //found one, select it
line 1523
;1523:		ps->fd.forcePowerSelected = foundnext;
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1524
;1524:	}
LABELV $520
line 1525
;1525:}
LABELV $493
endproc BG_CycleForce 40 4
export BG_GetItemIndexByTag
proc BG_GetItemIndexByTag 8 0
line 1528
;1526:
;1527:int BG_GetItemIndexByTag(int tag, int type)
;1528:{ //Get the itemlist index from the tag and type
line 1529
;1529:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $524
JUMPV
LABELV $523
line 1532
;1530:
;1531:	while (i < bg_numItems)
;1532:	{
line 1533
;1533:		if (bg_itemlist[i].giTag == tag &&
ADDRLP4 4
CNSTI4 52
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $526
ADDRLP4 4
INDIRI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $526
line 1535
;1534:			bg_itemlist[i].giType == type)
;1535:		{
line 1536
;1536:			return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $522
JUMPV
LABELV $526
line 1539
;1537:		}
;1538:
;1539:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1540
;1540:	}
LABELV $524
line 1531
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $523
line 1542
;1541:
;1542:	return 0;
CNSTI4 0
RETI4
LABELV $522
endproc BG_GetItemIndexByTag 8 0
export BG_CycleInven
proc BG_CycleInven 12 8
line 1546
;1543:}
;1544:
;1545:void BG_CycleInven(playerState_t *ps, int direction)
;1546:{
line 1550
;1547:	int i;
;1548:	int original;
;1549:
;1550:	i = bg_itemlist[ps->stats[STAT_HOLDABLE_ITEM]].giTag;
ADDRLP4 0
CNSTI4 52
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ASGNI4
line 1551
;1551:	original = i;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 1553
;1552:
;1553:	if (direction == 1)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $532
line 1554
;1554:	{ //next
line 1555
;1555:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1556
;1556:	}
ADDRGP4 $535
JUMPV
LABELV $532
line 1558
;1557:	else
;1558:	{ //previous
line 1559
;1559:		i--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1560
;1560:	}
ADDRGP4 $535
JUMPV
LABELV $534
line 1563
;1561:
;1562:	while (i != original)
;1563:	{ //go in a full loop until hitting something, if hit nothing then select nothing
line 1564
;1564:		if (ps->stats[STAT_HOLDABLE_ITEMS] & (1 << i))
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $537
line 1565
;1565:		{ //we have it, select it.
line 1566
;1566:			ps->stats[STAT_HOLDABLE_ITEM] = BG_GetItemIndexByTag(i, IT_HOLDABLE);
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 8
ADDRGP4 BG_GetItemIndexByTag
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1567
;1567:			break;
ADDRGP4 $536
JUMPV
LABELV $537
line 1570
;1568:		}
;1569:
;1570:		if (direction == 1)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $539
line 1571
;1571:		{ //next
line 1572
;1572:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1573
;1573:		}
ADDRGP4 $540
JUMPV
LABELV $539
line 1575
;1574:		else
;1575:		{ //previous
line 1576
;1576:			i--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1577
;1577:		}
LABELV $540
line 1579
;1578:
;1579:		if (i < 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $541
line 1580
;1580:		{ //wrap around to the last
line 1581
;1581:			i = HI_NUM_HOLDABLE;
ADDRLP4 0
CNSTI4 7
ASGNI4
line 1582
;1582:		}
ADDRGP4 $542
JUMPV
LABELV $541
line 1583
;1583:		else if (i >= HI_NUM_HOLDABLE)
ADDRLP4 0
INDIRI4
CNSTI4 7
LTI4 $543
line 1584
;1584:		{ //wrap around to the first
line 1585
;1585:			i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1586
;1586:		}
LABELV $543
LABELV $542
line 1587
;1587:	}
LABELV $535
line 1562
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $534
LABELV $536
line 1588
;1588:}
LABELV $530
endproc BG_CycleInven 12 8
export BG_CanItemBeGrabbed
proc BG_CanItemBeGrabbed 56 8
line 1598
;1589:
;1590:/*
;1591:================
;1592:BG_CanItemBeGrabbed
;1593:
;1594:Returns false if the item should not be picked up.
;1595:This needs to be the same for client side prediction and server use.
;1596:================
;1597:*/
;1598:qboolean BG_CanItemBeGrabbed( int gametype, const entityState_t *ent, const playerState_t *ps ) {
line 1601
;1599:	gitem_t	*item;
;1600:
;1601:	if ( ent->modelindex < 1 || ent->modelindex >= bg_numItems ) {
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $548
ADDRLP4 4
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $546
LABELV $548
line 1602
;1602:		Com_Error( ERR_DROP, "BG_CanItemBeGrabbed: index out of range" );
CNSTI4 1
ARGI4
ADDRGP4 $549
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1603
;1603:	}
LABELV $546
line 1605
;1604:
;1605:	item = &bg_itemlist[ent->modelindex];
ADDRLP4 0
CNSTI4 52
ADDRFP4 4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 1607
;1606:
;1607:	if ( ps )
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $550
line 1608
;1608:	{
line 1609
;1609:		if ( ps->trueJedi )
ADDRFP4 8
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
CNSTI4 0
EQI4 $552
line 1610
;1610:		{//force powers and saber only
line 1611
;1611:			if ( item->giType != IT_TEAM //not a flag
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 8
EQI4 $553
ADDRLP4 12
INDIRI4
CNSTI4 3
EQI4 $553
ADDRLP4 12
INDIRI4
CNSTI4 1
NEI4 $556
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
EQI4 $553
LABELV $556
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 6
NEI4 $557
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 1
EQI4 $553
LABELV $557
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $558
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 15
NEI4 $553
LABELV $558
line 1616
;1612:				&& item->giType != IT_ARMOR//not shields
;1613:				&& (item->giType != IT_WEAPON || item->giTag != WP_SABER)//not a saber
;1614:				&& (item->giType != IT_HOLDABLE || item->giTag != HI_SEEKER)//not a seeker
;1615:				&& (item->giType != IT_POWERUP || item->giTag == PW_YSALAMIRI) )//not a force pick-up
;1616:			{
line 1617
;1617:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $545
JUMPV
line 1619
;1618:			}
;1619:		}
LABELV $552
line 1620
;1620:		else if ( ps->trueNonJedi )
ADDRFP4 8
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 0
EQI4 $559
line 1621
;1621:		{//can't pick up force powerups
line 1622
;1622:			if ( (item->giType == IT_POWERUP && item->giTag != PW_YSALAMIRI) //if a powerup, can only can pick up ysalamiri
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $564
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 15
NEI4 $565
LABELV $564
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 6
NEI4 $566
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 1
EQI4 $565
LABELV $566
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $561
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
NEI4 $561
LABELV $565
line 1625
;1623:				|| (item->giType == IT_HOLDABLE && item->giTag == HI_SEEKER)//if holdable, cannot pick up seeker 
;1624:				|| (item->giType == IT_WEAPON && item->giTag == WP_SABER ) )//or if it's a saber
;1625:			{
line 1626
;1626:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $545
JUMPV
LABELV $561
line 1628
;1627:			}
;1628:		}
LABELV $559
LABELV $553
line 1629
;1629:		if ( ps->isJediMaster && item && (item->giType == IT_WEAPON || item->giType == IT_AMMO))
ADDRFP4 8
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $567
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $567
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $569
ADDRLP4 12
INDIRI4
CNSTI4 2
NEI4 $567
LABELV $569
line 1630
;1630:		{//jedi master cannot pick up weapons
line 1631
;1631:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $545
JUMPV
LABELV $567
line 1633
;1632:		}
;1633:		if ( ps->duelInProgress )
ADDRFP4 8
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $551
line 1634
;1634:		{ //no picking stuff up while in a duel, no matter what the type is
line 1635
;1635:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $545
JUMPV
line 1637
;1636:		}
;1637:	}
LABELV $550
line 1639
;1638:	else
;1639:	{//safety return since below code assumes a non-null ps
line 1640
;1640:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $545
JUMPV
LABELV $551
line 1643
;1641:	}
;1642:
;1643:	switch( item->giType ) {
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $573
ADDRLP4 8
INDIRI4
CNSTI4 8
GTI4 $573
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $624
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $624
address $622
address $575
address $580
address $583
address $586
address $596
address $619
address $573
address $601
code
LABELV $575
line 1645
;1644:	case IT_WEAPON:
;1645:		if (ent->generic1 == ps->clientNum && ent->powerups)
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
NEI4 $576
ADDRLP4 16
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
CNSTI4 0
EQI4 $576
line 1646
;1646:		{
line 1647
;1647:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $545
JUMPV
LABELV $576
line 1649
;1648:		}
;1649:		if (!(ent->eFlags & EF_DROPPEDWEAPON) && (ps->stats[STAT_WEAPONS] & (1 << item->giTag)) &&
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 16777216
BANDI4
ADDRLP4 20
INDIRI4
NEI4 $578
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 24
INDIRI4
LSHI4
BANDI4
ADDRLP4 20
INDIRI4
EQI4 $578
ADDRLP4 24
INDIRI4
CNSTI4 11
EQI4 $578
ADDRLP4 24
INDIRI4
CNSTI4 12
EQI4 $578
ADDRLP4 24
INDIRI4
CNSTI4 13
EQI4 $578
line 1651
;1650:			item->giTag != WP_THERMAL && item->giTag != WP_TRIP_MINE && item->giTag != WP_DET_PACK)
;1651:		{ //weaponstay stuff.. if this isn't dropped, and you already have it, you don't get it.
line 1652
;1652:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $545
JUMPV
LABELV $578
line 1654
;1653:		}
;1654:		return qtrue;	// weapons are always picked up
CNSTI4 1
RETI4
ADDRGP4 $545
JUMPV
LABELV $580
line 1657
;1655:
;1656:	case IT_AMMO:
;1657:		if ( ps->ammo[item->giTag] >= ammoData[item->giTag].max) {
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 28
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
ADDRGP4 ammoData
ADDP4
INDIRI4
LTI4 $581
line 1658
;1658:			return qfalse;		// can't hold any more
CNSTI4 0
RETI4
ADDRGP4 $545
JUMPV
LABELV $581
line 1660
;1659:		}
;1660:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $545
JUMPV
LABELV $583
line 1663
;1661:
;1662:	case IT_ARMOR:
;1663:		if ( ps->stats[STAT_ARMOR] >= ps->stats[STAT_MAX_HEALTH] * item->giTag ) {
ADDRLP4 32
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
MULI4
LTI4 $584
line 1664
;1664:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $545
JUMPV
LABELV $584
line 1666
;1665:		}
;1666:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $545
JUMPV
LABELV $586
line 1671
;1667:
;1668:	case IT_HEALTH:
;1669:		// small and mega healths will go over the max, otherwise
;1670:		// don't pick up if already at max
;1671:		if ((ps->fd.forcePowersActive & (1 << FP_RAGE)))
ADDRFP4 8
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $587
line 1672
;1672:		{
line 1673
;1673:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $545
JUMPV
LABELV $587
line 1676
;1674:		}
;1675:
;1676:		if ( item->quantity == 5 || item->quantity == 100 ) {
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 5
EQI4 $591
ADDRLP4 36
INDIRI4
CNSTI4 100
NEI4 $589
LABELV $591
line 1677
;1677:			if ( ps->stats[STAT_HEALTH] >= ps->stats[STAT_MAX_HEALTH] * 2 ) {
ADDRLP4 40
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 40
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 1
LSHI4
LTI4 $592
line 1678
;1678:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $545
JUMPV
LABELV $592
line 1680
;1679:			}
;1680:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $545
JUMPV
LABELV $589
line 1683
;1681:		}
;1682:
;1683:		if ( ps->stats[STAT_HEALTH] >= ps->stats[STAT_MAX_HEALTH] ) {
ADDRLP4 40
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 40
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LTI4 $594
line 1684
;1684:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $545
JUMPV
LABELV $594
line 1686
;1685:		}
;1686:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $545
JUMPV
LABELV $596
line 1689
;1687:
;1688:	case IT_POWERUP:
;1689:		if (ps && (ps->powerups[PW_YSALAMIRI]))
ADDRLP4 44
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $597
ADDRLP4 44
INDIRP4
CNSTI4 404
ADDP4
INDIRI4
CNSTI4 0
EQI4 $597
line 1690
;1690:		{
line 1691
;1691:			if (item->giTag != PW_YSALAMIRI)
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 15
EQI4 $599
line 1692
;1692:			{
line 1693
;1693:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $545
JUMPV
LABELV $599
line 1695
;1694:			}
;1695:		}
LABELV $597
line 1696
;1696:		return qtrue;	// powerups are always picked up
CNSTI4 1
RETI4
ADDRGP4 $545
JUMPV
LABELV $601
line 1699
;1697:
;1698:	case IT_TEAM: // team items, such as flags
;1699:		if( gametype == GT_CTF || gametype == GT_CTY ) {
ADDRLP4 48
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 7
EQI4 $604
ADDRLP4 48
INDIRI4
CNSTI4 8
NEI4 $602
LABELV $604
line 1703
;1700:			// ent->modelindex2 is non-zero on items if they are dropped
;1701:			// we need to know this because we can pick up our dropped flag (and return it)
;1702:			// but we can't pick up our flag at base
;1703:			if (ps->persistant[PERS_TEAM] == TEAM_RED) {
ADDRFP4 8
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
CNSTI4 1
NEI4 $605
line 1704
;1704:				if (item->giTag == PW_BLUEFLAG ||
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 5
EQI4 $610
ADDRLP4 52
INDIRI4
CNSTI4 4
NEI4 $611
ADDRFP4 4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
NEI4 $610
LABELV $611
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 4
NEI4 $606
ADDRFP4 8
INDIRP4
CNSTI4 364
ADDP4
INDIRI4
CNSTI4 0
EQI4 $606
LABELV $610
line 1707
;1705:					(item->giTag == PW_REDFLAG && ent->modelindex2) ||
;1706:					(item->giTag == PW_REDFLAG && ps->powerups[PW_BLUEFLAG]) )
;1707:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $545
JUMPV
line 1708
;1708:			} else if (ps->persistant[PERS_TEAM] == TEAM_BLUE) {
LABELV $605
ADDRFP4 8
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
CNSTI4 2
NEI4 $612
line 1709
;1709:				if (item->giTag == PW_REDFLAG ||
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 4
EQI4 $617
ADDRLP4 52
INDIRI4
CNSTI4 5
NEI4 $618
ADDRFP4 4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
NEI4 $617
LABELV $618
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 5
NEI4 $614
ADDRFP4 8
INDIRP4
CNSTI4 360
ADDP4
INDIRI4
CNSTI4 0
EQI4 $614
LABELV $617
line 1712
;1710:					(item->giTag == PW_BLUEFLAG && ent->modelindex2) ||
;1711:					(item->giTag == PW_BLUEFLAG && ps->powerups[PW_REDFLAG]) )
;1712:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $545
JUMPV
LABELV $614
line 1713
;1713:			}
LABELV $612
LABELV $606
line 1714
;1714:		}
LABELV $602
line 1716
;1715:
;1716:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $545
JUMPV
LABELV $619
line 1719
;1717:
;1718:	case IT_HOLDABLE:
;1719:		if ( ps->stats[STAT_HOLDABLE_ITEMS] & (1 << item->giTag))
ADDRFP4 8
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $620
line 1720
;1720:		{
line 1721
;1721:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $545
JUMPV
LABELV $620
line 1723
;1722:		}
;1723:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $545
JUMPV
LABELV $622
line 1726
;1724:
;1725:        case IT_BAD:
;1726:            Com_Error( ERR_DROP, "BG_CanItemBeGrabbed: IT_BAD" );
CNSTI4 1
ARGI4
ADDRGP4 $623
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1733
;1727:        default:
;1728:#ifndef Q3_VM
;1729:#ifndef NDEBUG // bk0001204
;1730:          Com_Printf("BG_CanItemBeGrabbed: unknown enum %d\n", item->giType );
;1731:#endif
;1732:#endif
;1733:         break;
LABELV $573
line 1736
;1734:	}
;1735:
;1736:	return qfalse;
CNSTI4 0
RETI4
LABELV $545
endproc BG_CanItemBeGrabbed 56 8
export BG_EvaluateTrajectory
proc BG_EvaluateTrajectory 84 12
line 1747
;1737:}
;1738:
;1739://======================================================================
;1740:
;1741:/*
;1742:================
;1743:BG_EvaluateTrajectory
;1744:
;1745:================
;1746:*/
;1747:void BG_EvaluateTrajectory( const trajectory_t *tr, int atTime, vec3_t result ) {
line 1751
;1748:	float		deltaTime;
;1749:	float		phase;
;1750:
;1751:	switch( tr->trType ) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $626
ADDRLP4 8
INDIRI4
CNSTI4 5
GTI4 $626
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $639
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $639
address $629
address $629
address $630
address $632
address $631
address $637
code
LABELV $629
line 1754
;1752:	case TR_STATIONARY:
;1753:	case TR_INTERPOLATE:
;1754:		VectorCopy( tr->trBase, result );
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 1755
;1755:		break;
ADDRGP4 $627
JUMPV
LABELV $630
line 1757
;1756:	case TR_LINEAR:
;1757:		deltaTime = ( atTime - tr->trTime ) * 0.001;	// milliseconds to seconds
ADDRLP4 0
CNSTF4 981668463
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
ASGNF4
line 1758
;1758:		VectorMA( tr->trBase, deltaTime, tr->trDelta, result );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 1759
;1759:		break;
ADDRGP4 $627
JUMPV
LABELV $631
line 1761
;1760:	case TR_SINE:
;1761:		deltaTime = ( atTime - tr->trTime ) / (float) tr->trDuration;
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRFP4 4
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 28
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 1762
;1762:		phase = sin( deltaTime * M_PI * 2 );
CNSTF4 1073741824
CNSTF4 1078530011
ADDRLP4 0
INDIRF4
MULF4
MULF4
ARGF4
ADDRLP4 32
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 32
INDIRF4
ASGNF4
line 1763
;1763:		VectorMA( tr->trBase, phase, tr->trDelta, result );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 36
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1764
;1764:		break;
ADDRGP4 $627
JUMPV
LABELV $632
line 1766
;1765:	case TR_LINEAR_STOP:
;1766:		if ( atTime > tr->trTime + tr->trDuration ) {
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDI4
LEI4 $633
line 1767
;1767:			atTime = tr->trTime + tr->trDuration;
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 52
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1768
;1768:		}
LABELV $633
line 1769
;1769:		deltaTime = ( atTime - tr->trTime ) * 0.001;	// milliseconds to seconds
ADDRLP4 0
CNSTF4 981668463
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
ASGNF4
line 1770
;1770:		if ( deltaTime < 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $635
line 1771
;1771:			deltaTime = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1772
;1772:		}
LABELV $635
line 1773
;1773:		VectorMA( tr->trBase, deltaTime, tr->trDelta, result );
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 52
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 56
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 60
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 1774
;1774:		break;
ADDRGP4 $627
JUMPV
LABELV $637
line 1776
;1775:	case TR_GRAVITY:
;1776:		deltaTime = ( atTime - tr->trTime ) * 0.001;	// milliseconds to seconds
ADDRLP4 0
CNSTF4 981668463
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
ASGNF4
line 1777
;1777:		VectorMA( tr->trBase, deltaTime, tr->trDelta, result );
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 64
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 68
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 1778
;1778:		result[2] -= 0.5 * DEFAULT_GRAVITY * deltaTime * deltaTime;		// FIXME: local gravity...
ADDRLP4 76
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 80
ADDRLP4 0
INDIRF4
ASGNF4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
CNSTF4 1137180672
ADDRLP4 80
INDIRF4
MULF4
ADDRLP4 80
INDIRF4
MULF4
SUBF4
ASGNF4
line 1779
;1779:		break;
ADDRGP4 $627
JUMPV
LABELV $626
line 1784
;1780:	default:
;1781:#ifdef QAGAME
;1782:		Com_Error( ERR_DROP, "BG_EvaluateTrajectory: [GAME SIDE] unknown trType: %i", tr->trType );
;1783:#else
;1784:		Com_Error( ERR_DROP, "BG_EvaluateTrajectory: [CLIENTGAME SIDE] unknown trType: %i", tr->trType );
CNSTI4 1
ARGI4
ADDRGP4 $638
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 Com_Error
CALLV
pop
line 1786
;1785:#endif
;1786:		break;
LABELV $627
line 1788
;1787:	}
;1788:}
LABELV $625
endproc BG_EvaluateTrajectory 84 12
export BG_EvaluateTrajectoryDelta
proc BG_EvaluateTrajectoryDelta 44 12
line 1797
;1789:
;1790:/*
;1791:================
;1792:BG_EvaluateTrajectoryDelta
;1793:
;1794:For determining velocity at a given time
;1795:================
;1796:*/
;1797:void BG_EvaluateTrajectoryDelta( const trajectory_t *tr, int atTime, vec3_t result ) {
line 1801
;1798:	float	deltaTime;
;1799:	float	phase;
;1800:
;1801:	switch( tr->trType ) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $641
ADDRLP4 8
INDIRI4
CNSTI4 5
GTI4 $641
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $652
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $652
address $644
address $644
address $645
address $647
address $646
address $650
code
LABELV $644
line 1804
;1802:	case TR_STATIONARY:
;1803:	case TR_INTERPOLATE:
;1804:		VectorClear( result );
ADDRLP4 16
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRF4
ASGNF4
line 1805
;1805:		break;
ADDRGP4 $642
JUMPV
LABELV $645
line 1807
;1806:	case TR_LINEAR:
;1807:		VectorCopy( tr->trDelta, result );
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1808
;1808:		break;
ADDRGP4 $642
JUMPV
LABELV $646
line 1810
;1809:	case TR_SINE:
;1810:		deltaTime = ( atTime - tr->trTime ) / (float) tr->trDuration;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRFP4 4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 1811
;1811:		phase = cos( deltaTime * M_PI * 2 );	// derivative of sin = cos
CNSTF4 1073741824
CNSTF4 1078530011
ADDRLP4 4
INDIRF4
MULF4
MULF4
ARGF4
ADDRLP4 28
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 28
INDIRF4
ASGNF4
line 1812
;1812:		phase *= 0.5;
ADDRLP4 0
CNSTF4 1056964608
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 1813
;1813:		VectorScale( tr->trDelta, phase, result );
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 1814
;1814:		break;
ADDRGP4 $642
JUMPV
LABELV $647
line 1816
;1815:	case TR_LINEAR_STOP:
;1816:		if ( atTime > tr->trTime + tr->trDuration ) {
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDI4
LEI4 $648
line 1817
;1817:			VectorClear( result );
ADDRLP4 36
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 40
CNSTF4 0
ASGNF4
ADDRLP4 36
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 36
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 36
INDIRP4
ADDRLP4 40
INDIRF4
ASGNF4
line 1818
;1818:			return;
ADDRGP4 $640
JUMPV
LABELV $648
line 1820
;1819:		}
;1820:		VectorCopy( tr->trDelta, result );
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1821
;1821:		break;
ADDRGP4 $642
JUMPV
LABELV $650
line 1823
;1822:	case TR_GRAVITY:
;1823:		deltaTime = ( atTime - tr->trTime ) * 0.001;	// milliseconds to seconds
ADDRLP4 4
CNSTF4 981668463
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
ASGNF4
line 1824
;1824:		VectorCopy( tr->trDelta, result );
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1825
;1825:		result[2] -= DEFAULT_GRAVITY * deltaTime;		// FIXME: local gravity...
ADDRLP4 36
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
CNSTF4 1145569280
ADDRLP4 4
INDIRF4
MULF4
SUBF4
ASGNF4
line 1826
;1826:		break;
ADDRGP4 $642
JUMPV
LABELV $641
line 1828
;1827:	default:
;1828:		Com_Error( ERR_DROP, "BG_EvaluateTrajectoryDelta: unknown trType: %i", tr->trTime );
CNSTI4 1
ARGI4
ADDRGP4 $651
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_Error
CALLV
pop
line 1829
;1829:		break;
LABELV $642
line 1831
;1830:	}
;1831:}
LABELV $640
endproc BG_EvaluateTrajectoryDelta 44 12
data
export eventnames
align 4
LABELV eventnames
address $653
address $654
address $655
address $656
address $657
address $658
address $659
address $660
address $661
address $662
address $663
address $664
address $665
address $666
address $667
address $668
address $669
address $670
address $671
address $672
address $673
address $674
address $675
address $676
address $677
address $678
address $679
address $680
address $681
address $682
address $683
address $684
address $685
address $686
address $687
address $688
address $689
address $690
address $691
address $692
address $693
address $694
address $695
address $696
address $697
address $698
address $699
address $700
address $701
address $702
address $703
address $704
address $705
address $706
address $707
address $708
address $709
address $710
address $711
address $712
address $713
address $714
address $715
address $716
address $717
address $718
address $719
address $720
address $721
address $722
address $723
address $724
address $725
address $726
address $727
address $728
address $729
address $730
address $731
address $732
address $733
address $734
address $735
address $736
address $737
address $738
address $739
address $740
address $741
address $742
address $743
address $744
address $745
address $746
address $747
address $748
address $749
address $750
address $751
address $752
address $753
address $754
address $755
address $756
address $757
address $758
address $759
address $760
address $761
address $762
export BG_AddPredictableEventToPlayerstate
code
proc BG_AddPredictableEventToPlayerstate 12 0
line 1994
;1832:
;1833:char *eventnames[] = {
;1834:	"EV_NONE",
;1835:
;1836:	"EV_CLIENTJOIN",
;1837:
;1838:	"EV_FOOTSTEP",
;1839:	"EV_FOOTSTEP_METAL",
;1840:	"EV_FOOTSPLASH",
;1841:	"EV_FOOTWADE",
;1842:	"EV_SWIM",
;1843:
;1844:	"EV_STEP_4",
;1845:	"EV_STEP_8",
;1846:	"EV_STEP_12",
;1847:	"EV_STEP_16",
;1848:
;1849:	"EV_FALL",
;1850:
;1851:	"EV_JUMP_PAD",			// boing sound at origin", jump sound on player
;1852:
;1853:	"EV_PRIVATE_DUEL",
;1854:
;1855:	"EV_JUMP",
;1856:	"EV_ROLL",
;1857:	"EV_WATER_TOUCH",	// foot touches
;1858:	"EV_WATER_LEAVE",	// foot leaves
;1859:	"EV_WATER_UNDER",	// head touches
;1860:	"EV_WATER_CLEAR",	// head leaves
;1861:
;1862:	"EV_ITEM_PICKUP",			// normal item pickups are predictable
;1863:	"EV_GLOBAL_ITEM_PICKUP",	// powerup / team sounds are broadcast to everyone
;1864:
;1865:	"EV_NOAMMO",
;1866:	"EV_CHANGE_WEAPON",
;1867:	"EV_FIRE_WEAPON",
;1868:	"EV_ALT_FIRE",
;1869:	"EV_SABER_ATTACK",
;1870:	"EV_SABER_HIT",
;1871:	"EV_SABER_BLOCK",
;1872:	"EV_SABER_UNHOLSTER",
;1873:	"EV_BECOME_JEDIMASTER",
;1874:	"EV_DISRUPTOR_MAIN_SHOT",
;1875:	"EV_DISRUPTOR_SNIPER_SHOT",
;1876:	"EV_DISRUPTOR_SNIPER_MISS",
;1877:	"EV_DISRUPTOR_HIT",
;1878:	"EV_DISRUPTOR_ZOOMSOUND",
;1879:
;1880:	"EV_PREDEFSOUND",
;1881:
;1882:	"EV_TEAM_POWER",
;1883:
;1884:	"EV_SCREENSHAKE",
;1885:
;1886:	"EV_USE",			// +Use key
;1887:
;1888:	"EV_USE_ITEM0",
;1889:	"EV_USE_ITEM1",
;1890:	"EV_USE_ITEM2",
;1891:	"EV_USE_ITEM3",
;1892:	"EV_USE_ITEM4",
;1893:	"EV_USE_ITEM5",
;1894:	"EV_USE_ITEM6",
;1895:	"EV_USE_ITEM7",
;1896:	"EV_USE_ITEM8",
;1897:	"EV_USE_ITEM9",
;1898:	"EV_USE_ITEM10",
;1899:	"EV_USE_ITEM11",
;1900:	"EV_USE_ITEM12",
;1901:	"EV_USE_ITEM13",
;1902:	"EV_USE_ITEM14",
;1903:	"EV_USE_ITEM15",
;1904:
;1905:	"EV_ITEMUSEFAIL",
;1906:
;1907:	"EV_ITEM_RESPAWN",
;1908:	"EV_ITEM_POP",
;1909:	"EV_PLAYER_TELEPORT_IN",
;1910:	"EV_PLAYER_TELEPORT_OUT",
;1911:
;1912:	"EV_GRENADE_BOUNCE",		// eventParm will be the soundindex
;1913:	"EV_MISSILE_STICK",
;1914:
;1915:	"EV_PLAY_EFFECT",
;1916:	"EV_PLAY_EFFECT_ID", //finally gave in and added it..
;1917:
;1918:	"EV_MUTE_SOUND",
;1919:	"EV_GENERAL_SOUND",
;1920:	"EV_GLOBAL_SOUND",		// no attenuation
;1921:	"EV_GLOBAL_TEAM_SOUND",
;1922:	"EV_ENTITY_SOUND",
;1923:
;1924:	"EV_PLAY_ROFF",
;1925:
;1926:	"EV_GLASS_SHATTER",
;1927:	"EV_DEBRIS",
;1928:
;1929:	"EV_MISSILE_HIT",
;1930:	"EV_MISSILE_MISS",
;1931:	"EV_MISSILE_MISS_METAL",
;1932:	"EV_BULLET",				// otherEntity is the shooter
;1933:
;1934:	"EV_PAIN",
;1935:	"EV_DEATH1",
;1936:	"EV_DEATH2",
;1937:	"EV_DEATH3",
;1938:	"EV_OBITUARY",
;1939:
;1940:	"EV_POWERUP_QUAD",
;1941:	"EV_POWERUP_BATTLESUIT",
;1942:	//"EV_POWERUP_REGEN",
;1943:
;1944:	"EV_FORCE_DRAINED",
;1945:
;1946:	"EV_GIB_PLAYER",			// gib a previously living player
;1947:	"EV_SCOREPLUM",			// score plum
;1948:
;1949:	"EV_CTFMESSAGE",
;1950:
;1951:	"EV_SAGA_ROUNDOVER",
;1952:	"EV_SAGA_OBJECTIVECOMPLETE",
;1953:
;1954:	"EV_DESTROY_GHOUL2_INSTANCE",
;1955:
;1956:	"EV_DESTROY_WEAPON_MODEL",
;1957:
;1958:	"EV_GIVE_NEW_RANK",
;1959:	"EV_SET_FREE_SABER",
;1960:	"EV_SET_FORCE_DISABLE",
;1961:
;1962:	"EV_WEAPON_CHARGE",
;1963:	"EV_WEAPON_CHARGE_ALT",
;1964:
;1965:	"EV_SHIELD_HIT",
;1966:
;1967:	"EV_DEBUG_LINE",
;1968:	"EV_TESTLINE",
;1969:	"EV_STOPLOOPINGSOUND",
;1970:	"EV_STARTLOOPINGSOUND",
;1971:	"EV_TAUNT",
;1972:
;1973:	"EV_TAUNT_YES",
;1974:	"EV_TAUNT_NO",
;1975:	"EV_TAUNT_FOLLOWME",
;1976:	"EV_TAUNT_GETFLAG",
;1977:	"EV_TAUNT_GUARDBASE",
;1978:	"EV_TAUNT_PATROL",
;1979:
;1980:	"EV_BODY_QUEUE_COPY"
;1981:
;1982:};
;1983:
;1984:/*
;1985:===============
;1986:BG_AddPredictableEventToPlayerstate
;1987:
;1988:Handles the sequence numbers
;1989:===============
;1990:*/
;1991:
;1992:void	trap_Cvar_VariableStringBuffer( const char *var_name, char *buffer, int bufsize );
;1993:
;1994:void BG_AddPredictableEventToPlayerstate( int newEvent, int eventParm, playerState_t *ps ) {
line 2009
;1995:
;1996:#ifdef _DEBUG
;1997:	{
;1998:		char buf[256];
;1999:		trap_Cvar_VariableStringBuffer("showevents", buf, sizeof(buf));
;2000:		if ( atof(buf) != 0 ) {
;2001:#ifdef QAGAME
;2002:			Com_Printf(" game event svt %5d -> %5d: num = %20s parm %d\n", ps->pmove_framecount/*ps->commandTime*/, ps->eventSequence, eventnames[newEvent], eventParm);
;2003:#else
;2004:			Com_Printf("Cgame event svt %5d -> %5d: num = %20s parm %d\n", ps->pmove_framecount/*ps->commandTime*/, ps->eventSequence, eventnames[newEvent], eventParm);
;2005:#endif
;2006:		}
;2007:	}
;2008:#endif
;2009:	ps->events[ps->eventSequence & (MAX_PS_EVENTS-1)] = newEvent;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 2010
;2010:	ps->eventParms[ps->eventSequence & (MAX_PS_EVENTS-1)] = eventParm;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 124
ADDP4
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 2011
;2011:	ps->eventSequence++;
ADDRLP4 8
ADDRFP4 8
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2012
;2012:}
LABELV $763
endproc BG_AddPredictableEventToPlayerstate 12 0
export BG_TouchJumpPad
proc BG_TouchJumpPad 32 8
line 2019
;2013:
;2014:/*
;2015:========================
;2016:BG_TouchJumpPad
;2017:========================
;2018:*/
;2019:void BG_TouchJumpPad( playerState_t *ps, entityState_t *jumppad ) {
line 2025
;2020:	vec3_t	angles;
;2021:	float p;
;2022:	int effectNum;
;2023:
;2024:	// spectators don't use jump pads
;2025:	if ( ps->pm_type != PM_NORMAL && ps->pm_type != PM_FLOAT ) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $765
ADDRLP4 20
INDIRI4
CNSTI4 1
EQI4 $765
line 2026
;2026:		return;
ADDRGP4 $764
JUMPV
LABELV $765
line 2031
;2027:	}
;2028:
;2029:	// if we didn't hit this same jumppad the previous frame
;2030:	// then don't play the event sound again if we are in a fat trigger
;2031:	if ( ps->jumppad_ent != jumppad->number ) {
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
EQI4 $767
line 2033
;2032:
;2033:		vectoangles( jumppad->origin2, angles);
ADDRFP4 4
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2034
;2034:		p = fabs( AngleNormalize180( angles[PITCH] ) );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleNormalize180
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 28
INDIRF4
ASGNF4
line 2035
;2035:		if( p < 45 ) {
ADDRLP4 12
INDIRF4
CNSTF4 1110704128
GEF4 $769
line 2036
;2036:			effectNum = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 2037
;2037:		} else {
ADDRGP4 $770
JUMPV
LABELV $769
line 2038
;2038:			effectNum = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 2039
;2039:		}
LABELV $770
line 2040
;2040:	}
LABELV $767
line 2042
;2041:	// remember hitting this jumppad this frame
;2042:	ps->jumppad_ent = jumppad->number;
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 2043
;2043:	ps->jumppad_frame = ps->pmove_framecount;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 492
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
ASGNI4
line 2045
;2044:	// give the player the velocity from the jumppad
;2045:	VectorCopy( jumppad->origin2, ps->velocity );
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 2046
;2046:}
LABELV $764
endproc BG_TouchJumpPad 32 8
export BG_PlayerStateToEntityState
proc BG_PlayerStateToEntityState 28 0
line 2056
;2047:
;2048:/*
;2049:========================
;2050:BG_PlayerStateToEntityState
;2051:
;2052:This is done after each set of usercmd_t on the server,
;2053:and after local prediction on the client
;2054:========================
;2055:*/
;2056:void BG_PlayerStateToEntityState( playerState_t *ps, entityState_t *s, qboolean snap ) {
line 2059
;2057:	int		i;
;2058:
;2059:	if ( ps->pm_type == PM_INTERMISSION || ps->pm_type == PM_SPECTATOR ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 6
EQI4 $774
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $772
LABELV $774
line 2060
;2060:		s->eType = ET_INVISIBLE;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 12
ASGNI4
line 2061
;2061:	} else if ( ps->stats[STAT_HEALTH] <= GIB_HEALTH ) {
ADDRGP4 $773
JUMPV
LABELV $772
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $775
line 2062
;2062:		s->eType = ET_INVISIBLE;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 12
ASGNI4
line 2063
;2063:	} else {
ADDRGP4 $776
JUMPV
LABELV $775
line 2064
;2064:		s->eType = ET_PLAYER;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
line 2065
;2065:	}
LABELV $776
LABELV $773
line 2067
;2066:
;2067:	s->number = ps->clientNum;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 2069
;2068:
;2069:	s->pos.trType = TR_INTERPOLATE;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 1
ASGNI4
line 2070
;2070:	VectorCopy( ps->origin, s->pos.trBase );
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2071
;2071:	if ( snap ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $777
line 2072
;2072:		SnapVector( s->pos.trBase );
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 2073
;2073:	}
LABELV $777
line 2075
;2074:	// set the trDelta for flag direction
;2075:	VectorCopy( ps->velocity, s->pos.trDelta );
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 2077
;2076:
;2077:	s->apos.trType = TR_INTERPOLATE;
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 1
ASGNI4
line 2078
;2078:	VectorCopy( ps->viewangles, s->apos.trBase );
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 2079
;2079:	if ( snap ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $779
line 2080
;2080:		SnapVector( s->apos.trBase );
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 2081
;2081:	}
LABELV $779
line 2083
;2082:
;2083:	s->trickedentindex = ps->fd.forceMindtrickTargetIndex;
ADDRFP4 4
INDIRP4
CNSTI4 148
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1156
ADDP4
INDIRI4
ASGNI4
line 2084
;2084:	s->trickedentindex2 = ps->fd.forceMindtrickTargetIndex2;
ADDRFP4 4
INDIRP4
CNSTI4 152
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1160
ADDP4
INDIRI4
ASGNI4
line 2085
;2085:	s->trickedentindex3 = ps->fd.forceMindtrickTargetIndex3;
ADDRFP4 4
INDIRP4
CNSTI4 156
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1164
ADDP4
INDIRI4
ASGNI4
line 2086
;2086:	s->trickedentindex4 = ps->fd.forceMindtrickTargetIndex4;
ADDRFP4 4
INDIRP4
CNSTI4 160
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1168
ADDP4
INDIRI4
ASGNI4
line 2088
;2087:
;2088:	s->forceFrame = ps->saberLockFrame;
ADDRFP4 4
INDIRP4
CNSTI4 288
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ASGNI4
line 2090
;2089:
;2090:	s->emplacedOwner = ps->electrifyTime;
ADDRFP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ASGNI4
line 2092
;2091:
;2092:	s->speed = ps->speed;
ADDRFP4 4
INDIRP4
CNSTI4 164
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2094
;2093:
;2094:	s->genericenemyindex = ps->genericEnemyIndex;
ADDRFP4 4
INDIRP4
CNSTI4 172
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ASGNI4
line 2096
;2095:
;2096:	s->activeForcePass = ps->activeForcePass;
ADDRFP4 4
INDIRP4
CNSTI4 176
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
ASGNI4
line 2098
;2097:
;2098:	s->angles2[YAW] = ps->movementDir;
ADDRFP4 4
INDIRP4
CNSTI4 132
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2099
;2099:	s->legsAnim = ps->legsAnim;
ADDRFP4 4
INDIRP4
CNSTI4 280
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ASGNI4
line 2100
;2100:	s->torsoAnim = ps->torsoAnim;
ADDRFP4 4
INDIRP4
CNSTI4 284
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
line 2101
;2101:	s->clientNum = ps->clientNum;		// ET_PLAYER looks here instead of at number
ADDRFP4 4
INDIRP4
CNSTI4 220
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 2103
;2102:										// so corpses can also reference the proper config
;2103:	s->eFlags = ps->eFlags;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 2105
;2104:
;2105:	s->saberInFlight = ps->saberInFlight;
ADDRFP4 4
INDIRP4
CNSTI4 228
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
ASGNI4
line 2106
;2106:	s->saberEntityNum = ps->saberEntityNum;
ADDRFP4 4
INDIRP4
CNSTI4 232
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ASGNI4
line 2107
;2107:	s->saberMove = ps->saberMove;
ADDRFP4 4
INDIRP4
CNSTI4 236
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 2108
;2108:	s->forcePowersActive = ps->fd.forcePowersActive;
ADDRFP4 4
INDIRP4
CNSTI4 240
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
ASGNI4
line 2110
;2109:
;2110:	if (ps->duelInProgress)
ADDRFP4 0
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $781
line 2111
;2111:	{
line 2112
;2112:		s->bolt1 = 1;
ADDRFP4 4
INDIRP4
CNSTI4 140
ADDP4
CNSTI4 1
ASGNI4
line 2113
;2113:	}
ADDRGP4 $782
JUMPV
LABELV $781
line 2115
;2114:	else
;2115:	{
line 2116
;2116:		s->bolt1 = 0;
ADDRFP4 4
INDIRP4
CNSTI4 140
ADDP4
CNSTI4 0
ASGNI4
line 2117
;2117:	}
LABELV $782
line 2119
;2118:
;2119:	if (ps->dualBlade)
ADDRFP4 0
INDIRP4
CNSTI4 1364
ADDP4
INDIRI4
CNSTI4 0
EQI4 $783
line 2120
;2120:	{
line 2121
;2121:		s->bolt2 = 1;
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1
ASGNI4
line 2122
;2122:	}
ADDRGP4 $784
JUMPV
LABELV $783
line 2124
;2123:	else
;2124:	{
line 2125
;2125:		s->bolt2 = 0;
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 0
ASGNI4
line 2126
;2126:	}
LABELV $784
line 2128
;2127:
;2128:	s->otherEntityNum2 = ps->emplacedIndex;
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
ASGNI4
line 2130
;2129:
;2130:	s->shouldtarget = ps->saberHolstered; //reuse bool in entitystate for players differently
ADDRFP4 4
INDIRP4
CNSTI4 268
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
ASGNI4
line 2131
;2131:	s->teamowner = ps->usingATST;
ADDRFP4 4
INDIRP4
CNSTI4 264
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
ASGNI4
line 2133
;2132:
;2133:	if (ps->genericEnemyIndex != -1)
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $785
line 2134
;2134:	{
line 2135
;2135:		s->eFlags |= EF_SEEKERDRONE;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1048576
BORI4
ASGNI4
line 2136
;2136:	}
LABELV $785
line 2138
;2137:
;2138:	if ( ps->stats[STAT_HEALTH] <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $787
line 2139
;2139:		s->eFlags |= EF_DEAD;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 2140
;2140:	} else {
ADDRGP4 $788
JUMPV
LABELV $787
line 2141
;2141:		s->eFlags &= ~EF_DEAD;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 2142
;2142:	}
LABELV $788
line 2144
;2143:
;2144:	if ( ps->externalEvent ) {
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
CNSTI4 0
EQI4 $789
line 2145
;2145:		s->event = ps->externalEvent;
ADDRFP4 4
INDIRP4
CNSTI4 252
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
ASGNI4
line 2146
;2146:		s->eventParm = ps->externalEventParm;
ADDRFP4 4
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 136
ADDP4
INDIRI4
ASGNI4
line 2147
;2147:	} else if ( ps->entityEventSequence < ps->eventSequence ) {
ADDRGP4 $790
JUMPV
LABELV $789
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
GEI4 $791
line 2150
;2148:		int		seq;
;2149:
;2150:		if ( ps->entityEventSequence < ps->eventSequence - MAX_PS_EVENTS) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 2
SUBI4
GEI4 $793
line 2151
;2151:			ps->entityEventSequence = ps->eventSequence - MAX_PS_EVENTS;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 2152
;2152:		}
LABELV $793
line 2153
;2153:		seq = ps->entityEventSequence & (MAX_PS_EVENTS-1);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 2154
;2154:		s->event = ps->events[ seq ] | ( ( ps->entityEventSequence & 3 ) << 8 );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 252
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
CNSTI4 116
ADDP4
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 8
LSHI4
BORI4
ASGNI4
line 2155
;2155:		s->eventParm = ps->eventParms[ seq ];
ADDRFP4 4
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
ADDP4
INDIRI4
ASGNI4
line 2156
;2156:		ps->entityEventSequence++;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2157
;2157:	}
LABELV $791
LABELV $790
line 2160
;2158:
;2159:
;2160:	s->weapon = ps->weapon;
ADDRFP4 4
INDIRP4
CNSTI4 276
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
line 2161
;2161:	s->groundEntityNum = ps->groundEntityNum;
ADDRFP4 4
INDIRP4
CNSTI4 192
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ASGNI4
line 2163
;2162:
;2163:	s->powerups = 0;
ADDRFP4 4
INDIRP4
CNSTI4 272
ADDP4
CNSTI4 0
ASGNI4
line 2164
;2164:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $795
line 2165
;2165:		if ( ps->powerups[ i ] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $799
line 2166
;2166:			s->powerups |= 1 << i;
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 272
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 2167
;2167:		}
LABELV $799
line 2168
;2168:	}
LABELV $796
line 2164
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $795
line 2170
;2169:
;2170:	s->loopSound = ps->loopSound;
ADDRFP4 4
INDIRP4
CNSTI4 200
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
ASGNI4
line 2171
;2171:	s->generic1 = ps->generic1;
ADDRFP4 4
INDIRP4
CNSTI4 292
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
ASGNI4
line 2174
;2172:
;2173:	//NOT INCLUDED IN ENTITYSTATETOPLAYERSTATE:
;2174:	s->modelindex2 = ps->weaponstate;
ADDRFP4 4
INDIRP4
CNSTI4 216
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ASGNI4
line 2175
;2175:	s->constantLight = ps->weaponChargeTime;
ADDRFP4 4
INDIRP4
CNSTI4 196
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ASGNI4
line 2177
;2176:
;2177:	VectorCopy(ps->lastHitLoc, s->origin2);
ADDRFP4 4
INDIRP4
CNSTI4 104
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1368
ADDP4
INDIRB
ASGNB 12
line 2179
;2178:
;2179:	s->isJediMaster = ps->isJediMaster;
ADDRFP4 4
INDIRP4
CNSTI4 244
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ASGNI4
line 2181
;2180:
;2181:	s->time2 = ps->holocronBits;
ADDRFP4 4
INDIRP4
CNSTI4 88
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRI4
ASGNI4
line 2183
;2182:
;2183:	s->fireflag = ps->fd.saberAnimLevel;
ADDRFP4 4
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ASGNI4
line 2184
;2184:}
LABELV $771
endproc BG_PlayerStateToEntityState 28 0
export BG_PlayerStateToEntityStateExtraPolate
proc BG_PlayerStateToEntityStateExtraPolate 28 0
line 2194
;2185:
;2186:/*
;2187:========================
;2188:BG_PlayerStateToEntityStateExtraPolate
;2189:
;2190:This is done after each set of usercmd_t on the server,
;2191:and after local prediction on the client
;2192:========================
;2193:*/
;2194:void BG_PlayerStateToEntityStateExtraPolate( playerState_t *ps, entityState_t *s, int time, qboolean snap ) {
line 2197
;2195:	int		i;
;2196:
;2197:	if ( ps->pm_type == PM_INTERMISSION || ps->pm_type == PM_SPECTATOR ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 6
EQI4 $804
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $802
LABELV $804
line 2198
;2198:		s->eType = ET_INVISIBLE;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 12
ASGNI4
line 2199
;2199:	} else if ( ps->stats[STAT_HEALTH] <= GIB_HEALTH ) {
ADDRGP4 $803
JUMPV
LABELV $802
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $805
line 2200
;2200:		s->eType = ET_INVISIBLE;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 12
ASGNI4
line 2201
;2201:	} else {
ADDRGP4 $806
JUMPV
LABELV $805
line 2202
;2202:		s->eType = ET_PLAYER;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
line 2203
;2203:	}
LABELV $806
LABELV $803
line 2205
;2204:
;2205:	s->number = ps->clientNum;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 2207
;2206:
;2207:	s->pos.trType = TR_LINEAR_STOP;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 3
ASGNI4
line 2208
;2208:	VectorCopy( ps->origin, s->pos.trBase );
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2209
;2209:	if ( snap ) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $807
line 2210
;2210:		SnapVector( s->pos.trBase );
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 2211
;2211:	}
LABELV $807
line 2213
;2212:	// set the trDelta for flag direction and linear prediction
;2213:	VectorCopy( ps->velocity, s->pos.trDelta );
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 2215
;2214:	// set the time for linear prediction
;2215:	s->pos.trTime = time;
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 2217
;2216:	// set maximum extra polation time
;2217:	s->pos.trDuration = 50; // 1000 / sv_fps (default = 20)
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 50
ASGNI4
line 2219
;2218:
;2219:	s->apos.trType = TR_INTERPOLATE;
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 1
ASGNI4
line 2220
;2220:	VectorCopy( ps->viewangles, s->apos.trBase );
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 2221
;2221:	if ( snap ) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $809
line 2222
;2222:		SnapVector( s->apos.trBase );
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 2223
;2223:	}
LABELV $809
line 2225
;2224:
;2225:	s->trickedentindex = ps->fd.forceMindtrickTargetIndex;
ADDRFP4 4
INDIRP4
CNSTI4 148
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1156
ADDP4
INDIRI4
ASGNI4
line 2226
;2226:	s->trickedentindex2 = ps->fd.forceMindtrickTargetIndex2;
ADDRFP4 4
INDIRP4
CNSTI4 152
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1160
ADDP4
INDIRI4
ASGNI4
line 2227
;2227:	s->trickedentindex3 = ps->fd.forceMindtrickTargetIndex3;
ADDRFP4 4
INDIRP4
CNSTI4 156
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1164
ADDP4
INDIRI4
ASGNI4
line 2228
;2228:	s->trickedentindex4 = ps->fd.forceMindtrickTargetIndex4;
ADDRFP4 4
INDIRP4
CNSTI4 160
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1168
ADDP4
INDIRI4
ASGNI4
line 2230
;2229:
;2230:	s->forceFrame = ps->saberLockFrame;
ADDRFP4 4
INDIRP4
CNSTI4 288
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ASGNI4
line 2232
;2231:
;2232:	s->emplacedOwner = ps->electrifyTime;
ADDRFP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ASGNI4
line 2234
;2233:
;2234:	s->speed = ps->speed;
ADDRFP4 4
INDIRP4
CNSTI4 164
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2236
;2235:
;2236:	s->genericenemyindex = ps->genericEnemyIndex;
ADDRFP4 4
INDIRP4
CNSTI4 172
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ASGNI4
line 2238
;2237:
;2238:	s->activeForcePass = ps->activeForcePass;
ADDRFP4 4
INDIRP4
CNSTI4 176
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
ASGNI4
line 2240
;2239:
;2240:	s->angles2[YAW] = ps->movementDir;
ADDRFP4 4
INDIRP4
CNSTI4 132
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2241
;2241:	s->legsAnim = ps->legsAnim;
ADDRFP4 4
INDIRP4
CNSTI4 280
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ASGNI4
line 2242
;2242:	s->torsoAnim = ps->torsoAnim;
ADDRFP4 4
INDIRP4
CNSTI4 284
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
line 2243
;2243:	s->clientNum = ps->clientNum;		// ET_PLAYER looks here instead of at number
ADDRFP4 4
INDIRP4
CNSTI4 220
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 2245
;2244:										// so corpses can also reference the proper config
;2245:	s->eFlags = ps->eFlags;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 2247
;2246:
;2247:	s->saberInFlight = ps->saberInFlight;
ADDRFP4 4
INDIRP4
CNSTI4 228
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
ASGNI4
line 2248
;2248:	s->saberEntityNum = ps->saberEntityNum;
ADDRFP4 4
INDIRP4
CNSTI4 232
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ASGNI4
line 2249
;2249:	s->saberMove = ps->saberMove;
ADDRFP4 4
INDIRP4
CNSTI4 236
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 2250
;2250:	s->forcePowersActive = ps->fd.forcePowersActive;
ADDRFP4 4
INDIRP4
CNSTI4 240
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
ASGNI4
line 2252
;2251:
;2252:	if (ps->duelInProgress)
ADDRFP4 0
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $811
line 2253
;2253:	{
line 2254
;2254:		s->bolt1 = 1;
ADDRFP4 4
INDIRP4
CNSTI4 140
ADDP4
CNSTI4 1
ASGNI4
line 2255
;2255:	}
ADDRGP4 $812
JUMPV
LABELV $811
line 2257
;2256:	else
;2257:	{
line 2258
;2258:		s->bolt1 = 0;
ADDRFP4 4
INDIRP4
CNSTI4 140
ADDP4
CNSTI4 0
ASGNI4
line 2259
;2259:	}
LABELV $812
line 2261
;2260:
;2261:	if (ps->dualBlade)
ADDRFP4 0
INDIRP4
CNSTI4 1364
ADDP4
INDIRI4
CNSTI4 0
EQI4 $813
line 2262
;2262:	{
line 2263
;2263:		s->bolt2 = 1;
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1
ASGNI4
line 2264
;2264:	}
ADDRGP4 $814
JUMPV
LABELV $813
line 2266
;2265:	else
;2266:	{
line 2267
;2267:		s->bolt2 = 0;
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 0
ASGNI4
line 2268
;2268:	}
LABELV $814
line 2270
;2269:
;2270:	s->otherEntityNum2 = ps->emplacedIndex;
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
ASGNI4
line 2272
;2271:
;2272:	s->shouldtarget = ps->saberHolstered; //reuse bool in entitystate for players differently
ADDRFP4 4
INDIRP4
CNSTI4 268
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
ASGNI4
line 2273
;2273:	s->teamowner = ps->usingATST;
ADDRFP4 4
INDIRP4
CNSTI4 264
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
ASGNI4
line 2275
;2274:
;2275:	if (ps->genericEnemyIndex != -1)
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $815
line 2276
;2276:	{
line 2277
;2277:		s->eFlags |= EF_SEEKERDRONE;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1048576
BORI4
ASGNI4
line 2278
;2278:	}
LABELV $815
line 2280
;2279:
;2280:	if ( ps->stats[STAT_HEALTH] <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $817
line 2281
;2281:		s->eFlags |= EF_DEAD;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 2282
;2282:	} else {
ADDRGP4 $818
JUMPV
LABELV $817
line 2283
;2283:		s->eFlags &= ~EF_DEAD;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 2284
;2284:	}
LABELV $818
line 2286
;2285:
;2286:	if ( ps->externalEvent ) {
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
CNSTI4 0
EQI4 $819
line 2287
;2287:		s->event = ps->externalEvent;
ADDRFP4 4
INDIRP4
CNSTI4 252
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
ASGNI4
line 2288
;2288:		s->eventParm = ps->externalEventParm;
ADDRFP4 4
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 136
ADDP4
INDIRI4
ASGNI4
line 2289
;2289:	} else if ( ps->entityEventSequence < ps->eventSequence ) {
ADDRGP4 $820
JUMPV
LABELV $819
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
GEI4 $821
line 2292
;2290:		int		seq;
;2291:
;2292:		if ( ps->entityEventSequence < ps->eventSequence - MAX_PS_EVENTS) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 2
SUBI4
GEI4 $823
line 2293
;2293:			ps->entityEventSequence = ps->eventSequence - MAX_PS_EVENTS;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 2294
;2294:		}
LABELV $823
line 2295
;2295:		seq = ps->entityEventSequence & (MAX_PS_EVENTS-1);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 2296
;2296:		s->event = ps->events[ seq ] | ( ( ps->entityEventSequence & 3 ) << 8 );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 252
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
CNSTI4 116
ADDP4
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 8
LSHI4
BORI4
ASGNI4
line 2297
;2297:		s->eventParm = ps->eventParms[ seq ];
ADDRFP4 4
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
ADDP4
INDIRI4
ASGNI4
line 2298
;2298:		ps->entityEventSequence++;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2299
;2299:	}
LABELV $821
LABELV $820
line 2300
;2300:	s->weapon = ps->weapon;
ADDRFP4 4
INDIRP4
CNSTI4 276
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
line 2301
;2301:	s->groundEntityNum = ps->groundEntityNum;
ADDRFP4 4
INDIRP4
CNSTI4 192
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ASGNI4
line 2303
;2302:
;2303:	s->powerups = 0;
ADDRFP4 4
INDIRP4
CNSTI4 272
ADDP4
CNSTI4 0
ASGNI4
line 2304
;2304:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $825
line 2305
;2305:		if ( ps->powerups[ i ] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $829
line 2306
;2306:			s->powerups |= 1 << i;
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 272
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 2307
;2307:		}
LABELV $829
line 2308
;2308:	}
LABELV $826
line 2304
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $825
line 2310
;2309:
;2310:	s->loopSound = ps->loopSound;
ADDRFP4 4
INDIRP4
CNSTI4 200
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
ASGNI4
line 2311
;2311:	s->generic1 = ps->generic1;
ADDRFP4 4
INDIRP4
CNSTI4 292
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
ASGNI4
line 2314
;2312:
;2313:	//NOT INCLUDED IN ENTITYSTATETOPLAYERSTATE:
;2314:	s->modelindex2 = ps->weaponstate;
ADDRFP4 4
INDIRP4
CNSTI4 216
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ASGNI4
line 2315
;2315:	s->constantLight = ps->weaponChargeTime;
ADDRFP4 4
INDIRP4
CNSTI4 196
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ASGNI4
line 2317
;2316:
;2317:	VectorCopy(ps->lastHitLoc, s->origin2);
ADDRFP4 4
INDIRP4
CNSTI4 104
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1368
ADDP4
INDIRB
ASGNB 12
line 2319
;2318:
;2319:	s->isJediMaster = ps->isJediMaster;
ADDRFP4 4
INDIRP4
CNSTI4 244
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ASGNI4
line 2321
;2320:
;2321:	s->time2 = ps->holocronBits;
ADDRFP4 4
INDIRP4
CNSTI4 88
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRI4
ASGNI4
line 2323
;2322:
;2323:	s->fireflag = ps->fd.saberAnimLevel;
ADDRFP4 4
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ASGNI4
line 2324
;2324:}
LABELV $801
endproc BG_PlayerStateToEntityStateExtraPolate 28 0
data
align 4
LABELV bg_poolSize
byte 4 0
align 4
LABELV bg_poolTail
byte 4 2048000
export BG_Alloc
code
proc BG_Alloc 8 16
line 2340
;2325:
;2326:/*
;2327:=============================================================================
;2328:
;2329:PLAYER ANGLES
;2330:
;2331:=============================================================================
;2332:*/
;2333:#define MAX_POOL_SIZE	2048000 //1024000
;2334:
;2335:static char		bg_pool[MAX_POOL_SIZE];
;2336:static int		bg_poolSize = 0;
;2337:static int		bg_poolTail = MAX_POOL_SIZE;
;2338:
;2339:void *BG_Alloc ( int size )
;2340:{
line 2341
;2341:	bg_poolSize = ((bg_poolSize + 0x00000003) & 0xfffffffc);
ADDRLP4 0
ADDRGP4 bg_poolSize
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 3
ADDI4
CVIU4 4
CNSTU4 4294967292
BANDU4
CVUI4 4
ASGNI4
line 2343
;2342:
;2343:	if (bg_poolSize + size > bg_poolTail)
ADDRGP4 bg_poolSize
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ADDRGP4 bg_poolTail
INDIRI4
LEI4 $832
line 2344
;2344:	{
line 2345
;2345:		Com_Error( ERR_DROP, "BG_Alloc: buffer exceeded tail (%d > %d)", bg_poolSize + size, bg_poolTail);
CNSTI4 1
ARGI4
ADDRGP4 $834
ARGP4
ADDRGP4 bg_poolSize
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ARGI4
ADDRGP4 bg_poolTail
INDIRI4
ARGI4
ADDRGP4 Com_Error
CALLV
pop
line 2346
;2346:		return 0;
CNSTP4 0
RETP4
ADDRGP4 $831
JUMPV
LABELV $832
line 2349
;2347:	}
;2348:
;2349:	bg_poolSize += size;
ADDRLP4 4
ADDRGP4 bg_poolSize
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ASGNI4
line 2351
;2350:
;2351:	return &bg_pool[bg_poolSize-size];
ADDRGP4 bg_poolSize
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
ADDRGP4 bg_pool
ADDP4
RETP4
LABELV $831
endproc BG_Alloc 8 16
export BG_AllocUnaligned
proc BG_AllocUnaligned 4 16
line 2355
;2352:}
;2353:
;2354:void *BG_AllocUnaligned ( int size )
;2355:{
line 2356
;2356:	if (bg_poolSize + size > bg_poolTail)
ADDRGP4 bg_poolSize
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ADDRGP4 bg_poolTail
INDIRI4
LEI4 $836
line 2357
;2357:	{
line 2358
;2358:		Com_Error( ERR_DROP, "BG_AllocUnaligned: buffer exceeded tail (%d > %d)", bg_poolSize + size, bg_poolTail);
CNSTI4 1
ARGI4
ADDRGP4 $838
ARGP4
ADDRGP4 bg_poolSize
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ARGI4
ADDRGP4 bg_poolTail
INDIRI4
ARGI4
ADDRGP4 Com_Error
CALLV
pop
line 2359
;2359:		return 0;
CNSTP4 0
RETP4
ADDRGP4 $835
JUMPV
LABELV $836
line 2362
;2360:	}
;2361:
;2362:	bg_poolSize += size;
ADDRLP4 0
ADDRGP4 bg_poolSize
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ASGNI4
line 2364
;2363:
;2364:	return &bg_pool[bg_poolSize-size];
ADDRGP4 bg_poolSize
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
ADDRGP4 bg_pool
ADDP4
RETP4
LABELV $835
endproc BG_AllocUnaligned 4 16
export BG_TempAlloc
proc BG_TempAlloc 4 16
line 2368
;2365:}
;2366:
;2367:void *BG_TempAlloc( int size )
;2368:{
line 2369
;2369:	size = ((size + 0x00000003) & 0xfffffffc);
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 3
ADDI4
CVIU4 4
CNSTU4 4294967292
BANDU4
CVUI4 4
ASGNI4
line 2371
;2370:
;2371:	if (bg_poolTail - size < bg_poolSize)
ADDRGP4 bg_poolTail
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
ADDRGP4 bg_poolSize
INDIRI4
GEI4 $840
line 2372
;2372:	{
line 2373
;2373:		Com_Error( ERR_DROP, "BG_TempAlloc: buffer exceeded head (%d > %d)", bg_poolTail - size, bg_poolSize);
CNSTI4 1
ARGI4
ADDRGP4 $842
ARGP4
ADDRGP4 bg_poolTail
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
ARGI4
ADDRGP4 bg_poolSize
INDIRI4
ARGI4
ADDRGP4 Com_Error
CALLV
pop
line 2374
;2374:		return 0;
CNSTP4 0
RETP4
ADDRGP4 $839
JUMPV
LABELV $840
line 2377
;2375:	}
;2376:
;2377:	bg_poolTail -= size;
ADDRLP4 0
ADDRGP4 bg_poolTail
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
ASGNI4
line 2379
;2378:
;2379:	return &bg_pool[bg_poolTail];
ADDRGP4 bg_poolTail
INDIRI4
ADDRGP4 bg_pool
ADDP4
RETP4
LABELV $839
endproc BG_TempAlloc 4 16
export BG_TempFree
proc BG_TempFree 4 16
line 2383
;2380:}
;2381:
;2382:void BG_TempFree( int size )
;2383:{
line 2384
;2384:	size = ((size + 0x00000003) & 0xfffffffc);
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 3
ADDI4
CVIU4 4
CNSTU4 4294967292
BANDU4
CVUI4 4
ASGNI4
line 2386
;2385:
;2386:	if (bg_poolTail+size > MAX_POOL_SIZE)
ADDRGP4 bg_poolTail
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
CNSTI4 2048000
LEI4 $844
line 2387
;2387:	{
line 2388
;2388:		Com_Error( ERR_DROP, "BG_TempFree: tail greater than size (%d > %d)", bg_poolTail+size, MAX_POOL_SIZE );
CNSTI4 1
ARGI4
ADDRGP4 $846
ARGP4
ADDRGP4 bg_poolTail
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ARGI4
CNSTI4 2048000
ARGI4
ADDRGP4 Com_Error
CALLV
pop
line 2389
;2389:	}
LABELV $844
line 2391
;2390:
;2391:	bg_poolTail += size;
ADDRLP4 0
ADDRGP4 bg_poolTail
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ASGNI4
line 2392
;2392:}
LABELV $843
endproc BG_TempFree 4 16
export BG_StringAlloc
proc BG_StringAlloc 12 8
line 2395
;2393:
;2394:char *BG_StringAlloc ( const char *source )
;2395:{
line 2398
;2396:	char *dest;
;2397:
;2398:	dest = BG_Alloc ( strlen ( source ) + 1 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 2399
;2399:	strcpy ( dest, source );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 2400
;2400:	return dest;
ADDRLP4 0
INDIRP4
RETP4
LABELV $847
endproc BG_StringAlloc 12 8
export BG_OutOfMemory
proc BG_OutOfMemory 4 0
line 2404
;2401:}
;2402:
;2403:qboolean BG_OutOfMemory ( void )
;2404:{
line 2405
;2405:	return bg_poolSize >= MAX_POOL_SIZE;
ADDRGP4 bg_poolSize
INDIRI4
CNSTI4 2048000
LTI4 $850
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $851
JUMPV
LABELV $850
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $851
ADDRLP4 0
INDIRI4
RETI4
LABELV $848
endproc BG_OutOfMemory 4 0
bss
align 1
LABELV bg_pool
skip 2048000
import g2WeaponInstances
import CG_CheckPlayerG2Weapons
import CG_CopyG2WeaponInstance
import CG_ShutDownG2Weapons
import CG_InitG2Weapons
import CG_CreateBBRefEnts
import CG_SetGhoul2Info
import CG_Init_CGents
import CG_Init_CG
import trap_G2API_SetNewOrigin
import trap_G2API_SetSurfaceOnOff
import trap_G2API_SetRootSurface
import trap_G2API_SetBoneAnim
import trap_G2API_GetGLAName
import trap_G2API_SetBoneAngles
import trap_G2API_CleanGhoul2Models
import trap_G2API_SetBoltInfo
import trap_G2API_AddBolt
import trap_G2API_RemoveGhoul2Model
import trap_G2API_HasGhoul2ModelOnIndex
import trap_G2API_DuplicateGhoul2Instance
import trap_G2API_CopySpecificGhoul2Model
import trap_G2API_CopyGhoul2Instance
import trap_G2API_GiveMeVectorFromMatrix
import trap_G2API_InitGhoul2Model
import trap_G2API_GetBoltMatrix_NoRecNoRot
import trap_G2API_GetBoltMatrix_NoReconstruct
import trap_G2API_GetBoltMatrix
import trap_G2_HaveWeGhoul2Models
import trap_G2_SetGhoul2ModelIndexes
import trap_G2_ListModelBones
import trap_G2_ListModelSurfaces
import trap_G2API_CollisionDetect
import FX_ForceDrained
import FX_BlasterWeaponHitPlayer
import FX_BlasterWeaponHitWall
import FX_BlasterAltFireThink
import FX_BlasterProjectileThink
import FX_BryarAltHitPlayer
import FX_BryarHitPlayer
import FX_BryarAltHitWall
import FX_BryarHitWall
import CG_Spark
import FX_TurretHitPlayer
import FX_TurretHitWall
import FX_TurretProjectileThink
import CG_NewParticleArea
import initparticles
import CG_GetStripEdString
import CG_ParticleExplosion
import CG_ParticleMisc
import CG_ParticleDust
import CG_ParticleSparks
import CG_ParticleBulletDebris
import CG_ParticleSnowFlurry
import CG_AddParticleShrapnel
import CG_ParticleSmoke
import CG_ParticleSnow
import CG_AddParticles
import CG_ClearParticles
import trap_ROFF_Purge_Ent
import trap_ROFF_Play
import trap_ROFF_Cache
import trap_ROFF_UpdateEntities
import trap_ROFF_Clean
import trap_CG_RegisterSharedMemory
import trap_SP_GetStringTextString
import trap_SP_Print
import trap_FX_AddSprite
import trap_FX_AddPrimitive
import trap_FX_AddBezier
import trap_FX_AddPoly
import trap_FX_AdjustTime
import trap_FX_FreeSystem
import trap_FX_InitSystem
import trap_FX_AddScheduledEffects
import trap_FX_PlayBoltedEffectID
import trap_FX_PlayEntityEffectID
import trap_FX_PlayEffectID
import trap_FX_PlaySimpleEffectID
import trap_FX_PlayEntityEffect
import trap_FX_PlayEffect
import trap_FX_PlaySimpleEffect
import trap_FX_RegisterEffect
import trap_R_inPVS
import trap_GetEntityToken
import trap_getCameraInfo
import trap_startCamera
import trap_loadCamera
import trap_SnapVector
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_Key_GetKey
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_IsDown
import trap_MemoryRemaining
import testPrintFloat
import testPrintInt
import trap_OpenUIMenu
import trap_SetClientTurnExtent
import trap_SetClientForceAngle
import trap_SetUserCmdValue
import trap_GetUserCmd
import trap_GetCurrentCmdNumber
import trap_GetServerCommand
import trap_GetSnapshot
import trap_GetCurrentSnapshotNumber
import trap_GetGameState
import trap_GetGlconfig
import trap_FX_AddLine
import trap_R_GetBModelVerts
import trap_R_SetLightStyle
import trap_R_GetLightStyle
import trap_R_RemapShader
import trap_R_DrawRotatePic2
import trap_R_DrawRotatePic
import trap_R_LerpTag
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_LightForPoint
import trap_R_AddLightToScene
import trap_R_AddPolysToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_AnyLanguage_ReadCharFromString
import trap_Language_UsesSpaces
import trap_Language_IsAsian
import trap_R_Font_DrawString
import trap_R_Font_HeightPixels
import trap_R_Font_StrLenChars
import trap_R_Font_StrLenPixels
import trap_R_RegisterFont
import trap_R_RegisterShaderNoMip
import trap_R_RegisterShader
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
import trap_S_RegisterSound
import trap_S_Respatialize
import trap_S_UpdateEntityPosition
import trap_S_AddRealLoopingSound
import trap_S_AddLoopingSound
import trap_S_ClearLoopingSounds
import trap_S_StartLocalSound
import trap_S_StopLoopingSound
import trap_S_StartSound
import trap_S_MuteSound
import trap_CM_MarkFragments
import trap_CM_TransformedBoxTrace
import trap_CM_BoxTrace
import trap_CM_TransformedPointContents
import trap_CM_PointContents
import trap_CM_TempBoxModel
import trap_CM_InlineModel
import trap_CM_NumInlineModels
import trap_CM_LoadMap
import trap_UpdateScreen
import trap_SendClientCommand
import trap_AddCommand
import trap_SendConsoleCommand
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Cvar_VariableStringBuffer
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import CG_SagaObjectiveCompleted
import CG_SagaRoundOver
import CG_InitSagaMode
import CG_CheckChangedPredictableEvents
import CG_TransitionPlayerState
import CG_Respawn
import CG_IsMindTricked
import CG_PlayBufferedVoiceChats
import CG_VoiceChatLocal
import CG_ShaderStateChanged
import CG_LoadVoiceChats
import CG_SetConfigValues
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_InitConsoleCommands
import CG_ConsoleCommand
import CG_DrawOldTourneyScoreboard
import CG_DrawOldScoreboard
import CG_DrawInformation
import CG_LoadingClient
import CG_LoadingItem
import CG_LoadingString
import CG_ProcessSnapshots
import CG_InitGlass
import CG_TestLine
import CG_SurfaceExplosion
import CG_MakeExplosion
import CG_Bleed
import CG_ScorePlum
import CG_CreateDebris
import CG_GlassShatter
import CG_BubbleTrail
import CG_SmokePuff
import CG_AddLocalEntities
import CG_AllocLocalEntity
import CG_InitLocalEntities
import CG_ImpactMark
import CG_AddMarks
import CG_InitMarkPolys
import CG_OutOfAmmoChange
import CG_DrawIconBackground
import CG_DrawWeaponSelect
import CG_AddPlayerWeapon
import CG_AddViewWeapon
import CG_MissileHitPlayer
import CG_MissileHitWall
import CG_FireWeapon
import CG_RegisterItemVisuals
import CG_RegisterWeapon
import CG_Weapon_f
import CG_PrevWeapon_f
import CG_NextWeapon_f
import CG_GetClientWeaponMuzzleBoltPoint
import TurretClientRun
import ScaleModelAxis
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_ManualEntityRender
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
import CG_ReattachLimb
import CG_PainEvent
import CG_EntityEvent
import CG_PlaceString
import CG_CheckEvents
import CG_LoadDeferredPlayers
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
import CG_PlayerShieldHit
import CG_CustomSound
import CG_NewClientInfo
import CG_AddRefEntityWithPowerups
import CG_ResetPlayerEntity
import CG_Player
import CG_StatusHandle
import CG_OtherTeamHasFlag
import CG_YourTeamHasFlag
import CG_GameTypeString
import CG_CheckOrderPending
import CG_Text_PaintChar
import CG_Draw3DModel
import CG_GetKillerText
import CG_GetGameStatusText
import CG_GetTeamColor
import CG_InitTeamChat
import CG_SetPrintString
import CG_ShowResponseHead
import CG_DeferMenuScript
import CG_RunMenuScript
import CG_OwnerDrawVisible
import CG_GetValue
import CG_SelectNextPlayer
import CG_SelectPrevPlayer
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
import CG_OwnerDraw
import CG_DrawTeamBackground
import CG_DrawFlagModel
import CG_DrawActive
import CG_DrawHead
import CG_CenterPrint
import CG_AddLagometerSnapshotInfo
import CG_AddLagometerFrameInfo
import teamChat2
import teamChat1
import systemChat
import drawTeamOverlayModificationCount
import numSortedTeamPlayers
import sortedTeamPlayers
import CG_DrawTopBottom
import CG_DrawSides
import CG_DrawRect
import UI_DrawScaledProportionalString
import UI_DrawProportionalString
import CG_GetColorForHealth
import CG_ColorForHealth
import CG_TileClear
import CG_TeamColor
import CG_FadeColor
import CG_DrawStrlen
import CG_DrawSmallStringColor
import CG_DrawSmallString
import CG_DrawBigStringColor
import CG_DrawBigString
import CG_DrawStringExt
import CG_DrawNumField
import CG_DrawString
import CG_DrawRotatePic2
import CG_DrawRotatePic
import CG_DrawPic
import CG_FillRect
import CG_TestModelAnimate_f
import CG_TestModelSetAnglespost_f
import CG_TestModelSetAnglespre_f
import CG_ListModelBones_f
import CG_ListModelSurfaces_f
import CG_TestModelSurfaceOnOff_f
import CG_TestG2Model_f
import CG_DrawActiveFrame
import CG_AddBufferedSound
import CG_ZoomUp_f
import CG_ZoomDown_f
import CG_TestModelPrevSkin_f
import CG_TestModelNextSkin_f
import CG_TestModelPrevFrame_f
import CG_TestModelNextFrame_f
import CG_TestGun_f
import CG_TestModel_f
import CG_PrevForcePower_f
import CG_NextForcePower_f
import CG_PrevInventory_f
import CG_NextInventory_f
import CG_BuildSpectatorString
import CG_SetScoreSelection
import CG_RankRunFrame
import CG_EventHandling
import CG_MouseEvent
import CG_KeyEvent
import CG_LoadMenus
import CG_LastAttacker
import CG_CrosshairPlayer
import CG_UpdateCvars
import CG_StartMusic
import CG_Error
import CG_Printf
import CG_Argv
import CG_ConfigString
import cg_debugBB
import ui_myteam
import cg_recordSPDemoName
import cg_recordSPDemo
import cg_singlePlayerActive
import cg_enableBreath
import cg_enableDust
import cg_singlePlayer
import cg_currentSelectedPlayerName
import cg_currentSelectedPlayer
import cg_blueTeamName
import cg_redTeamName
import cg_trueLightning
import cg_noProjectileTrail
import cg_noTaunt
import cg_bigFont
import cg_smallFont
import cg_cameraMode
import cg_timescale
import cg_timescaleFadeSpeed
import cg_timescaleFadeEnd
import cg_cameraOrbitDelay
import cg_cameraOrbit
import pmove_msec
import pmove_fixed
import cg_smoothClients
import cg_hudFiles
import cg_scorePlum
import cg_noVoiceText
import cg_noVoiceChats
import cg_teamChatsOnly
import cg_drawFriend
import cg_deferPlayers
import cg_predictItems
import cg_blood
import cg_paused
import cg_buildScript
import cg_forceModel
import cg_stats
import cg_teamChatHeight
import cg_teamChatTime
import cg_synchronousClients
import cg_drawEnemyInfo
import cg_lagometer
import cg_stereoSeparation
import cg_thirdPersonHorzOffset
import cg_thirdPersonAlpha
import cg_thirdPersonTargetDamp
import cg_thirdPersonCameraDamp
import cg_thirdPersonVertOffset
import cg_thirdPersonPitchOffset
import cg_thirdPersonAngle
import cg_thirdPersonRange
import cg_thirdPerson
import cg_dismember
import cg_animBlend
import cg_auraShell
import cg_speedTrail
import cg_duelHeadAngles
import cg_saberTrail
import cg_saberContact
import cg_saberDynamicMarkTime
import cg_saberDynamicMarks
import cg_fpls
import cg_saberModelTraceEffect
import cg_oldPainSounds
import cg_swingAngles
import cg_zoomFov
import cg_fov
import cg_simpleItems
import cg_ignore
import cg_autoswitch
import cg_tracerLength
import cg_tracerWidth
import cg_tracerChance
import cg_viewsize
import cg_drawGun
import cg_gun_z
import cg_gun_y
import cg_gun_x
import cg_gun_frame
import cg_addMarks
import cg_footsteps
import cg_showmiss
import cg_noPlayerAnims
import cg_nopredict
import cg_errorDecay
import cg_debugEvents
import cg_debugPosition
import cg_debugAnim
import cg_animSpeed
import cg_draw2D
import cg_drawStatus
import cg_crosshairHealth
import cg_crosshairSize
import cg_crosshairY
import cg_crosshairX
import cg_teamOverlayUserinfo
import cg_drawTeamOverlay
import cg_drawRewards
import cg_dynamicCrosshair
import cg_drawScores
import cg_drawCrosshairNames
import cg_drawCrosshair
import cg_drawAmmoWarning
import cg_drawIcons
import cg_draw3dIcons
import cg_drawSnapshot
import cg_drawFPS
import cg_drawTimer
import cg_shadows
import cg_bobroll
import cg_bobpitch
import cg_bobup
import cg_runroll
import cg_runpitch
import cg_centertime
import cg_markPolys
import cg_items
import cg_weapons
import cg_entities
import cg
import cgs
import CGCam_SetMusicMult
import CGCam_Shake
import cgScreenEffects
import ammoTicPos
import forceTicPos
import BG_ParseAnimationFile
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
import saberMoveData
import Pmove
import PM_UpdateViewAngles
import pm
import bgGlobalAnimations
import BGPAFtextLoaded
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
LABELV $846
char 1 66
char 1 71
char 1 95
char 1 84
char 1 101
char 1 109
char 1 112
char 1 70
char 1 114
char 1 101
char 1 101
char 1 58
char 1 32
char 1 116
char 1 97
char 1 105
char 1 108
char 1 32
char 1 103
char 1 114
char 1 101
char 1 97
char 1 116
char 1 101
char 1 114
char 1 32
char 1 116
char 1 104
char 1 97
char 1 110
char 1 32
char 1 115
char 1 105
char 1 122
char 1 101
char 1 32
char 1 40
char 1 37
char 1 100
char 1 32
char 1 62
char 1 32
char 1 37
char 1 100
char 1 41
char 1 0
align 1
LABELV $842
char 1 66
char 1 71
char 1 95
char 1 84
char 1 101
char 1 109
char 1 112
char 1 65
char 1 108
char 1 108
char 1 111
char 1 99
char 1 58
char 1 32
char 1 98
char 1 117
char 1 102
char 1 102
char 1 101
char 1 114
char 1 32
char 1 101
char 1 120
char 1 99
char 1 101
char 1 101
char 1 100
char 1 101
char 1 100
char 1 32
char 1 104
char 1 101
char 1 97
char 1 100
char 1 32
char 1 40
char 1 37
char 1 100
char 1 32
char 1 62
char 1 32
char 1 37
char 1 100
char 1 41
char 1 0
align 1
LABELV $838
char 1 66
char 1 71
char 1 95
char 1 65
char 1 108
char 1 108
char 1 111
char 1 99
char 1 85
char 1 110
char 1 97
char 1 108
char 1 105
char 1 103
char 1 110
char 1 101
char 1 100
char 1 58
char 1 32
char 1 98
char 1 117
char 1 102
char 1 102
char 1 101
char 1 114
char 1 32
char 1 101
char 1 120
char 1 99
char 1 101
char 1 101
char 1 100
char 1 101
char 1 100
char 1 32
char 1 116
char 1 97
char 1 105
char 1 108
char 1 32
char 1 40
char 1 37
char 1 100
char 1 32
char 1 62
char 1 32
char 1 37
char 1 100
char 1 41
char 1 0
align 1
LABELV $834
char 1 66
char 1 71
char 1 95
char 1 65
char 1 108
char 1 108
char 1 111
char 1 99
char 1 58
char 1 32
char 1 98
char 1 117
char 1 102
char 1 102
char 1 101
char 1 114
char 1 32
char 1 101
char 1 120
char 1 99
char 1 101
char 1 101
char 1 100
char 1 101
char 1 100
char 1 32
char 1 116
char 1 97
char 1 105
char 1 108
char 1 32
char 1 40
char 1 37
char 1 100
char 1 32
char 1 62
char 1 32
char 1 37
char 1 100
char 1 41
char 1 0
align 1
LABELV $762
char 1 69
char 1 86
char 1 95
char 1 66
char 1 79
char 1 68
char 1 89
char 1 95
char 1 81
char 1 85
char 1 69
char 1 85
char 1 69
char 1 95
char 1 67
char 1 79
char 1 80
char 1 89
char 1 0
align 1
LABELV $761
char 1 69
char 1 86
char 1 95
char 1 84
char 1 65
char 1 85
char 1 78
char 1 84
char 1 95
char 1 80
char 1 65
char 1 84
char 1 82
char 1 79
char 1 76
char 1 0
align 1
LABELV $760
char 1 69
char 1 86
char 1 95
char 1 84
char 1 65
char 1 85
char 1 78
char 1 84
char 1 95
char 1 71
char 1 85
char 1 65
char 1 82
char 1 68
char 1 66
char 1 65
char 1 83
char 1 69
char 1 0
align 1
LABELV $759
char 1 69
char 1 86
char 1 95
char 1 84
char 1 65
char 1 85
char 1 78
char 1 84
char 1 95
char 1 71
char 1 69
char 1 84
char 1 70
char 1 76
char 1 65
char 1 71
char 1 0
align 1
LABELV $758
char 1 69
char 1 86
char 1 95
char 1 84
char 1 65
char 1 85
char 1 78
char 1 84
char 1 95
char 1 70
char 1 79
char 1 76
char 1 76
char 1 79
char 1 87
char 1 77
char 1 69
char 1 0
align 1
LABELV $757
char 1 69
char 1 86
char 1 95
char 1 84
char 1 65
char 1 85
char 1 78
char 1 84
char 1 95
char 1 78
char 1 79
char 1 0
align 1
LABELV $756
char 1 69
char 1 86
char 1 95
char 1 84
char 1 65
char 1 85
char 1 78
char 1 84
char 1 95
char 1 89
char 1 69
char 1 83
char 1 0
align 1
LABELV $755
char 1 69
char 1 86
char 1 95
char 1 84
char 1 65
char 1 85
char 1 78
char 1 84
char 1 0
align 1
LABELV $754
char 1 69
char 1 86
char 1 95
char 1 83
char 1 84
char 1 65
char 1 82
char 1 84
char 1 76
char 1 79
char 1 79
char 1 80
char 1 73
char 1 78
char 1 71
char 1 83
char 1 79
char 1 85
char 1 78
char 1 68
char 1 0
align 1
LABELV $753
char 1 69
char 1 86
char 1 95
char 1 83
char 1 84
char 1 79
char 1 80
char 1 76
char 1 79
char 1 79
char 1 80
char 1 73
char 1 78
char 1 71
char 1 83
char 1 79
char 1 85
char 1 78
char 1 68
char 1 0
align 1
LABELV $752
char 1 69
char 1 86
char 1 95
char 1 84
char 1 69
char 1 83
char 1 84
char 1 76
char 1 73
char 1 78
char 1 69
char 1 0
align 1
LABELV $751
char 1 69
char 1 86
char 1 95
char 1 68
char 1 69
char 1 66
char 1 85
char 1 71
char 1 95
char 1 76
char 1 73
char 1 78
char 1 69
char 1 0
align 1
LABELV $750
char 1 69
char 1 86
char 1 95
char 1 83
char 1 72
char 1 73
char 1 69
char 1 76
char 1 68
char 1 95
char 1 72
char 1 73
char 1 84
char 1 0
align 1
LABELV $749
char 1 69
char 1 86
char 1 95
char 1 87
char 1 69
char 1 65
char 1 80
char 1 79
char 1 78
char 1 95
char 1 67
char 1 72
char 1 65
char 1 82
char 1 71
char 1 69
char 1 95
char 1 65
char 1 76
char 1 84
char 1 0
align 1
LABELV $748
char 1 69
char 1 86
char 1 95
char 1 87
char 1 69
char 1 65
char 1 80
char 1 79
char 1 78
char 1 95
char 1 67
char 1 72
char 1 65
char 1 82
char 1 71
char 1 69
char 1 0
align 1
LABELV $747
char 1 69
char 1 86
char 1 95
char 1 83
char 1 69
char 1 84
char 1 95
char 1 70
char 1 79
char 1 82
char 1 67
char 1 69
char 1 95
char 1 68
char 1 73
char 1 83
char 1 65
char 1 66
char 1 76
char 1 69
char 1 0
align 1
LABELV $746
char 1 69
char 1 86
char 1 95
char 1 83
char 1 69
char 1 84
char 1 95
char 1 70
char 1 82
char 1 69
char 1 69
char 1 95
char 1 83
char 1 65
char 1 66
char 1 69
char 1 82
char 1 0
align 1
LABELV $745
char 1 69
char 1 86
char 1 95
char 1 71
char 1 73
char 1 86
char 1 69
char 1 95
char 1 78
char 1 69
char 1 87
char 1 95
char 1 82
char 1 65
char 1 78
char 1 75
char 1 0
align 1
LABELV $744
char 1 69
char 1 86
char 1 95
char 1 68
char 1 69
char 1 83
char 1 84
char 1 82
char 1 79
char 1 89
char 1 95
char 1 87
char 1 69
char 1 65
char 1 80
char 1 79
char 1 78
char 1 95
char 1 77
char 1 79
char 1 68
char 1 69
char 1 76
char 1 0
align 1
LABELV $743
char 1 69
char 1 86
char 1 95
char 1 68
char 1 69
char 1 83
char 1 84
char 1 82
char 1 79
char 1 89
char 1 95
char 1 71
char 1 72
char 1 79
char 1 85
char 1 76
char 1 50
char 1 95
char 1 73
char 1 78
char 1 83
char 1 84
char 1 65
char 1 78
char 1 67
char 1 69
char 1 0
align 1
LABELV $742
char 1 69
char 1 86
char 1 95
char 1 83
char 1 65
char 1 71
char 1 65
char 1 95
char 1 79
char 1 66
char 1 74
char 1 69
char 1 67
char 1 84
char 1 73
char 1 86
char 1 69
char 1 67
char 1 79
char 1 77
char 1 80
char 1 76
char 1 69
char 1 84
char 1 69
char 1 0
align 1
LABELV $741
char 1 69
char 1 86
char 1 95
char 1 83
char 1 65
char 1 71
char 1 65
char 1 95
char 1 82
char 1 79
char 1 85
char 1 78
char 1 68
char 1 79
char 1 86
char 1 69
char 1 82
char 1 0
align 1
LABELV $740
char 1 69
char 1 86
char 1 95
char 1 67
char 1 84
char 1 70
char 1 77
char 1 69
char 1 83
char 1 83
char 1 65
char 1 71
char 1 69
char 1 0
align 1
LABELV $739
char 1 69
char 1 86
char 1 95
char 1 83
char 1 67
char 1 79
char 1 82
char 1 69
char 1 80
char 1 76
char 1 85
char 1 77
char 1 0
align 1
LABELV $738
char 1 69
char 1 86
char 1 95
char 1 71
char 1 73
char 1 66
char 1 95
char 1 80
char 1 76
char 1 65
char 1 89
char 1 69
char 1 82
char 1 0
align 1
LABELV $737
char 1 69
char 1 86
char 1 95
char 1 70
char 1 79
char 1 82
char 1 67
char 1 69
char 1 95
char 1 68
char 1 82
char 1 65
char 1 73
char 1 78
char 1 69
char 1 68
char 1 0
align 1
LABELV $736
char 1 69
char 1 86
char 1 95
char 1 80
char 1 79
char 1 87
char 1 69
char 1 82
char 1 85
char 1 80
char 1 95
char 1 66
char 1 65
char 1 84
char 1 84
char 1 76
char 1 69
char 1 83
char 1 85
char 1 73
char 1 84
char 1 0
align 1
LABELV $735
char 1 69
char 1 86
char 1 95
char 1 80
char 1 79
char 1 87
char 1 69
char 1 82
char 1 85
char 1 80
char 1 95
char 1 81
char 1 85
char 1 65
char 1 68
char 1 0
align 1
LABELV $734
char 1 69
char 1 86
char 1 95
char 1 79
char 1 66
char 1 73
char 1 84
char 1 85
char 1 65
char 1 82
char 1 89
char 1 0
align 1
LABELV $733
char 1 69
char 1 86
char 1 95
char 1 68
char 1 69
char 1 65
char 1 84
char 1 72
char 1 51
char 1 0
align 1
LABELV $732
char 1 69
char 1 86
char 1 95
char 1 68
char 1 69
char 1 65
char 1 84
char 1 72
char 1 50
char 1 0
align 1
LABELV $731
char 1 69
char 1 86
char 1 95
char 1 68
char 1 69
char 1 65
char 1 84
char 1 72
char 1 49
char 1 0
align 1
LABELV $730
char 1 69
char 1 86
char 1 95
char 1 80
char 1 65
char 1 73
char 1 78
char 1 0
align 1
LABELV $729
char 1 69
char 1 86
char 1 95
char 1 66
char 1 85
char 1 76
char 1 76
char 1 69
char 1 84
char 1 0
align 1
LABELV $728
char 1 69
char 1 86
char 1 95
char 1 77
char 1 73
char 1 83
char 1 83
char 1 73
char 1 76
char 1 69
char 1 95
char 1 77
char 1 73
char 1 83
char 1 83
char 1 95
char 1 77
char 1 69
char 1 84
char 1 65
char 1 76
char 1 0
align 1
LABELV $727
char 1 69
char 1 86
char 1 95
char 1 77
char 1 73
char 1 83
char 1 83
char 1 73
char 1 76
char 1 69
char 1 95
char 1 77
char 1 73
char 1 83
char 1 83
char 1 0
align 1
LABELV $726
char 1 69
char 1 86
char 1 95
char 1 77
char 1 73
char 1 83
char 1 83
char 1 73
char 1 76
char 1 69
char 1 95
char 1 72
char 1 73
char 1 84
char 1 0
align 1
LABELV $725
char 1 69
char 1 86
char 1 95
char 1 68
char 1 69
char 1 66
char 1 82
char 1 73
char 1 83
char 1 0
align 1
LABELV $724
char 1 69
char 1 86
char 1 95
char 1 71
char 1 76
char 1 65
char 1 83
char 1 83
char 1 95
char 1 83
char 1 72
char 1 65
char 1 84
char 1 84
char 1 69
char 1 82
char 1 0
align 1
LABELV $723
char 1 69
char 1 86
char 1 95
char 1 80
char 1 76
char 1 65
char 1 89
char 1 95
char 1 82
char 1 79
char 1 70
char 1 70
char 1 0
align 1
LABELV $722
char 1 69
char 1 86
char 1 95
char 1 69
char 1 78
char 1 84
char 1 73
char 1 84
char 1 89
char 1 95
char 1 83
char 1 79
char 1 85
char 1 78
char 1 68
char 1 0
align 1
LABELV $721
char 1 69
char 1 86
char 1 95
char 1 71
char 1 76
char 1 79
char 1 66
char 1 65
char 1 76
char 1 95
char 1 84
char 1 69
char 1 65
char 1 77
char 1 95
char 1 83
char 1 79
char 1 85
char 1 78
char 1 68
char 1 0
align 1
LABELV $720
char 1 69
char 1 86
char 1 95
char 1 71
char 1 76
char 1 79
char 1 66
char 1 65
char 1 76
char 1 95
char 1 83
char 1 79
char 1 85
char 1 78
char 1 68
char 1 0
align 1
LABELV $719
char 1 69
char 1 86
char 1 95
char 1 71
char 1 69
char 1 78
char 1 69
char 1 82
char 1 65
char 1 76
char 1 95
char 1 83
char 1 79
char 1 85
char 1 78
char 1 68
char 1 0
align 1
LABELV $718
char 1 69
char 1 86
char 1 95
char 1 77
char 1 85
char 1 84
char 1 69
char 1 95
char 1 83
char 1 79
char 1 85
char 1 78
char 1 68
char 1 0
align 1
LABELV $717
char 1 69
char 1 86
char 1 95
char 1 80
char 1 76
char 1 65
char 1 89
char 1 95
char 1 69
char 1 70
char 1 70
char 1 69
char 1 67
char 1 84
char 1 95
char 1 73
char 1 68
char 1 0
align 1
LABELV $716
char 1 69
char 1 86
char 1 95
char 1 80
char 1 76
char 1 65
char 1 89
char 1 95
char 1 69
char 1 70
char 1 70
char 1 69
char 1 67
char 1 84
char 1 0
align 1
LABELV $715
char 1 69
char 1 86
char 1 95
char 1 77
char 1 73
char 1 83
char 1 83
char 1 73
char 1 76
char 1 69
char 1 95
char 1 83
char 1 84
char 1 73
char 1 67
char 1 75
char 1 0
align 1
LABELV $714
char 1 69
char 1 86
char 1 95
char 1 71
char 1 82
char 1 69
char 1 78
char 1 65
char 1 68
char 1 69
char 1 95
char 1 66
char 1 79
char 1 85
char 1 78
char 1 67
char 1 69
char 1 0
align 1
LABELV $713
char 1 69
char 1 86
char 1 95
char 1 80
char 1 76
char 1 65
char 1 89
char 1 69
char 1 82
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
char 1 79
char 1 85
char 1 84
char 1 0
align 1
LABELV $712
char 1 69
char 1 86
char 1 95
char 1 80
char 1 76
char 1 65
char 1 89
char 1 69
char 1 82
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
char 1 73
char 1 78
char 1 0
align 1
LABELV $711
char 1 69
char 1 86
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 95
char 1 80
char 1 79
char 1 80
char 1 0
align 1
LABELV $710
char 1 69
char 1 86
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 95
char 1 82
char 1 69
char 1 83
char 1 80
char 1 65
char 1 87
char 1 78
char 1 0
align 1
LABELV $709
char 1 69
char 1 86
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 85
char 1 83
char 1 69
char 1 70
char 1 65
char 1 73
char 1 76
char 1 0
align 1
LABELV $708
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 49
char 1 53
char 1 0
align 1
LABELV $707
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 49
char 1 52
char 1 0
align 1
LABELV $706
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 49
char 1 51
char 1 0
align 1
LABELV $705
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 49
char 1 50
char 1 0
align 1
LABELV $704
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 49
char 1 49
char 1 0
align 1
LABELV $703
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 49
char 1 48
char 1 0
align 1
LABELV $702
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 57
char 1 0
align 1
LABELV $701
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 56
char 1 0
align 1
LABELV $700
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 55
char 1 0
align 1
LABELV $699
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 54
char 1 0
align 1
LABELV $698
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 53
char 1 0
align 1
LABELV $697
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 52
char 1 0
align 1
LABELV $696
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 51
char 1 0
align 1
LABELV $695
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 50
char 1 0
align 1
LABELV $694
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 49
char 1 0
align 1
LABELV $693
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 48
char 1 0
align 1
LABELV $692
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 0
align 1
LABELV $691
char 1 69
char 1 86
char 1 95
char 1 83
char 1 67
char 1 82
char 1 69
char 1 69
char 1 78
char 1 83
char 1 72
char 1 65
char 1 75
char 1 69
char 1 0
align 1
LABELV $690
char 1 69
char 1 86
char 1 95
char 1 84
char 1 69
char 1 65
char 1 77
char 1 95
char 1 80
char 1 79
char 1 87
char 1 69
char 1 82
char 1 0
align 1
LABELV $689
char 1 69
char 1 86
char 1 95
char 1 80
char 1 82
char 1 69
char 1 68
char 1 69
char 1 70
char 1 83
char 1 79
char 1 85
char 1 78
char 1 68
char 1 0
align 1
LABELV $688
char 1 69
char 1 86
char 1 95
char 1 68
char 1 73
char 1 83
char 1 82
char 1 85
char 1 80
char 1 84
char 1 79
char 1 82
char 1 95
char 1 90
char 1 79
char 1 79
char 1 77
char 1 83
char 1 79
char 1 85
char 1 78
char 1 68
char 1 0
align 1
LABELV $687
char 1 69
char 1 86
char 1 95
char 1 68
char 1 73
char 1 83
char 1 82
char 1 85
char 1 80
char 1 84
char 1 79
char 1 82
char 1 95
char 1 72
char 1 73
char 1 84
char 1 0
align 1
LABELV $686
char 1 69
char 1 86
char 1 95
char 1 68
char 1 73
char 1 83
char 1 82
char 1 85
char 1 80
char 1 84
char 1 79
char 1 82
char 1 95
char 1 83
char 1 78
char 1 73
char 1 80
char 1 69
char 1 82
char 1 95
char 1 77
char 1 73
char 1 83
char 1 83
char 1 0
align 1
LABELV $685
char 1 69
char 1 86
char 1 95
char 1 68
char 1 73
char 1 83
char 1 82
char 1 85
char 1 80
char 1 84
char 1 79
char 1 82
char 1 95
char 1 83
char 1 78
char 1 73
char 1 80
char 1 69
char 1 82
char 1 95
char 1 83
char 1 72
char 1 79
char 1 84
char 1 0
align 1
LABELV $684
char 1 69
char 1 86
char 1 95
char 1 68
char 1 73
char 1 83
char 1 82
char 1 85
char 1 80
char 1 84
char 1 79
char 1 82
char 1 95
char 1 77
char 1 65
char 1 73
char 1 78
char 1 95
char 1 83
char 1 72
char 1 79
char 1 84
char 1 0
align 1
LABELV $683
char 1 69
char 1 86
char 1 95
char 1 66
char 1 69
char 1 67
char 1 79
char 1 77
char 1 69
char 1 95
char 1 74
char 1 69
char 1 68
char 1 73
char 1 77
char 1 65
char 1 83
char 1 84
char 1 69
char 1 82
char 1 0
align 1
LABELV $682
char 1 69
char 1 86
char 1 95
char 1 83
char 1 65
char 1 66
char 1 69
char 1 82
char 1 95
char 1 85
char 1 78
char 1 72
char 1 79
char 1 76
char 1 83
char 1 84
char 1 69
char 1 82
char 1 0
align 1
LABELV $681
char 1 69
char 1 86
char 1 95
char 1 83
char 1 65
char 1 66
char 1 69
char 1 82
char 1 95
char 1 66
char 1 76
char 1 79
char 1 67
char 1 75
char 1 0
align 1
LABELV $680
char 1 69
char 1 86
char 1 95
char 1 83
char 1 65
char 1 66
char 1 69
char 1 82
char 1 95
char 1 72
char 1 73
char 1 84
char 1 0
align 1
LABELV $679
char 1 69
char 1 86
char 1 95
char 1 83
char 1 65
char 1 66
char 1 69
char 1 82
char 1 95
char 1 65
char 1 84
char 1 84
char 1 65
char 1 67
char 1 75
char 1 0
align 1
LABELV $678
char 1 69
char 1 86
char 1 95
char 1 65
char 1 76
char 1 84
char 1 95
char 1 70
char 1 73
char 1 82
char 1 69
char 1 0
align 1
LABELV $677
char 1 69
char 1 86
char 1 95
char 1 70
char 1 73
char 1 82
char 1 69
char 1 95
char 1 87
char 1 69
char 1 65
char 1 80
char 1 79
char 1 78
char 1 0
align 1
LABELV $676
char 1 69
char 1 86
char 1 95
char 1 67
char 1 72
char 1 65
char 1 78
char 1 71
char 1 69
char 1 95
char 1 87
char 1 69
char 1 65
char 1 80
char 1 79
char 1 78
char 1 0
align 1
LABELV $675
char 1 69
char 1 86
char 1 95
char 1 78
char 1 79
char 1 65
char 1 77
char 1 77
char 1 79
char 1 0
align 1
LABELV $674
char 1 69
char 1 86
char 1 95
char 1 71
char 1 76
char 1 79
char 1 66
char 1 65
char 1 76
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 95
char 1 80
char 1 73
char 1 67
char 1 75
char 1 85
char 1 80
char 1 0
align 1
LABELV $673
char 1 69
char 1 86
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 95
char 1 80
char 1 73
char 1 67
char 1 75
char 1 85
char 1 80
char 1 0
align 1
LABELV $672
char 1 69
char 1 86
char 1 95
char 1 87
char 1 65
char 1 84
char 1 69
char 1 82
char 1 95
char 1 67
char 1 76
char 1 69
char 1 65
char 1 82
char 1 0
align 1
LABELV $671
char 1 69
char 1 86
char 1 95
char 1 87
char 1 65
char 1 84
char 1 69
char 1 82
char 1 95
char 1 85
char 1 78
char 1 68
char 1 69
char 1 82
char 1 0
align 1
LABELV $670
char 1 69
char 1 86
char 1 95
char 1 87
char 1 65
char 1 84
char 1 69
char 1 82
char 1 95
char 1 76
char 1 69
char 1 65
char 1 86
char 1 69
char 1 0
align 1
LABELV $669
char 1 69
char 1 86
char 1 95
char 1 87
char 1 65
char 1 84
char 1 69
char 1 82
char 1 95
char 1 84
char 1 79
char 1 85
char 1 67
char 1 72
char 1 0
align 1
LABELV $668
char 1 69
char 1 86
char 1 95
char 1 82
char 1 79
char 1 76
char 1 76
char 1 0
align 1
LABELV $667
char 1 69
char 1 86
char 1 95
char 1 74
char 1 85
char 1 77
char 1 80
char 1 0
align 1
LABELV $666
char 1 69
char 1 86
char 1 95
char 1 80
char 1 82
char 1 73
char 1 86
char 1 65
char 1 84
char 1 69
char 1 95
char 1 68
char 1 85
char 1 69
char 1 76
char 1 0
align 1
LABELV $665
char 1 69
char 1 86
char 1 95
char 1 74
char 1 85
char 1 77
char 1 80
char 1 95
char 1 80
char 1 65
char 1 68
char 1 0
align 1
LABELV $664
char 1 69
char 1 86
char 1 95
char 1 70
char 1 65
char 1 76
char 1 76
char 1 0
align 1
LABELV $663
char 1 69
char 1 86
char 1 95
char 1 83
char 1 84
char 1 69
char 1 80
char 1 95
char 1 49
char 1 54
char 1 0
align 1
LABELV $662
char 1 69
char 1 86
char 1 95
char 1 83
char 1 84
char 1 69
char 1 80
char 1 95
char 1 49
char 1 50
char 1 0
align 1
LABELV $661
char 1 69
char 1 86
char 1 95
char 1 83
char 1 84
char 1 69
char 1 80
char 1 95
char 1 56
char 1 0
align 1
LABELV $660
char 1 69
char 1 86
char 1 95
char 1 83
char 1 84
char 1 69
char 1 80
char 1 95
char 1 52
char 1 0
align 1
LABELV $659
char 1 69
char 1 86
char 1 95
char 1 83
char 1 87
char 1 73
char 1 77
char 1 0
align 1
LABELV $658
char 1 69
char 1 86
char 1 95
char 1 70
char 1 79
char 1 79
char 1 84
char 1 87
char 1 65
char 1 68
char 1 69
char 1 0
align 1
LABELV $657
char 1 69
char 1 86
char 1 95
char 1 70
char 1 79
char 1 79
char 1 84
char 1 83
char 1 80
char 1 76
char 1 65
char 1 83
char 1 72
char 1 0
align 1
LABELV $656
char 1 69
char 1 86
char 1 95
char 1 70
char 1 79
char 1 79
char 1 84
char 1 83
char 1 84
char 1 69
char 1 80
char 1 95
char 1 77
char 1 69
char 1 84
char 1 65
char 1 76
char 1 0
align 1
LABELV $655
char 1 69
char 1 86
char 1 95
char 1 70
char 1 79
char 1 79
char 1 84
char 1 83
char 1 84
char 1 69
char 1 80
char 1 0
align 1
LABELV $654
char 1 69
char 1 86
char 1 95
char 1 67
char 1 76
char 1 73
char 1 69
char 1 78
char 1 84
char 1 74
char 1 79
char 1 73
char 1 78
char 1 0
align 1
LABELV $653
char 1 69
char 1 86
char 1 95
char 1 78
char 1 79
char 1 78
char 1 69
char 1 0
align 1
LABELV $651
char 1 66
char 1 71
char 1 95
char 1 69
char 1 118
char 1 97
char 1 108
char 1 117
char 1 97
char 1 116
char 1 101
char 1 84
char 1 114
char 1 97
char 1 106
char 1 101
char 1 99
char 1 116
char 1 111
char 1 114
char 1 121
char 1 68
char 1 101
char 1 108
char 1 116
char 1 97
char 1 58
char 1 32
char 1 117
char 1 110
char 1 107
char 1 110
char 1 111
char 1 119
char 1 110
char 1 32
char 1 116
char 1 114
char 1 84
char 1 121
char 1 112
char 1 101
char 1 58
char 1 32
char 1 37
char 1 105
char 1 0
align 1
LABELV $638
char 1 66
char 1 71
char 1 95
char 1 69
char 1 118
char 1 97
char 1 108
char 1 117
char 1 97
char 1 116
char 1 101
char 1 84
char 1 114
char 1 97
char 1 106
char 1 101
char 1 99
char 1 116
char 1 111
char 1 114
char 1 121
char 1 58
char 1 32
char 1 91
char 1 67
char 1 76
char 1 73
char 1 69
char 1 78
char 1 84
char 1 71
char 1 65
char 1 77
char 1 69
char 1 32
char 1 83
char 1 73
char 1 68
char 1 69
char 1 93
char 1 32
char 1 117
char 1 110
char 1 107
char 1 110
char 1 111
char 1 119
char 1 110
char 1 32
char 1 116
char 1 114
char 1 84
char 1 121
char 1 112
char 1 101
char 1 58
char 1 32
char 1 37
char 1 105
char 1 0
align 1
LABELV $623
char 1 66
char 1 71
char 1 95
char 1 67
char 1 97
char 1 110
char 1 73
char 1 116
char 1 101
char 1 109
char 1 66
char 1 101
char 1 71
char 1 114
char 1 97
char 1 98
char 1 98
char 1 101
char 1 100
char 1 58
char 1 32
char 1 73
char 1 84
char 1 95
char 1 66
char 1 65
char 1 68
char 1 0
align 1
LABELV $549
char 1 66
char 1 71
char 1 95
char 1 67
char 1 97
char 1 110
char 1 73
char 1 116
char 1 101
char 1 109
char 1 66
char 1 101
char 1 71
char 1 114
char 1 97
char 1 98
char 1 98
char 1 101
char 1 100
char 1 58
char 1 32
char 1 105
char 1 110
char 1 100
char 1 101
char 1 120
char 1 32
char 1 111
char 1 117
char 1 116
char 1 32
char 1 111
char 1 102
char 1 32
char 1 114
char 1 97
char 1 110
char 1 103
char 1 101
char 1 0
align 1
LABELV $466
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
char 1 105
char 1 116
char 1 101
char 1 109
char 1 32
char 1 102
char 1 111
char 1 114
char 1 32
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 32
char 1 37
char 1 105
char 1 0
align 1
LABELV $457
char 1 72
char 1 111
char 1 108
char 1 100
char 1 97
char 1 98
char 1 108
char 1 101
char 1 73
char 1 116
char 1 101
char 1 109
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 102
char 1 111
char 1 117
char 1 110
char 1 100
char 1 0
align 1
LABELV $401
char 1 105
char 1 99
char 1 111
char 1 110
char 1 115
char 1 47
char 1 105
char 1 99
char 1 111
char 1 110
char 1 104
char 1 95
char 1 98
char 1 111
char 1 114
char 1 98
char 1 0
align 1
LABELV $400
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 117
char 1 112
char 1 115
char 1 47
char 1 111
char 1 114
char 1 98
char 1 47
char 1 98
char 1 95
char 1 111
char 1 114
char 1 98
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $399
char 1 105
char 1 116
char 1 101
char 1 109
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 99
char 1 117
char 1 98
char 1 101
char 1 0
align 1
LABELV $398
char 1 105
char 1 99
char 1 111
char 1 110
char 1 115
char 1 47
char 1 105
char 1 99
char 1 111
char 1 110
char 1 104
char 1 95
char 1 114
char 1 111
char 1 114
char 1 98
char 1 0
align 1
LABELV $397
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 117
char 1 112
char 1 115
char 1 47
char 1 111
char 1 114
char 1 98
char 1 47
char 1 114
char 1 95
char 1 111
char 1 114
char 1 98
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $396
char 1 105
char 1 116
char 1 101
char 1 109
char 1 95
char 1 114
char 1 101
char 1 100
char 1 99
char 1 117
char 1 98
char 1 101
char 1 0
align 1
LABELV $395
char 1 105
char 1 99
char 1 111
char 1 110
char 1 115
char 1 47
char 1 105
char 1 99
char 1 111
char 1 110
char 1 102
char 1 95
char 1 110
char 1 101
char 1 117
char 1 116
char 1 114
char 1 97
char 1 108
char 1 49
char 1 0
align 1
LABELV $394
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 102
char 1 108
char 1 97
char 1 103
char 1 115
char 1 47
char 1 110
char 1 95
char 1 102
char 1 108
char 1 97
char 1 103
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $393
char 1 116
char 1 101
char 1 97
char 1 109
char 1 95
char 1 67
char 1 84
char 1 70
char 1 95
char 1 110
char 1 101
char 1 117
char 1 116
char 1 114
char 1 97
char 1 108
char 1 102
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $392
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 109
char 1 112
char 1 105
char 1 95
char 1 98
char 1 102
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $391
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 102
char 1 108
char 1 97
char 1 103
char 1 115
char 1 47
char 1 98
char 1 95
char 1 102
char 1 108
char 1 97
char 1 103
char 1 95
char 1 121
char 1 115
char 1 97
char 1 108
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $390
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 102
char 1 108
char 1 97
char 1 103
char 1 115
char 1 47
char 1 98
char 1 95
char 1 102
char 1 108
char 1 97
char 1 103
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $389
char 1 116
char 1 101
char 1 97
char 1 109
char 1 95
char 1 67
char 1 84
char 1 70
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 102
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $388
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 109
char 1 112
char 1 105
char 1 95
char 1 114
char 1 102
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $387
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 102
char 1 108
char 1 97
char 1 103
char 1 115
char 1 47
char 1 114
char 1 95
char 1 102
char 1 108
char 1 97
char 1 103
char 1 95
char 1 121
char 1 115
char 1 97
char 1 108
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $386
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 102
char 1 108
char 1 97
char 1 103
char 1 115
char 1 47
char 1 114
char 1 95
char 1 102
char 1 108
char 1 97
char 1 103
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $385
char 1 116
char 1 101
char 1 97
char 1 109
char 1 95
char 1 67
char 1 84
char 1 70
char 1 95
char 1 114
char 1 101
char 1 100
char 1 102
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $384
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 112
char 1 47
char 1 97
char 1 109
char 1 109
char 1 111
char 1 95
char 1 114
char 1 111
char 1 99
char 1 107
char 1 101
char 1 116
char 1 115
char 1 0
align 1
LABELV $383
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 105
char 1 116
char 1 101
char 1 109
char 1 115
char 1 47
char 1 114
char 1 111
char 1 99
char 1 107
char 1 101
char 1 116
char 1 115
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $382
char 1 97
char 1 109
char 1 109
char 1 111
char 1 95
char 1 114
char 1 111
char 1 99
char 1 107
char 1 101
char 1 116
char 1 115
char 1 0
align 1
LABELV $381
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 112
char 1 47
char 1 97
char 1 109
char 1 109
char 1 111
char 1 95
char 1 109
char 1 101
char 1 116
char 1 97
char 1 108
char 1 108
char 1 105
char 1 99
char 1 95
char 1 98
char 1 111
char 1 108
char 1 116
char 1 115
char 1 0
align 1
LABELV $380
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 105
char 1 116
char 1 101
char 1 109
char 1 115
char 1 47
char 1 109
char 1 101
char 1 116
char 1 97
char 1 108
char 1 108
char 1 105
char 1 99
char 1 95
char 1 98
char 1 111
char 1 108
char 1 116
char 1 115
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $379
char 1 97
char 1 109
char 1 109
char 1 111
char 1 95
char 1 109
char 1 101
char 1 116
char 1 97
char 1 108
char 1 108
char 1 105
char 1 99
char 1 95
char 1 98
char 1 111
char 1 108
char 1 116
char 1 115
char 1 0
align 1
LABELV $378
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 112
char 1 47
char 1 97
char 1 109
char 1 109
char 1 111
char 1 95
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 95
char 1 99
char 1 101
char 1 108
char 1 108
char 1 0
align 1
LABELV $377
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 105
char 1 116
char 1 101
char 1 109
char 1 115
char 1 47
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 95
char 1 99
char 1 101
char 1 108
char 1 108
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $376
char 1 97
char 1 109
char 1 109
char 1 111
char 1 95
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 99
char 1 101
char 1 108
char 1 108
char 1 0
align 1
LABELV $375
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 105
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 98
char 1 97
char 1 116
char 1 116
char 1 101
char 1 114
char 1 121
char 1 0
align 1
LABELV $374
char 1 97
char 1 109
char 1 109
char 1 111
char 1 95
char 1 98
char 1 108
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $373
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 105
char 1 116
char 1 101
char 1 109
char 1 115
char 1 47
char 1 101
char 1 110
char 1 101
char 1 114
char 1 103
char 1 121
char 1 95
char 1 99
char 1 101
char 1 108
char 1 108
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $372
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 47
char 1 112
char 1 105
char 1 99
char 1 107
char 1 117
char 1 112
char 1 101
char 1 110
char 1 101
char 1 114
char 1 103
char 1 121
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $371
char 1 97
char 1 109
char 1 109
char 1 111
char 1 95
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 0
align 1
LABELV $370
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 95
char 1 116
char 1 117
char 1 114
char 1 114
char 1 101
char 1 116
char 1 119
char 1 112
char 1 0
align 1
LABELV $369
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 95
char 1 101
char 1 109
char 1 112
char 1 108
char 1 97
char 1 99
char 1 101
char 1 100
char 1 0
align 1
LABELV $368
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 95
char 1 100
char 1 101
char 1 116
char 1 95
char 1 112
char 1 97
char 1 99
char 1 107
char 1 0
align 1
LABELV $367
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 95
char 1 116
char 1 114
char 1 105
char 1 112
char 1 95
char 1 109
char 1 105
char 1 110
char 1 101
char 1 0
align 1
LABELV $366
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 95
char 1 116
char 1 104
char 1 101
char 1 114
char 1 109
char 1 97
char 1 108
char 1 0
align 1
LABELV $365
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 119
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 100
char 1 101
char 1 116
char 1 112
char 1 97
char 1 99
char 1 107
char 1 0
align 1
LABELV $364
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
char 1 100
char 1 101
char 1 116
char 1 112
char 1 97
char 1 99
char 1 107
char 1 47
char 1 100
char 1 101
char 1 116
char 1 95
char 1 112
char 1 97
char 1 99
char 1 107
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $363
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
char 1 100
char 1 101
char 1 116
char 1 112
char 1 97
char 1 99
char 1 107
char 1 47
char 1 100
char 1 101
char 1 116
char 1 95
char 1 112
char 1 97
char 1 99
char 1 107
char 1 95
char 1 119
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $362
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
char 1 100
char 1 101
char 1 116
char 1 112
char 1 97
char 1 99
char 1 107
char 1 47
char 1 100
char 1 101
char 1 116
char 1 95
char 1 112
char 1 97
char 1 99
char 1 107
char 1 95
char 1 112
char 1 114
char 1 111
char 1 106
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $361
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
char 1 100
char 1 101
char 1 116
char 1 112
char 1 97
char 1 99
char 1 107
char 1 47
char 1 100
char 1 101
char 1 116
char 1 95
char 1 112
char 1 97
char 1 99
char 1 107
char 1 95
char 1 112
char 1 117
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $360
char 1 97
char 1 109
char 1 109
char 1 111
char 1 95
char 1 100
char 1 101
char 1 116
char 1 112
char 1 97
char 1 99
char 1 107
char 1 0
align 1
LABELV $359
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 119
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 116
char 1 114
char 1 105
char 1 112
char 1 109
char 1 105
char 1 110
char 1 101
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
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
char 1 47
char 1 108
char 1 97
char 1 115
char 1 101
char 1 114
char 1 95
char 1 116
char 1 114
char 1 97
char 1 112
char 1 47
char 1 108
char 1 97
char 1 115
char 1 101
char 1 114
char 1 95
char 1 116
char 1 114
char 1 97
char 1 112
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $357
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
char 1 108
char 1 97
char 1 115
char 1 101
char 1 114
char 1 95
char 1 116
char 1 114
char 1 97
char 1 112
char 1 47
char 1 108
char 1 97
char 1 115
char 1 101
char 1 114
char 1 95
char 1 116
char 1 114
char 1 97
char 1 112
char 1 95
char 1 119
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $356
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
char 1 108
char 1 97
char 1 115
char 1 101
char 1 114
char 1 95
char 1 116
char 1 114
char 1 97
char 1 112
char 1 47
char 1 108
char 1 97
char 1 115
char 1 101
char 1 114
char 1 95
char 1 116
char 1 114
char 1 97
char 1 112
char 1 95
char 1 112
char 1 117
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $355
char 1 97
char 1 109
char 1 109
char 1 111
char 1 95
char 1 116
char 1 114
char 1 105
char 1 112
char 1 109
char 1 105
char 1 110
char 1 101
char 1 0
align 1
LABELV $354
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 119
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 116
char 1 104
char 1 101
char 1 114
char 1 109
char 1 97
char 1 108
char 1 0
align 1
LABELV $353
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
char 1 116
char 1 104
char 1 101
char 1 114
char 1 109
char 1 97
char 1 108
char 1 47
char 1 116
char 1 104
char 1 101
char 1 114
char 1 109
char 1 97
char 1 108
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $352
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
char 1 116
char 1 104
char 1 101
char 1 114
char 1 109
char 1 97
char 1 108
char 1 47
char 1 116
char 1 104
char 1 101
char 1 114
char 1 109
char 1 97
char 1 108
char 1 95
char 1 119
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $351
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
char 1 116
char 1 104
char 1 101
char 1 114
char 1 109
char 1 97
char 1 108
char 1 47
char 1 116
char 1 104
char 1 101
char 1 114
char 1 109
char 1 97
char 1 108
char 1 95
char 1 112
char 1 117
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $350
char 1 97
char 1 109
char 1 109
char 1 111
char 1 95
char 1 116
char 1 104
char 1 101
char 1 114
char 1 109
char 1 97
char 1 108
char 1 0
align 1
LABELV $349
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 119
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 109
char 1 101
char 1 114
char 1 114
char 1 115
char 1 111
char 1 110
char 1 110
char 1 0
align 1
LABELV $348
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
char 1 109
char 1 101
char 1 114
char 1 114
char 1 95
char 1 115
char 1 111
char 1 110
char 1 110
char 1 47
char 1 109
char 1 101
char 1 114
char 1 114
char 1 95
char 1 115
char 1 111
char 1 110
char 1 110
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $347
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
char 1 109
char 1 101
char 1 114
char 1 114
char 1 95
char 1 115
char 1 111
char 1 110
char 1 110
char 1 47
char 1 109
char 1 101
char 1 114
char 1 114
char 1 95
char 1 115
char 1 111
char 1 110
char 1 110
char 1 95
char 1 119
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $346
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 95
char 1 114
char 1 111
char 1 99
char 1 107
char 1 101
char 1 116
char 1 95
char 1 108
char 1 97
char 1 117
char 1 110
char 1 99
char 1 104
char 1 101
char 1 114
char 1 0
align 1
LABELV $345
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 119
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 102
char 1 108
char 1 101
char 1 99
char 1 104
char 1 101
char 1 116
char 1 116
char 1 101
char 1 0
align 1
LABELV $344
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
char 1 103
char 1 111
char 1 108
char 1 97
char 1 110
char 1 95
char 1 97
char 1 114
char 1 109
char 1 115
char 1 47
char 1 103
char 1 111
char 1 108
char 1 97
char 1 110
char 1 95
char 1 97
char 1 114
char 1 109
char 1 115
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $343
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
char 1 103
char 1 111
char 1 108
char 1 97
char 1 110
char 1 95
char 1 97
char 1 114
char 1 109
char 1 115
char 1 47
char 1 103
char 1 111
char 1 108
char 1 97
char 1 110
char 1 95
char 1 97
char 1 114
char 1 109
char 1 115
char 1 95
char 1 119
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $342
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 95
char 1 102
char 1 108
char 1 101
char 1 99
char 1 104
char 1 101
char 1 116
char 1 116
char 1 101
char 1 0
align 1
LABELV $341
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 119
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 100
char 1 101
char 1 109
char 1 112
char 1 50
char 1 0
align 1
LABELV $340
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
char 1 100
char 1 101
char 1 109
char 1 112
char 1 50
char 1 47
char 1 100
char 1 101
char 1 109
char 1 112
char 1 50
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $339
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
char 1 100
char 1 101
char 1 109
char 1 112
char 1 50
char 1 47
char 1 100
char 1 101
char 1 109
char 1 112
char 1 50
char 1 95
char 1 119
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $338
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 95
char 1 100
char 1 101
char 1 109
char 1 112
char 1 50
char 1 0
align 1
LABELV $337
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 119
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 114
char 1 101
char 1 112
char 1 101
char 1 97
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $336
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
char 1 104
char 1 101
char 1 97
char 1 118
char 1 121
char 1 95
char 1 114
char 1 101
char 1 112
char 1 101
char 1 97
char 1 116
char 1 101
char 1 114
char 1 47
char 1 104
char 1 101
char 1 97
char 1 118
char 1 121
char 1 95
char 1 114
char 1 101
char 1 112
char 1 101
char 1 97
char 1 116
char 1 101
char 1 114
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $335
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
char 1 104
char 1 101
char 1 97
char 1 118
char 1 121
char 1 95
char 1 114
char 1 101
char 1 112
char 1 101
char 1 97
char 1 116
char 1 101
char 1 114
char 1 47
char 1 104
char 1 101
char 1 97
char 1 118
char 1 121
char 1 95
char 1 114
char 1 101
char 1 112
char 1 101
char 1 97
char 1 116
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
LABELV $334
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 95
char 1 114
char 1 101
char 1 112
char 1 101
char 1 97
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $333
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 119
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 98
char 1 111
char 1 119
char 1 99
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $332
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
char 1 98
char 1 111
char 1 119
char 1 99
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 47
char 1 98
char 1 111
char 1 119
char 1 99
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $331
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
char 1 98
char 1 111
char 1 119
char 1 99
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 47
char 1 98
char 1 111
char 1 119
char 1 99
char 1 97
char 1 115
char 1 116
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
LABELV $330
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 95
char 1 98
char 1 111
char 1 119
char 1 99
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $329
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 119
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 100
char 1 105
char 1 115
char 1 114
char 1 117
char 1 112
char 1 116
char 1 111
char 1 114
char 1 0
align 1
LABELV $328
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
char 1 100
char 1 105
char 1 115
char 1 114
char 1 117
char 1 112
char 1 116
char 1 111
char 1 114
char 1 47
char 1 100
char 1 105
char 1 115
char 1 114
char 1 117
char 1 112
char 1 116
char 1 111
char 1 114
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $327
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
char 1 100
char 1 105
char 1 115
char 1 114
char 1 117
char 1 112
char 1 116
char 1 111
char 1 114
char 1 47
char 1 100
char 1 105
char 1 115
char 1 114
char 1 117
char 1 112
char 1 116
char 1 111
char 1 114
char 1 95
char 1 119
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $326
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 95
char 1 100
char 1 105
char 1 115
char 1 114
char 1 117
char 1 112
char 1 116
char 1 111
char 1 114
char 1 0
align 1
LABELV $325
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 119
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 98
char 1 108
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $324
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
char 1 98
char 1 108
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 95
char 1 114
char 1 47
char 1 98
char 1 108
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $323
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
char 1 98
char 1 108
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 95
char 1 114
char 1 47
char 1 98
char 1 108
char 1 97
char 1 115
char 1 116
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
LABELV $322
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 95
char 1 98
char 1 108
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $321
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 119
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 114
char 1 105
char 1 102
char 1 108
char 1 101
char 1 0
align 1
LABELV $320
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
char 1 98
char 1 114
char 1 105
char 1 97
char 1 114
char 1 95
char 1 112
char 1 105
char 1 115
char 1 116
char 1 111
char 1 108
char 1 47
char 1 98
char 1 114
char 1 105
char 1 97
char 1 114
char 1 95
char 1 112
char 1 105
char 1 115
char 1 116
char 1 111
char 1 108
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $319
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
char 1 98
char 1 114
char 1 105
char 1 97
char 1 114
char 1 95
char 1 112
char 1 105
char 1 115
char 1 116
char 1 111
char 1 108
char 1 47
char 1 98
char 1 114
char 1 105
char 1 97
char 1 114
char 1 95
char 1 112
char 1 105
char 1 115
char 1 116
char 1 111
char 1 108
char 1 95
char 1 119
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $318
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 95
char 1 98
char 1 114
char 1 121
char 1 97
char 1 114
char 1 95
char 1 112
char 1 105
char 1 115
char 1 116
char 1 111
char 1 108
char 1 0
align 1
LABELV $317
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 119
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 0
align 1
LABELV $316
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
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $315
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
LABELV $314
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 95
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 0
align 1
LABELV $313
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 119
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 115
char 1 116
char 1 117
char 1 110
char 1 98
char 1 97
char 1 116
char 1 111
char 1 110
char 1 0
align 1
LABELV $312
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
char 1 116
char 1 117
char 1 110
char 1 95
char 1 98
char 1 97
char 1 116
char 1 111
char 1 110
char 1 47
char 1 98
char 1 97
char 1 116
char 1 111
char 1 110
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $311
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
char 1 116
char 1 117
char 1 110
char 1 95
char 1 98
char 1 97
char 1 116
char 1 111
char 1 110
char 1 47
char 1 98
char 1 97
char 1 116
char 1 111
char 1 110
char 1 95
char 1 119
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $310
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 95
char 1 115
char 1 116
char 1 117
char 1 110
char 1 95
char 1 98
char 1 97
char 1 116
char 1 111
char 1 110
char 1 0
align 1
LABELV $309
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 109
char 1 112
char 1 105
char 1 95
char 1 121
char 1 115
char 1 97
char 1 109
char 1 97
char 1 114
char 1 105
char 1 0
align 1
LABELV $308
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 121
char 1 115
char 1 97
char 1 108
char 1 105
char 1 109
char 1 97
char 1 114
char 1 105
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $307
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 47
char 1 121
char 1 115
char 1 97
char 1 108
char 1 105
char 1 109
char 1 97
char 1 114
char 1 105
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $306
char 1 105
char 1 116
char 1 101
char 1 109
char 1 95
char 1 121
char 1 115
char 1 97
char 1 108
char 1 105
char 1 109
char 1 97
char 1 114
char 1 105
char 1 0
align 1
LABELV $305
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 109
char 1 112
char 1 105
char 1 95
char 1 102
char 1 98
char 1 111
char 1 111
char 1 110
char 1 0
align 1
LABELV $304
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 95
char 1 98
char 1 111
char 1 111
char 1 110
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $303
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 47
char 1 98
char 1 111
char 1 111
char 1 110
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $302
char 1 105
char 1 116
char 1 101
char 1 109
char 1 95
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 95
char 1 98
char 1 111
char 1 111
char 1 110
char 1 0
align 1
LABELV $301
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 109
char 1 112
char 1 105
char 1 95
char 1 100
char 1 107
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 0
align 1
LABELV $300
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 100
char 1 107
char 1 95
char 1 101
char 1 110
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 101
char 1 110
char 1 109
char 1 101
char 1 110
char 1 116
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $299
char 1 105
char 1 116
char 1 101
char 1 109
char 1 95
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 95
char 1 101
char 1 110
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 101
char 1 110
char 1 95
char 1 100
char 1 97
char 1 114
char 1 107
char 1 0
align 1
LABELV $298
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 109
char 1 112
char 1 105
char 1 95
char 1 106
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 0
align 1
LABELV $297
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 106
char 1 101
char 1 100
char 1 105
char 1 95
char 1 101
char 1 110
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 101
char 1 110
char 1 109
char 1 101
char 1 110
char 1 116
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $296
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 47
char 1 101
char 1 110
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 101
char 1 110
char 1 109
char 1 101
char 1 110
char 1 116
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $295
char 1 105
char 1 116
char 1 101
char 1 109
char 1 95
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 95
char 1 101
char 1 110
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 101
char 1 110
char 1 95
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 0
align 1
LABELV $294
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 105
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 115
char 1 101
char 1 110
char 1 116
char 1 114
char 1 121
char 1 103
char 1 117
char 1 110
char 1 0
align 1
LABELV $293
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 105
char 1 116
char 1 101
char 1 109
char 1 115
char 1 47
char 1 112
char 1 115
char 1 103
char 1 117
char 1 110
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $292
char 1 105
char 1 116
char 1 101
char 1 109
char 1 95
char 1 115
char 1 101
char 1 110
char 1 116
char 1 114
char 1 121
char 1 95
char 1 103
char 1 117
char 1 110
char 1 0
align 1
LABELV $291
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 105
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 122
char 1 111
char 1 111
char 1 109
char 1 0
align 1
LABELV $290
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 105
char 1 116
char 1 101
char 1 109
char 1 115
char 1 47
char 1 98
char 1 105
char 1 110
char 1 111
char 1 99
char 1 117
char 1 108
char 1 97
char 1 114
char 1 115
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $289
char 1 105
char 1 116
char 1 101
char 1 109
char 1 95
char 1 98
char 1 105
char 1 110
char 1 111
char 1 99
char 1 117
char 1 108
char 1 97
char 1 114
char 1 115
char 1 0
align 1
LABELV $288
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 105
char 1 116
char 1 101
char 1 109
char 1 115
char 1 47
char 1 100
char 1 97
char 1 116
char 1 97
char 1 112
char 1 97
char 1 100
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $287
char 1 105
char 1 116
char 1 101
char 1 109
char 1 95
char 1 100
char 1 97
char 1 116
char 1 97
char 1 112
char 1 97
char 1 100
char 1 0
align 1
LABELV $286
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 105
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 98
char 1 97
char 1 99
char 1 116
char 1 97
char 1 0
align 1
LABELV $285
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 98
char 1 97
char 1 99
char 1 116
char 1 97
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $284
char 1 105
char 1 116
char 1 101
char 1 109
char 1 95
char 1 109
char 1 101
char 1 100
char 1 112
char 1 97
char 1 99
char 1 0
align 1
LABELV $283
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 47
char 1 100
char 1 101
char 1 116
char 1 112
char 1 97
char 1 99
char 1 107
char 1 47
char 1 115
char 1 116
char 1 105
char 1 99
char 1 107
char 1 46
char 1 119
char 1 97
char 1 118
char 1 32
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 109
char 1 111
char 1 118
char 1 101
char 1 114
char 1 115
char 1 47
char 1 100
char 1 111
char 1 111
char 1 114
char 1 115
char 1 47
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 102
char 1 105
char 1 101
char 1 108
char 1 100
char 1 95
char 1 111
char 1 110
char 1 46
char 1 119
char 1 97
char 1 118
char 1 32
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 109
char 1 111
char 1 118
char 1 101
char 1 114
char 1 115
char 1 47
char 1 100
char 1 111
char 1 111
char 1 114
char 1 115
char 1 47
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 102
char 1 105
char 1 101
char 1 108
char 1 100
char 1 95
char 1 111
char 1 102
char 1 102
char 1 46
char 1 119
char 1 97
char 1 118
char 1 32
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 109
char 1 111
char 1 118
char 1 101
char 1 114
char 1 115
char 1 47
char 1 100
char 1 111
char 1 111
char 1 114
char 1 115
char 1 47
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 102
char 1 105
char 1 101
char 1 108
char 1 100
char 1 95
char 1 108
char 1 112
char 1 46
char 1 119
char 1 97
char 1 118
char 1 32
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 101
char 1 102
char 1 102
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 98
char 1 117
char 1 109
char 1 112
char 1 102
char 1 105
char 1 101
char 1 108
char 1 100
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $282
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 105
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 115
char 1 104
char 1 105
char 1 101
char 1 108
char 1 100
char 1 119
char 1 97
char 1 108
char 1 108
char 1 0
align 1
LABELV $281
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 115
char 1 104
char 1 105
char 1 101
char 1 108
char 1 100
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $280
char 1 105
char 1 116
char 1 101
char 1 109
char 1 95
char 1 115
char 1 104
char 1 105
char 1 101
char 1 108
char 1 100
char 1 0
align 1
LABELV $279
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 105
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 115
char 1 101
char 1 101
char 1 107
char 1 101
char 1 114
char 1 0
align 1
LABELV $278
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 105
char 1 116
char 1 101
char 1 109
char 1 115
char 1 47
char 1 114
char 1 101
char 1 109
char 1 111
char 1 116
char 1 101
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $277
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 47
char 1 119
char 1 95
char 1 112
char 1 107
char 1 117
char 1 112
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $276
char 1 105
char 1 116
char 1 101
char 1 109
char 1 95
char 1 115
char 1 101
char 1 101
char 1 107
char 1 101
char 1 114
char 1 0
align 1
LABELV $275
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 105
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 109
char 1 101
char 1 100
char 1 107
char 1 105
char 1 116
char 1 0
align 1
LABELV $274
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 109
char 1 101
char 1 100
char 1 112
char 1 97
char 1 99
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $273
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 47
char 1 112
char 1 105
char 1 99
char 1 107
char 1 117
char 1 112
char 1 104
char 1 101
char 1 97
char 1 108
char 1 116
char 1 104
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $272
char 1 105
char 1 116
char 1 101
char 1 109
char 1 95
char 1 109
char 1 101
char 1 100
char 1 112
char 1 97
char 1 107
char 1 95
char 1 105
char 1 110
char 1 115
char 1 116
char 1 97
char 1 110
char 1 116
char 1 0
align 1
LABELV $271
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 112
char 1 47
char 1 108
char 1 97
char 1 114
char 1 103
char 1 101
char 1 95
char 1 115
char 1 104
char 1 105
char 1 101
char 1 108
char 1 100
char 1 0
align 1
LABELV $270
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 112
char 1 115
char 1 100
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $269
char 1 105
char 1 116
char 1 101
char 1 109
char 1 95
char 1 115
char 1 104
char 1 105
char 1 101
char 1 108
char 1 100
char 1 95
char 1 108
char 1 114
char 1 103
char 1 95
char 1 105
char 1 110
char 1 115
char 1 116
char 1 97
char 1 110
char 1 116
char 1 0
align 1
LABELV $268
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 112
char 1 47
char 1 115
char 1 109
char 1 97
char 1 108
char 1 108
char 1 95
char 1 115
char 1 104
char 1 105
char 1 101
char 1 108
char 1 100
char 1 0
align 1
LABELV $267
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 112
char 1 115
char 1 100
char 1 95
char 1 115
char 1 109
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $266
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 47
char 1 112
char 1 105
char 1 99
char 1 107
char 1 117
char 1 112
char 1 115
char 1 104
char 1 105
char 1 101
char 1 108
char 1 100
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $265
char 1 105
char 1 116
char 1 101
char 1 109
char 1 95
char 1 115
char 1 104
char 1 105
char 1 101
char 1 108
char 1 100
char 1 95
char 1 115
char 1 109
char 1 95
char 1 105
char 1 110
char 1 115
char 1 116
char 1 97
char 1 110
char 1 116
char 1 0
align 1
LABELV $264
char 1 0
align 1
LABELV $263
char 1 37
char 1 105
char 1 0
align 1
LABELV $132
char 1 37
char 1 105
char 1 45
char 1 0
align 1
LABELV $131
char 1 55
char 1 45
char 1 49
char 1 45
char 1 48
char 1 51
char 1 50
char 1 51
char 1 51
char 1 48
char 1 48
char 1 48
char 1 48
char 1 48
char 1 48
char 1 48
char 1 48
char 1 48
char 1 49
char 1 51
char 1 51
char 1 51
char 1 0
align 1
LABELV $127
char 1 77
char 1 65
char 1 83
char 1 84
char 1 69
char 1 82
char 1 89
char 1 55
char 1 0
align 1
LABELV $126
char 1 77
char 1 65
char 1 83
char 1 84
char 1 69
char 1 82
char 1 89
char 1 54
char 1 0
align 1
LABELV $125
char 1 77
char 1 65
char 1 83
char 1 84
char 1 69
char 1 82
char 1 89
char 1 53
char 1 0
align 1
LABELV $124
char 1 77
char 1 65
char 1 83
char 1 84
char 1 69
char 1 82
char 1 89
char 1 52
char 1 0
align 1
LABELV $123
char 1 77
char 1 65
char 1 83
char 1 84
char 1 69
char 1 82
char 1 89
char 1 51
char 1 0
align 1
LABELV $122
char 1 77
char 1 65
char 1 83
char 1 84
char 1 69
char 1 82
char 1 89
char 1 50
char 1 0
align 1
LABELV $121
char 1 77
char 1 65
char 1 83
char 1 84
char 1 69
char 1 82
char 1 89
char 1 49
char 1 0
align 1
LABELV $120
char 1 77
char 1 65
char 1 83
char 1 84
char 1 69
char 1 82
char 1 89
char 1 48
char 1 0
