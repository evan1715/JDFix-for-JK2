data
export gDuelExit
align 4
LABELV gDuelExit
byte 4 0
export gDuelist1
align 4
LABELV gDuelist1
byte 4 -1
export gDuelist2
align 4
LABELV gDuelist2
byte 4 -1
align 4
LABELV gameCvarTable
address jd_CloseServer
address $79
address $80
byte 4 1
byte 4 0
byte 4 1
skip 4
address jd_Messages
address $81
address $82
byte 4 1
byte 4 0
byte 4 1
skip 4
address g_cheats
address $83
address $84
byte 4 0
byte 4 0
byte 4 0
skip 4
byte 4 0
address $85
address $86
byte 4 68
byte 4 0
byte 4 0
skip 4
byte 4 0
address $87
address $88
byte 4 64
byte 4 0
byte 4 0
skip 4
address g_restarted
address $89
address $80
byte 4 64
byte 4 0
byte 4 0
skip 4
byte 4 0
address $90
address $84
byte 4 68
byte 4 0
byte 4 0
skip 4
address g_gametype
address $91
address $80
byte 4 38
byte 4 0
byte 4 0
skip 4
address g_MaxHolocronCarry
address $92
address $93
byte 4 38
byte 4 0
byte 4 0
skip 4
address g_maxclients
address $94
address $95
byte 4 37
byte 4 0
byte 4 0
skip 4
address g_maxGameClients
address $96
address $80
byte 4 37
byte 4 0
byte 4 0
skip 4
address g_ff_objectives
address $97
address $80
byte 4 1024
byte 4 0
byte 4 1
skip 4
address g_trueJedi
address $98
address $80
byte 4 37
byte 4 0
byte 4 1
skip 4
address g_autoMapCycle
address $99
address $80
byte 4 1025
byte 4 0
byte 4 1
skip 4
address g_dmflags
address $100
address $80
byte 4 5
byte 4 0
byte 4 1
skip 4
address g_maxForceRank
address $101
address $102
byte 4 39
byte 4 0
byte 4 0
skip 4
address g_forceBasedTeams
address $103
address $80
byte 4 39
byte 4 0
byte 4 0
skip 4
address g_privateDuel
address $104
address $82
byte 4 5
byte 4 0
byte 4 1
skip 4
address g_saberLocking
address $105
address $82
byte 4 5
byte 4 0
byte 4 1
skip 4
address g_saberLockFactor
address $106
address $107
byte 4 1
byte 4 0
byte 4 1
skip 4
address g_saberTraceSaberFirst
address $108
address $82
byte 4 1
byte 4 0
byte 4 1
skip 4
address g_saberGhoul2Collision
address $109
address $80
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_saberAlwaysBoxTrace
address $110
address $80
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_saberBoxTraceSize
address $111
address $112
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_logClientInfo
address $113
address $80
byte 4 1
byte 4 0
byte 4 1
skip 4
address g_slowmoDuelEnd
address $114
address $80
byte 4 1
byte 4 0
byte 4 1
skip 4
address g_saberDamageScale
address $115
address $82
byte 4 1
byte 4 0
byte 4 1
skip 4
address g_forceRegenTime
address $116
address $80
byte 4 5
byte 4 0
byte 4 1
skip 4
address g_spawnInvulnerability
address $117
address $118
byte 4 1
byte 4 0
byte 4 1
skip 4
address g_forcePowerDisable
address $119
address $80
byte 4 37
byte 4 0
byte 4 1
skip 4
address g_weaponDisable
address $120
address $80
byte 4 37
byte 4 0
byte 4 1
skip 4
address g_duelWeaponDisable
address $121
address $82
byte 4 37
byte 4 0
byte 4 1
skip 4
address g_allowDuelSuicide
address $122
address $80
byte 4 1
byte 4 0
byte 4 1
skip 4
address g_fraglimitVoteCorrection
address $123
address $82
byte 4 1
byte 4 0
byte 4 1
skip 4
address g_fraglimit
address $124
address $125
byte 4 1029
byte 4 0
byte 4 1
skip 4
address g_duel_fraglimit
address $126
address $127
byte 4 1029
byte 4 0
byte 4 1
skip 4
address g_timelimit
address $128
address $80
byte 4 1029
byte 4 0
byte 4 1
skip 4
address g_capturelimit
address $129
address $95
byte 4 1029
byte 4 0
byte 4 1
skip 4
address g_synchronousClients
address $130
address $80
byte 4 8
byte 4 0
byte 4 0
skip 4
address g_saberInterpolate
address $131
address $82
byte 4 1
byte 4 0
byte 4 1
skip 4
address g_friendlyFire
address $132
address $80
byte 4 1
byte 4 0
byte 4 1
skip 4
address g_friendlySaber
address $133
address $80
byte 4 1
byte 4 0
byte 4 1
skip 4
address g_teamAutoJoin
address $134
address $80
byte 4 1
skip 12
address g_teamForceBalance
address $135
address $80
byte 4 1
skip 12
address g_warmup
address $136
address $137
byte 4 1
byte 4 0
byte 4 1
skip 4
address g_doWarmup
address $138
address $80
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_log
address $139
address $140
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_logSync
address $141
address $80
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_statLog
address $142
address $80
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_statLogFile
address $143
address $144
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_password
address $145
address $84
byte 4 2
byte 4 0
byte 4 0
skip 4
address g_banIPs
address $146
address $84
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_filterBan
address $147
address $82
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_needpass
address $148
address $80
byte 4 68
byte 4 0
byte 4 0
skip 4
address g_dedicated
address $149
address $80
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_speed
address $150
address $151
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_gravity
address $152
address $153
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_knockback
address $154
address $155
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_quadfactor
address $156
address $93
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_weaponRespawn
address $157
address $158
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_weaponTeamRespawn
address $159
address $158
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_adaptRespawn
address $160
address $82
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_forcerespawn
address $161
address $162
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_inactivity
address $163
address $80
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_debugMove
address $164
address $80
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_debugDamage
address $165
address $80
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_debugAlloc
address $166
address $80
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_motd
address $167
address $84
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_blood
address $168
address $82
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_podiumDist
address $169
address $170
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_podiumDrop
address $171
address $172
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_allowVote
address $173
address $82
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_listEntity
address $174
address $80
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_redteam
address $175
address $176
byte 4 7
byte 4 0
byte 4 1
byte 4 1
address g_blueteam
address $177
address $178
byte 4 7
byte 4 0
byte 4 1
byte 4 1
address g_singlePlayer
address $179
address $84
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address g_enableDust
address $180
address $80
byte 4 0
byte 4 0
byte 4 1
byte 4 0
address g_enableBreath
address $181
address $80
byte 4 0
byte 4 0
byte 4 1
byte 4 0
address g_smoothClients
address $182
address $82
byte 4 0
byte 4 0
byte 4 0
skip 4
address pmove_fixed
address $183
address $80
byte 4 8
byte 4 0
byte 4 0
skip 4
address pmove_msec
address $184
address $95
byte 4 8
byte 4 0
byte 4 0
skip 4
address g_rankings
address $185
address $80
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_dismember
address $186
address $80
byte 4 1
byte 4 0
byte 4 1
skip 4
address g_forceDodge
address $187
address $82
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_timeouttospec
address $188
address $172
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_saberDmgVelocityScale
address $189
address $80
byte 4 1
byte 4 0
byte 4 1
skip 4
address g_saberDmgDelay_Idle
address $190
address $191
byte 4 1
byte 4 0
byte 4 1
skip 4
address g_saberDmgDelay_Wound
address $192
address $80
byte 4 1
byte 4 0
byte 4 1
skip 4
address g_saberDebugPrint
address $193
address $80
byte 4 512
byte 4 0
byte 4 0
skip 4
address g_austrian
address $194
address $80
byte 4 1
byte 4 0
byte 4 0
skip 4
align 4
LABELV gameCvarTableSize
byte 4 90
export vmMain
code
proc vmMain 16 12
file "../g_main.c"
line 310
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:#include "g_local.h"
;5:
;6:level_locals_t	level;
;7:
;8:typedef struct {
;9:	vmCvar_t	*vmCvar;
;10:	char		*cvarName;
;11:	char		*defaultString;
;12:	int			cvarFlags;
;13:	int			modificationCount;  // for tracking changes
;14:	qboolean	trackChange;	    // track this variable, and announce if changed
;15:  qboolean teamShader;        // track and if changed, update shader state
;16:} cvarTable_t;
;17:
;18:gentity_t		g_entities[MAX_GENTITIES];
;19:gclient_t		g_clients[MAX_CLIENTS];
;20:
;21:qboolean gDuelExit = qfalse;
;22:
;23:vmCvar_t	g_trueJedi;
;24:
;25:vmCvar_t	g_gametype;
;26:vmCvar_t	g_MaxHolocronCarry;
;27:vmCvar_t	g_ff_objectives;
;28:vmCvar_t	g_autoMapCycle;
;29:vmCvar_t	g_dmflags;
;30:vmCvar_t	g_maxForceRank;
;31:vmCvar_t	g_forceBasedTeams;
;32:vmCvar_t	g_privateDuel;
;33:vmCvar_t	g_saberLocking;
;34:vmCvar_t	g_saberLockFactor;
;35:vmCvar_t	g_saberTraceSaberFirst;
;36:
;37:#ifdef G2_COLLISION_ENABLED
;38:vmCvar_t	g_saberGhoul2Collision;
;39:#endif
;40:vmCvar_t	g_saberAlwaysBoxTrace;
;41:vmCvar_t	g_saberBoxTraceSize;
;42:
;43:vmCvar_t	g_logClientInfo;
;44:
;45:vmCvar_t	g_slowmoDuelEnd;
;46:
;47:vmCvar_t	g_saberDamageScale;
;48:
;49:vmCvar_t	g_forceRegenTime;
;50:vmCvar_t	g_spawnInvulnerability;
;51:vmCvar_t	g_forcePowerDisable;
;52:vmCvar_t	g_weaponDisable;
;53:vmCvar_t	g_duelWeaponDisable;
;54:vmCvar_t	g_allowDuelSuicide;
;55:vmCvar_t	g_fraglimitVoteCorrection;
;56:vmCvar_t	g_fraglimit;
;57:vmCvar_t	g_duel_fraglimit;
;58:vmCvar_t	g_timelimit;
;59:vmCvar_t	g_capturelimit;
;60:vmCvar_t	g_saberInterpolate;
;61:vmCvar_t	g_friendlyFire;
;62:vmCvar_t	g_friendlySaber;
;63:vmCvar_t	g_password;
;64:vmCvar_t	g_needpass;
;65:vmCvar_t	g_maxclients;
;66:vmCvar_t	g_maxGameClients;
;67:vmCvar_t	g_dedicated;
;68:vmCvar_t	g_speed;
;69:vmCvar_t	g_gravity;
;70:vmCvar_t	g_cheats;
;71:vmCvar_t	g_knockback;
;72:vmCvar_t	g_quadfactor;
;73:vmCvar_t	g_forcerespawn;
;74:vmCvar_t	g_inactivity;
;75:vmCvar_t	g_debugMove;
;76:vmCvar_t	g_debugDamage;
;77:vmCvar_t	g_debugAlloc;
;78:vmCvar_t	g_weaponRespawn;
;79:vmCvar_t	g_weaponTeamRespawn;
;80:vmCvar_t	g_adaptRespawn;
;81:vmCvar_t	g_motd;
;82:vmCvar_t	g_synchronousClients;
;83:vmCvar_t	g_warmup;
;84:vmCvar_t	g_doWarmup;
;85:vmCvar_t	g_restarted;
;86:vmCvar_t	g_log;
;87:vmCvar_t	g_logSync;
;88:vmCvar_t	g_statLog;
;89:vmCvar_t	g_statLogFile;
;90:vmCvar_t	g_blood;
;91:vmCvar_t	g_podiumDist;
;92:vmCvar_t	g_podiumDrop;
;93:vmCvar_t	g_allowVote;
;94:vmCvar_t	g_teamAutoJoin;
;95:vmCvar_t	g_teamForceBalance;
;96:vmCvar_t	g_banIPs;
;97:vmCvar_t	g_filterBan;
;98:vmCvar_t	g_debugForward;
;99:vmCvar_t	g_debugRight;
;100:vmCvar_t	g_debugUp;
;101:vmCvar_t	g_smoothClients;
;102:vmCvar_t	pmove_fixed;
;103:vmCvar_t	pmove_msec;
;104:vmCvar_t	g_rankings;
;105:vmCvar_t	g_listEntity;
;106:vmCvar_t	g_redteam;
;107:vmCvar_t	g_blueteam;
;108:vmCvar_t	g_singlePlayer;
;109:vmCvar_t	g_enableDust;
;110:vmCvar_t	g_enableBreath;
;111:vmCvar_t	g_dismember;
;112:vmCvar_t	g_forceDodge;
;113:vmCvar_t	g_timeouttospec;
;114:
;115:vmCvar_t	g_saberDmgVelocityScale;
;116:vmCvar_t	g_saberDmgDelay_Idle;
;117:vmCvar_t	g_saberDmgDelay_Wound;
;118:
;119:vmCvar_t	g_saberDebugPrint;
;120:
;121:vmCvar_t	g_austrian;
;122:
;123://JediDog: Added commands
;124://vmCvar_t	jd_antiFlood;
;125://vmCvar_t	jd_antiNameCrash;
;126://vmCvar_t	jd_antiForceCrash;
;127://vmCvar_t	jd_FakePlayerDetection;
;128:vmCvar_t	jd_CloseServer;
;129://vmCvar_t	jd_SitEmote;
;130:vmCvar_t	jd_Messages;
;131://vmCvar_t	jd_LungeFloat;
;132://end  of cmds
;133:
;134:int gDuelist1 = -1;
;135:int gDuelist2 = -1;
;136:
;137:// bk001129 - made static to avoid aliasing
;138:static cvarTable_t		gameCvarTable[] = {
;139:
;140:	//JediDog: beginning of the commands
;141://	{ &jd_antiFlood,		   "jd_antiFlood",			 "1", CVAR_ARCHIVE, 0, qtrue },
;142://	{ &jd_antiNameCrash,       "jd_antiNameCrash",       "1", CVAR_ARCHIVE, 0, qtrue }, 
;143://	{ &jd_antiForceCrash,      "jd_antiForceCrash",      "1", CVAR_ARCHIVE, 0, qtrue },
;144://	{ &jd_FakePlayerDetection, "jd_FakePlayerDetection", "1", CVAR_ARCHIVE, 0, qtrue },
;145:	{ &jd_CloseServer,         "jd_CloseServer",         "0", CVAR_ARCHIVE, 0, qtrue },
;146://	{ &jd_SitEmote,			   "jd_SitEmote",			 "1", CVAR_ARCHIVE, 0, qtrue },
;147:	{ &jd_Messages,		       "jd_Messages",			 "1", CVAR_ARCHIVE, 0, qtrue },
;148://	{ &jd_LungeFloat,		   "jd_LungeFloat",			 "0", CVAR_ARCHIVE, 0, qtrue },
;149:	//end of the commands
;150:
;151:	// don't override the cheat state set by the system
;152:	{ &g_cheats, "sv_cheats", "", 0, 0, qfalse },
;153:
;154:	// noset vars
;155:	{ NULL, "gamename", GAMEVERSION , CVAR_SERVERINFO | CVAR_ROM, 0, qfalse  },
;156:	{ NULL, "gamedate", __DATE__ , CVAR_ROM, 0, qfalse  },
;157:	{ &g_restarted, "g_restarted", "0", CVAR_ROM, 0, qfalse  },
;158:	{ NULL, "sv_mapname", "", CVAR_SERVERINFO | CVAR_ROM, 0, qfalse  },
;159:
;160:	// latched vars
;161:	{ &g_gametype, "g_gametype", "0", CVAR_SERVERINFO | CVAR_USERINFO | CVAR_LATCH, 0, qfalse  },
;162:	{ &g_MaxHolocronCarry, "g_MaxHolocronCarry", "3", CVAR_SERVERINFO | CVAR_USERINFO | CVAR_LATCH, 0, qfalse  },
;163:
;164:	{ &g_maxclients, "sv_maxclients", "8", CVAR_SERVERINFO | CVAR_LATCH | CVAR_ARCHIVE, 0, qfalse  },
;165:	{ &g_maxGameClients, "g_maxGameClients", "0", CVAR_SERVERINFO | CVAR_LATCH | CVAR_ARCHIVE, 0, qfalse  },
;166:
;167:	// change anytime vars
;168:	{ &g_ff_objectives, "g_ff_objectives", "0", /*CVAR_SERVERINFO |*/  CVAR_NORESTART, 0, qtrue },
;169:
;170:	{ &g_trueJedi, "g_jediVmerc", "0", CVAR_SERVERINFO | CVAR_LATCH | CVAR_ARCHIVE, 0, qtrue },
;171:
;172:	{ &g_autoMapCycle, "g_autoMapCycle", "0", CVAR_ARCHIVE | CVAR_NORESTART, 0, qtrue },
;173:	{ &g_dmflags, "dmflags", "0", CVAR_SERVERINFO | CVAR_ARCHIVE, 0, qtrue  },
;174:	
;175:	{ &g_maxForceRank, "g_maxForceRank", "7", CVAR_SERVERINFO | CVAR_ARCHIVE | CVAR_USERINFO | CVAR_LATCH, 0, qfalse  },
;176:	{ &g_forceBasedTeams, "g_forceBasedTeams", "0", CVAR_SERVERINFO | CVAR_ARCHIVE | CVAR_USERINFO | CVAR_LATCH, 0, qfalse  },
;177:	{ &g_privateDuel, "g_privateDuel", "1", CVAR_SERVERINFO | CVAR_ARCHIVE, 0, qtrue  },
;178:	{ &g_saberLocking, "g_saberLocking", "1", CVAR_SERVERINFO | CVAR_ARCHIVE, 0, qtrue  },
;179:	{ &g_saberLockFactor, "g_saberLockFactor", "6", CVAR_ARCHIVE, 0, qtrue  },
;180:	{ &g_saberTraceSaberFirst, "g_saberTraceSaberFirst", "1", CVAR_ARCHIVE, 0, qtrue  },
;181:
;182:#ifdef G2_COLLISION_ENABLED
;183:	{ &g_saberGhoul2Collision, "g_saberGhoul2Collision", "0", 0, 0, qtrue  },
;184:#endif
;185:	{ &g_saberAlwaysBoxTrace, "g_saberAlwaysBoxTrace", "0", 0, 0, qtrue  },
;186:	{ &g_saberBoxTraceSize, "g_saberBoxTraceSize", "2", 0, 0, qtrue  },
;187:
;188:	{ &g_logClientInfo, "g_logClientInfo", "0", CVAR_ARCHIVE, 0, qtrue  },
;189:
;190:	{ &g_slowmoDuelEnd, "g_slowmoDuelEnd", "0", CVAR_ARCHIVE, 0, qtrue  },
;191:
;192:	{ &g_saberDamageScale, "g_saberDamageScale", "1", CVAR_ARCHIVE, 0, qtrue  },
;193:
;194:	{ &g_forceRegenTime, "g_forceRegenTime", "0", CVAR_SERVERINFO | CVAR_ARCHIVE, 0, qtrue  },
;195:
;196:	{ &g_spawnInvulnerability, "g_spawnInvulnerability", "10000", CVAR_ARCHIVE, 0, qtrue  },
;197:
;198:	{ &g_forcePowerDisable, "g_forcePowerDisable", "0", CVAR_SERVERINFO | CVAR_ARCHIVE | CVAR_LATCH, 0, qtrue  },
;199:	{ &g_weaponDisable, "g_weaponDisable", "0", CVAR_SERVERINFO | CVAR_ARCHIVE | CVAR_LATCH, 0, qtrue  },
;200:	{ &g_duelWeaponDisable, "g_duelWeaponDisable", "1", CVAR_SERVERINFO | CVAR_ARCHIVE | CVAR_LATCH, 0, qtrue  },
;201:
;202:	{ &g_allowDuelSuicide, "g_allowDuelSuicide", "0", CVAR_ARCHIVE, 0, qtrue },
;203:
;204:	{ &g_fraglimitVoteCorrection, "g_fraglimitVoteCorrection", "1", CVAR_ARCHIVE, 0, qtrue },
;205:
;206:	{ &g_fraglimit, "fraglimit", "50", CVAR_SERVERINFO | CVAR_ARCHIVE | CVAR_NORESTART, 0, qtrue },
;207:	{ &g_duel_fraglimit, "duel_fraglimit", "10", CVAR_SERVERINFO | CVAR_ARCHIVE | CVAR_NORESTART, 0, qtrue },
;208:	{ &g_timelimit, "timelimit", "0", CVAR_SERVERINFO | CVAR_ARCHIVE | CVAR_NORESTART, 0, qtrue },
;209:	{ &g_capturelimit, "capturelimit", "8", CVAR_SERVERINFO | CVAR_ARCHIVE | CVAR_NORESTART, 0, qtrue },
;210:
;211:	{ &g_synchronousClients, "g_synchronousClients", "0", CVAR_SYSTEMINFO, 0, qfalse  },
;212:
;213:	{ &g_saberInterpolate, "g_saberInterpolate", "1", CVAR_ARCHIVE, 0, qtrue },
;214:
;215:	{ &g_friendlyFire, "g_friendlyFire", "0", CVAR_ARCHIVE, 0, qtrue  },
;216:	{ &g_friendlySaber, "g_friendlySaber", "0", CVAR_ARCHIVE, 0, qtrue  },
;217:
;218:	{ &g_teamAutoJoin, "g_teamAutoJoin", "0", CVAR_ARCHIVE  },
;219:	{ &g_teamForceBalance, "g_teamForceBalance", "0", CVAR_ARCHIVE  },
;220:
;221:	{ &g_warmup, "g_warmup", "20", CVAR_ARCHIVE, 0, qtrue  },
;222:	{ &g_doWarmup, "g_doWarmup", "0", 0, 0, qtrue  },
;223:	{ &g_log, "g_log", "games.log", CVAR_ARCHIVE, 0, qfalse  },
;224:	{ &g_logSync, "g_logSync", "0", CVAR_ARCHIVE, 0, qfalse  },
;225:
;226:	{ &g_statLog, "g_statLog", "0", CVAR_ARCHIVE, 0, qfalse },
;227:	{ &g_statLogFile, "g_statLogFile", "statlog.log", CVAR_ARCHIVE, 0, qfalse },
;228:
;229:	{ &g_password, "g_password", "", CVAR_USERINFO, 0, qfalse  },
;230:
;231:	{ &g_banIPs, "g_banIPs", "", CVAR_ARCHIVE, 0, qfalse  },
;232:	{ &g_filterBan, "g_filterBan", "1", CVAR_ARCHIVE, 0, qfalse  },
;233:
;234:	{ &g_needpass, "g_needpass", "0", CVAR_SERVERINFO | CVAR_ROM, 0, qfalse },
;235:
;236:	{ &g_dedicated, "dedicated", "0", 0, 0, qfalse  },
;237:
;238:	{ &g_speed, "g_speed", "250", 0, 0, qtrue  },
;239:	{ &g_gravity, "g_gravity", "800", 0, 0, qtrue  },
;240:	{ &g_knockback, "g_knockback", "1000", 0, 0, qtrue  },
;241:	{ &g_quadfactor, "g_quadfactor", "3", 0, 0, qtrue  },
;242:	{ &g_weaponRespawn, "g_weaponrespawn", "5", 0, 0, qtrue  },
;243:	{ &g_weaponTeamRespawn, "g_weaponTeamRespawn", "5", 0, 0, qtrue },
;244:	{ &g_adaptRespawn, "g_adaptrespawn", "1", 0, 0, qtrue  },		// Make weapons respawn faster with a lot of players.
;245:	{ &g_forcerespawn, "g_forcerespawn", "60", 0, 0, qtrue },		// One minute force respawn.  Give a player enough time to reallocate force.
;246:	{ &g_inactivity, "g_inactivity", "0", 0, 0, qtrue },
;247:	{ &g_debugMove, "g_debugMove", "0", 0, 0, qfalse },
;248:	{ &g_debugDamage, "g_debugDamage", "0", 0, 0, qfalse },
;249:	{ &g_debugAlloc, "g_debugAlloc", "0", 0, 0, qfalse },
;250:	{ &g_motd, "g_motd", "", 0, 0, qfalse },
;251:	{ &g_blood, "com_blood", "1", 0, 0, qfalse },
;252:
;253:	{ &g_podiumDist, "g_podiumDist", "80", 0, 0, qfalse },
;254:	{ &g_podiumDrop, "g_podiumDrop", "70", 0, 0, qfalse },
;255:
;256:	{ &g_allowVote, "g_allowVote", "1", CVAR_ARCHIVE, 0, qfalse },
;257:	{ &g_listEntity, "g_listEntity", "0", 0, 0, qfalse },
;258:
;259:#if 0
;260:	{ &g_debugForward, "g_debugForward", "0", 0, 0, qfalse },
;261:	{ &g_debugRight, "g_debugRight", "0", 0, 0, qfalse },
;262:	{ &g_debugUp, "g_debugUp", "0", 0, 0, qfalse },
;263:#endif
;264:
;265:	{ &g_redteam, "g_redteam", "Empire", CVAR_ARCHIVE | CVAR_SERVERINFO | CVAR_USERINFO , 0, qtrue, qtrue },
;266:	{ &g_blueteam, "g_blueteam", "Rebellion", CVAR_ARCHIVE | CVAR_SERVERINFO | CVAR_USERINFO , 0, qtrue, qtrue  },
;267:	{ &g_singlePlayer, "ui_singlePlayerActive", "", 0, 0, qfalse, qfalse  },
;268:
;269:	{ &g_enableDust, "g_enableDust", "0", 0, 0, qtrue, qfalse },
;270:	{ &g_enableBreath, "g_enableBreath", "0", 0, 0, qtrue, qfalse },
;271:	{ &g_smoothClients, "g_smoothClients", "1", 0, 0, qfalse},
;272:	{ &pmove_fixed, "pmove_fixed", "0", CVAR_SYSTEMINFO, 0, qfalse},
;273:	{ &pmove_msec, "pmove_msec", "8", CVAR_SYSTEMINFO, 0, qfalse},
;274:
;275:	{ &g_rankings, "g_rankings", "0", 0, 0, qfalse},
;276:
;277:	{ &g_dismember, "g_dismember", "0", CVAR_ARCHIVE, 0, qtrue  },
;278:	{ &g_forceDodge, "g_forceDodge", "1", 0, 0, qtrue  },
;279:
;280:	{ &g_timeouttospec, "g_timeouttospec", "70", CVAR_ARCHIVE, 0, qfalse },
;281:
;282:	{ &g_saberDmgVelocityScale, "g_saberDmgVelocityScale", "0", CVAR_ARCHIVE, 0, qtrue  },
;283:	{ &g_saberDmgDelay_Idle, "g_saberDmgDelay_Idle", "350", CVAR_ARCHIVE, 0, qtrue  },
;284:	{ &g_saberDmgDelay_Wound, "g_saberDmgDelay_Wound", "0", CVAR_ARCHIVE, 0, qtrue  },
;285:
;286:	{ &g_saberDebugPrint, "g_saberDebugPrint", "0", CVAR_CHEAT, 0, qfalse  },
;287:
;288:	{ &g_austrian, "g_austrian", "0", CVAR_ARCHIVE, 0, qfalse  },
;289:};
;290:
;291:// bk001129 - made static to avoid aliasing
;292:static int gameCvarTableSize = sizeof( gameCvarTable ) / sizeof( gameCvarTable[0] );
;293:
;294:
;295:void G_InitGame					( int levelTime, int randomSeed, int restart );
;296:void G_RunFrame					( int levelTime );
;297:void G_ShutdownGame				( int restart );
;298:void CheckExitRules				( void );
;299:void G_ROFF_NotetrackCallback	( gentity_t *cent, const char *notetrack);
;300:
;301:
;302:/*
;303:================
;304:vmMain
;305:
;306:This is the only way control passes into the module.
;307:This must be the very first function compiled into the .q3vm file
;308:================
;309:*/
;310:int vmMain( int command, int arg0, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6, int arg7, int arg8, int arg9, int arg10, int arg11  ) {
line 311
;311:	switch ( command ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $196
ADDRLP4 0
INDIRI4
CNSTI4 11
GTI4 $196
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $210
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $210
address $198
address $199
address $200
address $204
address $202
address $203
address $205
address $201
address $206
address $207
address $208
address $209
code
LABELV $198
line 313
;312:	case GAME_INIT:
;313:		G_InitGame( arg0, arg1, arg2 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 G_InitGame
CALLV
pop
line 314
;314:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $195
JUMPV
LABELV $199
line 316
;315:	case GAME_SHUTDOWN:
;316:		G_ShutdownGame( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_ShutdownGame
CALLV
pop
line 317
;317:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $195
JUMPV
LABELV $200
line 319
;318:	case GAME_CLIENT_CONNECT:
;319:		return (int)ClientConnect( arg0, arg1, arg2 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 ClientConnect
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CVUI4 4
RETI4
ADDRGP4 $195
JUMPV
LABELV $201
line 321
;320:	case GAME_CLIENT_THINK:
;321:		ClientThink( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 ClientThink
CALLV
pop
line 322
;322:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $195
JUMPV
LABELV $202
line 324
;323:	case GAME_CLIENT_USERINFO_CHANGED:
;324:		ClientUserinfoChanged( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 325
;325:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $195
JUMPV
LABELV $203
line 327
;326:	case GAME_CLIENT_DISCONNECT:
;327:		ClientDisconnect( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 ClientDisconnect
CALLV
pop
line 328
;328:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $195
JUMPV
LABELV $204
line 330
;329:	case GAME_CLIENT_BEGIN:
;330:		ClientBegin( arg0, qtrue );
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 331
;331:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $195
JUMPV
LABELV $205
line 333
;332:	case GAME_CLIENT_COMMAND:
;333:		ClientCommand( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 ClientCommand
CALLV
pop
line 334
;334:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $195
JUMPV
LABELV $206
line 336
;335:	case GAME_RUN_FRAME:
;336:		G_RunFrame( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_RunFrame
CALLV
pop
line 337
;337:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $195
JUMPV
LABELV $207
line 339
;338:	case GAME_CONSOLE_COMMAND:
;339:		return ConsoleCommand();
ADDRLP4 8
ADDRGP4 ConsoleCommand
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $195
JUMPV
LABELV $208
line 341
;340:	case BOTAI_START_FRAME:
;341:		return BotAIStartFrame( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 BotAIStartFrame
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $195
JUMPV
LABELV $209
line 343
;342:	case GAME_ROFF_NOTETRACK_CALLBACK:
;343:		G_ROFF_NotetrackCallback( &g_entities[arg0], (const char *)arg1 );
CNSTI4 832
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRFP4 8
INDIRI4
CVIU4 4
CVUP4 4
ARGP4
ADDRGP4 G_ROFF_NotetrackCallback
CALLV
pop
line 344
;344:	}
LABELV $196
line 346
;345:
;346:	return -1;
CNSTI4 -1
RETI4
LABELV $195
endproc vmMain 16 12
export G_Printf
proc G_Printf 1028 12
line 350
;347:}
;348:
;349:
;350:void QDECL G_Printf( const char *fmt, ... ) {
line 354
;351:	va_list		argptr;
;352:	char		text[1024];
;353:
;354:	va_start (argptr, fmt);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 355
;355:	vsprintf (text, fmt, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 356
;356:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 358
;357:
;358:	trap_Printf( text );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 359
;359:}
LABELV $211
endproc G_Printf 1028 12
export G_Error
proc G_Error 1028 12
line 361
;360:
;361:void QDECL G_Error( const char *fmt, ... ) {
line 365
;362:	va_list		argptr;
;363:	char		text[1024];
;364:
;365:	va_start (argptr, fmt);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 366
;366:	vsprintf (text, fmt, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 367
;367:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 369
;368:
;369:	trap_Error( text );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 370
;370:}
LABELV $213
endproc G_Error 1028 12
export G_FindTeams
proc G_FindTeams 48 12
line 383
;371:
;372:/*
;373:================
;374:G_FindTeams
;375:
;376:Chain together all entities with a matching team field.
;377:Entity teams are used for item groups and multi-entity mover groups.
;378:
;379:All but the first will have the FL_TEAMSLAVE flag set and teammaster field set
;380:All but the last will have the teamchain field set to the next one
;381:================
;382:*/
;383:void G_FindTeams( void ) {
line 388
;384:	gentity_t	*e, *e2;
;385:	int		i, j;
;386:	int		c, c2;
;387:
;388:	c = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 389
;389:	c2 = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 390
;390:	for ( i=1, e=g_entities+i ; i < level.num_entities ; i++,e++ ){
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRLP4 4
CNSTI4 832
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
ADDRGP4 $219
JUMPV
LABELV $216
line 391
;391:		if (!e->inuse)
ADDRLP4 4
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $221
line 392
;392:			continue;
ADDRGP4 $217
JUMPV
LABELV $221
line 393
;393:		if (!e->team)
ADDRLP4 4
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $223
line 394
;394:			continue;
ADDRGP4 $217
JUMPV
LABELV $223
line 395
;395:		if (e->flags & FL_TEAMSLAVE)
ADDRLP4 4
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $225
line 396
;396:			continue;
ADDRGP4 $217
JUMPV
LABELV $225
line 397
;397:		e->teammaster = e;
ADDRLP4 4
INDIRP4
CNSTI4 740
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 398
;398:		c++;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 399
;399:		c2++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 400
;400:		for (j=i+1, e2=e+1 ; j < level.num_entities ; j++,e2++)
ADDRLP4 8
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 832
ADDP4
ASGNP4
ADDRGP4 $230
JUMPV
LABELV $227
line 401
;401:		{
line 402
;402:			if (!e2->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $232
line 403
;403:				continue;
ADDRGP4 $228
JUMPV
LABELV $232
line 404
;404:			if (!e2->team)
ADDRLP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $234
line 405
;405:				continue;
ADDRGP4 $228
JUMPV
LABELV $234
line 406
;406:			if (e2->flags & FL_TEAMSLAVE)
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $236
line 407
;407:				continue;
ADDRGP4 $228
JUMPV
LABELV $236
line 408
;408:			if (!strcmp(e->team, e2->team))
ADDRLP4 28
CNSTI4 592
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $238
line 409
;409:			{
line 410
;410:				c2++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 411
;411:				e2->teamchain = e->teamchain;
ADDRLP4 36
CNSTI4 736
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ADDRLP4 4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRP4
ASGNP4
line 412
;412:				e->teamchain = e2;
ADDRLP4 4
INDIRP4
CNSTI4 736
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 413
;413:				e2->teammaster = e;
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 414
;414:				e2->flags |= FL_TEAMSLAVE;
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 417
;415:
;416:				// make sure that targets only point at the master
;417:				if ( e2->targetname ) {
ADDRLP4 0
INDIRP4
CNSTI4 588
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $240
line 418
;418:					e->targetname = e2->targetname;
ADDRLP4 44
CNSTI4 588
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRP4
ASGNP4
line 419
;419:					e2->targetname = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 588
ADDP4
CNSTP4 0
ASGNP4
line 420
;420:				}
LABELV $240
line 421
;421:			}
LABELV $238
line 422
;422:		}
LABELV $228
line 400
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 832
ADDP4
ASGNP4
LABELV $230
ADDRLP4 8
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $227
line 423
;423:	}
LABELV $217
line 390
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 832
ADDP4
ASGNP4
LABELV $219
ADDRLP4 16
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $216
line 425
;424:
;425:	G_Printf ("%i teams with %i entities\n", c, c2);
ADDRGP4 $242
ARGP4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 426
;426:}
LABELV $215
endproc G_FindTeams 48 12
export G_RemapTeamShaders
proc G_RemapTeamShaders 0 0
line 428
;427:
;428:void G_RemapTeamShaders( void ) {
line 440
;429:#if 0
;430:	char string[1024];
;431:	float f = level.time * 0.001;
;432:	Com_sprintf( string, sizeof(string), "team_icon/%s_red", g_redteam.string );
;433:	AddRemap("textures/ctf2/redteam01", string, f); 
;434:	AddRemap("textures/ctf2/redteam02", string, f); 
;435:	Com_sprintf( string, sizeof(string), "team_icon/%s_blue", g_blueteam.string );
;436:	AddRemap("textures/ctf2/blueteam01", string, f); 
;437:	AddRemap("textures/ctf2/blueteam02", string, f); 
;438:	trap_SetConfigstring(CS_SHADERSTATE, BuildShaderStateConfig());
;439:#endif
;440:}
LABELV $243
endproc G_RemapTeamShaders 0 0
export G_RegisterCvars
proc G_RegisterCvars 20 16
line 448
;441:
;442:
;443:/*
;444:=================
;445:G_RegisterCvars
;446:=================
;447:*/
;448:void G_RegisterCvars( void ) {
line 451
;449:	int			i;
;450:	cvarTable_t	*cv;
;451:	qboolean remapped = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 453
;452:
;453:	for ( i = 0, cv = gameCvarTable ; i < gameCvarTableSize ; i++, cv++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 gameCvarTable
ASGNP4
ADDRGP4 $248
JUMPV
LABELV $245
line 454
;454:		trap_Cvar_Register( cv->vmCvar, cv->cvarName,
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 456
;455:			cv->defaultString, cv->cvarFlags );
;456:		if ( cv->vmCvar )
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $249
line 457
;457:			cv->modificationCount = cv->vmCvar->modificationCount;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
LABELV $249
line 459
;458:
;459:		if (cv->teamShader) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $251
line 460
;460:			remapped = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 461
;461:		}
LABELV $251
line 462
;462:	}
LABELV $246
line 453
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
LABELV $248
ADDRLP4 4
INDIRI4
ADDRGP4 gameCvarTableSize
INDIRI4
LTI4 $245
line 464
;463:
;464:	if (remapped) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $253
line 465
;465:		G_RemapTeamShaders();
ADDRGP4 G_RemapTeamShaders
CALLV
pop
line 466
;466:	}
LABELV $253
line 469
;467:
;468:	// check some things
;469:	if ( g_gametype.integer < 0 || g_gametype.integer >= GT_MAX_GAME_TYPE ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
LTI4 $259
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 9
LTI4 $255
LABELV $259
line 470
;470:		G_Printf( "g_gametype %i is out of range, defaulting to 0\n", g_gametype.integer );
ADDRGP4 $260
ARGP4
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 471
;471:		trap_Cvar_Set( "g_gametype", "0" );
ADDRGP4 $91
ARGP4
ADDRGP4 $80
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 472
;472:	}
LABELV $255
line 474
;473:
;474:	level.warmupModificationCount = g_warmup.modificationCount;
ADDRGP4 level+224
ADDRGP4 g_warmup+4
INDIRI4
ASGNI4
line 475
;475:}
LABELV $244
endproc G_RegisterCvars 20 16
export G_UpdateCvars
proc G_UpdateCvars 28 12
line 482
;476:
;477:/*
;478:=================
;479:G_UpdateCvars
;480:=================
;481:*/
;482:void G_UpdateCvars( void ) {
line 485
;483:	int			i;
;484:	cvarTable_t	*cv;
;485:	qboolean remapped = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 487
;486:
;487:	for ( i = 0, cv = gameCvarTable ; i < gameCvarTableSize ; i++, cv++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 gameCvarTable
ASGNP4
ADDRGP4 $268
JUMPV
LABELV $265
line 488
;488:		if ( cv->vmCvar ) {
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $269
line 489
;489:			trap_Cvar_Update( cv->vmCvar );
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 491
;490:
;491:			if ( cv->modificationCount != cv->vmCvar->modificationCount ) {
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
EQI4 $271
line 492
;492:				cv->modificationCount = cv->vmCvar->modificationCount;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 494
;493:
;494:				if ( cv->trackChange ) {
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
EQI4 $273
line 495
;495:					trap_SendServerCommand( -1, va("print \"Server: %s changed to %s\n\"", 
ADDRGP4 $275
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 497
;496:						cv->cvarName, cv->vmCvar->string ) );
;497:				}
LABELV $273
line 499
;498:
;499:				if (cv->teamShader) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $276
line 500
;500:					remapped = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 501
;501:				}
LABELV $276
line 502
;502:			}
LABELV $271
line 503
;503:		}
LABELV $269
line 504
;504:	}
LABELV $266
line 487
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
LABELV $268
ADDRLP4 4
INDIRI4
ADDRGP4 gameCvarTableSize
INDIRI4
LTI4 $265
line 506
;505:
;506:	if (remapped) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $278
line 507
;507:		G_RemapTeamShaders();
ADDRGP4 G_RemapTeamShaders
CALLV
pop
line 508
;508:	}
LABELV $278
line 509
;509:}
LABELV $264
endproc G_UpdateCvars 28 12
export G_InitGame
proc G_InitGame 1032 20
line 517
;510:
;511:/*
;512:============
;513:G_InitGame
;514:
;515:============
;516:*/
;517:void G_InitGame( int levelTime, int randomSeed, int restart ) {
line 520
;518:	int					i;
;519:
;520:	B_InitAlloc(); //make sure everything is clean
ADDRGP4 B_InitAlloc
CALLV
pop
line 522
;521:
;522:	G_Printf ("------- Game Initialization -------\n");
ADDRGP4 $281
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 523
;523:	G_Printf ("gamename: %s\n", GAMEVERSION);
ADDRGP4 $282
ARGP4
ADDRGP4 $86
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 524
;524:	G_Printf ("gamedate: %s\n", __DATE__);
ADDRGP4 $283
ARGP4
ADDRGP4 $88
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 526
;525:
;526:	srand( randomSeed );
ADDRFP4 4
INDIRI4
CVIU4 4
ARGU4
ADDRGP4 srand
CALLV
pop
line 528
;527:
;528:	G_RegisterCvars();
ADDRGP4 G_RegisterCvars
CALLV
pop
line 530
;529:
;530:	G_ProcessIPBans();
ADDRGP4 G_ProcessIPBans
CALLV
pop
line 532
;531:
;532:	G_InitMemory();
ADDRGP4 G_InitMemory
CALLV
pop
line 535
;533:
;534:	// set some level globals
;535:	memset( &level, 0, sizeof( level ) );
ADDRGP4 level
ARGP4
CNSTI4 0
ARGI4
CNSTI4 9096
ARGI4
ADDRGP4 memset
CALLP4
pop
line 536
;536:	level.time = levelTime;
ADDRGP4 level+32
ADDRFP4 0
INDIRI4
ASGNI4
line 537
;537:	level.startTime = levelTime;
ADDRGP4 level+40
ADDRFP4 0
INDIRI4
ASGNI4
line 539
;538:
;539:	level.snd_fry = G_SoundIndex("sound/player/fry.wav");	// FIXME standing in lava / slime
ADDRGP4 $287
ARGP4
ADDRLP4 4
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 level+220
ADDRLP4 4
INDIRI4
ASGNI4
line 543
;540:
;541:	//trap_SP_RegisterServer("mp_svgame");
;542:
;543:	if ( g_log.string[0] ) {
ADDRGP4 g_log+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $288
line 544
;544:		if ( g_logSync.integer ) {
ADDRGP4 g_logSync+12
INDIRI4
CNSTI4 0
EQI4 $291
line 545
;545:			trap_FS_FOpenFile( g_log.string, &level.logFile, FS_APPEND_SYNC );
ADDRGP4 g_log+16
ARGP4
ADDRGP4 level+20
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 546
;546:		} else {
ADDRGP4 $292
JUMPV
LABELV $291
line 547
;547:			trap_FS_FOpenFile( g_log.string, &level.logFile, FS_APPEND );
ADDRGP4 g_log+16
ARGP4
ADDRGP4 level+20
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 548
;548:		}
LABELV $292
line 549
;549:		if ( !level.logFile ) {
ADDRGP4 level+20
INDIRI4
CNSTI4 0
NEI4 $298
line 550
;550:			G_Printf( "WARNING: Couldn't open logfile: %s\n", g_log.string );
ADDRGP4 $301
ARGP4
ADDRGP4 g_log+16
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 551
;551:		} else {
ADDRGP4 $289
JUMPV
LABELV $298
line 554
;552:			char	serverinfo[MAX_INFO_STRING];
;553:
;554:			trap_GetServerinfo( serverinfo, sizeof( serverinfo ) );
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetServerinfo
CALLV
pop
line 556
;555:
;556:			G_LogPrintf("------------------------------------------------------------\n" );
ADDRGP4 $303
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 557
;557:			G_LogPrintf("InitGame: %s\n", serverinfo );
ADDRGP4 $304
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 558
;558:		}
line 559
;559:	} else {
ADDRGP4 $289
JUMPV
LABELV $288
line 560
;560:		G_Printf( "Not logging to disk.\n" );
ADDRGP4 $305
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 561
;561:	}
LABELV $289
line 563
;562:
;563:	G_LogWeaponInit();
ADDRGP4 G_LogWeaponInit
CALLV
pop
line 565
;564:
;565:	G_InitWorldSession();
ADDRGP4 G_InitWorldSession
CALLV
pop
line 568
;566:
;567:	// initialize all entities for this game
;568:	memset( g_entities, 0, MAX_GENTITIES * sizeof(g_entities[0]) );
ADDRGP4 g_entities
ARGP4
CNSTI4 0
ARGI4
CNSTI4 851968
ARGI4
ADDRGP4 memset
CALLP4
pop
line 569
;569:	level.gentities = g_entities;
ADDRGP4 level+4
ADDRGP4 g_entities
ASGNP4
line 572
;570:
;571:	// initialize all clients for this game
;572:	level.maxclients = g_maxclients.integer;
ADDRGP4 level+24
ADDRGP4 g_maxclients+12
INDIRI4
ASGNI4
line 573
;573:	memset( g_clients, 0, MAX_CLIENTS * sizeof(g_clients[0]) );
ADDRGP4 g_clients
ARGP4
CNSTI4 0
ARGI4
CNSTI4 57984
ARGI4
ADDRGP4 memset
CALLP4
pop
line 574
;574:	level.clients = g_clients;
ADDRGP4 level
ADDRGP4 g_clients
ASGNP4
line 577
;575:
;576:	// set client fields on player ents
;577:	for ( i=0 ; i<level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $312
JUMPV
LABELV $309
line 578
;578:		g_entities[i].client = level.clients + i;
CNSTI4 832
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
CNSTI4 1812
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 579
;579:	}
LABELV $310
line 577
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $312
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $309
line 584
;580:
;581:	// always leave room for the max number of clients,
;582:	// even if they aren't all used, so numbers inside that
;583:	// range are NEVER anything but clients
;584:	level.num_entities = MAX_CLIENTS;
ADDRGP4 level+12
CNSTI4 32
ASGNI4
line 587
;585:
;586:	// let the server system know where the entites are
;587:	trap_LocateGameData( level.gentities, level.num_entities, sizeof( gentity_t ), 
ADDRGP4 level+4
INDIRP4
ARGP4
ADDRGP4 level+12
INDIRI4
ARGI4
CNSTI4 832
ARGI4
ADDRGP4 level
INDIRP4
ARGP4
CNSTI4 1812
ARGI4
ADDRGP4 trap_LocateGameData
CALLV
pop
line 591
;588:		&level.clients[0].ps, sizeof( level.clients[0] ) );
;589:
;590:	// reserve some spots for dead player bodies
;591:	InitBodyQue();
ADDRGP4 InitBodyQue
CALLV
pop
line 593
;592:
;593:	ClearRegisteredItems();
ADDRGP4 ClearRegisteredItems
CALLV
pop
line 597
;594:
;595:	// initialize saga mode before spawning entities so we know
;596:	// if we should remove any saga-related entities on spawn
;597:	InitSagaMode();
ADDRGP4 InitSagaMode
CALLV
pop
line 600
;598:
;599:	// parse the key/value pairs and spawn gentities
;600:	G_SpawnEntitiesFromString();
ADDRGP4 G_SpawnEntitiesFromString
CALLV
pop
line 603
;601:
;602:	// general initialization
;603:	G_FindTeams();
ADDRGP4 G_FindTeams
CALLV
pop
line 606
;604:
;605:	// make sure we have flags for CTF, etc
;606:	if( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $318
line 607
;607:		G_CheckTeamItems();
ADDRGP4 G_CheckTeamItems
CALLV
pop
line 608
;608:	}
ADDRGP4 $319
JUMPV
LABELV $318
line 609
;609:	else if ( g_gametype.integer == GT_JEDIMASTER )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $321
line 610
;610:	{
line 611
;611:		trap_SetConfigstring ( CS_CLIENT_JEDIMASTER, "-1" );
CNSTI4 28
ARGI4
ADDRGP4 $324
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 612
;612:	}
LABELV $321
LABELV $319
line 614
;613:
;614:	trap_SetConfigstring ( CS_CLIENT_DUELISTS, va("-1|-1") );
ADDRGP4 $325
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 30
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 615
;615:	trap_SetConfigstring ( CS_CLIENT_DUELWINNER, va("-1") );
ADDRGP4 $324
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 29
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 616
;616:	gDuelist1 = -1;
ADDRGP4 gDuelist1
CNSTI4 -1
ASGNI4
line 617
;617:	gDuelist2 = -1;
ADDRGP4 gDuelist2
CNSTI4 -1
ASGNI4
line 619
;618:
;619:	SaveRegisteredItems();
ADDRGP4 SaveRegisteredItems
CALLV
pop
line 621
;620:
;621:	G_Printf ("-----------------------------------\n");
ADDRGP4 $326
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 623
;622:
;623:	if( g_gametype.integer == GT_SINGLE_PLAYER || trap_Cvar_VariableIntegerValue( "com_buildScript" ) ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
EQI4 $331
ADDRGP4 $330
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $327
LABELV $331
line 624
;624:		G_ModelIndex( SP_PODIUM_MODEL );
ADDRGP4 $332
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 625
;625:		G_SoundIndex( "sound/player/gurp1.wav" );
ADDRGP4 $333
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 626
;626:		G_SoundIndex( "sound/player/gurp2.wav" );
ADDRGP4 $334
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 627
;627:	}
LABELV $327
line 629
;628:
;629:	if ( trap_Cvar_VariableIntegerValue( "bot_enable" ) ) {
ADDRGP4 $337
ARGP4
ADDRLP4 20
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $335
line 630
;630:		BotAISetup( restart );
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 BotAISetup
CALLI4
pop
line 631
;631:		BotAILoadMap( restart );
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 BotAILoadMap
CALLI4
pop
line 632
;632:		G_InitBots( restart );
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 G_InitBots
CALLV
pop
line 633
;633:	}
LABELV $335
line 635
;634:
;635:	G_RemapTeamShaders();
ADDRGP4 G_RemapTeamShaders
CALLV
pop
line 637
;636:
;637:	if ( g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $338
line 638
;638:	{
line 639
;639:		G_LogPrintf("Duel Tournament Begun: kill limit %d, win limit: %d\n", g_fraglimit.integer, g_duel_fraglimit.integer );
ADDRGP4 $341
ARGP4
ADDRGP4 g_fraglimit+12
INDIRI4
ARGI4
ADDRGP4 g_duel_fraglimit+12
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 640
;640:	}
LABELV $338
line 641
;641:}
LABELV $280
endproc G_InitGame 1032 20
export G_ShutdownGame
proc G_ShutdownGame 4 4
line 650
;642:
;643:
;644:
;645:/*
;646:=================
;647:G_ShutdownGame
;648:=================
;649:*/
;650:void G_ShutdownGame( int restart ) {
line 651
;651:	G_Printf ("==== ShutdownGame ====\n");
ADDRGP4 $345
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 653
;652:
;653:	G_LogWeaponOutput();
ADDRGP4 G_LogWeaponOutput
CALLV
pop
line 655
;654:
;655:	if ( level.logFile ) {
ADDRGP4 level+20
INDIRI4
CNSTI4 0
EQI4 $346
line 656
;656:		G_LogPrintf("ShutdownGame:\n" );
ADDRGP4 $349
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 657
;657:		G_LogPrintf("------------------------------------------------------------\n" );
ADDRGP4 $303
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 658
;658:		trap_FS_FCloseFile( level.logFile );
ADDRGP4 level+20
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 659
;659:	}
LABELV $346
line 662
;660:
;661:	// write all the client session data so we can get it back
;662:	G_WriteSessionData();
ADDRGP4 G_WriteSessionData
CALLV
pop
line 664
;663:
;664:	trap_ROFF_Clean();
ADDRGP4 trap_ROFF_Clean
CALLI4
pop
line 666
;665:
;666:	if ( trap_Cvar_VariableIntegerValue( "bot_enable" ) ) {
ADDRGP4 $337
ARGP4
ADDRLP4 0
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $351
line 667
;667:		BotAIShutdown( restart );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 BotAIShutdown
CALLI4
pop
line 668
;668:	}
LABELV $351
line 670
;669:
;670:	B_CleanupAlloc(); //clean up all allocations made with B_Alloc
ADDRGP4 B_CleanupAlloc
CALLV
pop
line 671
;671:}
LABELV $344
endproc G_ShutdownGame 4 4
export Com_Error
proc Com_Error 1028 12
line 680
;672:
;673:
;674:
;675://===================================================================
;676:
;677:#ifndef GAME_HARD_LINKED
;678:// this is only here so the functions in q_shared.c and bg_*.c can link
;679:
;680:void QDECL Com_Error ( int level, const char *error, ... ) {
line 684
;681:	va_list		argptr;
;682:	char		text[1024];
;683:
;684:	va_start (argptr, error);
ADDRLP4 0
ADDRFP4 4+4
ASGNP4
line 685
;685:	vsprintf (text, error, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 686
;686:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 688
;687:
;688:	G_Error( "%s", text);
ADDRGP4 $355
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 689
;689:}
LABELV $353
endproc Com_Error 1028 12
export Com_Printf
proc Com_Printf 1028 12
line 691
;690:
;691:void QDECL Com_Printf( const char *msg, ... ) {
line 695
;692:	va_list		argptr;
;693:	char		text[1024];
;694:
;695:	va_start (argptr, msg);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 696
;696:	vsprintf (text, msg, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 697
;697:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 699
;698:
;699:	G_Printf ("%s", text);
ADDRGP4 $355
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 700
;700:}
LABELV $356
endproc Com_Printf 1028 12
export AddTournamentPlayer
proc AddTournamentPlayer 24 8
line 720
;701:
;702:#endif
;703:
;704:/*
;705:========================================================================
;706:
;707:PLAYER COUNTING / SCORE SORTING
;708:
;709:========================================================================
;710:*/
;711:
;712:/*
;713:=============
;714:AddTournamentPlayer
;715:
;716:If there are less than two tournament players, put a
;717:spectator in the game and restart
;718:=============
;719:*/
;720:void AddTournamentPlayer( void ) {
line 725
;721:	int			i;
;722:	gclient_t	*client;
;723:	gclient_t	*nextInLine;
;724:
;725:	if ( level.numPlayingClients >= 2 ) {
ADDRGP4 level+80
INDIRI4
CNSTI4 2
LTI4 $359
line 726
;726:		return;
ADDRGP4 $358
JUMPV
LABELV $359
line 734
;727:	}
;728:
;729:	// never change during intermission
;730://	if ( level.intermissiontime ) {
;731://		return;
;732://	}
;733:
;734:	nextInLine = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 736
;735:
;736:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $365
JUMPV
LABELV $362
line 737
;737:		client = &level.clients[i];
ADDRLP4 0
CNSTI4 1812
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 738
;738:		if ( client->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $367
line 739
;739:			continue;
ADDRGP4 $363
JUMPV
LABELV $367
line 741
;740:		}
;741:		if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
CNSTI4 3
EQI4 $369
line 742
;742:			continue;
ADDRGP4 $363
JUMPV
LABELV $369
line 745
;743:		}
;744:		// never select the dedicated follow or scoreboard clients
;745:		if ( client->sess.spectatorState == SPECTATOR_SCOREBOARD || 
ADDRLP4 0
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
CNSTI4 3
EQI4 $373
ADDRLP4 0
INDIRP4
CNSTI4 1548
ADDP4
INDIRI4
CNSTI4 0
GEI4 $371
LABELV $373
line 746
;746:			client->sess.spectatorClient < 0  ) {
line 747
;747:			continue;
ADDRGP4 $363
JUMPV
LABELV $371
line 750
;748:		}
;749:
;750:		if ( !nextInLine || client->sess.spectatorTime < nextInLine->sess.spectatorTime ) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $376
ADDRLP4 20
CNSTI4 1540
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
GEI4 $374
LABELV $376
line 751
;751:			nextInLine = client;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
line 752
;752:		}
LABELV $374
line 753
;753:	}
LABELV $363
line 736
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $365
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $362
line 755
;754:
;755:	if ( !nextInLine ) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $377
line 756
;756:		return;
ADDRGP4 $358
JUMPV
LABELV $377
line 759
;757:	}
;758:
;759:	level.warmupTime = -1;
ADDRGP4 level+16
CNSTI4 -1
ASGNI4
line 762
;760:
;761:	// set them to free-for-all team
;762:	SetTeam( &g_entities[ nextInLine - level.clients ], "f" );
CNSTI4 832
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1812
DIVI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $380
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 763
;763:}
LABELV $358
endproc AddTournamentPlayer 24 8
export RemoveTournamentLoser
proc RemoveTournamentLoser 4 8
line 772
;764:
;765:/*
;766:=======================
;767:RemoveTournamentLoser
;768:
;769:Make the loser a spectator at the back of the line
;770:=======================
;771:*/
;772:void RemoveTournamentLoser( void ) {
line 775
;773:	int			clientNum;
;774:
;775:	if ( level.numPlayingClients != 2 ) {
ADDRGP4 level+80
INDIRI4
CNSTI4 2
EQI4 $382
line 776
;776:		return;
ADDRGP4 $381
JUMPV
LABELV $382
line 779
;777:	}
;778:
;779:	clientNum = level.sortedClients[1];
ADDRLP4 0
ADDRGP4 level+84+4
INDIRI4
ASGNI4
line 781
;780:
;781:	if ( level.clients[ clientNum ].pers.connected != CON_CONNECTED ) {
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
CNSTI4 2
EQI4 $387
line 782
;782:		return;
ADDRGP4 $381
JUMPV
LABELV $387
line 786
;783:	}
;784:
;785:	// make them a spectator
;786:	SetTeam( &g_entities[ clientNum ], "s" );
CNSTI4 832
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $389
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 787
;787:}
LABELV $381
endproc RemoveTournamentLoser 4 8
export RemoveDuelDrawLoser
proc RemoveDuelDrawLoser 28 8
line 790
;788:
;789:void RemoveDuelDrawLoser(void)
;790:{
line 791
;791:	int clFirst = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 792
;792:	int clSec = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 793
;793:	int clFailure = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 795
;794:
;795:	if ( level.clients[ level.sortedClients[0] ].pers.connected != CON_CONNECTED )
CNSTI4 1812
ADDRGP4 level+84
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $391
line 796
;796:	{
line 797
;797:		return;
ADDRGP4 $390
JUMPV
LABELV $391
line 799
;798:	}
;799:	if ( level.clients[ level.sortedClients[1] ].pers.connected != CON_CONNECTED )
CNSTI4 1812
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $394
line 800
;800:	{
line 801
;801:		return;
ADDRGP4 $390
JUMPV
LABELV $394
line 804
;802:	}
;803:
;804:	clFirst = level.clients[ level.sortedClients[0] ].ps.stats[STAT_HEALTH] + level.clients[ level.sortedClients[0] ].ps.stats[STAT_ARMOR];
ADDRLP4 12
CNSTI4 1812
ASGNI4
ADDRLP4 16
ADDRGP4 level
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ADDRGP4 level+84
INDIRI4
MULI4
ADDRLP4 16
INDIRP4
ADDP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
ADDRGP4 level+84
INDIRI4
MULI4
ADDRLP4 16
INDIRP4
ADDP4
CNSTI4 236
ADDP4
INDIRI4
ADDI4
ASGNI4
line 805
;805:	clSec = level.clients[ level.sortedClients[1] ].ps.stats[STAT_HEALTH] + level.clients[ level.sortedClients[1] ].ps.stats[STAT_ARMOR];
ADDRLP4 20
CNSTI4 1812
ASGNI4
ADDRLP4 24
ADDRGP4 level
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRI4
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRLP4 24
INDIRP4
ADDP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRLP4 24
INDIRP4
ADDP4
CNSTI4 236
ADDP4
INDIRI4
ADDI4
ASGNI4
line 807
;806:
;807:	if (clFirst > clSec)
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $404
line 808
;808:	{
line 809
;809:		clFailure = 1;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 810
;810:	}
ADDRGP4 $405
JUMPV
LABELV $404
line 811
;811:	else if (clSec > clFirst)
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $406
line 812
;812:	{
line 813
;813:		clFailure = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 814
;814:	}
ADDRGP4 $407
JUMPV
LABELV $406
line 816
;815:	else
;816:	{
line 817
;817:		clFailure = 2;
ADDRLP4 8
CNSTI4 2
ASGNI4
line 818
;818:	}
LABELV $407
LABELV $405
line 820
;819:
;820:	if (clFailure != 2)
ADDRLP4 8
INDIRI4
CNSTI4 2
EQI4 $408
line 821
;821:	{
line 822
;822:		SetTeam( &g_entities[ level.sortedClients[clFailure] ], "s" );
CNSTI4 832
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $389
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 823
;823:	}
ADDRGP4 $409
JUMPV
LABELV $408
line 825
;824:	else
;825:	{ //we could be more elegant about this, but oh well.
line 826
;826:		SetTeam( &g_entities[ level.sortedClients[1] ], "s" );
CNSTI4 832
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $389
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 827
;827:	}
LABELV $409
line 828
;828:}
LABELV $390
endproc RemoveDuelDrawLoser 28 8
export RemoveTournamentWinner
proc RemoveTournamentWinner 4 8
line 835
;829:
;830:/*
;831:=======================
;832:RemoveTournamentWinner
;833:=======================
;834:*/
;835:void RemoveTournamentWinner( void ) {
line 838
;836:	int			clientNum;
;837:
;838:	if ( level.numPlayingClients != 2 ) {
ADDRGP4 level+80
INDIRI4
CNSTI4 2
EQI4 $414
line 839
;839:		return;
ADDRGP4 $413
JUMPV
LABELV $414
line 842
;840:	}
;841:
;842:	clientNum = level.sortedClients[0];
ADDRLP4 0
ADDRGP4 level+84
INDIRI4
ASGNI4
line 844
;843:
;844:	if ( level.clients[ clientNum ].pers.connected != CON_CONNECTED ) {
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
CNSTI4 2
EQI4 $418
line 845
;845:		return;
ADDRGP4 $413
JUMPV
LABELV $418
line 849
;846:	}
;847:
;848:	// make them a spectator
;849:	SetTeam( &g_entities[ clientNum ], "s" );
CNSTI4 832
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $389
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 850
;850:}
LABELV $413
endproc RemoveTournamentWinner 4 8
export AdjustTournamentScores
proc AdjustTournamentScores 68 8
line 857
;851:
;852:/*
;853:=======================
;854:AdjustTournamentScores
;855:=======================
;856:*/
;857:void AdjustTournamentScores( void ) {
line 860
;858:	int			clientNum;
;859:
;860:	if (level.clients[level.sortedClients[0]].ps.persistant[PERS_SCORE] ==
ADDRLP4 4
CNSTI4 1812
ASGNI4
ADDRLP4 8
ADDRGP4 level
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 280
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 level+84
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
NEI4 $421
ADDRLP4 16
CNSTI4 1380
ASGNI4
ADDRLP4 20
CNSTI4 2
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 level+84
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $421
ADDRLP4 4
INDIRI4
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $421
line 864
;861:		level.clients[level.sortedClients[1]].ps.persistant[PERS_SCORE] &&
;862:		level.clients[level.sortedClients[0]].pers.connected == CON_CONNECTED &&
;863:		level.clients[level.sortedClients[1]].pers.connected == CON_CONNECTED)
;864:	{
line 865
;865:		int clFirst = level.clients[ level.sortedClients[0] ].ps.stats[STAT_HEALTH] + level.clients[ level.sortedClients[0] ].ps.stats[STAT_ARMOR];
ADDRLP4 40
CNSTI4 1812
ASGNI4
ADDRLP4 44
ADDRGP4 level
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 40
INDIRI4
ADDRGP4 level+84
INDIRI4
MULI4
ADDRLP4 44
INDIRP4
ADDP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
ADDRGP4 level+84
INDIRI4
MULI4
ADDRLP4 44
INDIRP4
ADDP4
CNSTI4 236
ADDP4
INDIRI4
ADDI4
ASGNI4
line 866
;866:		int clSec = level.clients[ level.sortedClients[1] ].ps.stats[STAT_HEALTH] + level.clients[ level.sortedClients[1] ].ps.stats[STAT_ARMOR];
ADDRLP4 48
CNSTI4 1812
ASGNI4
ADDRLP4 52
ADDRGP4 level
INDIRP4
ASGNP4
ADDRLP4 36
ADDRLP4 48
INDIRI4
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRLP4 52
INDIRP4
ADDP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 48
INDIRI4
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRLP4 52
INDIRP4
ADDP4
CNSTI4 236
ADDP4
INDIRI4
ADDI4
ASGNI4
line 867
;867:		int clFailure = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 868
;868:		int clSuccess = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 870
;869:
;870:		if (clFirst > clSec)
ADDRLP4 32
INDIRI4
ADDRLP4 36
INDIRI4
LEI4 $435
line 871
;871:		{
line 872
;872:			clFailure = 1;
ADDRLP4 24
CNSTI4 1
ASGNI4
line 873
;873:			clSuccess = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 874
;874:		}
ADDRGP4 $436
JUMPV
LABELV $435
line 875
;875:		else if (clSec > clFirst)
ADDRLP4 36
INDIRI4
ADDRLP4 32
INDIRI4
LEI4 $437
line 876
;876:		{
line 877
;877:			clFailure = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 878
;878:			clSuccess = 1;
ADDRLP4 28
CNSTI4 1
ASGNI4
line 879
;879:		}
ADDRGP4 $438
JUMPV
LABELV $437
line 881
;880:		else
;881:		{
line 882
;882:			clFailure = 2;
ADDRLP4 24
CNSTI4 2
ASGNI4
line 883
;883:			clSuccess = 2;
ADDRLP4 28
CNSTI4 2
ASGNI4
line 884
;884:		}
LABELV $438
LABELV $436
line 886
;885:
;886:		if (clFailure != 2)
ADDRLP4 24
INDIRI4
CNSTI4 2
EQI4 $439
line 887
;887:		{
line 888
;888:			clientNum = level.sortedClients[clSuccess];
ADDRLP4 0
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
ASGNI4
line 890
;889:
;890:			level.clients[ clientNum ].sess.wins++;
ADDRLP4 56
CNSTI4 1812
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1552
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 891
;891:			ClientUserinfoChanged( clientNum );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 892
;892:			trap_SetConfigstring ( CS_CLIENT_DUELWINNER, va("%i", clientNum ) );
ADDRGP4 $442
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 29
ARGI4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 894
;893:
;894:			clientNum = level.sortedClients[clFailure];
ADDRLP4 0
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
ASGNI4
line 896
;895:
;896:			level.clients[ clientNum ].sess.losses++;
ADDRLP4 64
CNSTI4 1812
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1556
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 897
;897:			ClientUserinfoChanged( clientNum );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 898
;898:		}
ADDRGP4 $422
JUMPV
LABELV $439
line 900
;899:		else
;900:		{
line 901
;901:			clSuccess = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 902
;902:			clFailure = 1;
ADDRLP4 24
CNSTI4 1
ASGNI4
line 904
;903:
;904:			clientNum = level.sortedClients[clSuccess];
ADDRLP4 0
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
ASGNI4
line 906
;905:
;906:			level.clients[ clientNum ].sess.wins++;
ADDRLP4 56
CNSTI4 1812
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1552
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 907
;907:			ClientUserinfoChanged( clientNum );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 908
;908:			trap_SetConfigstring ( CS_CLIENT_DUELWINNER, va("%i", clientNum ) );
ADDRGP4 $442
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 29
ARGI4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 910
;909:
;910:			clientNum = level.sortedClients[clFailure];
ADDRLP4 0
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
ASGNI4
line 912
;911:
;912:			level.clients[ clientNum ].sess.losses++;
ADDRLP4 64
CNSTI4 1812
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1556
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 913
;913:			ClientUserinfoChanged( clientNum );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 914
;914:		}
line 915
;915:	}
ADDRGP4 $422
JUMPV
LABELV $421
line 917
;916:	else
;917:	{
line 918
;918:		clientNum = level.sortedClients[0];
ADDRLP4 0
ADDRGP4 level+84
INDIRI4
ASGNI4
line 919
;919:		if ( level.clients[ clientNum ].pers.connected == CON_CONNECTED ) {
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
CNSTI4 2
NEI4 $447
line 920
;920:			level.clients[ clientNum ].sess.wins++;
ADDRLP4 24
CNSTI4 1812
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1552
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
line 921
;921:			ClientUserinfoChanged( clientNum );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 923
;922:
;923:			trap_SetConfigstring ( CS_CLIENT_DUELWINNER, va("%i", clientNum ) );
ADDRGP4 $442
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 29
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 924
;924:		}
LABELV $447
line 926
;925:
;926:		clientNum = level.sortedClients[1];
ADDRLP4 0
ADDRGP4 level+84+4
INDIRI4
ASGNI4
line 927
;927:		if ( level.clients[ clientNum ].pers.connected == CON_CONNECTED ) {
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
CNSTI4 2
NEI4 $451
line 928
;928:			level.clients[ clientNum ].sess.losses++;
ADDRLP4 24
CNSTI4 1812
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1556
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
line 929
;929:			ClientUserinfoChanged( clientNum );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 930
;930:		}
LABELV $451
line 931
;931:	}
LABELV $422
line 932
;932:}
LABELV $420
endproc AdjustTournamentScores 68 8
export SortRanks
proc SortRanks 32 0
line 940
;933:
;934:/*
;935:=============
;936:SortRanks
;937:
;938:=============
;939:*/
;940:int QDECL SortRanks( const void *a, const void *b ) {
line 943
;941:	gclient_t	*ca, *cb;
;942:
;943:	ca = &level.clients[*(int *)a];
ADDRLP4 0
CNSTI4 1812
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 944
;944:	cb = &level.clients[*(int *)b];
ADDRLP4 4
CNSTI4 1812
ADDRFP4 4
INDIRP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 947
;945:
;946:	// sort special clients last
;947:	if ( ca->sess.spectatorState == SPECTATOR_SCOREBOARD || ca->sess.spectatorClient < 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
CNSTI4 3
EQI4 $456
ADDRLP4 0
INDIRP4
CNSTI4 1548
ADDP4
INDIRI4
CNSTI4 0
GEI4 $454
LABELV $456
line 948
;948:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $453
JUMPV
LABELV $454
line 950
;949:	}
;950:	if ( cb->sess.spectatorState == SPECTATOR_SCOREBOARD || cb->sess.spectatorClient < 0  ) {
ADDRLP4 4
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
CNSTI4 3
EQI4 $459
ADDRLP4 4
INDIRP4
CNSTI4 1548
ADDP4
INDIRI4
CNSTI4 0
GEI4 $457
LABELV $459
line 951
;951:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $453
JUMPV
LABELV $457
line 955
;952:	}
;953:
;954:	// then connecting clients
;955:	if ( ca->pers.connected == CON_CONNECTING ) {
ADDRLP4 0
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 1
NEI4 $460
line 956
;956:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $453
JUMPV
LABELV $460
line 958
;957:	}
;958:	if ( cb->pers.connected == CON_CONNECTING ) {
ADDRLP4 4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 1
NEI4 $462
line 959
;959:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $453
JUMPV
LABELV $462
line 964
;960:	}
;961:
;962:
;963:	// then spectators
;964:	if ( ca->sess.sessionTeam == TEAM_SPECTATOR && cb->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 16
CNSTI4 1536
ASGNI4
ADDRLP4 20
CNSTI4 3
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $464
ADDRLP4 4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $464
line 965
;965:		if ( ca->sess.spectatorTime < cb->sess.spectatorTime ) {
ADDRLP4 24
CNSTI4 1540
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
GEI4 $466
line 966
;966:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $453
JUMPV
LABELV $466
line 968
;967:		}
;968:		if ( ca->sess.spectatorTime > cb->sess.spectatorTime ) {
ADDRLP4 28
CNSTI4 1540
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
LEI4 $468
line 969
;969:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $453
JUMPV
LABELV $468
line 971
;970:		}
;971:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $453
JUMPV
LABELV $464
line 973
;972:	}
;973:	if ( ca->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
CNSTI4 3
NEI4 $470
line 974
;974:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $453
JUMPV
LABELV $470
line 976
;975:	}
;976:	if ( cb->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 4
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
CNSTI4 3
NEI4 $472
line 977
;977:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $453
JUMPV
LABELV $472
line 981
;978:	}
;979:
;980:	// then sort by score
;981:	if ( ca->ps.persistant[PERS_SCORE]
ADDRLP4 24
CNSTI4 280
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
LEI4 $474
line 982
;982:		> cb->ps.persistant[PERS_SCORE] ) {
line 983
;983:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $453
JUMPV
LABELV $474
line 985
;984:	}
;985:	if ( ca->ps.persistant[PERS_SCORE]
ADDRLP4 28
CNSTI4 280
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
GEI4 $476
line 986
;986:		< cb->ps.persistant[PERS_SCORE] ) {
line 987
;987:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $453
JUMPV
LABELV $476
line 989
;988:	}
;989:	return 0;
CNSTI4 0
RETI4
LABELV $453
endproc SortRanks 32 0
data
export gQueueScoreMessage
align 4
LABELV gQueueScoreMessage
byte 4 0
export gQueueScoreMessageTime
align 4
LABELV gQueueScoreMessageTime
byte 4 0
export CalculateRanks
code
proc CalculateRanks 52 16
line 1004
;990:}
;991:
;992:qboolean gQueueScoreMessage = qfalse;
;993:int gQueueScoreMessageTime = 0;
;994:
;995:/*
;996:============
;997:CalculateRanks
;998:
;999:Recalculates the score ranks of all players
;1000:This will be called on every client connect, begin, disconnect, death,
;1001:and team change.
;1002:============
;1003:*/
;1004:void CalculateRanks( void ) {
line 1009
;1005:	int		i;
;1006:	int		rank;
;1007:	int		score;
;1008:	int		newScore;
;1009:	int		preNumSpec = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 1010
;1010:	int		nonSpecIndex = -1;
ADDRLP4 20
CNSTI4 -1
ASGNI4
line 1013
;1011:	gclient_t	*cl;
;1012:
;1013:	preNumSpec = level.numNonSpectatorClients;
ADDRLP4 24
ADDRGP4 level+76
INDIRI4
ASGNI4
line 1015
;1014:
;1015:	level.follow1 = -1;
ADDRGP4 level+212
CNSTI4 -1
ASGNI4
line 1016
;1016:	level.follow2 = -1;
ADDRGP4 level+216
CNSTI4 -1
ASGNI4
line 1017
;1017:	level.numConnectedClients = 0;
ADDRGP4 level+72
CNSTI4 0
ASGNI4
line 1018
;1018:	level.numNonSpectatorClients = 0;
ADDRGP4 level+76
CNSTI4 0
ASGNI4
line 1019
;1019:	level.numPlayingClients = 0;
ADDRGP4 level+80
CNSTI4 0
ASGNI4
line 1020
;1020:	level.numVotingClients = 0;		// don't count bots
ADDRGP4 level+2292
CNSTI4 0
ASGNI4
line 1021
;1021:	for ( i = 0; i < TEAM_NUM_TEAMS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $486
line 1022
;1022:		level.numteamVotingClients[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4376
ADDP4
CNSTI4 0
ASGNI4
line 1023
;1023:	}
LABELV $487
line 1021
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $486
line 1024
;1024:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $494
JUMPV
LABELV $491
line 1025
;1025:		if ( level.clients[i].pers.connected != CON_DISCONNECTED ) {
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
EQI4 $496
line 1026
;1026:			level.sortedClients[level.numConnectedClients] = i;
ADDRGP4 level+72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1027
;1027:			level.numConnectedClients++;
ADDRLP4 28
ADDRGP4 level+72
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1029
;1028:
;1029:			if ( level.clients[i].sess.sessionTeam != TEAM_SPECTATOR ) {
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
CNSTI4 3
EQI4 $501
line 1030
;1030:				level.numNonSpectatorClients++;
ADDRLP4 32
ADDRGP4 level+76
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1031
;1031:				nonSpecIndex = i;
ADDRLP4 20
ADDRLP4 0
INDIRI4
ASGNI4
line 1034
;1032:			
;1033:				// decide if this should be auto-followed
;1034:				if ( level.clients[i].pers.connected == CON_CONNECTED ) {
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
CNSTI4 2
NEI4 $504
line 1035
;1035:					level.numPlayingClients++;
ADDRLP4 36
ADDRGP4 level+80
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1036
;1036:					if ( !(g_entities[i].r.svFlags & SVF_BOT) ) {
CNSTI4 832
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+296+8
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $507
line 1037
;1037:						level.numVotingClients++;
ADDRLP4 40
ADDRGP4 level+2292
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1038
;1038:						if ( level.clients[i].sess.sessionTeam == TEAM_RED )
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
CNSTI4 1
NEI4 $512
line 1039
;1039:							level.numteamVotingClients[0]++;
ADDRLP4 44
ADDRGP4 level+4376
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $513
JUMPV
LABELV $512
line 1040
;1040:						else if ( level.clients[i].sess.sessionTeam == TEAM_BLUE )
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
CNSTI4 2
NEI4 $515
line 1041
;1041:							level.numteamVotingClients[1]++;
ADDRLP4 48
ADDRGP4 level+4376+4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $515
LABELV $513
line 1042
;1042:					}
LABELV $507
line 1043
;1043:					if ( level.follow1 == -1 ) {
ADDRGP4 level+212
INDIRI4
CNSTI4 -1
NEI4 $519
line 1044
;1044:						level.follow1 = i;
ADDRGP4 level+212
ADDRLP4 0
INDIRI4
ASGNI4
line 1045
;1045:					} else if ( level.follow2 == -1 ) {
ADDRGP4 $520
JUMPV
LABELV $519
ADDRGP4 level+216
INDIRI4
CNSTI4 -1
NEI4 $523
line 1046
;1046:						level.follow2 = i;
ADDRGP4 level+216
ADDRLP4 0
INDIRI4
ASGNI4
line 1047
;1047:					}
LABELV $523
LABELV $520
line 1048
;1048:				}
LABELV $504
line 1049
;1049:			}
LABELV $501
line 1050
;1050:		}
LABELV $496
line 1051
;1051:	}
LABELV $492
line 1024
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $494
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $491
line 1053
;1052:
;1053:	if (!g_warmup.integer)
ADDRGP4 g_warmup+12
INDIRI4
CNSTI4 0
NEI4 $527
line 1054
;1054:	{
line 1055
;1055:		level.warmupTime = 0;
ADDRGP4 level+16
CNSTI4 0
ASGNI4
line 1056
;1056:	}
LABELV $527
line 1072
;1057:
;1058:	/*
;1059:	if (level.numNonSpectatorClients == 2 && preNumSpec < 2 && nonSpecIndex != -1 && g_gametype.integer == GT_TOURNAMENT && !level.warmupTime)
;1060:	{
;1061:		gentity_t *currentWinner = G_GetDuelWinner(&level.clients[nonSpecIndex]);
;1062:
;1063:		if (currentWinner && currentWinner->client)
;1064:		{
;1065:			trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " %s %s\n\"",
;1066:			currentWinner->client->pers.netname, G_GetStripEdString("SVINGAME", "VERSUS"), level.clients[nonSpecIndex].pers.netname));
;1067:		}
;1068:	}
;1069:	*/
;1070:	//NOTE: for now not doing this either. May use later if appropriate.
;1071:
;1072:	qsort( level.sortedClients, level.numConnectedClients, 
ADDRGP4 level+84
ARGP4
ADDRGP4 level+72
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 SortRanks
ARGP4
ADDRGP4 qsort
CALLV
pop
line 1076
;1073:		sizeof(level.sortedClients[0]), SortRanks );
;1074:
;1075:	// set the rank value for all clients that are connected and not spectators
;1076:	if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $534
line 1078
;1077:		// in team games, rank is just the order of the teams, 0=red, 1=blue, 2=tied
;1078:		for ( i = 0;  i < level.numConnectedClients; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $540
JUMPV
LABELV $537
line 1079
;1079:			cl = &level.clients[ level.sortedClients[i] ];
ADDRLP4 4
CNSTI4 1812
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1080
;1080:			if ( level.teamScores[TEAM_RED] == level.teamScores[TEAM_BLUE] ) {
ADDRGP4 level+44+4
INDIRI4
ADDRGP4 level+44+8
INDIRI4
NEI4 $543
line 1081
;1081:				cl->ps.persistant[PERS_RANK] = 2;
ADDRLP4 4
INDIRP4
CNSTI4 288
ADDP4
CNSTI4 2
ASGNI4
line 1082
;1082:			} else if ( level.teamScores[TEAM_RED] > level.teamScores[TEAM_BLUE] ) {
ADDRGP4 $544
JUMPV
LABELV $543
ADDRGP4 level+44+4
INDIRI4
ADDRGP4 level+44+8
INDIRI4
LEI4 $549
line 1083
;1083:				cl->ps.persistant[PERS_RANK] = 0;
ADDRLP4 4
INDIRP4
CNSTI4 288
ADDP4
CNSTI4 0
ASGNI4
line 1084
;1084:			} else {
ADDRGP4 $550
JUMPV
LABELV $549
line 1085
;1085:				cl->ps.persistant[PERS_RANK] = 1;
ADDRLP4 4
INDIRP4
CNSTI4 288
ADDP4
CNSTI4 1
ASGNI4
line 1086
;1086:			}
LABELV $550
LABELV $544
line 1087
;1087:		}
LABELV $538
line 1078
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $540
ADDRLP4 0
INDIRI4
ADDRGP4 level+72
INDIRI4
LTI4 $537
line 1088
;1088:	} else {	
ADDRGP4 $535
JUMPV
LABELV $534
line 1089
;1089:		rank = -1;
ADDRLP4 12
CNSTI4 -1
ASGNI4
line 1090
;1090:		score = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1091
;1091:		for ( i = 0;  i < level.numPlayingClients; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $558
JUMPV
LABELV $555
line 1092
;1092:			cl = &level.clients[ level.sortedClients[i] ];
ADDRLP4 4
CNSTI4 1812
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1093
;1093:			newScore = cl->ps.persistant[PERS_SCORE];
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ASGNI4
line 1094
;1094:			if ( i == 0 || newScore != score ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $563
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $561
LABELV $563
line 1095
;1095:				rank = i;
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
line 1097
;1096:				// assume we aren't tied until the next client is checked
;1097:				level.clients[ level.sortedClients[i] ].ps.persistant[PERS_RANK] = rank;
CNSTI4 1812
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 288
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1098
;1098:			} else {
ADDRGP4 $562
JUMPV
LABELV $561
line 1100
;1099:				// we are tied with the previous client
;1100:				level.clients[ level.sortedClients[i-1] ].ps.persistant[PERS_RANK] = rank | RANK_TIED_FLAG;
CNSTI4 1812
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84-4
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 288
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 1101
;1101:				level.clients[ level.sortedClients[i] ].ps.persistant[PERS_RANK] = rank | RANK_TIED_FLAG;
CNSTI4 1812
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 288
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 1102
;1102:			}
LABELV $562
line 1103
;1103:			score = newScore;
ADDRLP4 16
ADDRLP4 8
INDIRI4
ASGNI4
line 1104
;1104:			if ( g_gametype.integer == GT_SINGLE_PLAYER && level.numPlayingClients == 1 ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $568
ADDRGP4 level+80
INDIRI4
CNSTI4 1
NEI4 $568
line 1105
;1105:				level.clients[ level.sortedClients[i] ].ps.persistant[PERS_RANK] = rank | RANK_TIED_FLAG;
CNSTI4 1812
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 288
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 1106
;1106:			}
LABELV $568
line 1107
;1107:		}
LABELV $556
line 1091
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $558
ADDRLP4 0
INDIRI4
ADDRGP4 level+80
INDIRI4
LTI4 $555
line 1108
;1108:	}
LABELV $535
line 1111
;1109:
;1110:	// set the CS_SCORES1/2 configstrings, which will be visible to everyone
;1111:	if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $573
line 1112
;1112:		trap_SetConfigstring( CS_SCORES1, va("%i", level.teamScores[TEAM_RED] ) );
ADDRGP4 $442
ARGP4
ADDRGP4 level+44+4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 6
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1113
;1113:		trap_SetConfigstring( CS_SCORES2, va("%i", level.teamScores[TEAM_BLUE] ) );
ADDRGP4 $442
ARGP4
ADDRGP4 level+44+8
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 7
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1114
;1114:	} else {
ADDRGP4 $574
JUMPV
LABELV $573
line 1115
;1115:		if ( level.numConnectedClients == 0 ) {
ADDRGP4 level+72
INDIRI4
CNSTI4 0
NEI4 $580
line 1116
;1116:			trap_SetConfigstring( CS_SCORES1, va("%i", SCORE_NOT_PRESENT) );
ADDRGP4 $442
ARGP4
CNSTI4 -9999
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 6
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1117
;1117:			trap_SetConfigstring( CS_SCORES2, va("%i", SCORE_NOT_PRESENT) );
ADDRGP4 $442
ARGP4
CNSTI4 -9999
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 7
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1118
;1118:		} else if ( level.numConnectedClients == 1 ) {
ADDRGP4 $581
JUMPV
LABELV $580
ADDRGP4 level+72
INDIRI4
CNSTI4 1
NEI4 $583
line 1119
;1119:			trap_SetConfigstring( CS_SCORES1, va("%i", level.clients[ level.sortedClients[0] ].ps.persistant[PERS_SCORE] ) );
ADDRGP4 $442
ARGP4
CNSTI4 1812
ADDRGP4 level+84
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 280
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 6
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1120
;1120:			trap_SetConfigstring( CS_SCORES2, va("%i", SCORE_NOT_PRESENT) );
ADDRGP4 $442
ARGP4
CNSTI4 -9999
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 7
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1121
;1121:		} else {
ADDRGP4 $584
JUMPV
LABELV $583
line 1122
;1122:			trap_SetConfigstring( CS_SCORES1, va("%i", level.clients[ level.sortedClients[0] ].ps.persistant[PERS_SCORE] ) );
ADDRGP4 $442
ARGP4
CNSTI4 1812
ADDRGP4 level+84
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 280
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 6
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1123
;1123:			trap_SetConfigstring( CS_SCORES2, va("%i", level.clients[ level.sortedClients[1] ].ps.persistant[PERS_SCORE] ) );
ADDRGP4 $442
ARGP4
CNSTI4 1812
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 280
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 7
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1124
;1124:		}
LABELV $584
LABELV $581
line 1126
;1125:
;1126:		if (g_gametype.integer != GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $590
line 1127
;1127:		{ //when not in duel, use this configstring to pass the index of the player currently in first place
line 1128
;1128:			if ( level.numConnectedClients >= 1 )
ADDRGP4 level+72
INDIRI4
CNSTI4 1
LTI4 $593
line 1129
;1129:			{
line 1130
;1130:				trap_SetConfigstring ( CS_CLIENT_DUELWINNER, va("%i", level.sortedClients[0] ) );
ADDRGP4 $442
ARGP4
ADDRGP4 level+84
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 29
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1131
;1131:			}
ADDRGP4 $594
JUMPV
LABELV $593
line 1133
;1132:			else
;1133:			{
line 1134
;1134:				trap_SetConfigstring ( CS_CLIENT_DUELWINNER, "-1" );
CNSTI4 29
ARGI4
ADDRGP4 $324
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1135
;1135:			}
LABELV $594
line 1136
;1136:		}
LABELV $590
line 1137
;1137:	}
LABELV $574
line 1140
;1138:
;1139:	// see if it is time to end the level
;1140:	CheckExitRules();
ADDRGP4 CheckExitRules
CALLV
pop
line 1143
;1141:
;1142:	// if we are at the intermission or in multi-frag Duel game mode, send the new info to everyone
;1143:	if ( level.intermissiontime || g_gametype.integer == GT_TOURNAMENT ) {
ADDRGP4 level+9008
INDIRI4
CNSTI4 0
NEI4 $601
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $597
LABELV $601
line 1144
;1144:		gQueueScoreMessage = qtrue;
ADDRGP4 gQueueScoreMessage
CNSTI4 1
ASGNI4
line 1145
;1145:		gQueueScoreMessageTime = level.time + 500;
ADDRGP4 gQueueScoreMessageTime
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 1148
;1146:		//SendScoreboardMessageToAllClients();
;1147:		//rww - Made this operate on a "queue" system because it was causing large overflows
;1148:	}
LABELV $597
line 1149
;1149:}
LABELV $478
endproc CalculateRanks 52 16
export SendScoreboardMessageToAllClients
proc SendScoreboardMessageToAllClients 4 4
line 1168
;1150:
;1151:
;1152:/*
;1153:========================================================================
;1154:
;1155:MAP CHANGING
;1156:
;1157:========================================================================
;1158:*/
;1159:
;1160:/*
;1161:========================
;1162:SendScoreboardMessageToAllClients
;1163:
;1164:Do this at BeginIntermission time and whenever ranks are recalculated
;1165:due to enters/exits/forced team changes
;1166:========================
;1167:*/
;1168:void SendScoreboardMessageToAllClients( void ) {
line 1171
;1169:	int		i;
;1170:
;1171:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $607
JUMPV
LABELV $604
line 1172
;1172:		if ( level.clients[ i ].pers.connected == CON_CONNECTED ) {
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
CNSTI4 2
NEI4 $609
line 1173
;1173:			DeathmatchScoreboardMessage( g_entities + i );
CNSTI4 832
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 DeathmatchScoreboardMessage
CALLV
pop
line 1174
;1174:		}
LABELV $609
line 1175
;1175:	}
LABELV $605
line 1171
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $607
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $604
line 1176
;1176:}
LABELV $603
endproc SendScoreboardMessageToAllClients 4 4
export MoveClientToIntermission
proc MoveClientToIntermission 0 12
line 1186
;1177:
;1178:/*
;1179:========================
;1180:MoveClientToIntermission
;1181:
;1182:When the intermission starts, this will be called for all players.
;1183:If a new client connects, this will be called after the spawn function.
;1184:========================
;1185:*/
;1186:void MoveClientToIntermission( gentity_t *ent ) {
line 1188
;1187:	// take out of follow mode if needed
;1188:	if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
CNSTI4 2
NEI4 $612
line 1189
;1189:		StopFollowing( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 StopFollowing
CALLV
pop
line 1190
;1190:	}
LABELV $612
line 1194
;1191:
;1192:
;1193:	// move to the spot
;1194:	VectorCopy( level.intermission_origin, ent->s.origin );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRGP4 level+9024
INDIRB
ASGNB 12
line 1195
;1195:	VectorCopy( level.intermission_origin, ent->client->ps.origin );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ADDRGP4 level+9024
INDIRB
ASGNB 12
line 1196
;1196:	VectorCopy (level.intermission_angle, ent->client->ps.viewangles);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ADDRGP4 level+9036
INDIRB
ASGNB 12
line 1197
;1197:	ent->client->ps.pm_type = PM_INTERMISSION;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 6
ASGNI4
line 1200
;1198:
;1199:	// clean up powerup info
;1200:	memset( ent->client->ps.powerups, 0, sizeof(ent->client->ps.powerups) );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1202
;1201:
;1202:	ent->client->ps.eFlags = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
CNSTI4 0
ASGNI4
line 1203
;1203:	ent->s.eFlags = 0;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 1204
;1204:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 1205
;1205:	ent->s.modelindex = 0;
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 0
ASGNI4
line 1206
;1206:	ent->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 1207
;1207:	ent->s.event = 0;
ADDRFP4 0
INDIRP4
CNSTI4 252
ADDP4
CNSTI4 0
ASGNI4
line 1208
;1208:	ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 1209
;1209:}
LABELV $611
endproc MoveClientToIntermission 0 12
export FindIntermissionPoint
proc FindIntermissionPoint 32 12
line 1218
;1210:
;1211:/*
;1212:==================
;1213:FindIntermissionPoint
;1214:
;1215:This is also used for spectator spawns
;1216:==================
;1217:*/
;1218:void FindIntermissionPoint( void ) {
line 1223
;1219:	gentity_t	*ent, *target;
;1220:	vec3_t		dir;
;1221:
;1222:	// find the intermission spot
;1223:	ent = G_Find (NULL, FOFS(classname), "info_player_intermission");
CNSTP4 0
ARGP4
CNSTI4 416
ARGI4
ADDRGP4 $618
ARGP4
ADDRLP4 20
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 1224
;1224:	if ( !ent ) {	// the map creator forgot to put in an intermission point...
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $619
line 1225
;1225:		SelectSpawnPoint ( vec3_origin, level.intermission_origin, level.intermission_angle );
ADDRGP4 vec3_origin
ARGP4
ADDRGP4 level+9024
ARGP4
ADDRGP4 level+9036
ARGP4
ADDRGP4 SelectSpawnPoint
CALLP4
pop
line 1226
;1226:	} else {
ADDRGP4 $620
JUMPV
LABELV $619
line 1227
;1227:		VectorCopy (ent->s.origin, level.intermission_origin);
ADDRGP4 level+9024
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1228
;1228:		VectorCopy (ent->s.angles, level.intermission_angle);
ADDRGP4 level+9036
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1230
;1229:		// if it has a target, look towards it
;1230:		if ( ent->target ) {
ADDRLP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $625
line 1231
;1231:			target = G_PickTarget( ent->target );
ADDRLP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
ASGNP4
line 1232
;1232:			if ( target ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $627
line 1233
;1233:				VectorSubtract( target->s.origin, level.intermission_origin, dir );
ADDRLP4 28
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRGP4 level+9024
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 28
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRGP4 level+9024+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+8
ADDRLP4 4
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRGP4 level+9024+8
INDIRF4
SUBF4
ASGNF4
line 1234
;1234:				vectoangles( dir, level.intermission_angle );
ADDRLP4 8
ARGP4
ADDRGP4 level+9036
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1235
;1235:			}
LABELV $627
line 1236
;1236:		}
LABELV $625
line 1237
;1237:	}
LABELV $620
line 1239
;1238:
;1239:}
LABELV $617
endproc FindIntermissionPoint 32 12
export BeginIntermission
proc BeginIntermission 12 8
line 1248
;1240:
;1241:qboolean DuelLimitHit(void);
;1242:
;1243:/*
;1244:==================
;1245:BeginIntermission
;1246:==================
;1247:*/
;1248:void BeginIntermission( void ) {
line 1252
;1249:	int			i;
;1250:	gentity_t	*client;
;1251:
;1252:	if ( level.intermissiontime ) {
ADDRGP4 level+9008
INDIRI4
CNSTI4 0
EQI4 $638
line 1253
;1253:		return;		// already active
ADDRGP4 $637
JUMPV
LABELV $638
line 1257
;1254:	}
;1255:
;1256:	// if in tournement mode, change the wins / losses
;1257:	if ( g_gametype.integer == GT_TOURNAMENT ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $641
line 1258
;1258:		trap_SetConfigstring ( CS_CLIENT_DUELWINNER, "-1" );
CNSTI4 29
ARGI4
ADDRGP4 $324
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1260
;1259:
;1260:		AdjustTournamentScores();
ADDRGP4 AdjustTournamentScores
CALLV
pop
line 1261
;1261:		if (DuelLimitHit())
ADDRLP4 8
ADDRGP4 DuelLimitHit
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $644
line 1262
;1262:		{
line 1263
;1263:			gDuelExit = qtrue;
ADDRGP4 gDuelExit
CNSTI4 1
ASGNI4
line 1264
;1264:		}
ADDRGP4 $645
JUMPV
LABELV $644
line 1266
;1265:		else
;1266:		{
line 1267
;1267:			gDuelExit = qfalse;
ADDRGP4 gDuelExit
CNSTI4 0
ASGNI4
line 1268
;1268:		}
LABELV $645
line 1269
;1269:	}
LABELV $641
line 1271
;1270:
;1271:	level.intermissiontime = level.time;
ADDRGP4 level+9008
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1272
;1272:	FindIntermissionPoint();
ADDRGP4 FindIntermissionPoint
CALLV
pop
line 1274
;1273:
;1274:	if (g_singlePlayer.integer) {
ADDRGP4 g_singlePlayer+12
INDIRI4
CNSTI4 0
EQI4 $648
line 1275
;1275:		trap_Cvar_Set("ui_singlePlayerActive", "0");
ADDRGP4 $179
ARGP4
ADDRGP4 $80
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1276
;1276:		UpdateTournamentInfo();
ADDRGP4 UpdateTournamentInfo
CALLV
pop
line 1277
;1277:	}
LABELV $648
line 1280
;1278:
;1279:	// move all clients to the intermission point
;1280:	for (i=0 ; i< level.maxclients ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $654
JUMPV
LABELV $651
line 1281
;1281:		client = g_entities + i;
ADDRLP4 0
CNSTI4 832
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1282
;1282:		if (!client->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $656
line 1283
;1283:			continue;
ADDRGP4 $652
JUMPV
LABELV $656
line 1285
;1284:		// respawn if dead
;1285:		if (client->health <= 0) {
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $658
line 1286
;1286:			respawn(client);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 1287
;1287:		}
LABELV $658
line 1288
;1288:		MoveClientToIntermission( client );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 MoveClientToIntermission
CALLV
pop
line 1289
;1289:	}
LABELV $652
line 1280
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $654
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $651
line 1292
;1290:
;1291:	// send the current scoring to all clients
;1292:	SendScoreboardMessageToAllClients();
ADDRGP4 SendScoreboardMessageToAllClients
CALLV
pop
line 1294
;1293:
;1294:}
LABELV $637
endproc BeginIntermission 12 8
export DuelLimitHit
proc DuelLimitHit 8 0
line 1297
;1295:
;1296:qboolean DuelLimitHit(void)
;1297:{
line 1301
;1298:	int i;
;1299:	gclient_t *cl;
;1300:
;1301:	for ( i=0 ; i< g_maxclients.integer ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $664
JUMPV
LABELV $661
line 1302
;1302:		cl = level.clients + i;
ADDRLP4 4
CNSTI4 1812
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1303
;1303:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $666
line 1304
;1304:			continue;
ADDRGP4 $662
JUMPV
LABELV $666
line 1307
;1305:		}
;1306:
;1307:		if ( g_duel_fraglimit.integer && cl->sess.wins >= g_duel_fraglimit.integer )
ADDRGP4 g_duel_fraglimit+12
INDIRI4
CNSTI4 0
EQI4 $668
ADDRLP4 4
INDIRP4
CNSTI4 1552
ADDP4
INDIRI4
ADDRGP4 g_duel_fraglimit+12
INDIRI4
LTI4 $668
line 1308
;1308:		{
line 1309
;1309:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $660
JUMPV
LABELV $668
line 1311
;1310:		}
;1311:	}
LABELV $662
line 1301
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $664
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $661
line 1313
;1312:
;1313:	return qfalse;
CNSTI4 0
RETI4
LABELV $660
endproc DuelLimitHit 8 0
export DuelResetWinsLosses
proc DuelResetWinsLosses 8 0
line 1317
;1314:}
;1315:
;1316:void DuelResetWinsLosses(void)
;1317:{
line 1321
;1318:	int i;
;1319:	gclient_t *cl;
;1320:
;1321:	for ( i=0 ; i< g_maxclients.integer ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $676
JUMPV
LABELV $673
line 1322
;1322:		cl = level.clients + i;
ADDRLP4 0
CNSTI4 1812
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1323
;1323:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $678
line 1324
;1324:			continue;
ADDRGP4 $674
JUMPV
LABELV $678
line 1327
;1325:		}
;1326:
;1327:		cl->sess.wins = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1552
ADDP4
CNSTI4 0
ASGNI4
line 1328
;1328:		cl->sess.losses = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1556
ADDP4
CNSTI4 0
ASGNI4
line 1329
;1329:	}
LABELV $674
line 1321
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $676
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $673
line 1330
;1330:}
LABELV $672
endproc DuelResetWinsLosses 8 0
export ExitLevel
proc ExitLevel 12 8
line 1341
;1331:
;1332:/*
;1333:=============
;1334:ExitLevel
;1335:
;1336:When the intermission has been exited, the server is either killed
;1337:or moved to a new level based on the "nextmap" cvar 
;1338:
;1339:=============
;1340:*/
;1341:void ExitLevel (void) {
line 1347
;1342:	int		i;
;1343:	gclient_t *cl;
;1344:
;1345:	// if we are running a tournement map, kick the loser to spectator status,
;1346:	// which will automatically grab the next spectator and restart
;1347:	if ( g_gametype.integer == GT_TOURNAMENT  ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $681
line 1348
;1348:		if (!DuelLimitHit())
ADDRLP4 8
ADDRGP4 DuelLimitHit
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $684
line 1349
;1349:		{
line 1350
;1350:			if ( !level.restarted ) {
ADDRGP4 level+68
INDIRI4
CNSTI4 0
NEI4 $680
line 1351
;1351:				trap_SendConsoleCommand( EXEC_APPEND, "map_restart 0\n" );
CNSTI4 2
ARGI4
ADDRGP4 $689
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1352
;1352:				level.restarted = qtrue;
ADDRGP4 level+68
CNSTI4 1
ASGNI4
line 1353
;1353:				level.changemap = NULL;
ADDRGP4 level+9012
CNSTP4 0
ASGNP4
line 1354
;1354:				level.intermissiontime = 0;
ADDRGP4 level+9008
CNSTI4 0
ASGNI4
line 1355
;1355:			}
line 1356
;1356:			return;	
ADDRGP4 $680
JUMPV
LABELV $684
line 1359
;1357:		}
;1358:
;1359:		DuelResetWinsLosses();
ADDRGP4 DuelResetWinsLosses
CALLV
pop
line 1360
;1360:	}
LABELV $681
line 1363
;1361:
;1362:
;1363:	trap_SendConsoleCommand( EXEC_APPEND, "vstr nextmap\n" );
CNSTI4 2
ARGI4
ADDRGP4 $693
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1364
;1364:	level.changemap = NULL;
ADDRGP4 level+9012
CNSTP4 0
ASGNP4
line 1365
;1365:	level.intermissiontime = 0;
ADDRGP4 level+9008
CNSTI4 0
ASGNI4
line 1368
;1366:
;1367:	// reset all the scores so we don't enter the intermission again
;1368:	level.teamScores[TEAM_RED] = 0;
ADDRGP4 level+44+4
CNSTI4 0
ASGNI4
line 1369
;1369:	level.teamScores[TEAM_BLUE] = 0;
ADDRGP4 level+44+8
CNSTI4 0
ASGNI4
line 1370
;1370:	for ( i=0 ; i< g_maxclients.integer ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $703
JUMPV
LABELV $700
line 1371
;1371:		cl = level.clients + i;
ADDRLP4 4
CNSTI4 1812
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1372
;1372:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $705
line 1373
;1373:			continue;
ADDRGP4 $701
JUMPV
LABELV $705
line 1375
;1374:		}
;1375:		cl->ps.persistant[PERS_SCORE] = 0;
ADDRLP4 4
INDIRP4
CNSTI4 280
ADDP4
CNSTI4 0
ASGNI4
line 1376
;1376:	}
LABELV $701
line 1370
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $703
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $700
line 1379
;1377:
;1378:	// we need to do this here before chaning to CON_CONNECTING
;1379:	G_WriteSessionData();
ADDRGP4 G_WriteSessionData
CALLV
pop
line 1383
;1380:
;1381:	// change all client states to connecting, so the early players into the
;1382:	// next level will know the others aren't done reconnecting
;1383:	for (i=0 ; i< g_maxclients.integer ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $710
JUMPV
LABELV $707
line 1384
;1384:		if ( level.clients[i].pers.connected == CON_CONNECTED ) {
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
CNSTI4 2
NEI4 $712
line 1385
;1385:			level.clients[i].pers.connected = CON_CONNECTING;
CNSTI4 1812
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1380
ADDP4
CNSTI4 1
ASGNI4
line 1386
;1386:		}
LABELV $712
line 1387
;1387:	}
LABELV $708
line 1383
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $710
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $707
line 1389
;1388:
;1389:}
LABELV $680
endproc ExitLevel 12 8
export G_LogPrintf
proc G_LogPrintf 1044 24
line 1398
;1390:
;1391:/*
;1392:=================
;1393:G_LogPrintf
;1394:
;1395:Print to the logfile with a time stamp if it is open
;1396:=================
;1397:*/
;1398:void QDECL G_LogPrintf( const char *fmt, ... ) {
line 1403
;1399:	va_list		argptr;
;1400:	char		string[1024];
;1401:	int			min, tens, sec;
;1402:
;1403:	sec = level.time / 1000;
ADDRLP4 0
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
DIVI4
ASGNI4
line 1405
;1404:
;1405:	min = sec / 60;
ADDRLP4 1032
ADDRLP4 0
INDIRI4
CNSTI4 60
DIVI4
ASGNI4
line 1406
;1406:	sec -= min * 60;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 60
ADDRLP4 1032
INDIRI4
MULI4
SUBI4
ASGNI4
line 1407
;1407:	tens = sec / 10;
ADDRLP4 1036
ADDRLP4 0
INDIRI4
CNSTI4 10
DIVI4
ASGNI4
line 1408
;1408:	sec -= tens * 10;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 10
ADDRLP4 1036
INDIRI4
MULI4
SUBI4
ASGNI4
line 1410
;1409:
;1410:	Com_sprintf( string, sizeof(string), "%3i:%i%i ", min, tens, sec );
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $716
ARGP4
ADDRLP4 1032
INDIRI4
ARGI4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1412
;1411:
;1412:	va_start( argptr, fmt );
ADDRLP4 1028
ADDRFP4 0+4
ASGNP4
line 1413
;1413:	vsprintf( string +7 , fmt,argptr );
ADDRLP4 4+7
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 1414
;1414:	va_end( argptr );
ADDRLP4 1028
CNSTP4 0
ASGNP4
line 1416
;1415:
;1416:	if ( g_dedicated.integer ) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $719
line 1417
;1417:		G_Printf( "%s", string + 7 );
ADDRGP4 $355
ARGP4
ADDRLP4 4+7
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1418
;1418:	}
LABELV $719
line 1420
;1419:
;1420:	if ( !level.logFile ) {
ADDRGP4 level+20
INDIRI4
CNSTI4 0
NEI4 $723
line 1421
;1421:		return;
ADDRGP4 $714
JUMPV
LABELV $723
line 1424
;1422:	}
;1423:
;1424:	trap_FS_Write( string, strlen( string ), level.logFile );
ADDRLP4 4
ARGP4
ADDRLP4 1040
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ARGP4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 level+20
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1425
;1425:}
LABELV $714
endproc G_LogPrintf 1044 24
export LogExit
proc LogExit 36 20
line 1434
;1426:
;1427:/*
;1428:================
;1429:LogExit
;1430:
;1431:Append information about this game to the log file
;1432:================
;1433:*/
;1434:void LogExit( const char *string ) {
line 1437
;1435:	int				i, numSorted;
;1436:	gclient_t		*cl;
;1437:	qboolean		won = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 1438
;1438:	G_LogPrintf( "Exit: %s\n", string );
ADDRGP4 $728
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1440
;1439:
;1440:	level.intermissionQueued = level.time;
ADDRGP4 level+9004
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1444
;1441:
;1442:	// this will keep the clients from playing any voice sounds
;1443:	// that will get cut off when the queued intermission starts
;1444:	trap_SetConfigstring( CS_INTERMISSION, "1" );
CNSTI4 22
ARGI4
ADDRGP4 $82
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1447
;1445:
;1446:	// don't send more than 32 scores (FIXME?)
;1447:	numSorted = level.numConnectedClients;
ADDRLP4 8
ADDRGP4 level+72
INDIRI4
ASGNI4
line 1448
;1448:	if ( numSorted > 32 ) {
ADDRLP4 8
INDIRI4
CNSTI4 32
LEI4 $732
line 1449
;1449:		numSorted = 32;
ADDRLP4 8
CNSTI4 32
ASGNI4
line 1450
;1450:	}
LABELV $732
line 1452
;1451:
;1452:	if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $734
line 1453
;1453:		G_LogPrintf( "red:%i  blue:%i\n",
ADDRGP4 $737
ARGP4
ADDRGP4 level+44+4
INDIRI4
ARGI4
ADDRGP4 level+44+8
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1455
;1454:			level.teamScores[TEAM_RED], level.teamScores[TEAM_BLUE] );
;1455:	}
LABELV $734
line 1457
;1456:
;1457:	for (i=0 ; i < numSorted ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $745
JUMPV
LABELV $742
line 1460
;1458:		int		ping;
;1459:
;1460:		cl = &level.clients[level.sortedClients[i]];
ADDRLP4 0
CNSTI4 1812
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1462
;1461:
;1462:		if ( cl->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
CNSTI4 3
NEI4 $747
line 1463
;1463:			continue;
ADDRGP4 $743
JUMPV
LABELV $747
line 1465
;1464:		}
;1465:		if ( cl->pers.connected == CON_CONNECTING ) {
ADDRLP4 0
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 1
NEI4 $749
line 1466
;1466:			continue;
ADDRGP4 $743
JUMPV
LABELV $749
line 1469
;1467:		}
;1468:
;1469:		ping = cl->ps.ping < 999 ? cl->ps.ping : 999;
ADDRLP4 0
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
CNSTI4 999
GEI4 $752
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $753
JUMPV
LABELV $752
ADDRLP4 20
CNSTI4 999
ASGNI4
LABELV $753
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
line 1471
;1470:
;1471:		G_LogPrintf( "score: %i  ping: %i  client: %i %s\n", cl->ps.persistant[PERS_SCORE], ping, level.sortedClients[i],	cl->pers.netname );
ADDRGP4 $754
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1472
;1472:		if (g_singlePlayer.integer && g_gametype.integer == GT_TOURNAMENT) {
ADDRGP4 g_singlePlayer+12
INDIRI4
CNSTI4 0
EQI4 $756
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $756
line 1473
;1473:			if (g_entities[cl - level.clients].r.svFlags & SVF_BOT && cl->ps.persistant[PERS_RANK] == 0) {
ADDRLP4 32
CNSTI4 0
ASGNI4
CNSTI4 832
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
MULI4
ADDRGP4 g_entities+296+8
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 32
INDIRI4
EQI4 $760
ADDRLP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $760
line 1474
;1474:				won = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1475
;1475:			}
LABELV $760
line 1476
;1476:		}
LABELV $756
line 1477
;1477:	}
LABELV $743
line 1457
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $745
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $742
line 1479
;1478:
;1479:	if (g_singlePlayer.integer) {
ADDRGP4 g_singlePlayer+12
INDIRI4
CNSTI4 0
EQI4 $764
line 1480
;1480:		if (g_gametype.integer >= GT_CTF) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
LTI4 $767
line 1481
;1481:			won = level.teamScores[TEAM_RED] > level.teamScores[TEAM_BLUE];
ADDRGP4 level+44+4
INDIRI4
ADDRGP4 level+44+8
INDIRI4
LEI4 $775
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRGP4 $776
JUMPV
LABELV $775
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $776
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
line 1482
;1482:		}
LABELV $767
line 1483
;1483:		trap_SendConsoleCommand( EXEC_APPEND, (won) ? "spWin\n" : "spLose\n" );
CNSTI4 2
ARGI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $780
ADDRLP4 16
ADDRGP4 $777
ASGNP4
ADDRGP4 $781
JUMPV
LABELV $780
ADDRLP4 16
ADDRGP4 $778
ASGNP4
LABELV $781
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1484
;1484:	}
LABELV $764
line 1485
;1485:}
LABELV $727
endproc LogExit 36 20
data
export gDidDuelStuff
align 4
LABELV gDidDuelStuff
byte 4 0
export CheckIntermissionExit
code
proc CheckIntermissionExit 64 32
line 1499
;1486:
;1487:qboolean gDidDuelStuff = qfalse; //gets reset on game reinit
;1488:
;1489:/*
;1490:=================
;1491:CheckIntermissionExit
;1492:
;1493:The level will stay at the intermission for a minimum of 5 seconds
;1494:If all players wish to continue, the level will then exit.
;1495:If one or more players have not acknowledged the continue, the game will
;1496:wait 10 seconds before going on.
;1497:=================
;1498:*/
;1499:void CheckIntermissionExit( void ) {
line 1506
;1500:	int			ready, notReady;
;1501:	int			i;
;1502:	gclient_t	*cl;
;1503:	int			readyMask;
;1504:
;1505:	// see which players are ready
;1506:	ready = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1507
;1507:	notReady = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1508
;1508:	readyMask = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1509
;1509:	for (i=0 ; i< g_maxclients.integer ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $786
JUMPV
LABELV $783
line 1510
;1510:		cl = level.clients + i;
ADDRLP4 4
CNSTI4 1812
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1511
;1511:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $788
line 1512
;1512:			continue;
ADDRGP4 $784
JUMPV
LABELV $788
line 1514
;1513:		}
;1514:		if ( g_entities[cl->ps.clientNum].r.svFlags & SVF_BOT ) {
CNSTI4 832
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+296+8
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $790
line 1515
;1515:			continue;
ADDRGP4 $784
JUMPV
LABELV $790
line 1518
;1516:		}
;1517:
;1518:		if ( cl->readyToExit ) {
ADDRLP4 4
INDIRP4
CNSTI4 1588
ADDP4
INDIRI4
CNSTI4 0
EQI4 $794
line 1519
;1519:			ready++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1520
;1520:			if ( i < 16 ) {
ADDRLP4 0
INDIRI4
CNSTI4 16
GEI4 $795
line 1521
;1521:				readyMask |= 1 << i;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 1522
;1522:			}
line 1523
;1523:		} else {
ADDRGP4 $795
JUMPV
LABELV $794
line 1524
;1524:			notReady++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1525
;1525:		}
LABELV $795
line 1526
;1526:	}
LABELV $784
line 1509
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $786
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $783
line 1528
;1527:
;1528:	if ( g_gametype.integer == GT_TOURNAMENT && !gDidDuelStuff &&
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $798
ADDRGP4 gDidDuelStuff
INDIRI4
CNSTI4 0
NEI4 $798
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+9008
INDIRI4
CNSTI4 2000
ADDI4
LEI4 $798
line 1530
;1529:		(level.time > level.intermissiontime + 2000) )
;1530:	{
line 1531
;1531:		gDidDuelStuff = qtrue;
ADDRGP4 gDidDuelStuff
CNSTI4 1
ASGNI4
line 1533
;1532:
;1533:		if ( g_austrian.integer )
ADDRGP4 g_austrian+12
INDIRI4
CNSTI4 0
EQI4 $803
line 1534
;1534:		{
line 1535
;1535:			G_LogPrintf("Duel Results:\n");
ADDRGP4 $806
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1537
;1536:			//G_LogPrintf("Duel Time: %d\n", level.time );
;1537:			G_LogPrintf("winner: %s, score: %d, wins/losses: %d/%d\n", 
ADDRGP4 $807
ARGP4
ADDRLP4 20
CNSTI4 1812
ASGNI4
ADDRLP4 24
ADDRGP4 level
INDIRP4
ASGNP4
ADDRLP4 20
INDIRI4
ADDRGP4 level+84
INDIRI4
MULI4
ADDRLP4 24
INDIRP4
ADDP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 20
INDIRI4
ADDRGP4 level+84
INDIRI4
MULI4
ADDRLP4 24
INDIRP4
ADDP4
CNSTI4 280
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ADDRGP4 level+84
INDIRI4
MULI4
ADDRLP4 24
INDIRP4
ADDP4
CNSTI4 1552
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ADDRGP4 level+84
INDIRI4
MULI4
ADDRLP4 24
INDIRP4
ADDP4
CNSTI4 1556
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1542
;1538:				level.clients[level.sortedClients[0]].pers.netname,
;1539:				level.clients[level.sortedClients[0]].ps.persistant[PERS_SCORE],
;1540:				level.clients[level.sortedClients[0]].sess.wins,
;1541:				level.clients[level.sortedClients[0]].sess.losses );
;1542:			G_LogPrintf("loser: %s, score: %d, wins/losses: %d/%d\n", 
ADDRGP4 $812
ARGP4
ADDRLP4 28
CNSTI4 1812
ASGNI4
ADDRLP4 32
ADDRGP4 level
INDIRP4
ASGNP4
ADDRLP4 28
INDIRI4
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRLP4 32
INDIRP4
ADDP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 28
INDIRI4
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRLP4 32
INDIRP4
ADDP4
CNSTI4 280
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRI4
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRLP4 32
INDIRP4
ADDP4
CNSTI4 1552
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRI4
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRLP4 32
INDIRP4
ADDP4
CNSTI4 1556
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1547
;1543:				level.clients[level.sortedClients[1]].pers.netname,
;1544:				level.clients[level.sortedClients[1]].ps.persistant[PERS_SCORE],
;1545:				level.clients[level.sortedClients[1]].sess.wins,
;1546:				level.clients[level.sortedClients[1]].sess.losses );
;1547:		}
LABELV $803
line 1550
;1548:		// if we are running a tournement map, kick the loser to spectator status,
;1549:		// which will automatically grab the next spectator and restart
;1550:		if (!DuelLimitHit())
ADDRLP4 20
ADDRGP4 DuelLimitHit
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $821
line 1551
;1551:		{
line 1552
;1552:			if (level.clients[level.sortedClients[0]].ps.persistant[PERS_SCORE] ==
ADDRLP4 24
CNSTI4 1812
ASGNI4
ADDRLP4 28
ADDRGP4 level
INDIRP4
ASGNP4
ADDRLP4 32
CNSTI4 280
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 level+84
INDIRI4
MULI4
ADDRLP4 28
INDIRP4
ADDP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRLP4 28
INDIRP4
ADDP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
NEI4 $823
ADDRLP4 36
CNSTI4 1380
ASGNI4
ADDRLP4 40
CNSTI4 2
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 level+84
INDIRI4
MULI4
ADDRLP4 28
INDIRP4
ADDP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
NEI4 $823
ADDRLP4 24
INDIRI4
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRLP4 28
INDIRP4
ADDP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
NEI4 $823
line 1556
;1553:				level.clients[level.sortedClients[1]].ps.persistant[PERS_SCORE] &&
;1554:				level.clients[level.sortedClients[0]].pers.connected == CON_CONNECTED &&
;1555:				level.clients[level.sortedClients[1]].pers.connected == CON_CONNECTED)
;1556:			{
line 1557
;1557:				RemoveDuelDrawLoser();
ADDRGP4 RemoveDuelDrawLoser
CALLV
pop
line 1558
;1558:			}
ADDRGP4 $824
JUMPV
LABELV $823
line 1560
;1559:			else
;1560:			{
line 1561
;1561:				RemoveTournamentLoser();
ADDRGP4 RemoveTournamentLoser
CALLV
pop
line 1562
;1562:			}
LABELV $824
line 1564
;1563:
;1564:			AddTournamentPlayer();
ADDRGP4 AddTournamentPlayer
CALLV
pop
line 1566
;1565:
;1566:			if ( g_austrian.integer )
ADDRGP4 g_austrian+12
INDIRI4
CNSTI4 0
EQI4 $831
line 1567
;1567:			{
line 1568
;1568:				G_LogPrintf("Duel Initiated: %s %d/%d vs %s %d/%d, kill limit: %d\n", 
ADDRGP4 $834
ARGP4
ADDRLP4 44
CNSTI4 1812
ASGNI4
ADDRLP4 48
ADDRGP4 level
INDIRP4
ASGNP4
ADDRLP4 52
CNSTI4 1428
ASGNI4
ADDRLP4 44
INDIRI4
ADDRGP4 level+84
INDIRI4
MULI4
ADDRLP4 48
INDIRP4
ADDP4
ADDRLP4 52
INDIRI4
ADDP4
ARGP4
ADDRLP4 56
CNSTI4 1552
ASGNI4
ADDRLP4 44
INDIRI4
ADDRGP4 level+84
INDIRI4
MULI4
ADDRLP4 48
INDIRP4
ADDP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
CNSTI4 1556
ASGNI4
ADDRLP4 44
INDIRI4
ADDRGP4 level+84
INDIRI4
MULI4
ADDRLP4 48
INDIRP4
ADDP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRLP4 48
INDIRP4
ADDP4
ADDRLP4 52
INDIRI4
ADDP4
ARGP4
ADDRLP4 44
INDIRI4
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRLP4 48
INDIRP4
ADDP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRLP4 48
INDIRP4
ADDP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRGP4 g_fraglimit+12
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1576
;1569:					level.clients[level.sortedClients[0]].pers.netname,
;1570:					level.clients[level.sortedClients[0]].sess.wins,
;1571:					level.clients[level.sortedClients[0]].sess.losses,
;1572:					level.clients[level.sortedClients[1]].pers.netname,
;1573:					level.clients[level.sortedClients[1]].sess.wins,
;1574:					level.clients[level.sortedClients[1]].sess.losses,
;1575:					g_fraglimit.integer );
;1576:			}
LABELV $831
line 1578
;1577:			
;1578:			if (level.numPlayingClients >= 2)
ADDRGP4 level+80
INDIRI4
CNSTI4 2
LTI4 $782
line 1579
;1579:			{
line 1580
;1580:				trap_SetConfigstring ( CS_CLIENT_DUELISTS, va("%i|%i", level.sortedClients[0], level.sortedClients[1] ) );
ADDRGP4 $848
ARGP4
ADDRGP4 level+84
INDIRI4
ARGI4
ADDRGP4 level+84+4
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 30
ARGI4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1581
;1581:				trap_SetConfigstring ( CS_CLIENT_DUELWINNER, "-1" );
CNSTI4 29
ARGI4
ADDRGP4 $324
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1583
;1582:
;1583:				gDuelist1 = level.sortedClients[0];
ADDRGP4 gDuelist1
ADDRGP4 level+84
INDIRI4
ASGNI4
line 1584
;1584:				gDuelist2 = level.sortedClients[1];
ADDRGP4 gDuelist2
ADDRGP4 level+84+4
INDIRI4
ASGNI4
line 1585
;1585:			}
line 1587
;1586:
;1587:			return;	
ADDRGP4 $782
JUMPV
LABELV $821
line 1590
;1588:		}
;1589:
;1590:		if ( g_austrian.integer )
ADDRGP4 g_austrian+12
INDIRI4
CNSTI4 0
EQI4 $855
line 1591
;1591:		{
line 1592
;1592:			G_LogPrintf("Duel Tournament Winner: %s wins/losses: %d/%d\n", 
ADDRGP4 $858
ARGP4
ADDRLP4 24
CNSTI4 1812
ASGNI4
ADDRLP4 28
ADDRGP4 level
INDIRP4
ASGNP4
ADDRLP4 24
INDIRI4
ADDRGP4 level+84
INDIRI4
MULI4
ADDRLP4 28
INDIRP4
ADDP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 24
INDIRI4
ADDRGP4 level+84
INDIRI4
MULI4
ADDRLP4 28
INDIRP4
ADDP4
CNSTI4 1552
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ADDRGP4 level+84
INDIRI4
MULI4
ADDRLP4 28
INDIRP4
ADDP4
CNSTI4 1556
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1596
;1593:				level.clients[level.sortedClients[0]].pers.netname,
;1594:				level.clients[level.sortedClients[0]].sess.wins,
;1595:				level.clients[level.sortedClients[0]].sess.losses );
;1596:		}
LABELV $855
line 1600
;1597:		//this means we hit the duel limit so reset the wins/losses
;1598:		//but still push the loser to the back of the line, and retain the order for
;1599:		//the map change
;1600:		if (level.clients[level.sortedClients[0]].ps.persistant[PERS_SCORE] ==
ADDRLP4 24
CNSTI4 1812
ASGNI4
ADDRLP4 28
ADDRGP4 level
INDIRP4
ASGNP4
ADDRLP4 32
CNSTI4 280
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 level+84
INDIRI4
MULI4
ADDRLP4 28
INDIRP4
ADDP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRLP4 28
INDIRP4
ADDP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
NEI4 $862
ADDRLP4 36
CNSTI4 1380
ASGNI4
ADDRLP4 40
CNSTI4 2
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 level+84
INDIRI4
MULI4
ADDRLP4 28
INDIRP4
ADDP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
NEI4 $862
ADDRLP4 24
INDIRI4
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRLP4 28
INDIRP4
ADDP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
NEI4 $862
line 1604
;1601:			level.clients[level.sortedClients[1]].ps.persistant[PERS_SCORE] &&
;1602:			level.clients[level.sortedClients[0]].pers.connected == CON_CONNECTED &&
;1603:			level.clients[level.sortedClients[1]].pers.connected == CON_CONNECTED)
;1604:		{
line 1605
;1605:			RemoveDuelDrawLoser();
ADDRGP4 RemoveDuelDrawLoser
CALLV
pop
line 1606
;1606:		}
ADDRGP4 $863
JUMPV
LABELV $862
line 1608
;1607:		else
;1608:		{
line 1609
;1609:			RemoveTournamentLoser();
ADDRGP4 RemoveTournamentLoser
CALLV
pop
line 1610
;1610:		}
LABELV $863
line 1612
;1611:
;1612:		AddTournamentPlayer();
ADDRGP4 AddTournamentPlayer
CALLV
pop
line 1614
;1613:
;1614:		if (level.numPlayingClients >= 2)
ADDRGP4 level+80
INDIRI4
CNSTI4 2
LTI4 $870
line 1615
;1615:		{
line 1616
;1616:			trap_SetConfigstring ( CS_CLIENT_DUELISTS, va("%i|%i", level.sortedClients[0], level.sortedClients[1] ) );
ADDRGP4 $848
ARGP4
ADDRGP4 level+84
INDIRI4
ARGI4
ADDRGP4 level+84+4
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 30
ARGI4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1617
;1617:			trap_SetConfigstring ( CS_CLIENT_DUELWINNER, "-1" );
CNSTI4 29
ARGI4
ADDRGP4 $324
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1619
;1618:
;1619:			gDuelist1 = level.sortedClients[0];
ADDRGP4 gDuelist1
ADDRGP4 level+84
INDIRI4
ASGNI4
line 1620
;1620:			gDuelist2 = level.sortedClients[1];
ADDRGP4 gDuelist2
ADDRGP4 level+84+4
INDIRI4
ASGNI4
line 1621
;1621:		}
LABELV $870
line 1622
;1622:	}
LABELV $798
line 1624
;1623:
;1624:	if (g_gametype.integer == GT_TOURNAMENT && !gDuelExit)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $879
ADDRGP4 gDuelExit
INDIRI4
CNSTI4 0
NEI4 $879
line 1625
;1625:	{ //in duel, we have different behaviour for between-round intermissions
line 1626
;1626:		if ( level.time > level.intermissiontime + 4000 )
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+9008
INDIRI4
CNSTI4 4000
ADDI4
LEI4 $882
line 1627
;1627:		{ //automatically go to next after 4 seconds
line 1628
;1628:			ExitLevel();
ADDRGP4 ExitLevel
CALLV
pop
line 1629
;1629:			return;
ADDRGP4 $782
JUMPV
LABELV $882
line 1632
;1630:		}
;1631:
;1632:		for (i=0 ; i< g_maxclients.integer ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $889
JUMPV
LABELV $886
line 1633
;1633:		{ //being in a "ready" state is not necessary here, so clear it for everyone
line 1636
;1634:		  //yes, I also thinking holding this in a ps value uniquely for each player
;1635:		  //is bad and wrong, but it wasn't my idea.
;1636:			cl = level.clients + i;
ADDRLP4 4
CNSTI4 1812
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1637
;1637:			if ( cl->pers.connected != CON_CONNECTED )
ADDRLP4 4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $891
line 1638
;1638:			{
line 1639
;1639:				continue;
ADDRGP4 $887
JUMPV
LABELV $891
line 1641
;1640:			}
;1641:			cl->ps.stats[STAT_CLIENTS_READY] = 0;
ADDRLP4 4
INDIRP4
CNSTI4 244
ADDP4
CNSTI4 0
ASGNI4
line 1642
;1642:		}
LABELV $887
line 1632
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $889
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $886
line 1643
;1643:		return;
ADDRGP4 $782
JUMPV
LABELV $879
line 1648
;1644:	}
;1645:
;1646:	// copy the readyMask to each player's stats so
;1647:	// it can be displayed on the scoreboard
;1648:	for (i=0 ; i< g_maxclients.integer ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $896
JUMPV
LABELV $893
line 1649
;1649:		cl = level.clients + i;
ADDRLP4 4
CNSTI4 1812
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1650
;1650:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $898
line 1651
;1651:			continue;
ADDRGP4 $894
JUMPV
LABELV $898
line 1653
;1652:		}
;1653:		cl->ps.stats[STAT_CLIENTS_READY] = readyMask;
ADDRLP4 4
INDIRP4
CNSTI4 244
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1654
;1654:	}
LABELV $894
line 1648
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $896
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $893
line 1657
;1655:
;1656:	// never exit in less than five seconds
;1657:	if ( level.time < level.intermissiontime + 5000 ) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+9008
INDIRI4
CNSTI4 5000
ADDI4
GEI4 $900
line 1658
;1658:		return;
ADDRGP4 $782
JUMPV
LABELV $900
line 1662
;1659:	}
;1660:
;1661:	// if nobody wants to go, clear timer
;1662:	if ( !ready ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $904
line 1663
;1663:		level.readyToExit = qfalse;
ADDRGP4 level+9016
CNSTI4 0
ASGNI4
line 1664
;1664:		return;
ADDRGP4 $782
JUMPV
LABELV $904
line 1668
;1665:	}
;1666:
;1667:	// if everyone wants to go, go now
;1668:	if ( !notReady ) {
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $907
line 1669
;1669:		ExitLevel();
ADDRGP4 ExitLevel
CALLV
pop
line 1670
;1670:		return;
ADDRGP4 $782
JUMPV
LABELV $907
line 1674
;1671:	}
;1672:
;1673:	// the first person to ready starts the ten second timeout
;1674:	if ( !level.readyToExit ) {
ADDRGP4 level+9016
INDIRI4
CNSTI4 0
NEI4 $909
line 1675
;1675:		level.readyToExit = qtrue;
ADDRGP4 level+9016
CNSTI4 1
ASGNI4
line 1676
;1676:		level.exitTime = level.time;
ADDRGP4 level+9020
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1677
;1677:	}
LABELV $909
line 1681
;1678:
;1679:	// if we have waited ten seconds since at least one player
;1680:	// wanted to exit, go ahead
;1681:	if ( level.time < level.exitTime + 10000 ) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+9020
INDIRI4
CNSTI4 10000
ADDI4
GEI4 $915
line 1682
;1682:		return;
ADDRGP4 $782
JUMPV
LABELV $915
line 1685
;1683:	}
;1684:
;1685:	ExitLevel();
ADDRGP4 ExitLevel
CALLV
pop
line 1686
;1686:}
LABELV $782
endproc CheckIntermissionExit 64 32
export ScoreIsTied
proc ScoreIsTied 12 0
line 1693
;1687:
;1688:/*
;1689:=============
;1690:ScoreIsTied
;1691:=============
;1692:*/
;1693:qboolean ScoreIsTied( void ) {
line 1696
;1694:	int		a, b;
;1695:
;1696:	if ( level.numPlayingClients < 2 ) {
ADDRGP4 level+80
INDIRI4
CNSTI4 2
GEI4 $920
line 1697
;1697:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $919
JUMPV
LABELV $920
line 1700
;1698:	}
;1699:	
;1700:	if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $923
line 1701
;1701:		return level.teamScores[TEAM_RED] == level.teamScores[TEAM_BLUE];
ADDRGP4 level+44+4
INDIRI4
ADDRGP4 level+44+8
INDIRI4
NEI4 $931
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $932
JUMPV
LABELV $931
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $932
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $919
JUMPV
LABELV $923
line 1704
;1702:	}
;1703:
;1704:	a = level.clients[level.sortedClients[0]].ps.persistant[PERS_SCORE];
ADDRLP4 0
CNSTI4 1812
ADDRGP4 level+84
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 280
ADDP4
INDIRI4
ASGNI4
line 1705
;1705:	b = level.clients[level.sortedClients[1]].ps.persistant[PERS_SCORE];
ADDRLP4 4
CNSTI4 1812
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 280
ADDP4
INDIRI4
ASGNI4
line 1707
;1706:
;1707:	return a == b;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $937
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $938
JUMPV
LABELV $937
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $938
ADDRLP4 8
INDIRI4
RETI4
LABELV $919
endproc ScoreIsTied 12 0
export CheckExitRules
proc CheckExitRules 28 12
line 1719
;1708:}
;1709:
;1710:/*
;1711:=================
;1712:CheckExitRules
;1713:
;1714:There will be a delay between the time the exit is qualified for
;1715:and the time everyone is moved to the intermission spot, so you
;1716:can see the last frag.
;1717:=================
;1718:*/
;1719:void CheckExitRules( void ) {
line 1724
;1720: 	int			i;
;1721:	gclient_t	*cl;
;1722:	// if at the intermission, wait for all non-bots to
;1723:	// signal ready, then go to next level
;1724:	if ( level.intermissiontime ) {
ADDRGP4 level+9008
INDIRI4
CNSTI4 0
EQI4 $940
line 1725
;1725:		CheckIntermissionExit ();
ADDRGP4 CheckIntermissionExit
CALLV
pop
line 1726
;1726:		return;
ADDRGP4 $939
JUMPV
LABELV $940
line 1729
;1727:	}
;1728:
;1729:	if (gDoSlowMoDuel)
ADDRGP4 gDoSlowMoDuel
INDIRI4
CNSTI4 0
EQI4 $943
line 1730
;1730:	{ //don't go to intermission while in slow motion
line 1731
;1731:		return;
ADDRGP4 $939
JUMPV
LABELV $943
line 1734
;1732:	}
;1733:
;1734:	if (gEscaping)
ADDRGP4 gEscaping
INDIRI4
CNSTI4 0
EQI4 $945
line 1735
;1735:	{
line 1736
;1736:		int i = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1737
;1737:		int numLiveClients = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $948
JUMPV
LABELV $947
line 1740
;1738:
;1739:		while (i < MAX_CLIENTS)
;1740:		{
line 1741
;1741:			if (g_entities[i].inuse && g_entities[i].client && g_entities[i].health > 0)
ADDRLP4 16
CNSTI4 832
ADDRLP4 8
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $950
ADDRLP4 16
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $950
ADDRLP4 16
INDIRI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
LEI4 $950
line 1742
;1742:			{
line 1743
;1743:				if (g_entities[i].client->sess.sessionTeam != TEAM_SPECTATOR &&
ADDRLP4 24
CNSTI4 832
ADDRLP4 8
INDIRI4
MULI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
CNSTI4 3
EQI4 $955
ADDRLP4 24
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $955
line 1745
;1744:					!(g_entities[i].client->ps.pm_flags & PMF_FOLLOW))
;1745:				{
line 1746
;1746:					numLiveClients++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1747
;1747:				}
LABELV $955
line 1748
;1748:			}
LABELV $950
line 1750
;1749:
;1750:			i++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1751
;1751:		}
LABELV $948
line 1739
ADDRLP4 8
INDIRI4
CNSTI4 32
LTI4 $947
line 1752
;1752:		if (gEscapeTime < level.time)
ADDRGP4 gEscapeTime
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $959
line 1753
;1753:		{
line 1754
;1754:			gEscaping = qfalse;
ADDRGP4 gEscaping
CNSTI4 0
ASGNI4
line 1755
;1755:			LogExit( "Escape time ended." );
ADDRGP4 $962
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1756
;1756:			return;
ADDRGP4 $939
JUMPV
LABELV $959
line 1758
;1757:		}
;1758:		if (!numLiveClients)
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $963
line 1759
;1759:		{
line 1760
;1760:			gEscaping = qfalse;
ADDRGP4 gEscaping
CNSTI4 0
ASGNI4
line 1761
;1761:			LogExit( "Everyone failed to escape." );
ADDRGP4 $965
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1762
;1762:			return;
ADDRGP4 $939
JUMPV
LABELV $963
line 1764
;1763:		}
;1764:	}
LABELV $945
line 1766
;1765:
;1766:	if ( level.intermissionQueued ) {
ADDRGP4 level+9004
INDIRI4
CNSTI4 0
EQI4 $966
line 1767
;1767:		int time = (g_singlePlayer.integer) ? SP_INTERMISSION_DELAY_TIME : INTERMISSION_DELAY_TIME;
ADDRGP4 g_singlePlayer+12
INDIRI4
CNSTI4 0
EQI4 $971
ADDRLP4 12
CNSTI4 5000
ASGNI4
ADDRGP4 $972
JUMPV
LABELV $971
ADDRLP4 12
CNSTI4 1000
ASGNI4
LABELV $972
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 1768
;1768:		if ( level.time - level.intermissionQueued >= time ) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+9004
INDIRI4
SUBI4
ADDRLP4 8
INDIRI4
LTI4 $939
line 1769
;1769:			level.intermissionQueued = 0;
ADDRGP4 level+9004
CNSTI4 0
ASGNI4
line 1770
;1770:			BeginIntermission();
ADDRGP4 BeginIntermission
CALLV
pop
line 1771
;1771:		}
line 1772
;1772:		return;
ADDRGP4 $939
JUMPV
LABELV $966
line 1776
;1773:	}
;1774:
;1775:	// check for sudden death
;1776:	if ( ScoreIsTied() ) {
ADDRLP4 8
ADDRGP4 ScoreIsTied
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $978
line 1778
;1777:		// always wait for sudden death
;1778:		if (g_gametype.integer != GT_TOURNAMENT || !g_timelimit.integer)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $984
ADDRGP4 g_timelimit+12
INDIRI4
CNSTI4 0
NEI4 $980
LABELV $984
line 1779
;1779:		{
line 1780
;1780:			return;
ADDRGP4 $939
JUMPV
LABELV $980
line 1782
;1781:		}
;1782:	}
LABELV $978
line 1784
;1783:
;1784:	if ( g_timelimit.integer && !level.warmupTime ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 g_timelimit+12
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $985
ADDRGP4 level+16
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $985
line 1785
;1785:		if ( level.time - level.startTime >= g_timelimit.integer*60000 ) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+40
INDIRI4
SUBI4
CNSTI4 60000
ADDRGP4 g_timelimit+12
INDIRI4
MULI4
LTI4 $989
line 1787
;1786://			trap_SendServerCommand( -1, "print \"Timelimit hit.\n\"");
;1787:			trap_SendServerCommand( -1, va("print \"%s.\n\"",G_GetStripEdString("SVINGAME", "TIMELIMIT_HIT")));
ADDRGP4 $995
ARGP4
ADDRGP4 $996
ARGP4
ADDRLP4 16
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $994
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
line 1788
;1788:			LogExit( "Timelimit hit." );
ADDRGP4 $997
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1789
;1789:			return;
ADDRGP4 $939
JUMPV
LABELV $989
line 1791
;1790:		}
;1791:	}
LABELV $985
line 1793
;1792:
;1793:	if ( level.numPlayingClients < 2 ) {
ADDRGP4 level+80
INDIRI4
CNSTI4 2
GEI4 $998
line 1794
;1794:		return;
ADDRGP4 $939
JUMPV
LABELV $998
line 1797
;1795:	}
;1796:
;1797:	if ( g_gametype.integer < GT_CTF && g_fraglimit.integer ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
GEI4 $1001
ADDRGP4 g_fraglimit+12
INDIRI4
CNSTI4 0
EQI4 $1001
line 1798
;1798:		if ( level.teamScores[TEAM_RED] >= g_fraglimit.integer ) {
ADDRGP4 level+44+4
INDIRI4
ADDRGP4 g_fraglimit+12
INDIRI4
LTI4 $1005
line 1799
;1799:			trap_SendServerCommand( -1, va("print \"Red %s\n\"", G_GetStripEdString("SVINGAME", "HIT_THE_KILL_LIMIT")) );
ADDRGP4 $995
ARGP4
ADDRGP4 $1011
ARGP4
ADDRLP4 16
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $1010
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
line 1800
;1800:			LogExit( "Kill limit hit." );
ADDRGP4 $1012
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1801
;1801:			return;
ADDRGP4 $939
JUMPV
LABELV $1005
line 1804
;1802:		}
;1803:
;1804:		if ( level.teamScores[TEAM_BLUE] >= g_fraglimit.integer ) {
ADDRGP4 level+44+8
INDIRI4
ADDRGP4 g_fraglimit+12
INDIRI4
LTI4 $1013
line 1805
;1805:			trap_SendServerCommand( -1, va("print \"Blue %s\n\"", G_GetStripEdString("SVINGAME", "HIT_THE_KILL_LIMIT")) );
ADDRGP4 $995
ARGP4
ADDRGP4 $1011
ARGP4
ADDRLP4 16
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $1018
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
line 1806
;1806:			LogExit( "Kill limit hit." );
ADDRGP4 $1012
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1807
;1807:			return;
ADDRGP4 $939
JUMPV
LABELV $1013
line 1810
;1808:		}
;1809:
;1810:		for ( i=0 ; i< g_maxclients.integer ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1022
JUMPV
LABELV $1019
line 1811
;1811:			cl = level.clients + i;
ADDRLP4 0
CNSTI4 1812
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1812
;1812:			if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1024
line 1813
;1813:				continue;
ADDRGP4 $1020
JUMPV
LABELV $1024
line 1815
;1814:			}
;1815:			if ( cl->sess.sessionTeam != TEAM_FREE ) {
ADDRLP4 0
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1026
line 1816
;1816:				continue;
ADDRGP4 $1020
JUMPV
LABELV $1026
line 1819
;1817:			}
;1818:
;1819:			if ( g_gametype.integer == GT_TOURNAMENT && g_duel_fraglimit.integer && cl->sess.wins >= g_duel_fraglimit.integer )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $1028
ADDRGP4 g_duel_fraglimit+12
INDIRI4
CNSTI4 0
EQI4 $1028
ADDRLP4 0
INDIRP4
CNSTI4 1552
ADDP4
INDIRI4
ADDRGP4 g_duel_fraglimit+12
INDIRI4
LTI4 $1028
line 1820
;1820:			{
line 1821
;1821:				LogExit( "Duel limit hit." );
ADDRGP4 $1033
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1822
;1822:				gDuelExit = qtrue;
ADDRGP4 gDuelExit
CNSTI4 1
ASGNI4
line 1823
;1823:				trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " hit the win limit.\n\"",
ADDRGP4 $1034
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1825
;1824:					cl->pers.netname ) );
;1825:				return;
ADDRGP4 $939
JUMPV
LABELV $1028
line 1828
;1826:			}
;1827:
;1828:			if ( cl->ps.persistant[PERS_SCORE] >= g_fraglimit.integer ) {
ADDRLP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ADDRGP4 g_fraglimit+12
INDIRI4
LTI4 $1035
line 1829
;1829:				LogExit( "Kill limit hit." );
ADDRGP4 $1012
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1830
;1830:				gDuelExit = qfalse;
ADDRGP4 gDuelExit
CNSTI4 0
ASGNI4
line 1831
;1831:				trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " %s.\n\"",
ADDRGP4 $995
ARGP4
ADDRGP4 $1011
ARGP4
ADDRLP4 16
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $1038
ARGP4
ADDRLP4 0
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
line 1836
;1832:												cl->pers.netname,
;1833:												G_GetStripEdString("SVINGAME", "HIT_THE_KILL_LIMIT")
;1834:												) 
;1835:										);
;1836:				return;
ADDRGP4 $939
JUMPV
LABELV $1035
line 1838
;1837:			}
;1838:		}
LABELV $1020
line 1810
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1022
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $1019
line 1839
;1839:	}
LABELV $1001
line 1841
;1840:
;1841:	if ( g_gametype.integer >= GT_CTF && g_capturelimit.integer ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
LTI4 $1039
ADDRGP4 g_capturelimit+12
INDIRI4
CNSTI4 0
EQI4 $1039
line 1843
;1842:
;1843:		if ( level.teamScores[TEAM_RED] >= g_capturelimit.integer ) {
ADDRGP4 level+44+4
INDIRI4
ADDRGP4 g_capturelimit+12
INDIRI4
LTI4 $1043
line 1844
;1844:			trap_SendServerCommand( -1, "print \"Red hit the capturelimit.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $1048
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1845
;1845:			LogExit( "Capturelimit hit." );
ADDRGP4 $1049
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1846
;1846:			return;
ADDRGP4 $939
JUMPV
LABELV $1043
line 1849
;1847:		}
;1848:
;1849:		if ( level.teamScores[TEAM_BLUE] >= g_capturelimit.integer ) {
ADDRGP4 level+44+8
INDIRI4
ADDRGP4 g_capturelimit+12
INDIRI4
LTI4 $1050
line 1850
;1850:			trap_SendServerCommand( -1, "print \"Blue hit the capturelimit.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $1055
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1851
;1851:			LogExit( "Capturelimit hit." );
ADDRGP4 $1049
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1852
;1852:			return;
LABELV $1050
line 1854
;1853:		}
;1854:	}
LABELV $1039
line 1855
;1855:}
LABELV $939
endproc CheckExitRules 28 12
export CheckTournament
proc CheckTournament 32 32
line 1874
;1856:
;1857:
;1858:
;1859:/*
;1860:========================================================================
;1861:
;1862:FUNCTIONS CALLED EVERY FRAME
;1863:
;1864:========================================================================
;1865:*/
;1866:
;1867:/*
;1868:=============
;1869:CheckTournament
;1870:
;1871:Once a frame, check for changes in tournement player state
;1872:=============
;1873:*/
;1874:void CheckTournament( void ) {
line 1877
;1875:	// check because we run 3 game frames before calling Connect and/or ClientBegin
;1876:	// for clients on a map_restart
;1877:	if ( level.numPlayingClients == 0 ) {
ADDRGP4 level+80
INDIRI4
CNSTI4 0
NEI4 $1057
line 1878
;1878:		return;
ADDRGP4 $1056
JUMPV
LABELV $1057
line 1881
;1879:	}
;1880:
;1881:	if ( g_gametype.integer == GT_TOURNAMENT ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $1060
line 1884
;1882:
;1883:		// pull in a spectator if needed
;1884:		if ( level.numPlayingClients < 2 ) {
ADDRGP4 level+80
INDIRI4
CNSTI4 2
GEI4 $1063
line 1885
;1885:			AddTournamentPlayer();
ADDRGP4 AddTournamentPlayer
CALLV
pop
line 1887
;1886:
;1887:			if (level.numPlayingClients >= 2)
ADDRGP4 level+80
INDIRI4
CNSTI4 2
LTI4 $1066
line 1888
;1888:			{
line 1889
;1889:				trap_SetConfigstring ( CS_CLIENT_DUELISTS, va("%i|%i", level.sortedClients[0], level.sortedClients[1] ) );
ADDRGP4 $848
ARGP4
ADDRGP4 level+84
INDIRI4
ARGI4
ADDRGP4 level+84+4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 30
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1890
;1890:				gDuelist1 = level.sortedClients[0];
ADDRGP4 gDuelist1
ADDRGP4 level+84
INDIRI4
ASGNI4
line 1891
;1891:				gDuelist2 = level.sortedClients[1];
ADDRGP4 gDuelist2
ADDRGP4 level+84+4
INDIRI4
ASGNI4
line 1892
;1892:			}
LABELV $1066
line 1893
;1893:		}
LABELV $1063
line 1895
;1894:
;1895:		if (level.numPlayingClients >= 2)
ADDRGP4 level+80
INDIRI4
CNSTI4 2
LTI4 $1075
line 1896
;1896:		{
line 1897
;1897:			if (gDuelist1 == -1 ||
ADDRLP4 0
CNSTI4 -1
ASGNI4
ADDRGP4 gDuelist1
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $1080
ADDRGP4 gDuelist2
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1078
LABELV $1080
line 1899
;1898:				gDuelist2 == -1)
;1899:			{
line 1900
;1900:				trap_SetConfigstring ( CS_CLIENT_DUELISTS, va("%i|%i", level.sortedClients[0], level.sortedClients[1] ) );
ADDRGP4 $848
ARGP4
ADDRGP4 level+84
INDIRI4
ARGI4
ADDRGP4 level+84+4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 30
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1901
;1901:				gDuelist1 = level.sortedClients[0];
ADDRGP4 gDuelist1
ADDRGP4 level+84
INDIRI4
ASGNI4
line 1902
;1902:				gDuelist2 = level.sortedClients[1];
ADDRGP4 gDuelist2
ADDRGP4 level+84+4
INDIRI4
ASGNI4
line 1903
;1903:				if ( g_austrian.integer )
ADDRGP4 g_austrian+12
INDIRI4
CNSTI4 0
EQI4 $1087
line 1904
;1904:				{
line 1905
;1905:					G_LogPrintf("Duel Initiated: %s %d/%d vs %s %d/%d, kill limit: %d\n", 
ADDRGP4 $834
ARGP4
ADDRLP4 8
CNSTI4 1812
ASGNI4
ADDRLP4 12
ADDRGP4 level
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 1428
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 level+84
INDIRI4
MULI4
ADDRLP4 12
INDIRP4
ADDP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
ADDRLP4 20
CNSTI4 1552
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 level+84
INDIRI4
MULI4
ADDRLP4 12
INDIRP4
ADDP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
CNSTI4 1556
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 level+84
INDIRI4
MULI4
ADDRLP4 12
INDIRP4
ADDP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRLP4 12
INDIRP4
ADDP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRLP4 12
INDIRP4
ADDP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRLP4 12
INDIRP4
ADDP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRGP4 g_fraglimit+12
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1913
;1906:						level.clients[level.sortedClients[0]].pers.netname,
;1907:						level.clients[level.sortedClients[0]].sess.wins,
;1908:						level.clients[level.sortedClients[0]].sess.losses,
;1909:						level.clients[level.sortedClients[1]].pers.netname,
;1910:						level.clients[level.sortedClients[1]].sess.wins,
;1911:						level.clients[level.sortedClients[1]].sess.losses,
;1912:						g_fraglimit.integer );
;1913:				}
LABELV $1087
line 1916
;1914:				//trap_SendConsoleCommand( EXEC_APPEND, "map_restart 0\n" );
;1915:				//FIXME: This seems to cause problems. But we'd like to reset things whenever a new opponent is set.
;1916:			}
LABELV $1078
line 1917
;1917:		}
LABELV $1075
line 1921
;1918:
;1919:		//rww - It seems we have decided there will be no warmup in duel.
;1920:		//if (!g_warmup.integer)
;1921:		{ //don't care about any of this stuff then, just add people and leave me alone
line 1922
;1922:			level.warmupTime = 0;
ADDRGP4 level+16
CNSTI4 0
ASGNI4
line 1923
;1923:			return;
ADDRGP4 $1056
JUMPV
LABELV $1060
line 1970
;1924:		}
;1925:#if 0
;1926:		// if we don't have two players, go back to "waiting for players"
;1927:		if ( level.numPlayingClients != 2 ) {
;1928:			if ( level.warmupTime != -1 ) {
;1929:				level.warmupTime = -1;
;1930:				trap_SetConfigstring( CS_WARMUP, va("%i", level.warmupTime) );
;1931:				G_LogPrintf( "Warmup:\n" );
;1932:			}
;1933:			return;
;1934:		}
;1935:
;1936:		if ( level.warmupTime == 0 ) {
;1937:			return;
;1938:		}
;1939:
;1940:		// if the warmup is changed at the console, restart it
;1941:		if ( g_warmup.modificationCount != level.warmupModificationCount ) {
;1942:			level.warmupModificationCount = g_warmup.modificationCount;
;1943:			level.warmupTime = -1;
;1944:		}
;1945:
;1946:		// if all players have arrived, start the countdown
;1947:		if ( level.warmupTime < 0 ) {
;1948:			if ( level.numPlayingClients == 2 ) {
;1949:				// fudge by -1 to account for extra delays
;1950:				level.warmupTime = level.time + ( g_warmup.integer - 1 ) * 1000;
;1951:
;1952:				if (level.warmupTime < (level.time + 3000))
;1953:				{ //rww - this is an unpleasent hack to keep the level from resetting completely on the client (this happens when two map_restarts are issued rapidly)
;1954:					level.warmupTime = level.time + 3000;
;1955:				}
;1956:				trap_SetConfigstring( CS_WARMUP, va("%i", level.warmupTime) );
;1957:			}
;1958:			return;
;1959:		}
;1960:
;1961:		// if the warmup time has counted down, restart
;1962:		if ( level.time > level.warmupTime ) {
;1963:			level.warmupTime += 10000;
;1964:			trap_Cvar_Set( "g_restarted", "1" );
;1965:			trap_SendConsoleCommand( EXEC_APPEND, "map_restart 0\n" );
;1966:			level.restarted = qtrue;
;1967:			return;
;1968:		}
;1969:#endif
;1970:	} else if ( level.warmupTime != 0 ) {
ADDRGP4 level+16
INDIRI4
CNSTI4 0
EQI4 $1101
line 1972
;1971:		int		counts[TEAM_NUM_TEAMS];
;1972:		qboolean	notEnough = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1974
;1973:
;1974:		if ( g_gametype.integer > GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LEI4 $1104
line 1975
;1975:			counts[TEAM_BLUE] = TeamCount( -1, TEAM_BLUE );
CNSTI4 -1
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 20
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 4+8
ADDRLP4 20
INDIRI4
ASGNI4
line 1976
;1976:			counts[TEAM_RED] = TeamCount( -1, TEAM_RED );
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 24
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 4+4
ADDRLP4 24
INDIRI4
ASGNI4
line 1978
;1977:
;1978:			if (counts[TEAM_RED] < 1 || counts[TEAM_BLUE] < 1) {
ADDRLP4 28
CNSTI4 1
ASGNI4
ADDRLP4 4+4
INDIRI4
ADDRLP4 28
INDIRI4
LTI4 $1113
ADDRLP4 4+8
INDIRI4
ADDRLP4 28
INDIRI4
GEI4 $1105
LABELV $1113
line 1979
;1979:				notEnough = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1980
;1980:			}
line 1981
;1981:		} else if ( level.numPlayingClients < 2 ) {
ADDRGP4 $1105
JUMPV
LABELV $1104
ADDRGP4 level+80
INDIRI4
CNSTI4 2
GEI4 $1114
line 1982
;1982:			notEnough = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1983
;1983:		}
LABELV $1114
LABELV $1105
line 1985
;1984:
;1985:		if ( notEnough ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1117
line 1986
;1986:			if ( level.warmupTime != -1 ) {
ADDRGP4 level+16
INDIRI4
CNSTI4 -1
EQI4 $1056
line 1987
;1987:				level.warmupTime = -1;
ADDRGP4 level+16
CNSTI4 -1
ASGNI4
line 1988
;1988:				trap_SetConfigstring( CS_WARMUP, va("%i", level.warmupTime) );
ADDRGP4 $442
ARGP4
ADDRGP4 level+16
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 5
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1989
;1989:				G_LogPrintf( "Warmup:\n" );
ADDRGP4 $1124
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1990
;1990:			}
line 1991
;1991:			return; // still waiting for team members
ADDRGP4 $1056
JUMPV
LABELV $1117
line 1994
;1992:		}
;1993:
;1994:		if ( level.warmupTime == 0 ) {
ADDRGP4 level+16
INDIRI4
CNSTI4 0
NEI4 $1125
line 1995
;1995:			return;
ADDRGP4 $1056
JUMPV
LABELV $1125
line 1999
;1996:		}
;1997:
;1998:		// if the warmup is changed at the console, restart it
;1999:		if ( g_warmup.modificationCount != level.warmupModificationCount ) {
ADDRGP4 g_warmup+4
INDIRI4
ADDRGP4 level+224
INDIRI4
EQI4 $1128
line 2000
;2000:			level.warmupModificationCount = g_warmup.modificationCount;
ADDRGP4 level+224
ADDRGP4 g_warmup+4
INDIRI4
ASGNI4
line 2001
;2001:			level.warmupTime = -1;
ADDRGP4 level+16
CNSTI4 -1
ASGNI4
line 2002
;2002:		}
LABELV $1128
line 2005
;2003:
;2004:		// if all players have arrived, start the countdown
;2005:		if ( level.warmupTime < 0 ) {
ADDRGP4 level+16
INDIRI4
CNSTI4 0
GEI4 $1135
line 2007
;2006:			// fudge by -1 to account for extra delays
;2007:			level.warmupTime = level.time + ( g_warmup.integer - 1 ) * 1000;
ADDRLP4 20
CNSTI4 1000
ASGNI4
ADDRGP4 level+16
ADDRGP4 level+32
INDIRI4
ADDRLP4 20
INDIRI4
ADDRGP4 g_warmup+12
INDIRI4
MULI4
ADDRLP4 20
INDIRI4
SUBI4
ADDI4
ASGNI4
line 2008
;2008:			trap_SetConfigstring( CS_WARMUP, va("%i", level.warmupTime) );
ADDRGP4 $442
ARGP4
ADDRGP4 level+16
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 5
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 2009
;2009:			return;
ADDRGP4 $1056
JUMPV
LABELV $1135
line 2013
;2010:		}
;2011:
;2012:		// if the warmup time has counted down, restart
;2013:		if ( level.time > level.warmupTime ) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+16
INDIRI4
LEI4 $1142
line 2014
;2014:			level.warmupTime += 10000;
ADDRLP4 20
ADDRGP4 level+16
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 2015
;2015:			trap_Cvar_Set( "g_restarted", "1" );
ADDRGP4 $89
ARGP4
ADDRGP4 $82
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2016
;2016:			trap_SendConsoleCommand( EXEC_APPEND, "map_restart 0\n" );
CNSTI4 2
ARGI4
ADDRGP4 $689
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 2017
;2017:			level.restarted = qtrue;
ADDRGP4 level+68
CNSTI4 1
ASGNI4
line 2018
;2018:			return;
LABELV $1142
line 2020
;2019:		}
;2020:	}
LABELV $1101
line 2021
;2021:}
LABELV $1056
endproc CheckTournament 32 32
export CheckVote
proc CheckVote 36 8
line 2029
;2022:
;2023:
;2024:/*
;2025:==================
;2026:CheckVote
;2027:==================
;2028:*/
;2029:void CheckVote( void ) {
line 2030
;2030:	if ( level.voteExecuteTime && level.voteExecuteTime < level.time ) {
ADDRGP4 level+2280
INDIRI4
CNSTI4 0
EQI4 $1149
ADDRGP4 level+2280
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $1149
line 2031
;2031:		level.voteExecuteTime = 0;
ADDRGP4 level+2280
CNSTI4 0
ASGNI4
line 2032
;2032:		trap_SendConsoleCommand( EXEC_APPEND, va("%s\n", level.voteString ) );
ADDRGP4 $1155
ARGP4
ADDRGP4 level+228
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 2034
;2033:
;2034:		if (level.votingGametype)
ADDRGP4 level+2296
INDIRI4
CNSTI4 0
EQI4 $1157
line 2035
;2035:		{
line 2036
;2036:			if (trap_Cvar_VariableIntegerValue("g_gametype") != level.votingGametypeTo)
ADDRGP4 $91
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 level+2300
INDIRI4
EQI4 $1160
line 2037
;2037:			{ //If we're voting to a different game type, be sure to refresh all the map stuff
line 2038
;2038:				const char *nextMap = G_RefreshNextMap(level.votingGametypeTo, qtrue);
ADDRGP4 level+2300
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 12
ADDRGP4 G_RefreshNextMap
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 2040
;2039:
;2040:				if (nextMap && nextMap[0])
ADDRLP4 16
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1161
ADDRLP4 16
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1161
line 2041
;2041:				{
line 2042
;2042:					trap_SendConsoleCommand( EXEC_APPEND, va("map %s\n", nextMap ) );
ADDRGP4 $1166
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 2043
;2043:				}
line 2045
;2044:
;2045:			}
ADDRGP4 $1161
JUMPV
LABELV $1160
line 2047
;2046:			else
;2047:			{ //otherwise, just leave the map until a restart
line 2048
;2048:				G_RefreshNextMap(level.votingGametypeTo, qfalse);
ADDRGP4 level+2300
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_RefreshNextMap
CALLP4
pop
line 2049
;2049:			}
LABELV $1161
line 2051
;2050:
;2051:			if (g_fraglimitVoteCorrection.integer)
ADDRGP4 g_fraglimitVoteCorrection+12
INDIRI4
CNSTI4 0
EQI4 $1168
line 2052
;2052:			{ //This means to auto-correct fraglimit when voting to and from duel.
line 2053
;2053:				int currentGT = trap_Cvar_VariableIntegerValue("g_gametype");
ADDRGP4 $91
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 2054
;2054:				int currentFL = trap_Cvar_VariableIntegerValue("fraglimit");
ADDRGP4 $124
ARGP4
ADDRLP4 20
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 20
INDIRI4
ASGNI4
line 2056
;2055:
;2056:				if (level.votingGametypeTo == GT_TOURNAMENT && currentGT != GT_TOURNAMENT)
ADDRLP4 24
CNSTI4 3
ASGNI4
ADDRGP4 level+2300
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $1171
ADDRLP4 8
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $1171
line 2057
;2057:				{
line 2058
;2058:					if (currentFL > 3 || !currentFL)
ADDRLP4 28
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 3
GTI4 $1176
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $1172
LABELV $1176
line 2059
;2059:					{ //if voting to duel, and fraglimit is more than 3 (or unlimited), then set it down to 3
line 2060
;2060:						trap_SendConsoleCommand(EXEC_APPEND, "fraglimit 3\n");
CNSTI4 2
ARGI4
ADDRGP4 $1177
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 2061
;2061:					}
line 2062
;2062:				}
ADDRGP4 $1172
JUMPV
LABELV $1171
line 2063
;2063:				else if (level.votingGametypeTo != GT_TOURNAMENT && currentGT == GT_TOURNAMENT)
ADDRLP4 28
CNSTI4 3
ASGNI4
ADDRGP4 level+2300
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $1178
ADDRLP4 8
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $1178
line 2064
;2064:				{
line 2065
;2065:					if (currentFL && currentFL < 20)
ADDRLP4 32
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $1181
ADDRLP4 32
INDIRI4
CNSTI4 20
GEI4 $1181
line 2066
;2066:					{ //if voting from duel, an fraglimit is less than 20, then set it up to 20
line 2067
;2067:						trap_SendConsoleCommand(EXEC_APPEND, "fraglimit 20\n");
CNSTI4 2
ARGI4
ADDRGP4 $1183
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 2068
;2068:					}
LABELV $1181
line 2069
;2069:				}
LABELV $1178
LABELV $1172
line 2070
;2070:			}
LABELV $1168
line 2072
;2071:
;2072:			level.votingGametype = qfalse;
ADDRGP4 level+2296
CNSTI4 0
ASGNI4
line 2073
;2073:			level.votingGametypeTo = 0;
ADDRGP4 level+2300
CNSTI4 0
ASGNI4
line 2074
;2074:		}
LABELV $1157
line 2075
;2075:	}
LABELV $1149
line 2076
;2076:	if ( !level.voteTime ) {
ADDRGP4 level+2276
INDIRI4
CNSTI4 0
NEI4 $1186
line 2077
;2077:		return;
ADDRGP4 $1148
JUMPV
LABELV $1186
line 2079
;2078:	}
;2079:	if ( level.time - level.voteTime >= VOTE_TIME ) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+2276
INDIRI4
SUBI4
CNSTI4 30000
LTI4 $1189
line 2080
;2080:		trap_SendServerCommand( -1, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "VOTEFAILED")) );
ADDRGP4 $995
ARGP4
ADDRGP4 $1194
ARGP4
ADDRLP4 0
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $1193
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2081
;2081:	} else {
ADDRGP4 $1190
JUMPV
LABELV $1189
line 2082
;2082:		if ( level.voteYes > level.numVotingClients/2 ) {
ADDRGP4 level+2284
INDIRI4
ADDRGP4 level+2292
INDIRI4
CNSTI4 2
DIVI4
LEI4 $1195
line 2084
;2083:			// execute the command, then remove the vote
;2084:			trap_SendServerCommand( -1, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "VOTEPASSED")) );
ADDRGP4 $995
ARGP4
ADDRGP4 $1199
ARGP4
ADDRLP4 0
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $1193
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2085
;2085:			level.voteExecuteTime = level.time + 3000;
ADDRGP4 level+2280
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 2086
;2086:		} else if ( level.voteNo >= level.numVotingClients/2 ) {
ADDRGP4 $1196
JUMPV
LABELV $1195
ADDRGP4 level+2288
INDIRI4
ADDRGP4 level+2292
INDIRI4
CNSTI4 2
DIVI4
LTI4 $1148
line 2088
;2087:			// same behavior as a timeout
;2088:			trap_SendServerCommand( -1, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "VOTEFAILED")) );
ADDRGP4 $995
ARGP4
ADDRGP4 $1194
ARGP4
ADDRLP4 0
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $1193
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2089
;2089:		} else {
line 2091
;2090:			// still waiting for a majority
;2091:			return;
LABELV $1203
LABELV $1196
line 2093
;2092:		}
;2093:	}
LABELV $1190
line 2094
;2094:	level.voteTime = 0;
ADDRGP4 level+2276
CNSTI4 0
ASGNI4
line 2095
;2095:	trap_SetConfigstring( CS_VOTE_TIME, "" );
CNSTI4 8
ARGI4
ADDRGP4 $84
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 2097
;2096:
;2097:}
LABELV $1148
endproc CheckVote 36 8
export PrintTeam
proc PrintTeam 4 8
line 2104
;2098:
;2099:/*
;2100:==================
;2101:PrintTeam
;2102:==================
;2103:*/
;2104:void PrintTeam(int team, char *message) {
line 2107
;2105:	int i;
;2106:
;2107:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1211
JUMPV
LABELV $1208
line 2108
;2108:		if (level.clients[i].sess.sessionTeam != team)
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
EQI4 $1213
line 2109
;2109:			continue;
ADDRGP4 $1209
JUMPV
LABELV $1213
line 2110
;2110:		trap_SendServerCommand( i, message );
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2111
;2111:	}
LABELV $1209
line 2107
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1211
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1208
line 2112
;2112:}
LABELV $1207
endproc PrintTeam 4 8
export SetLeader
proc SetLeader 12 12
line 2119
;2113:
;2114:/*
;2115:==================
;2116:SetLeader
;2117:==================
;2118:*/
;2119:void SetLeader(int team, int client) {
line 2122
;2120:	int i;
;2121:
;2122:	if ( level.clients[client].pers.connected == CON_DISCONNECTED ) {
CNSTI4 1812
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1216
line 2123
;2123:		PrintTeam(team, va("print \"%s is not connected\n\"", level.clients[client].pers.netname) );
ADDRGP4 $1218
ARGP4
CNSTI4 1812
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 PrintTeam
CALLV
pop
line 2124
;2124:		return;
ADDRGP4 $1215
JUMPV
LABELV $1216
line 2126
;2125:	}
;2126:	if (level.clients[client].sess.sessionTeam != team) {
CNSTI4 1812
ADDRFP4 4
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
EQI4 $1219
line 2127
;2127:		PrintTeam(team, va("print \"%s is not on the team anymore\n\"", level.clients[client].pers.netname) );
ADDRGP4 $1221
ARGP4
CNSTI4 1812
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 PrintTeam
CALLV
pop
line 2128
;2128:		return;
ADDRGP4 $1215
JUMPV
LABELV $1219
line 2130
;2129:	}
;2130:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1225
JUMPV
LABELV $1222
line 2131
;2131:		if (level.clients[i].sess.sessionTeam != team)
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
EQI4 $1227
line 2132
;2132:			continue;
ADDRGP4 $1223
JUMPV
LABELV $1227
line 2133
;2133:		if (level.clients[i].sess.teamLeader) {
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
EQI4 $1229
line 2134
;2134:			level.clients[i].sess.teamLeader = qfalse;
CNSTI4 1812
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1576
ADDP4
CNSTI4 0
ASGNI4
line 2135
;2135:			ClientUserinfoChanged(i);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 2136
;2136:		}
LABELV $1229
line 2137
;2137:	}
LABELV $1223
line 2130
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1225
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1222
line 2138
;2138:	level.clients[client].sess.teamLeader = qtrue;
CNSTI4 1812
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1576
ADDP4
CNSTI4 1
ASGNI4
line 2139
;2139:	ClientUserinfoChanged( client );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 2140
;2140:	PrintTeam(team, va("print \"%s %s\n\"", level.clients[client].pers.netname, G_GetStripEdString("SVINGAME", "NEWTEAMLEADER")) );
ADDRGP4 $995
ARGP4
ADDRGP4 $1232
ARGP4
ADDRLP4 4
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $1231
ARGP4
CNSTI4 1812
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 PrintTeam
CALLV
pop
line 2141
;2141:}
LABELV $1215
endproc SetLeader 12 12
export CheckTeamLeader
proc CheckTeamLeader 4 0
line 2148
;2142:
;2143:/*
;2144:==================
;2145:CheckTeamLeader
;2146:==================
;2147:*/
;2148:void CheckTeamLeader( int team ) {
line 2151
;2149:	int i;
;2150:
;2151:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1237
JUMPV
LABELV $1234
line 2152
;2152:		if (level.clients[i].sess.sessionTeam != team)
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
EQI4 $1239
line 2153
;2153:			continue;
ADDRGP4 $1235
JUMPV
LABELV $1239
line 2154
;2154:		if (level.clients[i].sess.teamLeader)
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
EQI4 $1241
line 2155
;2155:			break;
ADDRGP4 $1236
JUMPV
LABELV $1241
line 2156
;2156:	}
LABELV $1235
line 2151
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1237
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1234
LABELV $1236
line 2157
;2157:	if (i >= level.maxclients) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1243
line 2158
;2158:		for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1249
JUMPV
LABELV $1246
line 2159
;2159:			if (level.clients[i].sess.sessionTeam != team)
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
EQI4 $1251
line 2160
;2160:				continue;
ADDRGP4 $1247
JUMPV
LABELV $1251
line 2161
;2161:			if (!(g_entities[i].r.svFlags & SVF_BOT)) {
CNSTI4 832
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+296+8
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $1253
line 2162
;2162:				level.clients[i].sess.teamLeader = qtrue;
CNSTI4 1812
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1576
ADDP4
CNSTI4 1
ASGNI4
line 2163
;2163:				break;
ADDRGP4 $1248
JUMPV
LABELV $1253
line 2165
;2164:			}
;2165:		}
LABELV $1247
line 2158
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1249
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1246
LABELV $1248
line 2166
;2166:		for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1260
JUMPV
LABELV $1257
line 2167
;2167:			if (level.clients[i].sess.sessionTeam != team)
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
EQI4 $1262
line 2168
;2168:				continue;
ADDRGP4 $1258
JUMPV
LABELV $1262
line 2169
;2169:			level.clients[i].sess.teamLeader = qtrue;
CNSTI4 1812
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1576
ADDP4
CNSTI4 1
ASGNI4
line 2170
;2170:			break;
ADDRGP4 $1259
JUMPV
LABELV $1258
line 2166
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1260
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1257
LABELV $1259
line 2172
;2171:		}
;2172:	}
LABELV $1243
line 2173
;2173:}
LABELV $1233
endproc CheckTeamLeader 4 0
export CheckTeamVote
proc CheckTeamVote 28 12
line 2180
;2174:
;2175:/*
;2176:==================
;2177:CheckTeamVote
;2178:==================
;2179:*/
;2180:void CheckTeamVote( int team ) {
line 2183
;2181:	int cs_offset;
;2182:
;2183:	if ( team == TEAM_RED )
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $1265
line 2184
;2184:		cs_offset = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1266
JUMPV
LABELV $1265
line 2185
;2185:	else if ( team == TEAM_BLUE )
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $1264
line 2186
;2186:		cs_offset = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 2188
;2187:	else
;2188:		return;
LABELV $1268
LABELV $1266
line 2190
;2189:
;2190:	if ( !level.teamVoteTime[cs_offset] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4352
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1269
line 2191
;2191:		return;
ADDRGP4 $1264
JUMPV
LABELV $1269
line 2193
;2192:	}
;2193:	if ( level.time - level.teamVoteTime[cs_offset] >= VOTE_TIME ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4352
ADDP4
INDIRI4
SUBI4
CNSTI4 30000
LTI4 $1272
line 2194
;2194:		trap_SendServerCommand( -1, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "TEAMVOTEFAILED")) );
ADDRGP4 $995
ARGP4
ADDRGP4 $1276
ARGP4
ADDRLP4 4
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $1193
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2195
;2195:	} else {
ADDRGP4 $1273
JUMPV
LABELV $1272
line 2196
;2196:		if ( level.teamVoteYes[cs_offset] > level.numteamVotingClients[cs_offset]/2 ) {
ADDRLP4 4
CNSTI4 2
ASGNI4
ADDRLP4 8
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LSHI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 level+4360
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDRGP4 level+4376
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
DIVI4
LEI4 $1277
line 2198
;2197:			// execute the command, then remove the vote
;2198:			trap_SendServerCommand( -1, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "TEAMVOTEPASSED")) );
ADDRGP4 $995
ARGP4
ADDRGP4 $1281
ARGP4
ADDRLP4 12
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $1193
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2200
;2199:			//
;2200:			if ( !Q_strncmp( "leader", level.teamVoteString[cs_offset], 6) ) {
ADDRGP4 $1284
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+2304
ADDP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 20
ADDRGP4 Q_strncmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $1282
line 2202
;2201:				//set the team leader
;2202:				SetLeader(team, atoi(level.teamVoteString[cs_offset] + 7));
ADDRLP4 0
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+2304+7
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 SetLeader
CALLV
pop
line 2203
;2203:			}
ADDRGP4 $1278
JUMPV
LABELV $1282
line 2204
;2204:			else {
line 2205
;2205:				trap_SendConsoleCommand( EXEC_APPEND, va("%s\n", level.teamVoteString[cs_offset] ) );
ADDRGP4 $1155
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+2304
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 2206
;2206:			}
line 2207
;2207:		} else if ( level.teamVoteNo[cs_offset] >= level.numteamVotingClients[cs_offset]/2 ) {
ADDRGP4 $1278
JUMPV
LABELV $1277
ADDRLP4 12
CNSTI4 2
ASGNI4
ADDRLP4 16
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
LSHI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 level+4368
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
ADDRGP4 level+4376
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
DIVI4
LTI4 $1264
line 2209
;2208:			// same behavior as a timeout
;2209:			trap_SendServerCommand( -1, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "TEAMVOTEFAILED")) );
ADDRGP4 $995
ARGP4
ADDRGP4 $1276
ARGP4
ADDRLP4 20
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $1193
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2210
;2210:		} else {
line 2212
;2211:			// still waiting for a majority
;2212:			return;
LABELV $1290
LABELV $1278
line 2214
;2213:		}
;2214:	}
LABELV $1273
line 2215
;2215:	level.teamVoteTime[cs_offset] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4352
ADDP4
CNSTI4 0
ASGNI4
line 2216
;2216:	trap_SetConfigstring( CS_TEAMVOTE_TIME + cs_offset, "" );
ADDRLP4 0
INDIRI4
CNSTI4 12
ADDI4
ARGI4
ADDRGP4 $84
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 2218
;2217:
;2218:}
LABELV $1264
endproc CheckTeamVote 28 12
data
align 4
LABELV $1295
byte 4 -1
export CheckCvars
code
proc CheckCvars 4 8
line 2226
;2219:
;2220:
;2221:/*
;2222:==================
;2223:CheckCvars
;2224:==================
;2225:*/
;2226:void CheckCvars( void ) {
line 2229
;2227:	static int lastMod = -1;
;2228:
;2229:	if ( g_password.modificationCount != lastMod ) {
ADDRGP4 g_password+4
INDIRI4
ADDRGP4 $1295
INDIRI4
EQI4 $1296
line 2230
;2230:		lastMod = g_password.modificationCount;
ADDRGP4 $1295
ADDRGP4 g_password+4
INDIRI4
ASGNI4
line 2231
;2231:		if ( *g_password.string && Q_stricmp( g_password.string, "none" ) ) {
ADDRGP4 g_password+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1300
ADDRGP4 g_password+16
ARGP4
ADDRGP4 $1304
ARGP4
ADDRLP4 0
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1300
line 2232
;2232:			trap_Cvar_Set( "g_needpass", "1" );
ADDRGP4 $148
ARGP4
ADDRGP4 $82
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2233
;2233:		} else {
ADDRGP4 $1301
JUMPV
LABELV $1300
line 2234
;2234:			trap_Cvar_Set( "g_needpass", "0" );
ADDRGP4 $148
ARGP4
ADDRGP4 $80
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2235
;2235:		}
LABELV $1301
line 2236
;2236:	}
LABELV $1296
line 2237
;2237:}
LABELV $1294
endproc CheckCvars 4 8
export G_RunThink
proc G_RunThink 8 4
line 2246
;2238:
;2239:/*
;2240:=============
;2241:G_RunThink
;2242:
;2243:Runs thinking code for this frame if necessary
;2244:=============
;2245:*/
;2246:void G_RunThink (gentity_t *ent) {
line 2249
;2247:	float	thinktime;
;2248:
;2249:	thinktime = ent->nextthink;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2250
;2250:	if (thinktime <= 0) {
ADDRLP4 0
INDIRF4
CNSTF4 0
GTF4 $1306
line 2251
;2251:		return;
ADDRGP4 $1305
JUMPV
LABELV $1306
line 2253
;2252:	}
;2253:	if (thinktime > level.time) {
ADDRLP4 0
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $1308
line 2254
;2254:		return;
ADDRGP4 $1305
JUMPV
LABELV $1308
line 2257
;2255:	}
;2256:	
;2257:	ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
CNSTI4 0
ASGNI4
line 2258
;2258:	if (!ent->think) {
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1311
line 2259
;2259:		G_Error ( "NULL ent->think");
ADDRGP4 $1313
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 2260
;2260:	}
LABELV $1311
line 2261
;2261:	ent->think (ent);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 636
ADDP4
INDIRP4
CALLV
pop
line 2262
;2262:}
LABELV $1305
endproc G_RunThink 8 4
data
export g_LastFrameTime
align 4
LABELV g_LastFrameTime
byte 4 0
export g_TimeSinceLastFrame
align 4
LABELV g_TimeSinceLastFrame
byte 4 0
export gDoSlowMoDuel
align 4
LABELV gDoSlowMoDuel
byte 4 0
export gSlowMoDuelTime
align 4
LABELV gSlowMoDuelTime
byte 4 0
export G_RunFrame
code
proc G_RunFrame 164 12
line 2278
;2263:
;2264:int g_LastFrameTime = 0;
;2265:int g_TimeSinceLastFrame = 0;
;2266:
;2267:qboolean gDoSlowMoDuel = qfalse;
;2268:int gSlowMoDuelTime = 0;
;2269:
;2270:/*
;2271:================
;2272:G_RunFrame
;2273:
;2274:Advances the non-player objects in the world
;2275:================
;2276:*/
;2277:
;2278:void G_RunFrame( int levelTime ) {
line 2284
;2279:	int			i;
;2280:	gentity_t	*ent;
;2281:	int			msec;
;2282:	int start, end;
;2283:
;2284:	if (gDoSlowMoDuel)
ADDRGP4 gDoSlowMoDuel
INDIRI4
CNSTI4 0
EQI4 $1315
line 2285
;2285:	{
line 2286
;2286:		if (level.restarted)
ADDRGP4 level+68
INDIRI4
CNSTI4 0
EQI4 $1317
line 2287
;2287:		{
line 2289
;2288:			char buf[128];
;2289:			float tFVal = 0;
ADDRLP4 20
CNSTF4 0
ASGNF4
line 2291
;2290:
;2291:			trap_Cvar_VariableStringBuffer("timescale", buf, sizeof(buf));
ADDRGP4 $1320
ARGP4
ADDRLP4 24
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2293
;2292:
;2293:			tFVal = atof(buf);
ADDRLP4 24
ARGP4
ADDRLP4 152
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 152
INDIRF4
ASGNF4
line 2295
;2294:
;2295:			trap_Cvar_Set("timescale", "1");
ADDRGP4 $1320
ARGP4
ADDRGP4 $82
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2296
;2296:			if (tFVal == 1.0f)
ADDRLP4 20
INDIRF4
CNSTF4 1065353216
NEF4 $1318
line 2297
;2297:			{
line 2298
;2298:				gDoSlowMoDuel = qfalse;
ADDRGP4 gDoSlowMoDuel
CNSTI4 0
ASGNI4
line 2299
;2299:			}
line 2300
;2300:		}
ADDRGP4 $1318
JUMPV
LABELV $1317
line 2302
;2301:		else
;2302:		{
line 2303
;2303:			float timeDif = (level.time - gSlowMoDuelTime); //difference in time between when the slow motion was initiated and now
ADDRLP4 20
ADDRGP4 level+32
INDIRI4
ADDRGP4 gSlowMoDuelTime
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 2304
;2304:			float useDif = 0; //the difference to use when actually setting the timescale
ADDRLP4 24
CNSTF4 0
ASGNF4
line 2306
;2305:
;2306:			if (timeDif < 150)
ADDRLP4 20
INDIRF4
CNSTF4 1125515264
GEF4 $1324
line 2307
;2307:			{
line 2308
;2308:				trap_Cvar_Set("timescale", "0.1f");
ADDRGP4 $1320
ARGP4
ADDRGP4 $1326
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2309
;2309:			}
ADDRGP4 $1325
JUMPV
LABELV $1324
line 2310
;2310:			else if (timeDif < 1150)
ADDRLP4 20
INDIRF4
CNSTF4 1150271488
GEF4 $1327
line 2311
;2311:			{
line 2312
;2312:				useDif = (timeDif/1000); //scale from 0.1 up to 1
ADDRLP4 24
ADDRLP4 20
INDIRF4
CNSTF4 1148846080
DIVF4
ASGNF4
line 2313
;2313:				if (useDif < 0.1)
ADDRLP4 24
INDIRF4
CNSTF4 1036831949
GEF4 $1329
line 2314
;2314:				{
line 2315
;2315:					useDif = 0.1;
ADDRLP4 24
CNSTF4 1036831949
ASGNF4
line 2316
;2316:				}
LABELV $1329
line 2317
;2317:				if (useDif > 1.0)
ADDRLP4 24
INDIRF4
CNSTF4 1065353216
LEF4 $1331
line 2318
;2318:				{
line 2319
;2319:					useDif = 1.0;
ADDRLP4 24
CNSTF4 1065353216
ASGNF4
line 2320
;2320:				}
LABELV $1331
line 2321
;2321:				trap_Cvar_Set("timescale", va("%f", useDif));
ADDRGP4 $1333
ARGP4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1320
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2322
;2322:			}
ADDRGP4 $1328
JUMPV
LABELV $1327
line 2324
;2323:			else
;2324:			{
line 2326
;2325:				char buf[128];
;2326:				float tFVal = 0;
ADDRLP4 28
CNSTF4 0
ASGNF4
line 2328
;2327:
;2328:				trap_Cvar_VariableStringBuffer("timescale", buf, sizeof(buf));
ADDRGP4 $1320
ARGP4
ADDRLP4 32
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2330
;2329:
;2330:				tFVal = atof(buf);
ADDRLP4 32
ARGP4
ADDRLP4 160
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 160
INDIRF4
ASGNF4
line 2332
;2331:
;2332:				trap_Cvar_Set("timescale", "1");
ADDRGP4 $1320
ARGP4
ADDRGP4 $82
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2333
;2333:				if (timeDif > 1500 && tFVal == 1.0f)
ADDRLP4 20
INDIRF4
CNSTF4 1153138688
LEF4 $1334
ADDRLP4 28
INDIRF4
CNSTF4 1065353216
NEF4 $1334
line 2334
;2334:				{
line 2335
;2335:					gDoSlowMoDuel = qfalse;
ADDRGP4 gDoSlowMoDuel
CNSTI4 0
ASGNI4
line 2336
;2336:				}
LABELV $1334
line 2337
;2337:			}
LABELV $1328
LABELV $1325
line 2338
;2338:		}
LABELV $1318
line 2339
;2339:	}
LABELV $1315
line 2342
;2340:
;2341:	// if we are waiting for the level to restart, do nothing
;2342:	if ( level.restarted ) {
ADDRGP4 level+68
INDIRI4
CNSTI4 0
EQI4 $1336
line 2343
;2343:		return;
ADDRGP4 $1314
JUMPV
LABELV $1336
line 2346
;2344:	}
;2345:
;2346:	level.framenum++;
ADDRLP4 20
ADDRGP4 level+28
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2347
;2347:	level.previousTime = level.time;
ADDRGP4 level+36
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2348
;2348:	level.time = levelTime;
ADDRGP4 level+32
ADDRFP4 0
INDIRI4
ASGNI4
line 2349
;2349:	msec = level.time - level.previousTime;
ADDRLP4 16
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+36
INDIRI4
SUBI4
ASGNI4
line 2351
;2350:
;2351:	g_TimeSinceLastFrame = (level.time - g_LastFrameTime);
ADDRGP4 g_TimeSinceLastFrame
ADDRGP4 level+32
INDIRI4
ADDRGP4 g_LastFrameTime
INDIRI4
SUBI4
ASGNI4
line 2354
;2352:
;2353:	// get any cvar changes
;2354:	G_UpdateCvars();
ADDRGP4 G_UpdateCvars
CALLV
pop
line 2359
;2355:
;2356:	//
;2357:	// go through all allocated objects
;2358:	//
;2359:	start = trap_Milliseconds();
ADDRLP4 24
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 2360
;2360:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 2361
;2361:	for (i=0 ; i<level.num_entities ; i++, ent++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1349
JUMPV
LABELV $1346
line 2362
;2362:		if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1351
line 2363
;2363:			continue;
ADDRGP4 $1347
JUMPV
LABELV $1351
line 2367
;2364:		}
;2365:
;2366:		// clear events that are too old
;2367:		if ( level.time - ent->eventTime > EVENT_VALID_MSEC ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
SUBI4
CNSTI4 300
LEI4 $1353
line 2368
;2368:			if ( ent->s.event ) {
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1356
line 2369
;2369:				ent->s.event = 0;	// &= EV_EVENT_BITS;
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
CNSTI4 0
ASGNI4
line 2370
;2370:				if ( ent->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1358
line 2371
;2371:					ent->client->ps.externalEvent = 0;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 132
ADDP4
CNSTI4 0
ASGNI4
line 2375
;2372:					// predicted events should never be set to zero
;2373:					//ent->client->ps.events[0] = 0;
;2374:					//ent->client->ps.events[1] = 0;
;2375:				}
LABELV $1358
line 2376
;2376:			}
LABELV $1356
line 2377
;2377:			if ( ent->freeAfterEvent ) {
ADDRLP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1360
line 2379
;2378:				// tempEntities or dropped items completely go away after their event
;2379:				if (ent->s.eFlags & EF_SOUNDTRACKER)
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 8388608
BANDI4
CNSTI4 0
EQI4 $1362
line 2380
;2380:				{ //don't trigger the event again..
line 2381
;2381:					ent->s.event = 0;
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
CNSTI4 0
ASGNI4
line 2382
;2382:					ent->s.eventParm = 0;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 0
ASGNI4
line 2383
;2383:					ent->s.eType = 0;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 2384
;2384:					ent->eventTime = 0;
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
CNSTI4 0
ASGNI4
line 2385
;2385:				}
ADDRGP4 $1361
JUMPV
LABELV $1362
line 2387
;2386:				else
;2387:				{
line 2388
;2388:					G_FreeEntity( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 2389
;2389:					continue;
ADDRGP4 $1347
JUMPV
line 2391
;2390:				}
;2391:			} else if ( ent->unlinkAfterEvent ) {
LABELV $1360
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1364
line 2393
;2392:				// items that will respawn will hide themselves after their pickup event
;2393:				ent->unlinkAfterEvent = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTI4 0
ASGNI4
line 2394
;2394:				trap_UnlinkEntity( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 2395
;2395:			}
LABELV $1364
LABELV $1361
line 2396
;2396:		}
LABELV $1353
line 2399
;2397:
;2398:		// temporary entities don't think
;2399:		if ( ent->freeAfterEvent ) {
ADDRLP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1366
line 2400
;2400:			continue;
ADDRGP4 $1347
JUMPV
LABELV $1366
line 2403
;2401:		}
;2402:
;2403:		if ( !ent->r.linked && ent->neverFree ) {
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $1368
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $1368
line 2404
;2404:			continue;
ADDRGP4 $1347
JUMPV
LABELV $1368
line 2407
;2405:		}
;2406:
;2407:		if ( ent->s.eType == ET_MISSILE ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1370
line 2408
;2408:			G_RunMissile( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunMissile
CALLV
pop
line 2409
;2409:			continue;
ADDRGP4 $1347
JUMPV
LABELV $1370
line 2412
;2410:		}
;2411:
;2412:		if ( ent->s.eType == ET_ITEM || ent->physicsObject ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1374
ADDRLP4 0
INDIRP4
CNSTI4 500
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1372
LABELV $1374
line 2413
;2413:			G_RunItem( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunItem
CALLV
pop
line 2414
;2414:			continue;
ADDRGP4 $1347
JUMPV
LABELV $1372
line 2417
;2415:		}
;2416:
;2417:		if ( ent->s.eType == ET_MOVER ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 6
NEI4 $1375
line 2418
;2418:			G_RunMover( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunMover
CALLV
pop
line 2419
;2419:			continue;
ADDRGP4 $1347
JUMPV
LABELV $1375
line 2422
;2420:		}
;2421:
;2422:		if ( i < MAX_CLIENTS ) 
ADDRLP4 4
INDIRI4
CNSTI4 32
GEI4 $1377
line 2423
;2423:		{
line 2424
;2424:			G_CheckClientTimeouts ( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_CheckClientTimeouts
CALLV
pop
line 2426
;2425:			
;2426:			if((!level.intermissiontime)&&!(ent->client->ps.pm_flags&PMF_FOLLOW))
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRGP4 level+9008
INDIRI4
ADDRLP4 40
INDIRI4
NEI4 $1379
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 40
INDIRI4
NEI4 $1379
line 2427
;2427:			{
line 2428
;2428:				WP_ForcePowersUpdate(ent, &ent->client->pers.cmd );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
ARGP4
ADDRGP4 WP_ForcePowersUpdate
CALLV
pop
line 2429
;2429:				WP_SaberPositionUpdate(ent, &ent->client->pers.cmd);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
ARGP4
ADDRGP4 WP_SaberPositionUpdate
CALLV
pop
line 2430
;2430:			}
LABELV $1379
line 2431
;2431:			G_RunClient( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunClient
CALLV
pop
line 2432
;2432:			continue;
ADDRGP4 $1347
JUMPV
LABELV $1377
line 2435
;2433:		}
;2434:
;2435:		G_RunThink( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 2436
;2436:	}
LABELV $1347
line 2361
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 832
ADDP4
ASGNP4
LABELV $1349
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $1346
line 2437
;2437:end = trap_Milliseconds();
ADDRLP4 28
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 28
INDIRI4
ASGNI4
line 2439
;2438:
;2439:	trap_ROFF_UpdateEntities();
ADDRGP4 trap_ROFF_UpdateEntities
CALLV
pop
line 2441
;2440:
;2441:start = trap_Milliseconds();
ADDRLP4 32
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 32
INDIRI4
ASGNI4
line 2443
;2442:	// perform final fixups on the players
;2443:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 2444
;2444:	for (i=0 ; i < level.maxclients ; i++, ent++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1385
JUMPV
LABELV $1382
line 2445
;2445:		if ( ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1387
line 2446
;2446:			ClientEndFrame( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ClientEndFrame
CALLV
pop
line 2447
;2447:		}
LABELV $1387
line 2448
;2448:	}
LABELV $1383
line 2444
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 832
ADDP4
ASGNP4
LABELV $1385
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1382
line 2449
;2449:end = trap_Milliseconds();
ADDRLP4 36
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 36
INDIRI4
ASGNI4
line 2452
;2450:
;2451:	// see if it is time to do a tournement restart
;2452:	CheckTournament();
ADDRGP4 CheckTournament
CALLV
pop
line 2455
;2453:
;2454:	// see if it is time to end the level
;2455:	CheckExitRules();
ADDRGP4 CheckExitRules
CALLV
pop
line 2458
;2456:
;2457:	// update to team status?
;2458:	CheckTeamStatus();
ADDRGP4 CheckTeamStatus
CALLV
pop
line 2461
;2459:
;2460:	// cancel vote if timed out
;2461:	CheckVote();
ADDRGP4 CheckVote
CALLV
pop
line 2464
;2462:
;2463:	// check team votes
;2464:	CheckTeamVote( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 CheckTeamVote
CALLV
pop
line 2465
;2465:	CheckTeamVote( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 CheckTeamVote
CALLV
pop
line 2468
;2466:
;2467:	// for tracking changes
;2468:	CheckCvars();
ADDRGP4 CheckCvars
CALLV
pop
line 2470
;2469:
;2470:	if (g_listEntity.integer) {
ADDRGP4 g_listEntity+12
INDIRI4
CNSTI4 0
EQI4 $1389
line 2471
;2471:		for (i = 0; i < MAX_GENTITIES; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $1392
line 2472
;2472:			G_Printf("%4i: %s\n", i, g_entities[i].classname);
ADDRGP4 $1396
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 832
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities+416
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 2473
;2473:		}
LABELV $1393
line 2471
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1024
LTI4 $1392
line 2474
;2474:		trap_Cvar_Set("g_listEntity", "0");
ADDRGP4 $174
ARGP4
ADDRGP4 $80
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2475
;2475:	}
LABELV $1389
line 2478
;2476:
;2477:	//At the end of the frame, send out the ghoul2 kill queue, if there is one
;2478:	G_SendG2KillQueue();
ADDRGP4 G_SendG2KillQueue
CALLV
pop
line 2481
;2479:
;2480:
;2481:	if (gQueueScoreMessage)
ADDRGP4 gQueueScoreMessage
INDIRI4
CNSTI4 0
EQI4 $1398
line 2482
;2482:	{
line 2483
;2483:		if (gQueueScoreMessageTime < level.time)
ADDRGP4 gQueueScoreMessageTime
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $1400
line 2484
;2484:		{
line 2485
;2485:			SendScoreboardMessageToAllClients();
ADDRGP4 SendScoreboardMessageToAllClients
CALLV
pop
line 2487
;2486:
;2487:			gQueueScoreMessageTime = 0;
ADDRGP4 gQueueScoreMessageTime
CNSTI4 0
ASGNI4
line 2488
;2488:			gQueueScoreMessage = 0;
ADDRGP4 gQueueScoreMessage
CNSTI4 0
ASGNI4
line 2489
;2489:		}
LABELV $1400
line 2490
;2490:	}
LABELV $1398
line 2492
;2491:
;2492:	g_LastFrameTime = level.time;
ADDRGP4 g_LastFrameTime
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2493
;2493:}
LABELV $1314
endproc G_RunFrame 164 12
data
align 1
LABELV $1405
char 1 0
skip 1023
export G_GetStripEdString
code
proc G_GetStripEdString 0 16
line 2496
;2494:
;2495:const char *G_GetStripEdString(char *refSection, char *refName)
;2496:{
line 2509
;2497:	/*
;2498:	static char text[1024]={0};
;2499:	trap_SP_GetStringTextString(va("%s_%s", refSection, refName), text, sizeof(text));
;2500:	return text;
;2501:	*/
;2502:
;2503:	//Well, it would've been lovely doing it the above way, but it would mean mixing
;2504:	//languages for the client depending on what the server is. So we'll mark this as
;2505:	//a striped reference with @@@ and send the refname to the client, and when it goes
;2506:	//to print it will get scanned for the striped reference indication and dealt with
;2507:	//properly.
;2508:	static char text[1024]={0};
;2509:	Com_sprintf(text, sizeof(text), "@@@%s", refName);
ADDRGP4 $1405
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1406
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2510
;2510:	return text;
ADDRGP4 $1405
RETP4
LABELV $1404
endproc G_GetStripEdString 0 16
import G_ROFF_NotetrackCallback
bss
export g_listEntity
align 4
LABELV g_listEntity
skip 272
export g_podiumDrop
align 4
LABELV g_podiumDrop
skip 272
export g_podiumDist
align 4
LABELV g_podiumDist
skip 272
export g_statLogFile
align 4
LABELV g_statLogFile
skip 272
export g_statLog
align 4
LABELV g_statLog
skip 272
export g_logSync
align 4
LABELV g_logSync
skip 272
export g_log
align 4
LABELV g_log
skip 272
export g_MaxHolocronCarry
align 4
LABELV g_MaxHolocronCarry
skip 272
export g_clients
align 4
LABELV g_clients
skip 57984
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
export jd_Messages
align 4
LABELV jd_Messages
skip 272
export jd_CloseServer
align 4
LABELV jd_CloseServer
skip 272
export g_austrian
align 4
LABELV g_austrian
skip 272
export g_saberDebugPrint
align 4
LABELV g_saberDebugPrint
skip 272
export g_saberDmgDelay_Wound
align 4
LABELV g_saberDmgDelay_Wound
skip 272
export g_saberDmgDelay_Idle
align 4
LABELV g_saberDmgDelay_Idle
skip 272
export g_saberDmgVelocityScale
align 4
LABELV g_saberDmgVelocityScale
skip 272
export g_timeouttospec
align 4
LABELV g_timeouttospec
skip 272
export g_forceDodge
align 4
LABELV g_forceDodge
skip 272
export g_dismember
align 4
LABELV g_dismember
skip 272
export g_singlePlayer
align 4
LABELV g_singlePlayer
skip 272
export g_enableBreath
align 4
LABELV g_enableBreath
skip 272
export g_enableDust
align 4
LABELV g_enableDust
skip 272
export g_rankings
align 4
LABELV g_rankings
skip 272
export pmove_msec
align 4
LABELV pmove_msec
skip 272
export pmove_fixed
align 4
LABELV pmove_fixed
skip 272
export g_smoothClients
align 4
LABELV g_smoothClients
skip 272
export g_blueteam
align 4
LABELV g_blueteam
skip 272
export g_redteam
align 4
LABELV g_redteam
skip 272
export g_debugUp
align 4
LABELV g_debugUp
skip 272
export g_debugRight
align 4
LABELV g_debugRight
skip 272
export g_debugForward
align 4
LABELV g_debugForward
skip 272
export g_filterBan
align 4
LABELV g_filterBan
skip 272
export g_banIPs
align 4
LABELV g_banIPs
skip 272
export g_teamForceBalance
align 4
LABELV g_teamForceBalance
skip 272
export g_teamAutoJoin
align 4
LABELV g_teamAutoJoin
skip 272
export g_allowVote
align 4
LABELV g_allowVote
skip 272
export g_blood
align 4
LABELV g_blood
skip 272
export g_doWarmup
align 4
LABELV g_doWarmup
skip 272
export g_warmup
align 4
LABELV g_warmup
skip 272
export g_motd
align 4
LABELV g_motd
skip 272
export g_synchronousClients
align 4
LABELV g_synchronousClients
skip 272
export g_adaptRespawn
align 4
LABELV g_adaptRespawn
skip 272
export g_weaponTeamRespawn
align 4
LABELV g_weaponTeamRespawn
skip 272
export g_weaponRespawn
align 4
LABELV g_weaponRespawn
skip 272
export g_debugDamage
align 4
LABELV g_debugDamage
skip 272
export g_debugAlloc
align 4
LABELV g_debugAlloc
skip 272
export g_debugMove
align 4
LABELV g_debugMove
skip 272
export g_inactivity
align 4
LABELV g_inactivity
skip 272
export g_forcerespawn
align 4
LABELV g_forcerespawn
skip 272
export g_quadfactor
align 4
LABELV g_quadfactor
skip 272
export g_knockback
align 4
LABELV g_knockback
skip 272
export g_speed
align 4
LABELV g_speed
skip 272
export g_gravity
align 4
LABELV g_gravity
skip 272
export g_needpass
align 4
LABELV g_needpass
skip 272
export g_password
align 4
LABELV g_password
skip 272
export g_friendlySaber
align 4
LABELV g_friendlySaber
skip 272
export g_friendlyFire
align 4
LABELV g_friendlyFire
skip 272
export g_saberInterpolate
align 4
LABELV g_saberInterpolate
skip 272
export g_capturelimit
align 4
LABELV g_capturelimit
skip 272
export g_timelimit
align 4
LABELV g_timelimit
skip 272
export g_duel_fraglimit
align 4
LABELV g_duel_fraglimit
skip 272
export g_fraglimit
align 4
LABELV g_fraglimit
skip 272
export g_duelWeaponDisable
align 4
LABELV g_duelWeaponDisable
skip 272
export g_fraglimitVoteCorrection
align 4
LABELV g_fraglimitVoteCorrection
skip 272
export g_allowDuelSuicide
align 4
LABELV g_allowDuelSuicide
skip 272
export g_weaponDisable
align 4
LABELV g_weaponDisable
skip 272
export g_forcePowerDisable
align 4
LABELV g_forcePowerDisable
skip 272
export g_spawnInvulnerability
align 4
LABELV g_spawnInvulnerability
skip 272
export g_forceRegenTime
align 4
LABELV g_forceRegenTime
skip 272
export g_saberDamageScale
align 4
LABELV g_saberDamageScale
skip 272
export g_slowmoDuelEnd
align 4
LABELV g_slowmoDuelEnd
skip 272
export g_logClientInfo
align 4
LABELV g_logClientInfo
skip 272
export g_saberBoxTraceSize
align 4
LABELV g_saberBoxTraceSize
skip 272
export g_saberAlwaysBoxTrace
align 4
LABELV g_saberAlwaysBoxTrace
skip 272
export g_saberGhoul2Collision
align 4
LABELV g_saberGhoul2Collision
skip 272
export g_saberTraceSaberFirst
align 4
LABELV g_saberTraceSaberFirst
skip 272
export g_saberLockFactor
align 4
LABELV g_saberLockFactor
skip 272
export g_saberLocking
align 4
LABELV g_saberLocking
skip 272
export g_privateDuel
align 4
LABELV g_privateDuel
skip 272
export g_forceBasedTeams
align 4
LABELV g_forceBasedTeams
skip 272
export g_maxForceRank
align 4
LABELV g_maxForceRank
skip 272
export g_dmflags
align 4
LABELV g_dmflags
skip 272
export g_autoMapCycle
align 4
LABELV g_autoMapCycle
skip 272
export g_trueJedi
align 4
LABELV g_trueJedi
skip 272
export g_restarted
align 4
LABELV g_restarted
skip 272
export g_maxGameClients
align 4
LABELV g_maxGameClients
skip 272
export g_maxclients
align 4
LABELV g_maxclients
skip 272
export g_cheats
align 4
LABELV g_cheats
skip 272
export g_dedicated
align 4
LABELV g_dedicated
skip 272
export g_gametype
align 4
LABELV g_gametype
skip 272
export g_entities
align 4
LABELV g_entities
skip 851968
export level
align 4
LABELV level
skip 9096
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
export g_ff_objectives
align 4
LABELV g_ff_objectives
skip 272
import DeathmatchScoreboardMessage
import G_SetStats
import BlowDetpacks
import FireWeapon
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import gJMSaberEnt
import SpotWouldTelefrag
import AddScore
import player_die
import ClientSpawn
import InitBodyQue
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
LABELV $1406
char 1 64
char 1 64
char 1 64
char 1 37
char 1 115
char 1 0
align 1
LABELV $1396
char 1 37
char 1 52
char 1 105
char 1 58
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $1333
char 1 37
char 1 102
char 1 0
align 1
LABELV $1326
char 1 48
char 1 46
char 1 49
char 1 102
char 1 0
align 1
LABELV $1320
char 1 116
char 1 105
char 1 109
char 1 101
char 1 115
char 1 99
char 1 97
char 1 108
char 1 101
char 1 0
align 1
LABELV $1313
char 1 78
char 1 85
char 1 76
char 1 76
char 1 32
char 1 101
char 1 110
char 1 116
char 1 45
char 1 62
char 1 116
char 1 104
char 1 105
char 1 110
char 1 107
char 1 0
align 1
LABELV $1304
char 1 110
char 1 111
char 1 110
char 1 101
char 1 0
align 1
LABELV $1284
char 1 108
char 1 101
char 1 97
char 1 100
char 1 101
char 1 114
char 1 0
align 1
LABELV $1281
char 1 84
char 1 69
char 1 65
char 1 77
char 1 86
char 1 79
char 1 84
char 1 69
char 1 80
char 1 65
char 1 83
char 1 83
char 1 69
char 1 68
char 1 0
align 1
LABELV $1276
char 1 84
char 1 69
char 1 65
char 1 77
char 1 86
char 1 79
char 1 84
char 1 69
char 1 70
char 1 65
char 1 73
char 1 76
char 1 69
char 1 68
char 1 0
align 1
LABELV $1232
char 1 78
char 1 69
char 1 87
char 1 84
char 1 69
char 1 65
char 1 77
char 1 76
char 1 69
char 1 65
char 1 68
char 1 69
char 1 82
char 1 0
align 1
LABELV $1231
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
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $1221
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
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 97
char 1 110
char 1 121
char 1 109
char 1 111
char 1 114
char 1 101
char 1 10
char 1 34
char 1 0
align 1
LABELV $1218
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
char 1 34
char 1 0
align 1
LABELV $1199
char 1 86
char 1 79
char 1 84
char 1 69
char 1 80
char 1 65
char 1 83
char 1 83
char 1 69
char 1 68
char 1 0
align 1
LABELV $1194
char 1 86
char 1 79
char 1 84
char 1 69
char 1 70
char 1 65
char 1 73
char 1 76
char 1 69
char 1 68
char 1 0
align 1
LABELV $1193
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $1183
char 1 102
char 1 114
char 1 97
char 1 103
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 32
char 1 50
char 1 48
char 1 10
char 1 0
align 1
LABELV $1177
char 1 102
char 1 114
char 1 97
char 1 103
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 32
char 1 51
char 1 10
char 1 0
align 1
LABELV $1166
char 1 109
char 1 97
char 1 112
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $1155
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $1124
char 1 87
char 1 97
char 1 114
char 1 109
char 1 117
char 1 112
char 1 58
char 1 10
char 1 0
align 1
LABELV $1055
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 66
char 1 108
char 1 117
char 1 101
char 1 32
char 1 104
char 1 105
char 1 116
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 99
char 1 97
char 1 112
char 1 116
char 1 117
char 1 114
char 1 101
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $1049
char 1 67
char 1 97
char 1 112
char 1 116
char 1 117
char 1 114
char 1 101
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 32
char 1 104
char 1 105
char 1 116
char 1 46
char 1 0
align 1
LABELV $1048
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 82
char 1 101
char 1 100
char 1 32
char 1 104
char 1 105
char 1 116
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 99
char 1 97
char 1 112
char 1 116
char 1 117
char 1 114
char 1 101
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $1038
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
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $1034
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
char 1 104
char 1 105
char 1 116
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 119
char 1 105
char 1 110
char 1 32
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $1033
char 1 68
char 1 117
char 1 101
char 1 108
char 1 32
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 32
char 1 104
char 1 105
char 1 116
char 1 46
char 1 0
align 1
LABELV $1018
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 66
char 1 108
char 1 117
char 1 101
char 1 32
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $1012
char 1 75
char 1 105
char 1 108
char 1 108
char 1 32
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 32
char 1 104
char 1 105
char 1 116
char 1 46
char 1 0
align 1
LABELV $1011
char 1 72
char 1 73
char 1 84
char 1 95
char 1 84
char 1 72
char 1 69
char 1 95
char 1 75
char 1 73
char 1 76
char 1 76
char 1 95
char 1 76
char 1 73
char 1 77
char 1 73
char 1 84
char 1 0
align 1
LABELV $1010
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 82
char 1 101
char 1 100
char 1 32
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $997
char 1 84
char 1 105
char 1 109
char 1 101
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 32
char 1 104
char 1 105
char 1 116
char 1 46
char 1 0
align 1
LABELV $996
char 1 84
char 1 73
char 1 77
char 1 69
char 1 76
char 1 73
char 1 77
char 1 73
char 1 84
char 1 95
char 1 72
char 1 73
char 1 84
char 1 0
align 1
LABELV $995
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
LABELV $994
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 37
char 1 115
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $965
char 1 69
char 1 118
char 1 101
char 1 114
char 1 121
char 1 111
char 1 110
char 1 101
char 1 32
char 1 102
char 1 97
char 1 105
char 1 108
char 1 101
char 1 100
char 1 32
char 1 116
char 1 111
char 1 32
char 1 101
char 1 115
char 1 99
char 1 97
char 1 112
char 1 101
char 1 46
char 1 0
align 1
LABELV $962
char 1 69
char 1 115
char 1 99
char 1 97
char 1 112
char 1 101
char 1 32
char 1 116
char 1 105
char 1 109
char 1 101
char 1 32
char 1 101
char 1 110
char 1 100
char 1 101
char 1 100
char 1 46
char 1 0
align 1
LABELV $858
char 1 68
char 1 117
char 1 101
char 1 108
char 1 32
char 1 84
char 1 111
char 1 117
char 1 114
char 1 110
char 1 97
char 1 109
char 1 101
char 1 110
char 1 116
char 1 32
char 1 87
char 1 105
char 1 110
char 1 110
char 1 101
char 1 114
char 1 58
char 1 32
char 1 37
char 1 115
char 1 32
char 1 119
char 1 105
char 1 110
char 1 115
char 1 47
char 1 108
char 1 111
char 1 115
char 1 115
char 1 101
char 1 115
char 1 58
char 1 32
char 1 37
char 1 100
char 1 47
char 1 37
char 1 100
char 1 10
char 1 0
align 1
LABELV $848
char 1 37
char 1 105
char 1 124
char 1 37
char 1 105
char 1 0
align 1
LABELV $834
char 1 68
char 1 117
char 1 101
char 1 108
char 1 32
char 1 73
char 1 110
char 1 105
char 1 116
char 1 105
char 1 97
char 1 116
char 1 101
char 1 100
char 1 58
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 100
char 1 47
char 1 37
char 1 100
char 1 32
char 1 118
char 1 115
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 100
char 1 47
char 1 37
char 1 100
char 1 44
char 1 32
char 1 107
char 1 105
char 1 108
char 1 108
char 1 32
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 58
char 1 32
char 1 37
char 1 100
char 1 10
char 1 0
align 1
LABELV $812
char 1 108
char 1 111
char 1 115
char 1 101
char 1 114
char 1 58
char 1 32
char 1 37
char 1 115
char 1 44
char 1 32
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 58
char 1 32
char 1 37
char 1 100
char 1 44
char 1 32
char 1 119
char 1 105
char 1 110
char 1 115
char 1 47
char 1 108
char 1 111
char 1 115
char 1 115
char 1 101
char 1 115
char 1 58
char 1 32
char 1 37
char 1 100
char 1 47
char 1 37
char 1 100
char 1 10
char 1 0
align 1
LABELV $807
char 1 119
char 1 105
char 1 110
char 1 110
char 1 101
char 1 114
char 1 58
char 1 32
char 1 37
char 1 115
char 1 44
char 1 32
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 58
char 1 32
char 1 37
char 1 100
char 1 44
char 1 32
char 1 119
char 1 105
char 1 110
char 1 115
char 1 47
char 1 108
char 1 111
char 1 115
char 1 115
char 1 101
char 1 115
char 1 58
char 1 32
char 1 37
char 1 100
char 1 47
char 1 37
char 1 100
char 1 10
char 1 0
align 1
LABELV $806
char 1 68
char 1 117
char 1 101
char 1 108
char 1 32
char 1 82
char 1 101
char 1 115
char 1 117
char 1 108
char 1 116
char 1 115
char 1 58
char 1 10
char 1 0
align 1
LABELV $778
char 1 115
char 1 112
char 1 76
char 1 111
char 1 115
char 1 101
char 1 10
char 1 0
align 1
LABELV $777
char 1 115
char 1 112
char 1 87
char 1 105
char 1 110
char 1 10
char 1 0
align 1
LABELV $754
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 58
char 1 32
char 1 37
char 1 105
char 1 32
char 1 32
char 1 112
char 1 105
char 1 110
char 1 103
char 1 58
char 1 32
char 1 37
char 1 105
char 1 32
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
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
LABELV $737
char 1 114
char 1 101
char 1 100
char 1 58
char 1 37
char 1 105
char 1 32
char 1 32
char 1 98
char 1 108
char 1 117
char 1 101
char 1 58
char 1 37
char 1 105
char 1 10
char 1 0
align 1
LABELV $728
char 1 69
char 1 120
char 1 105
char 1 116
char 1 58
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $716
char 1 37
char 1 51
char 1 105
char 1 58
char 1 37
char 1 105
char 1 37
char 1 105
char 1 32
char 1 0
align 1
LABELV $693
char 1 118
char 1 115
char 1 116
char 1 114
char 1 32
char 1 110
char 1 101
char 1 120
char 1 116
char 1 109
char 1 97
char 1 112
char 1 10
char 1 0
align 1
LABELV $689
char 1 109
char 1 97
char 1 112
char 1 95
char 1 114
char 1 101
char 1 115
char 1 116
char 1 97
char 1 114
char 1 116
char 1 32
char 1 48
char 1 10
char 1 0
align 1
LABELV $618
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
char 1 105
char 1 110
char 1 116
char 1 101
char 1 114
char 1 109
char 1 105
char 1 115
char 1 115
char 1 105
char 1 111
char 1 110
char 1 0
align 1
LABELV $442
char 1 37
char 1 105
char 1 0
align 1
LABELV $389
char 1 115
char 1 0
align 1
LABELV $380
char 1 102
char 1 0
align 1
LABELV $355
char 1 37
char 1 115
char 1 0
align 1
LABELV $349
char 1 83
char 1 104
char 1 117
char 1 116
char 1 100
char 1 111
char 1 119
char 1 110
char 1 71
char 1 97
char 1 109
char 1 101
char 1 58
char 1 10
char 1 0
align 1
LABELV $345
char 1 61
char 1 61
char 1 61
char 1 61
char 1 32
char 1 83
char 1 104
char 1 117
char 1 116
char 1 100
char 1 111
char 1 119
char 1 110
char 1 71
char 1 97
char 1 109
char 1 101
char 1 32
char 1 61
char 1 61
char 1 61
char 1 61
char 1 10
char 1 0
align 1
LABELV $341
char 1 68
char 1 117
char 1 101
char 1 108
char 1 32
char 1 84
char 1 111
char 1 117
char 1 114
char 1 110
char 1 97
char 1 109
char 1 101
char 1 110
char 1 116
char 1 32
char 1 66
char 1 101
char 1 103
char 1 117
char 1 110
char 1 58
char 1 32
char 1 107
char 1 105
char 1 108
char 1 108
char 1 32
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 32
char 1 37
char 1 100
char 1 44
char 1 32
char 1 119
char 1 105
char 1 110
char 1 32
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 58
char 1 32
char 1 37
char 1 100
char 1 10
char 1 0
align 1
LABELV $337
char 1 98
char 1 111
char 1 116
char 1 95
char 1 101
char 1 110
char 1 97
char 1 98
char 1 108
char 1 101
char 1 0
align 1
LABELV $334
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
char 1 103
char 1 117
char 1 114
char 1 112
char 1 50
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $333
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
char 1 103
char 1 117
char 1 114
char 1 112
char 1 49
char 1 46
char 1 119
char 1 97
char 1 118
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
char 1 109
char 1 97
char 1 112
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 112
char 1 111
char 1 100
char 1 105
char 1 117
char 1 109
char 1 47
char 1 112
char 1 111
char 1 100
char 1 105
char 1 117
char 1 109
char 1 52
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $330
char 1 99
char 1 111
char 1 109
char 1 95
char 1 98
char 1 117
char 1 105
char 1 108
char 1 100
char 1 83
char 1 99
char 1 114
char 1 105
char 1 112
char 1 116
char 1 0
align 1
LABELV $326
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 10
char 1 0
align 1
LABELV $325
char 1 45
char 1 49
char 1 124
char 1 45
char 1 49
char 1 0
align 1
LABELV $324
char 1 45
char 1 49
char 1 0
align 1
LABELV $305
char 1 78
char 1 111
char 1 116
char 1 32
char 1 108
char 1 111
char 1 103
char 1 103
char 1 105
char 1 110
char 1 103
char 1 32
char 1 116
char 1 111
char 1 32
char 1 100
char 1 105
char 1 115
char 1 107
char 1 46
char 1 10
char 1 0
align 1
LABELV $304
char 1 73
char 1 110
char 1 105
char 1 116
char 1 71
char 1 97
char 1 109
char 1 101
char 1 58
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $303
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 10
char 1 0
align 1
LABELV $301
char 1 87
char 1 65
char 1 82
char 1 78
char 1 73
char 1 78
char 1 71
char 1 58
char 1 32
char 1 67
char 1 111
char 1 117
char 1 108
char 1 100
char 1 110
char 1 39
char 1 116
char 1 32
char 1 111
char 1 112
char 1 101
char 1 110
char 1 32
char 1 108
char 1 111
char 1 103
char 1 102
char 1 105
char 1 108
char 1 101
char 1 58
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $287
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
char 1 102
char 1 114
char 1 121
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $283
char 1 103
char 1 97
char 1 109
char 1 101
char 1 100
char 1 97
char 1 116
char 1 101
char 1 58
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $282
char 1 103
char 1 97
char 1 109
char 1 101
char 1 110
char 1 97
char 1 109
char 1 101
char 1 58
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $281
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 32
char 1 71
char 1 97
char 1 109
char 1 101
char 1 32
char 1 73
char 1 110
char 1 105
char 1 116
char 1 105
char 1 97
char 1 108
char 1 105
char 1 122
char 1 97
char 1 116
char 1 105
char 1 111
char 1 110
char 1 32
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 45
char 1 10
char 1 0
align 1
LABELV $275
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 83
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 58
char 1 32
char 1 37
char 1 115
char 1 32
char 1 99
char 1 104
char 1 97
char 1 110
char 1 103
char 1 101
char 1 100
char 1 32
char 1 116
char 1 111
char 1 32
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $260
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
char 1 105
char 1 32
char 1 105
char 1 115
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
char 1 44
char 1 32
char 1 100
char 1 101
char 1 102
char 1 97
char 1 117
char 1 108
char 1 116
char 1 105
char 1 110
char 1 103
char 1 32
char 1 116
char 1 111
char 1 32
char 1 48
char 1 10
char 1 0
align 1
LABELV $242
char 1 37
char 1 105
char 1 32
char 1 116
char 1 101
char 1 97
char 1 109
char 1 115
char 1 32
char 1 119
char 1 105
char 1 116
char 1 104
char 1 32
char 1 37
char 1 105
char 1 32
char 1 101
char 1 110
char 1 116
char 1 105
char 1 116
char 1 105
char 1 101
char 1 115
char 1 10
char 1 0
align 1
LABELV $194
char 1 103
char 1 95
char 1 97
char 1 117
char 1 115
char 1 116
char 1 114
char 1 105
char 1 97
char 1 110
char 1 0
align 1
LABELV $193
char 1 103
char 1 95
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 68
char 1 101
char 1 98
char 1 117
char 1 103
char 1 80
char 1 114
char 1 105
char 1 110
char 1 116
char 1 0
align 1
LABELV $192
char 1 103
char 1 95
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 68
char 1 109
char 1 103
char 1 68
char 1 101
char 1 108
char 1 97
char 1 121
char 1 95
char 1 87
char 1 111
char 1 117
char 1 110
char 1 100
char 1 0
align 1
LABELV $191
char 1 51
char 1 53
char 1 48
char 1 0
align 1
LABELV $190
char 1 103
char 1 95
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 68
char 1 109
char 1 103
char 1 68
char 1 101
char 1 108
char 1 97
char 1 121
char 1 95
char 1 73
char 1 100
char 1 108
char 1 101
char 1 0
align 1
LABELV $189
char 1 103
char 1 95
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 68
char 1 109
char 1 103
char 1 86
char 1 101
char 1 108
char 1 111
char 1 99
char 1 105
char 1 116
char 1 121
char 1 83
char 1 99
char 1 97
char 1 108
char 1 101
char 1 0
align 1
LABELV $188
char 1 103
char 1 95
char 1 116
char 1 105
char 1 109
char 1 101
char 1 111
char 1 117
char 1 116
char 1 116
char 1 111
char 1 115
char 1 112
char 1 101
char 1 99
char 1 0
align 1
LABELV $187
char 1 103
char 1 95
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 68
char 1 111
char 1 100
char 1 103
char 1 101
char 1 0
align 1
LABELV $186
char 1 103
char 1 95
char 1 100
char 1 105
char 1 115
char 1 109
char 1 101
char 1 109
char 1 98
char 1 101
char 1 114
char 1 0
align 1
LABELV $185
char 1 103
char 1 95
char 1 114
char 1 97
char 1 110
char 1 107
char 1 105
char 1 110
char 1 103
char 1 115
char 1 0
align 1
LABELV $184
char 1 112
char 1 109
char 1 111
char 1 118
char 1 101
char 1 95
char 1 109
char 1 115
char 1 101
char 1 99
char 1 0
align 1
LABELV $183
char 1 112
char 1 109
char 1 111
char 1 118
char 1 101
char 1 95
char 1 102
char 1 105
char 1 120
char 1 101
char 1 100
char 1 0
align 1
LABELV $182
char 1 103
char 1 95
char 1 115
char 1 109
char 1 111
char 1 111
char 1 116
char 1 104
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 115
char 1 0
align 1
LABELV $181
char 1 103
char 1 95
char 1 101
char 1 110
char 1 97
char 1 98
char 1 108
char 1 101
char 1 66
char 1 114
char 1 101
char 1 97
char 1 116
char 1 104
char 1 0
align 1
LABELV $180
char 1 103
char 1 95
char 1 101
char 1 110
char 1 97
char 1 98
char 1 108
char 1 101
char 1 68
char 1 117
char 1 115
char 1 116
char 1 0
align 1
LABELV $179
char 1 117
char 1 105
char 1 95
char 1 115
char 1 105
char 1 110
char 1 103
char 1 108
char 1 101
char 1 80
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 65
char 1 99
char 1 116
char 1 105
char 1 118
char 1 101
char 1 0
align 1
LABELV $178
char 1 82
char 1 101
char 1 98
char 1 101
char 1 108
char 1 108
char 1 105
char 1 111
char 1 110
char 1 0
align 1
LABELV $177
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
LABELV $176
char 1 69
char 1 109
char 1 112
char 1 105
char 1 114
char 1 101
char 1 0
align 1
LABELV $175
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
LABELV $174
char 1 103
char 1 95
char 1 108
char 1 105
char 1 115
char 1 116
char 1 69
char 1 110
char 1 116
char 1 105
char 1 116
char 1 121
char 1 0
align 1
LABELV $173
char 1 103
char 1 95
char 1 97
char 1 108
char 1 108
char 1 111
char 1 119
char 1 86
char 1 111
char 1 116
char 1 101
char 1 0
align 1
LABELV $172
char 1 55
char 1 48
char 1 0
align 1
LABELV $171
char 1 103
char 1 95
char 1 112
char 1 111
char 1 100
char 1 105
char 1 117
char 1 109
char 1 68
char 1 114
char 1 111
char 1 112
char 1 0
align 1
LABELV $170
char 1 56
char 1 48
char 1 0
align 1
LABELV $169
char 1 103
char 1 95
char 1 112
char 1 111
char 1 100
char 1 105
char 1 117
char 1 109
char 1 68
char 1 105
char 1 115
char 1 116
char 1 0
align 1
LABELV $168
char 1 99
char 1 111
char 1 109
char 1 95
char 1 98
char 1 108
char 1 111
char 1 111
char 1 100
char 1 0
align 1
LABELV $167
char 1 103
char 1 95
char 1 109
char 1 111
char 1 116
char 1 100
char 1 0
align 1
LABELV $166
char 1 103
char 1 95
char 1 100
char 1 101
char 1 98
char 1 117
char 1 103
char 1 65
char 1 108
char 1 108
char 1 111
char 1 99
char 1 0
align 1
LABELV $165
char 1 103
char 1 95
char 1 100
char 1 101
char 1 98
char 1 117
char 1 103
char 1 68
char 1 97
char 1 109
char 1 97
char 1 103
char 1 101
char 1 0
align 1
LABELV $164
char 1 103
char 1 95
char 1 100
char 1 101
char 1 98
char 1 117
char 1 103
char 1 77
char 1 111
char 1 118
char 1 101
char 1 0
align 1
LABELV $163
char 1 103
char 1 95
char 1 105
char 1 110
char 1 97
char 1 99
char 1 116
char 1 105
char 1 118
char 1 105
char 1 116
char 1 121
char 1 0
align 1
LABELV $162
char 1 54
char 1 48
char 1 0
align 1
LABELV $161
char 1 103
char 1 95
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 114
char 1 101
char 1 115
char 1 112
char 1 97
char 1 119
char 1 110
char 1 0
align 1
LABELV $160
char 1 103
char 1 95
char 1 97
char 1 100
char 1 97
char 1 112
char 1 116
char 1 114
char 1 101
char 1 115
char 1 112
char 1 97
char 1 119
char 1 110
char 1 0
align 1
LABELV $159
char 1 103
char 1 95
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 84
char 1 101
char 1 97
char 1 109
char 1 82
char 1 101
char 1 115
char 1 112
char 1 97
char 1 119
char 1 110
char 1 0
align 1
LABELV $158
char 1 53
char 1 0
align 1
LABELV $157
char 1 103
char 1 95
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 114
char 1 101
char 1 115
char 1 112
char 1 97
char 1 119
char 1 110
char 1 0
align 1
LABELV $156
char 1 103
char 1 95
char 1 113
char 1 117
char 1 97
char 1 100
char 1 102
char 1 97
char 1 99
char 1 116
char 1 111
char 1 114
char 1 0
align 1
LABELV $155
char 1 49
char 1 48
char 1 48
char 1 48
char 1 0
align 1
LABELV $154
char 1 103
char 1 95
char 1 107
char 1 110
char 1 111
char 1 99
char 1 107
char 1 98
char 1 97
char 1 99
char 1 107
char 1 0
align 1
LABELV $153
char 1 56
char 1 48
char 1 48
char 1 0
align 1
LABELV $152
char 1 103
char 1 95
char 1 103
char 1 114
char 1 97
char 1 118
char 1 105
char 1 116
char 1 121
char 1 0
align 1
LABELV $151
char 1 50
char 1 53
char 1 48
char 1 0
align 1
LABELV $150
char 1 103
char 1 95
char 1 115
char 1 112
char 1 101
char 1 101
char 1 100
char 1 0
align 1
LABELV $149
char 1 100
char 1 101
char 1 100
char 1 105
char 1 99
char 1 97
char 1 116
char 1 101
char 1 100
char 1 0
align 1
LABELV $148
char 1 103
char 1 95
char 1 110
char 1 101
char 1 101
char 1 100
char 1 112
char 1 97
char 1 115
char 1 115
char 1 0
align 1
LABELV $147
char 1 103
char 1 95
char 1 102
char 1 105
char 1 108
char 1 116
char 1 101
char 1 114
char 1 66
char 1 97
char 1 110
char 1 0
align 1
LABELV $146
char 1 103
char 1 95
char 1 98
char 1 97
char 1 110
char 1 73
char 1 80
char 1 115
char 1 0
align 1
LABELV $145
char 1 103
char 1 95
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
LABELV $144
char 1 115
char 1 116
char 1 97
char 1 116
char 1 108
char 1 111
char 1 103
char 1 46
char 1 108
char 1 111
char 1 103
char 1 0
align 1
LABELV $143
char 1 103
char 1 95
char 1 115
char 1 116
char 1 97
char 1 116
char 1 76
char 1 111
char 1 103
char 1 70
char 1 105
char 1 108
char 1 101
char 1 0
align 1
LABELV $142
char 1 103
char 1 95
char 1 115
char 1 116
char 1 97
char 1 116
char 1 76
char 1 111
char 1 103
char 1 0
align 1
LABELV $141
char 1 103
char 1 95
char 1 108
char 1 111
char 1 103
char 1 83
char 1 121
char 1 110
char 1 99
char 1 0
align 1
LABELV $140
char 1 103
char 1 97
char 1 109
char 1 101
char 1 115
char 1 46
char 1 108
char 1 111
char 1 103
char 1 0
align 1
LABELV $139
char 1 103
char 1 95
char 1 108
char 1 111
char 1 103
char 1 0
align 1
LABELV $138
char 1 103
char 1 95
char 1 100
char 1 111
char 1 87
char 1 97
char 1 114
char 1 109
char 1 117
char 1 112
char 1 0
align 1
LABELV $137
char 1 50
char 1 48
char 1 0
align 1
LABELV $136
char 1 103
char 1 95
char 1 119
char 1 97
char 1 114
char 1 109
char 1 117
char 1 112
char 1 0
align 1
LABELV $135
char 1 103
char 1 95
char 1 116
char 1 101
char 1 97
char 1 109
char 1 70
char 1 111
char 1 114
char 1 99
char 1 101
char 1 66
char 1 97
char 1 108
char 1 97
char 1 110
char 1 99
char 1 101
char 1 0
align 1
LABELV $134
char 1 103
char 1 95
char 1 116
char 1 101
char 1 97
char 1 109
char 1 65
char 1 117
char 1 116
char 1 111
char 1 74
char 1 111
char 1 105
char 1 110
char 1 0
align 1
LABELV $133
char 1 103
char 1 95
char 1 102
char 1 114
char 1 105
char 1 101
char 1 110
char 1 100
char 1 108
char 1 121
char 1 83
char 1 97
char 1 98
char 1 101
char 1 114
char 1 0
align 1
LABELV $132
char 1 103
char 1 95
char 1 102
char 1 114
char 1 105
char 1 101
char 1 110
char 1 100
char 1 108
char 1 121
char 1 70
char 1 105
char 1 114
char 1 101
char 1 0
align 1
LABELV $131
char 1 103
char 1 95
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 73
char 1 110
char 1 116
char 1 101
char 1 114
char 1 112
char 1 111
char 1 108
char 1 97
char 1 116
char 1 101
char 1 0
align 1
LABELV $130
char 1 103
char 1 95
char 1 115
char 1 121
char 1 110
char 1 99
char 1 104
char 1 114
char 1 111
char 1 110
char 1 111
char 1 117
char 1 115
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 115
char 1 0
align 1
LABELV $129
char 1 99
char 1 97
char 1 112
char 1 116
char 1 117
char 1 114
char 1 101
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $128
char 1 116
char 1 105
char 1 109
char 1 101
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $127
char 1 49
char 1 48
char 1 0
align 1
LABELV $126
char 1 100
char 1 117
char 1 101
char 1 108
char 1 95
char 1 102
char 1 114
char 1 97
char 1 103
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $125
char 1 53
char 1 48
char 1 0
align 1
LABELV $124
char 1 102
char 1 114
char 1 97
char 1 103
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $123
char 1 103
char 1 95
char 1 102
char 1 114
char 1 97
char 1 103
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 86
char 1 111
char 1 116
char 1 101
char 1 67
char 1 111
char 1 114
char 1 114
char 1 101
char 1 99
char 1 116
char 1 105
char 1 111
char 1 110
char 1 0
align 1
LABELV $122
char 1 103
char 1 95
char 1 97
char 1 108
char 1 108
char 1 111
char 1 119
char 1 68
char 1 117
char 1 101
char 1 108
char 1 83
char 1 117
char 1 105
char 1 99
char 1 105
char 1 100
char 1 101
char 1 0
align 1
LABELV $121
char 1 103
char 1 95
char 1 100
char 1 117
char 1 101
char 1 108
char 1 87
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 68
char 1 105
char 1 115
char 1 97
char 1 98
char 1 108
char 1 101
char 1 0
align 1
LABELV $120
char 1 103
char 1 95
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 68
char 1 105
char 1 115
char 1 97
char 1 98
char 1 108
char 1 101
char 1 0
align 1
LABELV $119
char 1 103
char 1 95
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 80
char 1 111
char 1 119
char 1 101
char 1 114
char 1 68
char 1 105
char 1 115
char 1 97
char 1 98
char 1 108
char 1 101
char 1 0
align 1
LABELV $118
char 1 49
char 1 48
char 1 48
char 1 48
char 1 48
char 1 0
align 1
LABELV $117
char 1 103
char 1 95
char 1 115
char 1 112
char 1 97
char 1 119
char 1 110
char 1 73
char 1 110
char 1 118
char 1 117
char 1 108
char 1 110
char 1 101
char 1 114
char 1 97
char 1 98
char 1 105
char 1 108
char 1 105
char 1 116
char 1 121
char 1 0
align 1
LABELV $116
char 1 103
char 1 95
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 82
char 1 101
char 1 103
char 1 101
char 1 110
char 1 84
char 1 105
char 1 109
char 1 101
char 1 0
align 1
LABELV $115
char 1 103
char 1 95
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 68
char 1 97
char 1 109
char 1 97
char 1 103
char 1 101
char 1 83
char 1 99
char 1 97
char 1 108
char 1 101
char 1 0
align 1
LABELV $114
char 1 103
char 1 95
char 1 115
char 1 108
char 1 111
char 1 119
char 1 109
char 1 111
char 1 68
char 1 117
char 1 101
char 1 108
char 1 69
char 1 110
char 1 100
char 1 0
align 1
LABELV $113
char 1 103
char 1 95
char 1 108
char 1 111
char 1 103
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 73
char 1 110
char 1 102
char 1 111
char 1 0
align 1
LABELV $112
char 1 50
char 1 0
align 1
LABELV $111
char 1 103
char 1 95
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 66
char 1 111
char 1 120
char 1 84
char 1 114
char 1 97
char 1 99
char 1 101
char 1 83
char 1 105
char 1 122
char 1 101
char 1 0
align 1
LABELV $110
char 1 103
char 1 95
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 65
char 1 108
char 1 119
char 1 97
char 1 121
char 1 115
char 1 66
char 1 111
char 1 120
char 1 84
char 1 114
char 1 97
char 1 99
char 1 101
char 1 0
align 1
LABELV $109
char 1 103
char 1 95
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 71
char 1 104
char 1 111
char 1 117
char 1 108
char 1 50
char 1 67
char 1 111
char 1 108
char 1 108
char 1 105
char 1 115
char 1 105
char 1 111
char 1 110
char 1 0
align 1
LABELV $108
char 1 103
char 1 95
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 84
char 1 114
char 1 97
char 1 99
char 1 101
char 1 83
char 1 97
char 1 98
char 1 101
char 1 114
char 1 70
char 1 105
char 1 114
char 1 115
char 1 116
char 1 0
align 1
LABELV $107
char 1 54
char 1 0
align 1
LABELV $106
char 1 103
char 1 95
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 76
char 1 111
char 1 99
char 1 107
char 1 70
char 1 97
char 1 99
char 1 116
char 1 111
char 1 114
char 1 0
align 1
LABELV $105
char 1 103
char 1 95
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 76
char 1 111
char 1 99
char 1 107
char 1 105
char 1 110
char 1 103
char 1 0
align 1
LABELV $104
char 1 103
char 1 95
char 1 112
char 1 114
char 1 105
char 1 118
char 1 97
char 1 116
char 1 101
char 1 68
char 1 117
char 1 101
char 1 108
char 1 0
align 1
LABELV $103
char 1 103
char 1 95
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 66
char 1 97
char 1 115
char 1 101
char 1 100
char 1 84
char 1 101
char 1 97
char 1 109
char 1 115
char 1 0
align 1
LABELV $102
char 1 55
char 1 0
align 1
LABELV $101
char 1 103
char 1 95
char 1 109
char 1 97
char 1 120
char 1 70
char 1 111
char 1 114
char 1 99
char 1 101
char 1 82
char 1 97
char 1 110
char 1 107
char 1 0
align 1
LABELV $100
char 1 100
char 1 109
char 1 102
char 1 108
char 1 97
char 1 103
char 1 115
char 1 0
align 1
LABELV $99
char 1 103
char 1 95
char 1 97
char 1 117
char 1 116
char 1 111
char 1 77
char 1 97
char 1 112
char 1 67
char 1 121
char 1 99
char 1 108
char 1 101
char 1 0
align 1
LABELV $98
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
LABELV $97
char 1 103
char 1 95
char 1 102
char 1 102
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 105
char 1 118
char 1 101
char 1 115
char 1 0
align 1
LABELV $96
char 1 103
char 1 95
char 1 109
char 1 97
char 1 120
char 1 71
char 1 97
char 1 109
char 1 101
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 115
char 1 0
align 1
LABELV $95
char 1 56
char 1 0
align 1
LABELV $94
char 1 115
char 1 118
char 1 95
char 1 109
char 1 97
char 1 120
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 115
char 1 0
align 1
LABELV $93
char 1 51
char 1 0
align 1
LABELV $92
char 1 103
char 1 95
char 1 77
char 1 97
char 1 120
char 1 72
char 1 111
char 1 108
char 1 111
char 1 99
char 1 114
char 1 111
char 1 110
char 1 67
char 1 97
char 1 114
char 1 114
char 1 121
char 1 0
align 1
LABELV $91
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
char 1 0
align 1
LABELV $90
char 1 115
char 1 118
char 1 95
char 1 109
char 1 97
char 1 112
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $89
char 1 103
char 1 95
char 1 114
char 1 101
char 1 115
char 1 116
char 1 97
char 1 114
char 1 116
char 1 101
char 1 100
char 1 0
align 1
LABELV $88
char 1 77
char 1 97
char 1 121
char 1 32
char 1 48
char 1 54
char 1 32
char 1 50
char 1 48
char 1 49
char 1 49
char 1 0
align 1
LABELV $87
char 1 103
char 1 97
char 1 109
char 1 101
char 1 100
char 1 97
char 1 116
char 1 101
char 1 0
align 1
LABELV $86
char 1 98
char 1 97
char 1 115
char 1 101
char 1 106
char 1 107
char 1 0
align 1
LABELV $85
char 1 103
char 1 97
char 1 109
char 1 101
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $84
char 1 0
align 1
LABELV $83
char 1 115
char 1 118
char 1 95
char 1 99
char 1 104
char 1 101
char 1 97
char 1 116
char 1 115
char 1 0
align 1
LABELV $82
char 1 49
char 1 0
align 1
LABELV $81
char 1 106
char 1 100
char 1 95
char 1 77
char 1 101
char 1 115
char 1 115
char 1 97
char 1 103
char 1 101
char 1 115
char 1 0
align 1
LABELV $80
char 1 48
char 1 0
align 1
LABELV $79
char 1 106
char 1 100
char 1 95
char 1 67
char 1 108
char 1 111
char 1 115
char 1 101
char 1 83
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 0
