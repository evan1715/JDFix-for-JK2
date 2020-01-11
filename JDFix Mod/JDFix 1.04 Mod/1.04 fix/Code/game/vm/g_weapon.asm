export touch_NULL
code
proc touch_NULL 0 0
file "../g_weapon.c"
line 106
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// g_weapon.c 
;4:// perform the server side effects of a weapon firing
;5:
;6:#include "g_local.h"
;7:#include "be_aas.h"
;8:
;9:static	float	s_quadFactor;
;10:static	vec3_t	forward, right, up;
;11:static	vec3_t	muzzle;
;12:
;13:// Bryar Pistol
;14://--------
;15:#define BRYAR_PISTOL_VEL			1600
;16:#define BRYAR_PISTOL_DAMAGE			10
;17:#define BRYAR_CHARGE_UNIT			200.0f	// bryar charging gives us one more unit every 200ms--if you change this, you'll have to do the same in bg_pmove
;18:#define BRYAR_ALT_SIZE				1.0f
;19:
;20:// E11 Blaster
;21://---------
;22:#define BLASTER_SPREAD				1.6f//1.2f
;23:#define BLASTER_VELOCITY			2300
;24:#define BLASTER_DAMAGE				20
;25:
;26:// Tenloss Disruptor
;27://----------
;28:#define DISRUPTOR_MAIN_DAMAGE			30 //40
;29:#define DISRUPTOR_NPC_MAIN_DAMAGE_CUT	0.25f
;30:
;31:#define DISRUPTOR_ALT_DAMAGE			100 //125
;32:#define DISRUPTOR_NPC_ALT_DAMAGE_CUT	0.2f
;33:#define DISRUPTOR_ALT_TRACES			3		// can go through a max of 3 damageable(sp?) entities
;34:#define DISRUPTOR_CHARGE_UNIT			50.0f	// distruptor charging gives us one more unit every 50ms--if you change this, you'll have to do the same in bg_pmove
;35:
;36:// Wookiee Bowcaster
;37://----------
;38:#define	BOWCASTER_DAMAGE			50
;39:#define	BOWCASTER_VELOCITY			1300
;40:#define BOWCASTER_SPLASH_DAMAGE		0
;41:#define BOWCASTER_SPLASH_RADIUS		0
;42:#define BOWCASTER_SIZE				2
;43:
;44:#define BOWCASTER_ALT_SPREAD		5.0f
;45:#define BOWCASTER_VEL_RANGE			0.3f
;46:#define BOWCASTER_CHARGE_UNIT		200.0f	// bowcaster charging gives us one more unit every 200ms--if you change this, you'll have to do the same in bg_pmove
;47:
;48:// Heavy Repeater
;49://----------
;50:#define REPEATER_SPREAD				1.4f
;51:#define	REPEATER_DAMAGE				14
;52:#define	REPEATER_VELOCITY			1600
;53:
;54:#define REPEATER_ALT_SIZE				3	// half of bbox size
;55:#define	REPEATER_ALT_DAMAGE				60
;56:#define REPEATER_ALT_SPLASH_DAMAGE		60
;57:#define REPEATER_ALT_SPLASH_RADIUS		128
;58:#define	REPEATER_ALT_VELOCITY			1100
;59:
;60:// DEMP2
;61://----------
;62:#define	DEMP2_DAMAGE				35
;63:#define	DEMP2_VELOCITY				1800
;64:#define	DEMP2_SIZE					2		// half of bbox size
;65:
;66:#define DEMP2_ALT_DAMAGE			8 //12		// does 12, 36, 84 at each of the 3 charge levels.
;67:#define DEMP2_CHARGE_UNIT			700.0f	// demp2 charging gives us one more unit every 700ms--if you change this, you'll have to do the same in bg_weapons
;68:#define DEMP2_ALT_RANGE				4096
;69:#define DEMP2_ALT_SPLASHRADIUS		256
;70:
;71:// Golan Arms Flechette
;72://---------
;73:#define FLECHETTE_SHOTS				5
;74:#define FLECHETTE_SPREAD			4.0f
;75:#define FLECHETTE_DAMAGE			12//15
;76:#define FLECHETTE_VEL				3500
;77:#define FLECHETTE_SIZE				1
;78:#define FLECHETTE_MINE_RADIUS_CHECK	256
;79:#define FLECHETTE_ALT_DAMAGE		60
;80:#define FLECHETTE_ALT_SPLASH_DAM	60
;81:#define FLECHETTE_ALT_SPLASH_RAD	128
;82:
;83:// Personal Rocket Launcher
;84://---------
;85:#define	ROCKET_VELOCITY				900
;86:#define	ROCKET_DAMAGE				100
;87:#define	ROCKET_SPLASH_DAMAGE		100
;88:#define	ROCKET_SPLASH_RADIUS		160
;89:#define ROCKET_SIZE					3
;90:#define ROCKET_ALT_THINK_TIME		100
;91:
;92:// Stun Baton
;93://--------------
;94:#define STUN_BATON_DAMAGE			20
;95:#define STUN_BATON_ALT_DAMAGE		20
;96:#define STUN_BATON_RANGE			8
;97:
;98:
;99:extern qboolean G_BoxInBounds( vec3_t point, vec3_t mins, vec3_t maxs, vec3_t boundsMins, vec3_t boundsMaxs );
;100:
;101:static void WP_FireEmplaced( gentity_t *ent, qboolean altFire );
;102:
;103:void laserTrapStick( gentity_t *ent, vec3_t endpos, vec3_t normal );
;104:
;105:void touch_NULL( gentity_t *ent, gentity_t *other, trace_t *trace )
;106:{
line 108
;107:
;108:}
LABELV $79
endproc touch_NULL 0 0
export W_TraceSetStart
proc W_TraceSetStart 1140 28
line 115
;109:
;110:void laserTrapExplode( gentity_t *self );
;111:
;112://-----------------------------------------------------------------------------
;113:void W_TraceSetStart( gentity_t *ent, vec3_t start, vec3_t mins, vec3_t maxs )
;114://-----------------------------------------------------------------------------
;115:{
line 122
;116:	//make sure our start point isn't on the other side of a wall
;117:	trace_t	tr;
;118:	vec3_t	entMins;
;119:	vec3_t	entMaxs;
;120:	vec3_t	eyePoint;
;121:
;122:	VectorAdd( ent->r.currentOrigin, ent->r.mins, entMins );
ADDRLP4 1116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1080
ADDRLP4 1116
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 1116
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1080+4
ADDRLP4 1116
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 1116
INDIRP4
CNSTI4 320
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1080+8
ADDRLP4 1120
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 1120
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
ADDF4
ASGNF4
line 123
;123:	VectorAdd( ent->r.currentOrigin, ent->r.maxs, entMaxs );
ADDRLP4 1124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1092
ADDRLP4 1124
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 1124
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1092+4
ADDRLP4 1124
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 1124
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1092+8
ADDRLP4 1128
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 1128
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
ADDF4
ASGNF4
line 125
;124:
;125:	if ( G_BoxInBounds( start, mins, maxs, entMins, entMaxs ) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 1080
ARGP4
ADDRLP4 1092
ARGP4
ADDRLP4 1132
ADDRGP4 G_BoxInBounds
CALLI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 0
EQI4 $85
line 126
;126:	{
line 127
;127:		return;
ADDRGP4 $80
JUMPV
LABELV $85
line 130
;128:	}
;129:
;130:	if ( !ent->client )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $87
line 131
;131:	{
line 132
;132:		return;
ADDRGP4 $80
JUMPV
LABELV $87
line 135
;133:	}
;134:
;135:	VectorCopy( ent->s.pos.trBase, eyePoint);
ADDRLP4 1104
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 136
;136:	eyePoint[2] += ent->client->ps.viewheight;
ADDRLP4 1104+8
ADDRLP4 1104+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 138
;137:		
;138:	trap_Trace( &tr, eyePoint, mins, maxs, start, ent->s.number, MASK_SOLID|CONTENTS_SHOTCLIP );
ADDRLP4 0
ARGP4
ADDRLP4 1104
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 129
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 140
;139:
;140:	if ( tr.startsolid || tr.allsolid )
ADDRLP4 1136
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 1136
INDIRI4
NEI4 $93
ADDRLP4 0
INDIRI4
ADDRLP4 1136
INDIRI4
EQI4 $90
LABELV $93
line 141
;141:	{
line 142
;142:		return;
ADDRGP4 $80
JUMPV
LABELV $90
line 145
;143:	}
;144:
;145:	if ( tr.fraction < 1.0f )
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $94
line 146
;146:	{
line 147
;147:		VectorCopy( tr.endpos, start );
ADDRFP4 4
INDIRP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 148
;148:	}
LABELV $94
line 149
;149:}
LABELV $80
endproc W_TraceSetStart 1140 28
proc WP_FireBryarPistol 20 24
line 169
;150:
;151:
;152:/*
;153:----------------------------------------------
;154:	PLAYER WEAPONS
;155:----------------------------------------------
;156:*/
;157:
;158:/*
;159:======================================================================
;160:
;161:BRYAR PISTOL
;162:
;163:======================================================================
;164:*/
;165:
;166://----------------------------------------------
;167:static void WP_FireBryarPistol( gentity_t *ent, qboolean altFire )
;168://---------------------------------------------------------
;169:{
line 170
;170:	int damage = BRYAR_PISTOL_DAMAGE;
ADDRLP4 8
CNSTI4 10
ASGNI4
line 173
;171:	int count;
;172:
;173:	gentity_t	*missile = CreateMissile( muzzle, forward, BRYAR_PISTOL_VEL, 10000, ent, altFire );
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
CNSTF4 1153957888
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 175
;174:
;175:	missile->classname = "bryar_proj";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $99
ASGNP4
line 176
;176:	missile->s.weapon = WP_BRYAR_PISTOL;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 3
ASGNI4
line 178
;177:
;178:	if ( altFire )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $100
line 179
;179:	{
line 180
;180:		float boxSize = 0;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 182
;181:
;182:		count = ( level.time - ent->client->ps.weaponChargeTime ) / BRYAR_CHARGE_UNIT;
ADDRLP4 4
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1128792064
DIVF4
CVFI4 4
ASGNI4
line 184
;183:
;184:		if ( count < 1 )
ADDRLP4 4
INDIRI4
CNSTI4 1
GEI4 $103
line 185
;185:		{
line 186
;186:			count = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 187
;187:		}
ADDRGP4 $104
JUMPV
LABELV $103
line 188
;188:		else if ( count > 5 )
ADDRLP4 4
INDIRI4
CNSTI4 5
LEI4 $105
line 189
;189:		{
line 190
;190:			count = 5;
ADDRLP4 4
CNSTI4 5
ASGNI4
line 191
;191:		}
LABELV $105
LABELV $104
line 193
;192:
;193:		if (count > 1)
ADDRLP4 4
INDIRI4
CNSTI4 1
LEI4 $107
line 194
;194:		{
line 195
;195:			damage *= (count*1.7);
ADDRLP4 8
ADDRLP4 8
INDIRI4
CVIF4 4
CNSTF4 1071225242
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
MULF4
CVFI4 4
ASGNI4
line 196
;196:		}
ADDRGP4 $108
JUMPV
LABELV $107
line 198
;197:		else
;198:		{
line 199
;199:			damage *= (count*1.5);
ADDRLP4 8
ADDRLP4 8
INDIRI4
CVIF4 4
CNSTF4 1069547520
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
MULF4
CVFI4 4
ASGNI4
line 200
;200:		}
LABELV $108
line 202
;201:
;202:		missile->s.generic1 = count; // The missile will then render according to the charge level.
ADDRLP4 0
INDIRP4
CNSTI4 292
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 205
;203://		missile->count = count;		// The single player stores the charge in count, which isn't accessible on the client
;204:
;205:		boxSize = BRYAR_ALT_SIZE*(count*0.5);
ADDRLP4 16
CNSTF4 1065353216
CNSTF4 1056964608
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
MULF4
ASGNF4
line 207
;206:
;207:		VectorSet( missile->r.maxs, boxSize, boxSize, boxSize );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
line 208
;208:		VectorSet( missile->r.mins, -boxSize, -boxSize, -boxSize );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
ADDRLP4 16
INDIRF4
NEGF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
ADDRLP4 16
INDIRF4
NEGF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
ADDRLP4 16
INDIRF4
NEGF4
ASGNF4
line 209
;209:	}
LABELV $100
line 211
;210:
;211:	missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 212
;212:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 128
ASGNI4
line 213
;213:	if (altFire)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $109
line 214
;214:	{
line 215
;215:		missile->methodOfDeath = MOD_BRYAR_PISTOL_ALT;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 5
ASGNI4
line 216
;216:	}
ADDRGP4 $110
JUMPV
LABELV $109
line 218
;217:	else
;218:	{
line 219
;219:		missile->methodOfDeath = MOD_BRYAR_PISTOL;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 4
ASGNI4
line 220
;220:	}
LABELV $110
line 221
;221:	missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 262913
ASGNI4
line 225
;222:
;223:	// we don't want it to bounce forever
;224:	// NOTENOTE These don't bounce yet.
;225:	missile->bounceCount = 8;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 8
ASGNI4
line 226
;226:}
LABELV $98
endproc WP_FireBryarPistol 20 24
export WP_FireTurretMissile
proc WP_FireTurretMissile 20 24
line 269
;227:
;228:/*
;229:======================================================================
;230:
;231:GENERIC
;232:
;233:======================================================================
;234:*/
;235://JediDog: original wp_FireTurretMissle
;236:/*
;237://---------------------------------------------------------
;238:void WP_FireTurretMissile( gentity_t *ent, vec3_t start, vec3_t dir, qboolean altFire, int damage, int velocity, int mod, gentity_t *ignore )
;239://---------------------------------------------------------
;240:{
;241:	gentity_t *missile;
;242:
;243:	missile = CreateMissile( start, dir, velocity, 10000, ent, altFire );
;244:
;245:	missile->classname = "generic_proj";
;246:	missile->s.weapon = WP_TURRET;
;247:
;248:	missile->damage = damage;
;249:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
;250:	missile->methodOfDeath = mod;
;251:	missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
;252:
;253:	if (ignore)
;254:	{
;255:		missile->passThroughNum = ignore->s.number+1;
;256:	}
;257:
;258:	// we don't want it to bounce forever
;259:	// NOTENOTE These don't bounce yet.
;260:	missile->bounceCount = 8;
;261:}
;262:
;263://Currently only the seeker drone uses this, but it might be useful for other things as well.
;264:*/
;265://JediDog: added this for turret/sentry bug (Ouned's fix)
;266://---------------------------------------------------------
;267:void WP_FireTurretMissile( gentity_t *ent, vec3_t start, vec3_t dir, qboolean altFire, int damage, int velocity, int mod, gentity_t *ignore )
;268://---------------------------------------------------------
;269:{
line 271
;270:  gentity_t *depp;
;271:  int e, vadder = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 273
;272:  
;273:  if (mod == MOD_SENTRY)
ADDRFP4 24
INDIRI4
CNSTI4 28
NEI4 $112
line 274
;274:  {
line 275
;275:    for ( e = 0 ; e <= 999 ; e++ ) 
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $114
line 276
;276:	  {
line 277
;277:		  depp = &g_entities[e];
ADDRLP4 4
CNSTI4 832
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 278
;278:      if ( depp->s.weapon == WP_TURRET || depp->isseeker == qtrue )
ADDRLP4 4
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 15
EQI4 $120
ADDRLP4 4
INDIRP4
CNSTI4 828
ADDP4
INDIRI4
CNSTI4 1
NEI4 $118
LABELV $120
line 279
;279:      {
line 280
;280:        vadder++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 281
;281:      }
LABELV $118
line 282
;282:    }
LABELV $115
line 275
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 999
LEI4 $114
line 284
;283:    
;284:    if ( vadder <= 10 )
ADDRLP4 8
INDIRI4
CNSTI4 10
GTI4 $113
line 285
;285:    {
line 287
;286:        gentity_t *missile;
;287:        missile = CreateMissile( start, dir, velocity, 10000, ent, altFire );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
CVIF4 4
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
ASGNP4
line 288
;288:	      missile->classname = "generic_proj";
ADDRLP4 12
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $123
ASGNP4
line 289
;289:	      missile->s.weapon = WP_TURRET;
ADDRLP4 12
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 15
ASGNI4
line 290
;290:	      missile->damage = damage;
ADDRLP4 12
INDIRP4
CNSTI4 688
ADDP4
ADDRFP4 16
INDIRI4
ASGNI4
line 291
;291:	      missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 12
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 128
ASGNI4
line 292
;292:	      missile->methodOfDeath = mod;
ADDRLP4 12
INDIRP4
CNSTI4 704
ADDP4
ADDRFP4 24
INDIRI4
ASGNI4
line 293
;293:	      missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 12
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 262913
ASGNI4
line 294
;294:	      if (ignore)
ADDRFP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $124
line 295
;295:	      {
line 296
;296:		       missile->passThroughNum = ignore->s.number+1;
ADDRLP4 12
INDIRP4
CNSTI4 444
ADDP4
ADDRFP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 297
;297:	      }
LABELV $124
line 298
;298:	      missile->bounceCount = 8;
ADDRLP4 12
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 8
ASGNI4
line 299
;299:    }
line 300
;300:  }
ADDRGP4 $113
JUMPV
LABELV $112
line 302
;301:  else
;302:  {
line 304
;303:    gentity_t *missile;
;304:    missile = CreateMissile( start, dir, velocity, 10000, ent, altFire );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
CVIF4 4
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
ASGNP4
line 305
;305:	  missile->classname = "generic_proj";
ADDRLP4 12
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $123
ASGNP4
line 306
;306:	  missile->s.weapon = WP_TURRET;
ADDRLP4 12
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 15
ASGNI4
line 307
;307:	  missile->damage = damage;
ADDRLP4 12
INDIRP4
CNSTI4 688
ADDP4
ADDRFP4 16
INDIRI4
ASGNI4
line 308
;308:	  missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 12
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 128
ASGNI4
line 309
;309:	  missile->methodOfDeath = mod;
ADDRLP4 12
INDIRP4
CNSTI4 704
ADDP4
ADDRFP4 24
INDIRI4
ASGNI4
line 310
;310:	  missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 12
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 262913
ASGNI4
line 311
;311:	  if (ignore)
ADDRFP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $126
line 312
;312:    {
line 313
;313:	  	missile->passThroughNum = ignore->s.number+1;
ADDRLP4 12
INDIRP4
CNSTI4 444
ADDP4
ADDRFP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 314
;314:	  }
LABELV $126
line 315
;315:	  missile->bounceCount = 8;
ADDRLP4 12
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 8
ASGNI4
line 316
;316:  }
LABELV $113
line 317
;317:}
LABELV $111
endproc WP_FireTurretMissile 20 24
export WP_FireGenericBlasterMissile
proc WP_FireGenericBlasterMissile 20 24
line 345
;318://JediDog: original wp_FireGenericBlasterMissle
;319:/*
;320://---------------------------------------------------------
;321:void WP_FireGenericBlasterMissile( gentity_t *ent, vec3_t start, vec3_t dir, qboolean altFire, int damage, int velocity, int mod )
;322://---------------------------------------------------------
;323:{
;324:	gentity_t *missile;
;325:
;326:	missile = CreateMissile( start, dir, velocity, 10000, ent, altFire );
;327:
;328:	missile->classname = "generic_proj";
;329:	missile->s.weapon = WP_BRYAR_PISTOL;
;330:
;331:	missile->damage = damage;
;332:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
;333:	missile->methodOfDeath = mod;
;334:	missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
;335:
;336:	// we don't want it to bounce forever
;337:	// NOTENOTE These don't bounce yet.
;338:	missile->bounceCount = 8;
;339:}
;340:*/
;341://JediDog: added this for turret/sentry bug (Ouned's fix)
;342://---------------------------------------------------------
;343:void WP_FireGenericBlasterMissile( gentity_t *ent, vec3_t start, vec3_t dir, qboolean altFire, int damage, int velocity, int mod )
;344://---------------------------------------------------------
;345:{
line 347
;346:   gentity_t *depp;
;347:   int e, vadder = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 349
;348:
;349:   for ( e = 0 ; e <= 999 ; e++ ) 
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $129
line 350
;350:	 {
line 351
;351:		  depp = &g_entities[e];
ADDRLP4 4
CNSTI4 832
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 352
;352:      if ( depp->isseeker == qtrue || depp->s.weapon == WP_TURRET )
ADDRLP4 4
INDIRP4
CNSTI4 828
ADDP4
INDIRI4
CNSTI4 1
EQI4 $135
ADDRLP4 4
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 15
NEI4 $133
LABELV $135
line 353
;353:      {
line 354
;354:        vadder++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 355
;355:      }
LABELV $133
line 356
;356:   }
LABELV $130
line 349
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 999
LEI4 $129
line 358
;357:  
;358:   if ( vadder <= 10 )
ADDRLP4 8
INDIRI4
CNSTI4 10
GTI4 $136
line 359
;359:   {
line 361
;360:	   gentity_t *missile;
;361:	   missile = CreateMissile( start, dir, velocity, 10000, ent, altFire );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
CVIF4 4
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
ASGNP4
line 362
;362:	   missile->classname = "generic_proj";
ADDRLP4 12
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $123
ASGNP4
line 363
;363:	   missile->s.weapon = WP_BRYAR_PISTOL;
ADDRLP4 12
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 3
ASGNI4
line 364
;364:	   missile->damage = damage;
ADDRLP4 12
INDIRP4
CNSTI4 688
ADDP4
ADDRFP4 16
INDIRI4
ASGNI4
line 365
;365:	   missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 12
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 128
ASGNI4
line 366
;366:	   missile->methodOfDeath = mod;
ADDRLP4 12
INDIRP4
CNSTI4 704
ADDP4
ADDRFP4 24
INDIRI4
ASGNI4
line 368
;367:	   // IM A SEEKER DRONE !!!1!1
;368:	   missile->isseeker = qtrue;
ADDRLP4 12
INDIRP4
CNSTI4 828
ADDP4
CNSTI4 1
ASGNI4
line 369
;369:	   missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 12
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 262913
ASGNI4
line 370
;370:	   missile->bounceCount = 8;
ADDRLP4 12
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 8
ASGNI4
line 371
;371:	 }
LABELV $136
line 372
;372:}
LABELV $128
endproc WP_FireGenericBlasterMissile 20 24
export WP_FireBlasterMissile
proc WP_FireBlasterMissile 16 24
line 384
;373:/*
;374:======================================================================
;375:
;376:BLASTER
;377:
;378:======================================================================
;379:*/
;380:
;381://---------------------------------------------------------
;382:void WP_FireBlasterMissile( gentity_t *ent, vec3_t start, vec3_t dir, qboolean altFire )
;383://---------------------------------------------------------
;384:{
line 385
;385:	int velocity	= BLASTER_VELOCITY;
ADDRLP4 8
CNSTI4 2300
ASGNI4
line 386
;386:	int	damage		= BLASTER_DAMAGE;
ADDRLP4 4
CNSTI4 20
ASGNI4
line 389
;387:	gentity_t *missile;
;388:
;389:	if (ent->s.eType == ET_GRAPPLE)
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $139
line 390
;390:	{ //animent
line 391
;391:		damage = 10;
ADDRLP4 4
CNSTI4 10
ASGNI4
line 392
;392:	}
LABELV $139
line 400
;393:	// NOTENOTE Vehicle models are not yet implemented
;394:/*	if ( ent->client && ent->client->ps.vehicleModel != 0 )
;395:	{
;396:		velocity = 10000;
;397:	}
;398:*/
;399:	
;400:	missile = CreateMissile( start, dir, velocity, 10000, ent, altFire );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 402
;401:
;402:	missile->classname = "blaster_proj";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $141
ASGNP4
line 403
;403:	missile->s.weapon = WP_BLASTER;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 4
ASGNI4
line 412
;404:
;405:	// NOTENOTE Vehicle models are not yet implemented
;406:/*	if ( ent->client && ent->client->ps.vehicleModel != 0 )
;407:	{
;408:		damage = 250;
;409:	}
;410:	*/
;411:
;412:	missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 413
;413:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 128
ASGNI4
line 414
;414:	missile->methodOfDeath = MOD_BLASTER;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 6
ASGNI4
line 415
;415:	missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 262913
ASGNI4
line 419
;416:
;417:	// we don't want it to bounce forever
;418:	// NOTENOTE These don't bounce yet.
;419:	missile->bounceCount = 8;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 8
ASGNI4
line 420
;420:}
LABELV $138
endproc WP_FireBlasterMissile 16 24
export WP_FireEmplacedMissile
proc WP_FireEmplacedMissile 16 24
line 425
;421:
;422://---------------------------------------------------------
;423:void WP_FireEmplacedMissile( gentity_t *ent, vec3_t start, vec3_t dir, qboolean altFire, gentity_t *ignore )
;424://---------------------------------------------------------
;425:{
line 426
;426:	int velocity	= BLASTER_VELOCITY;
ADDRLP4 4
CNSTI4 2300
ASGNI4
line 427
;427:	int	damage		= BLASTER_DAMAGE;
ADDRLP4 8
CNSTI4 20
ASGNI4
line 437
;428:	gentity_t *missile;
;429:
;430:	// NOTENOTE Vehicle models are not yet implemented
;431:/*	if ( ent->client && ent->client->ps.vehicleModel != 0 )
;432:	{
;433:		velocity = 10000;
;434:	}
;435:*/
;436:	
;437:	missile = CreateMissile( start, dir, velocity, 10000, ent, altFire );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 439
;438:
;439:	missile->classname = "emplaced_gun_proj";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $143
ASGNP4
line 440
;440:	missile->s.weapon = WP_TURRET;//WP_EMPLACED_GUN;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 15
ASGNI4
line 449
;441:
;442:	// NOTENOTE Vehicle models are not yet implemented
;443:/*	if ( ent->client && ent->client->ps.vehicleModel != 0 )
;444:	{
;445:		damage = 250;
;446:	}
;447:	*/
;448:
;449:	missile->activator = ignore;
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRFP4 16
INDIRP4
ASGNP4
line 451
;450:
;451:	missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 452
;452:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 128
ASGNI4
line 453
;453:	missile->methodOfDeath = MOD_BLASTER;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 6
ASGNI4
line 454
;454:	missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 262913
ASGNI4
line 456
;455:
;456:	if (ignore)
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $144
line 457
;457:	{
line 458
;458:		missile->passThroughNum = ignore->s.number+1;
ADDRLP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRFP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 459
;459:	}
LABELV $144
line 463
;460:
;461:	// we don't want it to bounce forever
;462:	// NOTENOTE These don't bounce yet.
;463:	missile->bounceCount = 8;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 8
ASGNI4
line 464
;464:}
LABELV $142
endproc WP_FireEmplacedMissile 16 24
proc WP_FireBlaster 32 16
line 469
;465:
;466://---------------------------------------------------------
;467:static void WP_FireBlaster( gentity_t *ent, qboolean altFire )
;468://---------------------------------------------------------
;469:{
line 472
;470:	vec3_t	dir, angs;
;471:
;472:	vectoangles( forward, angs );
ADDRGP4 forward
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 474
;473:
;474:	if ( altFire )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $147
line 475
;475:	{
line 477
;476:		// add some slop to the alt-fire direction
;477:		angs[PITCH] += crandom() * BLASTER_SPREAD;
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1070386381
CNSTF4 1073741824
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 478
;478:		angs[YAW]	+= crandom() * BLASTER_SPREAD;
ADDRLP4 28
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1070386381
CNSTF4 1073741824
ADDRLP4 28
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 479
;479:	}
LABELV $147
line 481
;480:
;481:	AngleVectors( angs, dir, NULL, NULL );
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 24
CNSTP4 0
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 484
;482:
;483:	// FIXME: if temp_org does not have clear trace to inside the bbox, don't shoot!
;484:	WP_FireBlasterMissile( ent, muzzle, dir, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireBlasterMissile
CALLV
pop
line 485
;485:}
LABELV $146
endproc WP_FireBlaster 32 16
proc WP_DisruptorMainFire 1200 32
line 501
;486:
;487:
;488:
;489:int G_GetHitLocation(gentity_t *target, vec3_t ppoint);
;490:
;491:/*
;492:======================================================================
;493:
;494:DISRUPTOR
;495:
;496:======================================================================
;497:*/
;498://---------------------------------------------------------
;499:static void WP_DisruptorMainFire( gentity_t *ent )
;500://---------------------------------------------------------
;501:{
line 502
;502:	int			damage = DISRUPTOR_MAIN_DAMAGE;
ADDRLP4 1128
CNSTI4 30
ASGNI4
line 503
;503:	qboolean	render_impact = qtrue;
ADDRLP4 1124
CNSTI4 1
ASGNI4
line 507
;504:	vec3_t		start, end	/*, spot*/	;
;505:	trace_t		tr;
;506:	gentity_t	*traceEnt, *tent;
;507:	float		/*dist, */shotRange = 8192;
ADDRLP4 1120
CNSTF4 1174405120
ASGNF4
line 510
;508:	int			ignore, traces;
;509:
;510:	memset(&tr, 0, sizeof(tr)); //to shut the compiler up
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1080
ARGI4
ADDRGP4 memset
CALLP4
pop
line 512
;511:
;512:	VectorCopy( ent->client->ps.origin, start );
ADDRLP4 1084
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 513
;513:	start[2] += ent->client->ps.viewheight;//By eyes
ADDRLP4 1084+8
ADDRLP4 1084+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 515
;514:
;515:	VectorMA( start, shotRange, forward, end );
ADDRLP4 1104
ADDRLP4 1084
INDIRF4
ADDRGP4 forward
INDIRF4
ADDRLP4 1120
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1104+4
ADDRLP4 1084+4
INDIRF4
ADDRGP4 forward+4
INDIRF4
ADDRLP4 1120
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1104+8
ADDRLP4 1084+8
INDIRF4
ADDRGP4 forward+8
INDIRF4
ADDRLP4 1120
INDIRF4
MULF4
ADDF4
ASGNF4
line 519
;516:
;517://	trap_Trace( &tr, start, NULL, NULL, end, ent->s.number, MASK_SHOT);
;518:
;519:	ignore = ent->s.number;
ADDRLP4 1096
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 520
;520:	traces = 0;
ADDRLP4 1100
CNSTI4 0
ASGNI4
ADDRGP4 $159
JUMPV
LABELV $158
line 522
;521:	while ( traces < 10 )
;522:	{//need to loop this in case we hit a Jedi who dodges the shot
line 523
;523:		trap_Trace( &tr, start, NULL, NULL, end, ignore, MASK_SHOT );
ADDRLP4 4
ARGP4
ADDRLP4 1084
ARGP4
ADDRLP4 1136
CNSTP4 0
ASGNP4
ADDRLP4 1136
INDIRP4
ARGP4
ADDRLP4 1136
INDIRP4
ARGP4
ADDRLP4 1104
ARGP4
ADDRLP4 1096
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 525
;524:
;525:		traceEnt = &g_entities[tr.entityNum];
ADDRLP4 0
CNSTI4 832
ADDRLP4 4+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 527
;526:
;527:		if (traceEnt && traceEnt->client && traceEnt->client->ps.duelInProgress &&
ADDRLP4 1144
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1144
INDIRU4
EQU4 $162
ADDRLP4 1148
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1148
INDIRP4
CVPU4 4
ADDRLP4 1144
INDIRU4
EQU4 $162
ADDRLP4 1148
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $162
ADDRLP4 1148
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $162
line 529
;528:			traceEnt->client->ps.duelIndex != ent->s.number)
;529:		{
line 530
;530:			VectorCopy( tr.endpos, start );
ADDRLP4 1084
ADDRLP4 4+12
INDIRB
ASGNB 12
line 531
;531:			ignore = tr.entityNum;
ADDRLP4 1096
ADDRLP4 4+52
INDIRI4
ASGNI4
line 532
;532:			traces++;
ADDRLP4 1100
ADDRLP4 1100
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 533
;533:			continue;
ADDRGP4 $159
JUMPV
LABELV $162
line 536
;534:		}
;535:
;536:		if ( Jedi_DodgeEvasion( traceEnt, ent, &tr, G_GetHitLocation(traceEnt, tr.endpos) ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 1152
ADDRGP4 G_GetHitLocation
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1152
INDIRI4
ARGI4
ADDRLP4 1156
ADDRGP4 Jedi_DodgeEvasion
CALLI4
ASGNI4
ADDRLP4 1156
INDIRI4
CNSTI4 0
EQI4 $166
line 537
;537:		{//act like we didn't even hit him
line 538
;538:			VectorCopy( tr.endpos, start );
ADDRLP4 1084
ADDRLP4 4+12
INDIRB
ASGNB 12
line 539
;539:			ignore = tr.entityNum;
ADDRLP4 1096
ADDRLP4 4+52
INDIRI4
ASGNI4
line 540
;540:			traces++;
ADDRLP4 1100
ADDRLP4 1100
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 541
;541:			continue;
ADDRGP4 $159
JUMPV
LABELV $166
line 543
;542:		}
;543:		else if (traceEnt && traceEnt->client && traceEnt->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] >= FORCE_LEVEL_3)
ADDRLP4 1164
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1164
INDIRU4
EQU4 $160
ADDRLP4 1168
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1168
INDIRP4
CVPU4 4
ADDRLP4 1164
INDIRU4
EQU4 $160
ADDRLP4 1168
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
CNSTI4 3
LTI4 $160
line 544
;544:		{
line 545
;545:			if (WP_SaberCanBlock(traceEnt, tr.endpos, 0, MOD_DISRUPTOR, qtrue, 0))
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 1172
CNSTI4 0
ASGNI4
ADDRLP4 1172
INDIRI4
ARGI4
CNSTI4 7
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 1172
INDIRI4
ARGI4
ADDRLP4 1176
ADDRGP4 WP_SaberCanBlock
CALLI4
ASGNI4
ADDRLP4 1176
INDIRI4
CNSTI4 0
EQI4 $160
line 546
;546:			{ //broadcast and stop the shot because it was blocked
line 547
;547:				gentity_t *te = NULL;
ADDRLP4 1180
CNSTP4 0
ASGNP4
line 549
;548:
;549:				tent = G_TempEntity( tr.endpos, EV_DISRUPTOR_MAIN_SHOT );
ADDRLP4 4+12
ARGP4
CNSTI4 31
ARGI4
ADDRLP4 1184
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1116
ADDRLP4 1184
INDIRP4
ASGNP4
line 550
;550:				VectorCopy( muzzle, tent->s.origin2 );
ADDRLP4 1116
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 551
;551:				tent->s.eventParm = ent->s.number;
ADDRLP4 1116
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 553
;552:
;553:				te = G_TempEntity( tr.endpos, EV_SABER_BLOCK );
ADDRLP4 4+12
ARGP4
CNSTI4 28
ARGI4
ADDRLP4 1188
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1180
ADDRLP4 1188
INDIRP4
ASGNP4
line 554
;554:				VectorCopy(tr.endpos, te->s.origin);
ADDRLP4 1180
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 4+12
INDIRB
ASGNB 12
line 555
;555:				VectorCopy(tr.plane.normal, te->s.angles);
ADDRLP4 1180
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 4+24
INDIRB
ASGNB 12
line 556
;556:				if (!te->s.angles[0] && !te->s.angles[1] && !te->s.angles[2])
ADDRLP4 1196
CNSTF4 0
ASGNF4
ADDRLP4 1180
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
ADDRLP4 1196
INDIRF4
NEF4 $180
ADDRLP4 1180
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ADDRLP4 1196
INDIRF4
NEF4 $180
ADDRLP4 1180
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
ADDRLP4 1196
INDIRF4
NEF4 $180
line 557
;557:				{
line 558
;558:					te->s.angles[1] = 1;
ADDRLP4 1180
INDIRP4
CNSTI4 120
ADDP4
CNSTF4 1065353216
ASGNF4
line 559
;559:				}
LABELV $180
line 560
;560:				te->s.eventParm = 0;
ADDRLP4 1180
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 0
ASGNI4
line 562
;561:
;562:				return;
ADDRGP4 $150
JUMPV
line 564
;563:			}
;564:		}
line 566
;565:		//a Jedi is not dodging this shot
;566:		break;
LABELV $159
line 521
ADDRLP4 1100
INDIRI4
CNSTI4 10
LTI4 $158
LABELV $160
line 569
;567:	}
;568:
;569:	if ( tr.surfaceFlags & SURF_NOIMPACT ) 
ADDRLP4 4+44
INDIRI4
CNSTI4 524288
BANDI4
CNSTI4 0
EQI4 $182
line 570
;570:	{
line 571
;571:		render_impact = qfalse;
ADDRLP4 1124
CNSTI4 0
ASGNI4
line 572
;572:	}
LABELV $182
line 575
;573:
;574:	// always render a shot beam, doing this the old way because I don't much feel like overriding the effect.
;575:	tent = G_TempEntity( tr.endpos, EV_DISRUPTOR_MAIN_SHOT );
ADDRLP4 4+12
ARGP4
CNSTI4 31
ARGI4
ADDRLP4 1136
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1116
ADDRLP4 1136
INDIRP4
ASGNP4
line 576
;576:	VectorCopy( muzzle, tent->s.origin2 );
ADDRLP4 1116
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 577
;577:	tent->s.eventParm = ent->s.number;
ADDRLP4 1116
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 579
;578:
;579:	traceEnt = &g_entities[tr.entityNum];
ADDRLP4 0
CNSTI4 832
ADDRLP4 4+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 581
;580:
;581:	if ( render_impact )
ADDRLP4 1124
INDIRI4
CNSTI4 0
EQI4 $187
line 582
;582:	{
line 583
;583:		if ( tr.entityNum < ENTITYNUM_WORLD && traceEnt->takedamage )
ADDRLP4 4+52
INDIRI4
CNSTI4 1022
GEI4 $189
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 0
EQI4 $189
line 584
;584:		{
line 588
;585:			// Create a simple impact type mark that doesn't last long in the world
;586://			G_PlayEffect( G_EffectIndex( "disruptor/flesh_impact" ), tr.endpos, tr.plane.normal );
;587:
;588:			if ( traceEnt->client && LogAccuracyHit( traceEnt, ent )) 
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $192
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1144
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 1144
INDIRI4
CNSTI4 0
EQI4 $192
line 589
;589:			{
line 590
;590:				ent->client->accuracy_hits++;
ADDRLP4 1148
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1672
ADDP4
ASGNP4
ADDRLP4 1148
INDIRP4
ADDRLP4 1148
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 591
;591:			} 
LABELV $192
line 593
;592:
;593:			G_Damage( traceEnt, ent, ent, forward, tr.endpos, damage, DAMAGE_NORMAL, MOD_DISRUPTOR );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1148
INDIRP4
ARGP4
ADDRLP4 1148
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 1128
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 595
;594:			
;595:			tent = G_TempEntity( tr.endpos, EV_DISRUPTOR_HIT );
ADDRLP4 4+12
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 1152
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1116
ADDRLP4 1152
INDIRP4
ASGNP4
line 596
;596:			tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 1156
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 1116
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 1156
INDIRI4
ASGNI4
line 597
;597:			if (traceEnt->client)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $190
line 598
;598:			{
line 599
;599:				tent->s.weapon = 1;
ADDRLP4 1116
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 1
ASGNI4
line 600
;600:			}
line 601
;601:		}
ADDRGP4 $190
JUMPV
LABELV $189
line 603
;602:		else 
;603:		{
line 605
;604:			 // Hmmm, maybe don't make any marks on things that could break
;605:			tent = G_TempEntity( tr.endpos, EV_DISRUPTOR_SNIPER_MISS );
ADDRLP4 4+12
ARGP4
CNSTI4 33
ARGI4
ADDRLP4 1140
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1116
ADDRLP4 1140
INDIRP4
ASGNP4
line 606
;606:			tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 1144
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 1116
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 1144
INDIRI4
ASGNI4
line 607
;607:			tent->s.weapon = 1;
ADDRLP4 1116
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 1
ASGNI4
line 608
;608:		}
LABELV $190
line 609
;609:	}
LABELV $187
line 610
;610:}
LABELV $150
endproc WP_DisruptorMainFire 1200 32
export WP_DisruptorAltFire
proc WP_DisruptorAltFire 1252 32
line 616
;611:
;612:
;613://---------------------------------------------------------
;614:void WP_DisruptorAltFire( gentity_t *ent )
;615://---------------------------------------------------------
;616:{
line 617
;617:	int			damage = 0, skip;
ADDRLP4 1140
CNSTI4 0
ASGNI4
line 618
;618:	qboolean	render_impact = qtrue;
ADDRLP4 1124
CNSTI4 1
ASGNI4
line 623
;619:	vec3_t		start, end;
;620:	vec3_t		muzzle2;
;621:	trace_t		tr;
;622:	gentity_t	*traceEnt, *tent;
;623:	float		shotRange = 8192;
ADDRLP4 1116
CNSTF4 1174405120
ASGNF4
line 628
;624:	// float	dist, shotDist;
;625:	// vec3_t	spot, dir;
;626:	int			i;
;627:	int			count;
;628:	int			traces = DISRUPTOR_ALT_TRACES;
ADDRLP4 1132
CNSTI4 3
ASGNI4
line 629
;629:	qboolean	fullCharge = qfalse;
ADDRLP4 1128
CNSTI4 0
ASGNI4
line 631
;630:
;631:	damage = DISRUPTOR_ALT_DAMAGE-30;
ADDRLP4 1140
CNSTI4 70
ASGNI4
line 642
;632:
;633:	/*
;634:	if (ent->client->ps.zoomMode == 1 &&
;635:		ent->client->ps.zoomLocked)
;636:	{ //Scale the additional 25 damage based on the zoomFov for the client.
;637:	  //In this instance, zoomFov 1 is minimum zoom while zoomFov 50 is maximum.
;638:		damage += ent->client->ps.zoomFov/2;
;639:	}
;640:	*/
;641:
;642:	VectorCopy( muzzle, muzzle2 ); // making a backup copy
ADDRLP4 1144
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 644
;643:
;644:	if (ent->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $202
line 645
;645:	{
line 646
;646:		VectorCopy( ent->client->ps.origin, start );
ADDRLP4 1088
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 647
;647:		start[2] += ent->client->ps.viewheight;//By eyes
ADDRLP4 1088+8
ADDRLP4 1088+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 649
;648:
;649:		count = ( level.time - ent->client->ps.weaponChargeTime ) / DISRUPTOR_CHARGE_UNIT;
ADDRLP4 1136
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1112014848
DIVF4
CVFI4 4
ASGNI4
line 650
;650:	}
ADDRGP4 $203
JUMPV
LABELV $202
line 652
;651:	else
;652:	{
line 653
;653:		VectorCopy( ent->r.currentOrigin, start );
ADDRLP4 1088
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 654
;654:		start[2] += 24;
ADDRLP4 1088+8
ADDRLP4 1088+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 656
;655:
;656:		count = ( 100 ) / DISRUPTOR_CHARGE_UNIT;
ADDRLP4 1136
CNSTI4 2
ASGNI4
line 657
;657:	}
LABELV $203
line 659
;658:
;659:	count *= 2;
ADDRLP4 1136
ADDRLP4 1136
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 661
;660:
;661:	if ( count < 1 )
ADDRLP4 1136
INDIRI4
CNSTI4 1
GEI4 $207
line 662
;662:	{
line 663
;663:		count = 1;
ADDRLP4 1136
CNSTI4 1
ASGNI4
line 664
;664:	}
ADDRGP4 $208
JUMPV
LABELV $207
line 665
;665:	else if ( count >= 60 )
ADDRLP4 1136
INDIRI4
CNSTI4 60
LTI4 $209
line 666
;666:	{
line 667
;667:		count = 60;
ADDRLP4 1136
CNSTI4 60
ASGNI4
line 668
;668:		fullCharge = qtrue;
ADDRLP4 1128
CNSTI4 1
ASGNI4
line 669
;669:	}
LABELV $209
LABELV $208
line 672
;670:
;671:	// more powerful charges go through more things
;672:	if ( count < 10 )
ADDRLP4 1136
INDIRI4
CNSTI4 10
GEI4 $211
line 673
;673:	{
line 674
;674:		traces = 1;
ADDRLP4 1132
CNSTI4 1
ASGNI4
line 675
;675:	}
ADDRGP4 $212
JUMPV
LABELV $211
line 676
;676:	else if ( count < 20 )
ADDRLP4 1136
INDIRI4
CNSTI4 20
GEI4 $213
line 677
;677:	{
line 678
;678:		traces = 2;
ADDRLP4 1132
CNSTI4 2
ASGNI4
line 679
;679:	}
LABELV $213
LABELV $212
line 681
;680:
;681:	damage += count;
ADDRLP4 1140
ADDRLP4 1140
INDIRI4
ADDRLP4 1136
INDIRI4
ADDI4
ASGNI4
line 683
;682:
;683:	skip = ent->s.number;
ADDRLP4 1112
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 685
;684:
;685:	for (i = 0; i < traces; i++ )
ADDRLP4 1120
CNSTI4 0
ASGNI4
ADDRGP4 $218
JUMPV
LABELV $215
line 686
;686:	{
line 687
;687:		VectorMA( start, shotRange, forward, end );
ADDRLP4 1100
ADDRLP4 1088
INDIRF4
ADDRGP4 forward
INDIRF4
ADDRLP4 1116
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1100+4
ADDRLP4 1088+4
INDIRF4
ADDRGP4 forward+4
INDIRF4
ADDRLP4 1116
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1100+8
ADDRLP4 1088+8
INDIRF4
ADDRGP4 forward+8
INDIRF4
ADDRLP4 1116
INDIRF4
MULF4
ADDF4
ASGNF4
line 689
;688:
;689:		trap_Trace ( &tr, start, NULL, NULL, end, skip, MASK_SHOT);
ADDRLP4 4
ARGP4
ADDRLP4 1088
ARGP4
ADDRLP4 1160
CNSTP4 0
ASGNP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRLP4 1100
ARGP4
ADDRLP4 1112
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 691
;690:
;691:		if ( tr.surfaceFlags & SURF_NOIMPACT ) 
ADDRLP4 4+44
INDIRI4
CNSTI4 524288
BANDI4
CNSTI4 0
EQI4 $225
line 692
;692:		{
line 693
;693:			render_impact = qfalse;
ADDRLP4 1124
CNSTI4 0
ASGNI4
line 694
;694:		}
LABELV $225
line 696
;695:
;696:		traceEnt = &g_entities[tr.entityNum];
ADDRLP4 0
CNSTI4 832
ADDRLP4 4+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 698
;697:
;698:		if (traceEnt && traceEnt->client && traceEnt->client->ps.duelInProgress &&
ADDRLP4 1168
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1168
INDIRU4
EQU4 $229
ADDRLP4 1172
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1172
INDIRP4
CVPU4 4
ADDRLP4 1168
INDIRU4
EQU4 $229
ADDRLP4 1172
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $229
ADDRLP4 1172
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $229
line 700
;699:			traceEnt->client->ps.duelIndex != ent->s.number)
;700:		{
line 701
;701:			skip = tr.entityNum;
ADDRLP4 1112
ADDRLP4 4+52
INDIRI4
ASGNI4
line 702
;702:			VectorCopy(tr.endpos, start);
ADDRLP4 1088
ADDRLP4 4+12
INDIRB
ASGNB 12
line 703
;703:			continue;
ADDRGP4 $216
JUMPV
LABELV $229
line 706
;704:		}
;705:
;706:		if (Jedi_DodgeEvasion(traceEnt, ent, &tr, G_GetHitLocation(traceEnt, tr.endpos)))
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 1176
ADDRGP4 G_GetHitLocation
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1176
INDIRI4
ARGI4
ADDRLP4 1180
ADDRGP4 Jedi_DodgeEvasion
CALLI4
ASGNI4
ADDRLP4 1180
INDIRI4
CNSTI4 0
EQI4 $233
line 707
;707:		{
line 708
;708:			skip = tr.entityNum;
ADDRLP4 1112
ADDRLP4 4+52
INDIRI4
ASGNI4
line 709
;709:			VectorCopy(tr.endpos, start);
ADDRLP4 1088
ADDRLP4 4+12
INDIRB
ASGNB 12
line 710
;710:			continue;
ADDRGP4 $216
JUMPV
LABELV $233
line 712
;711:		}
;712:		else if (traceEnt && traceEnt->client && traceEnt->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] >= FORCE_LEVEL_3)
ADDRLP4 1188
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1188
INDIRU4
EQU4 $238
ADDRLP4 1192
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1192
INDIRP4
CVPU4 4
ADDRLP4 1188
INDIRU4
EQU4 $238
ADDRLP4 1192
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
CNSTI4 3
LTI4 $238
line 713
;713:		{
line 714
;714:			if (WP_SaberCanBlock(traceEnt, tr.endpos, 0, MOD_DISRUPTOR_SNIPER, qtrue, 0))
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 1196
CNSTI4 0
ASGNI4
ADDRLP4 1196
INDIRI4
ARGI4
CNSTI4 9
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 1196
INDIRI4
ARGI4
ADDRLP4 1200
ADDRGP4 WP_SaberCanBlock
CALLI4
ASGNI4
ADDRLP4 1200
INDIRI4
CNSTI4 0
EQI4 $240
line 715
;715:			{ //broadcast and stop the shot because it was blocked
line 716
;716:				gentity_t *te = NULL;
ADDRLP4 1204
CNSTP4 0
ASGNP4
line 718
;717:
;718:				tent = G_TempEntity( tr.endpos, EV_DISRUPTOR_SNIPER_SHOT );
ADDRLP4 4+12
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 1208
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1084
ADDRLP4 1208
INDIRP4
ASGNP4
line 719
;719:				VectorCopy( muzzle, tent->s.origin2 );
ADDRLP4 1084
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 720
;720:				tent->s.shouldtarget = fullCharge;
ADDRLP4 1084
INDIRP4
CNSTI4 268
ADDP4
ADDRLP4 1128
INDIRI4
ASGNI4
line 721
;721:				tent->s.eventParm = ent->s.number;
ADDRLP4 1084
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 723
;722:
;723:				te = G_TempEntity( tr.endpos, EV_SABER_BLOCK );
ADDRLP4 4+12
ARGP4
CNSTI4 28
ARGI4
ADDRLP4 1212
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1204
ADDRLP4 1212
INDIRP4
ASGNP4
line 724
;724:				VectorCopy(tr.endpos, te->s.origin);
ADDRLP4 1204
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 4+12
INDIRB
ASGNB 12
line 725
;725:				VectorCopy(tr.plane.normal, te->s.angles);
ADDRLP4 1204
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 4+24
INDIRB
ASGNB 12
line 726
;726:				if (!te->s.angles[0] && !te->s.angles[1] && !te->s.angles[2])
ADDRLP4 1220
CNSTF4 0
ASGNF4
ADDRLP4 1204
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
ADDRLP4 1220
INDIRF4
NEF4 $247
ADDRLP4 1204
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ADDRLP4 1220
INDIRF4
NEF4 $247
ADDRLP4 1204
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
ADDRLP4 1220
INDIRF4
NEF4 $247
line 727
;727:				{
line 728
;728:					te->s.angles[1] = 1;
ADDRLP4 1204
INDIRP4
CNSTI4 120
ADDP4
CNSTF4 1065353216
ASGNF4
line 729
;729:				}
LABELV $247
line 730
;730:				te->s.eventParm = 0;
ADDRLP4 1204
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 0
ASGNI4
line 732
;731:
;732:				return;
ADDRGP4 $201
JUMPV
LABELV $240
line 734
;733:			}
;734:		}
LABELV $238
line 737
;735:
;736:		// always render a shot beam, doing this the old way because I don't much feel like overriding the effect.
;737:		tent = G_TempEntity( tr.endpos, EV_DISRUPTOR_SNIPER_SHOT );
ADDRLP4 4+12
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 1196
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1084
ADDRLP4 1196
INDIRP4
ASGNP4
line 738
;738:		VectorCopy( muzzle, tent->s.origin2 );
ADDRLP4 1084
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 739
;739:		tent->s.shouldtarget = fullCharge;
ADDRLP4 1084
INDIRP4
CNSTI4 268
ADDP4
ADDRLP4 1128
INDIRI4
ASGNI4
line 740
;740:		tent->s.eventParm = ent->s.number;
ADDRLP4 1084
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 743
;741:
;742:		// If the beam hits a skybox, etc. it would look foolish to add impact effects
;743:		if ( render_impact ) 
ADDRLP4 1124
INDIRI4
CNSTI4 0
EQI4 $217
line 744
;744:		{
line 745
;745:			if ( traceEnt->takedamage && traceEnt->client )
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 0
EQI4 $252
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $252
line 746
;746:			{
line 747
;747:				tent->s.otherEntityNum = traceEnt->s.number;
ADDRLP4 1084
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 751
;748:
;749:				// Create a simple impact type mark
;750://				G_PlayEffect( G_EffectIndex( "disruptor/alt_hit" ), tr.endpos, tr.plane.normal );
;751:				tent = G_TempEntity(tr.endpos, EV_MISSILE_MISS);
ADDRLP4 4+12
ARGP4
CNSTI4 74
ARGI4
ADDRLP4 1204
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1084
ADDRLP4 1204
INDIRP4
ASGNP4
line 752
;752:				tent->s.eventParm = DirToByte(tr.plane.normal);
ADDRLP4 4+24
ARGP4
ADDRLP4 1208
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 1084
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 1208
INDIRI4
ASGNI4
line 753
;753:				tent->s.eFlags |= EF_ALT_FIRING;
ADDRLP4 1212
ADDRLP4 1084
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 1212
INDIRP4
ADDRLP4 1212
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 755
;754:	
;755:				if ( LogAccuracyHit( traceEnt, ent )) 
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1216
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 1216
INDIRI4
CNSTI4 0
EQI4 $253
line 756
;756:				{
line 757
;757:					if (ent->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $253
line 758
;758:					{
line 759
;759:						ent->client->accuracy_hits++;
ADDRLP4 1220
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1672
ADDP4
ASGNP4
ADDRLP4 1220
INDIRP4
ADDRLP4 1220
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 760
;760:					}
line 761
;761:				}
line 762
;762:			} 
ADDRGP4 $253
JUMPV
LABELV $252
line 764
;763:			else 
;764:			{
line 765
;765:				 if ( traceEnt->r.svFlags & SVF_GLASS_BRUSH 
ADDRLP4 1208
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 134217728
BANDI4
ADDRLP4 1208
INDIRI4
NEI4 $263
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
ADDRLP4 1208
INDIRI4
NEI4 $263
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 6
NEI4 $260
LABELV $263
line 768
;766:						|| traceEnt->takedamage 
;767:						|| traceEnt->s.eType == ET_MOVER )
;768:				 {
line 770
;769:					//rww - is there some reason this was doing nothing?
;770:					if ( traceEnt->takedamage )
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 0
EQI4 $217
line 771
;771:					{
line 772
;772:						G_Damage( traceEnt, ent, ent, forward, tr.endpos, damage, 
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1212
INDIRP4
ARGP4
ADDRLP4 1212
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 1140
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 9
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 775
;773:								DAMAGE_NO_KNOCKBACK/*|DAMAGE_HALF_ARMOR_REDUCTION*/, MOD_DISRUPTOR_SNIPER );
;774:
;775:						tent = G_TempEntity( tr.endpos, EV_DISRUPTOR_HIT );
ADDRLP4 4+12
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 1216
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1084
ADDRLP4 1216
INDIRP4
ASGNP4
line 776
;776:						tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 1220
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 1084
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 1220
INDIRI4
ASGNI4
line 777
;777:					}
line 778
;778:				 }
ADDRGP4 $217
JUMPV
LABELV $260
line 780
;779:				 else
;780:				 {
line 782
;781:					 // Hmmm, maybe don't make any marks on things that could break
;782:					tent = G_TempEntity( tr.endpos, EV_DISRUPTOR_SNIPER_MISS );
ADDRLP4 4+12
ARGP4
CNSTI4 33
ARGI4
ADDRLP4 1212
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1084
ADDRLP4 1212
INDIRP4
ASGNP4
line 783
;783:					tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 1216
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 1084
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 1216
INDIRI4
ASGNI4
line 784
;784:				 }
line 785
;785:				break; // and don't try any more traces
ADDRGP4 $217
JUMPV
LABELV $253
line 788
;786:			}
;787:
;788:			if ( traceEnt->takedamage )
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 0
EQI4 $251
line 789
;789:			{
line 791
;790:				vec3_t preAng;
;791:				int preHealth = traceEnt->health;
ADDRLP4 1204
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ASGNI4
line 792
;792:				int preLegs = 0;
ADDRLP4 1208
CNSTI4 0
ASGNI4
line 793
;793:				int preTorso = 0;
ADDRLP4 1212
CNSTI4 0
ASGNI4
line 795
;794:
;795:				if (traceEnt->client)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $273
line 796
;796:				{
line 797
;797:					preLegs = traceEnt->client->ps.legsAnim;
ADDRLP4 1208
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ASGNI4
line 798
;798:					preTorso = traceEnt->client->ps.torsoAnim;
ADDRLP4 1212
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
line 799
;799:					VectorCopy(traceEnt->client->ps.viewangles, preAng);
ADDRLP4 1216
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 800
;800:				}
LABELV $273
line 802
;801:
;802:				G_Damage( traceEnt, ent, ent, forward, tr.endpos, damage, DAMAGE_NO_KNOCKBACK, MOD_DISRUPTOR_SNIPER );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1228
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1228
INDIRP4
ARGP4
ADDRLP4 1228
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 1140
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 9
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 804
;803:
;804:				if (traceEnt->client && preHealth > 0 && traceEnt->health <= 0 && fullCharge)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $276
ADDRLP4 1236
CNSTI4 0
ASGNI4
ADDRLP4 1204
INDIRI4
ADDRLP4 1236
INDIRI4
LEI4 $276
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 1236
INDIRI4
GTI4 $276
ADDRLP4 1128
INDIRI4
ADDRLP4 1236
INDIRI4
EQI4 $276
line 805
;805:				{ //was killed by a fully charged sniper shot, so disintegrate
line 806
;806:					VectorCopy(preAng, traceEnt->client->ps.viewangles);
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 1216
INDIRB
ASGNB 12
line 808
;807:
;808:					traceEnt->client->ps.eFlags |= EF_DISINTEGRATION;
ADDRLP4 1240
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 1240
INDIRP4
ADDRLP4 1240
INDIRP4
INDIRI4
CNSTI4 33554432
BORI4
ASGNI4
line 809
;809:					VectorCopy(tr.endpos, traceEnt->client->ps.lastHitLoc);
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1368
ADDP4
ADDRLP4 4+12
INDIRB
ASGNB 12
line 811
;810:
;811:					traceEnt->client->ps.legsAnim = preLegs;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 1208
INDIRI4
ASGNI4
line 812
;812:					traceEnt->client->ps.torsoAnim = preTorso;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
ADDRLP4 1212
INDIRI4
ASGNI4
line 814
;813:
;814:					traceEnt->r.contents = 0;
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 816
;815:
;816:					VectorClear(traceEnt->client->ps.velocity);
ADDRLP4 1244
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1248
CNSTF4 0
ASGNF4
ADDRLP4 1244
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 1248
INDIRF4
ASGNF4
ADDRLP4 1244
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 1248
INDIRF4
ASGNF4
ADDRLP4 1244
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 1248
INDIRF4
ASGNF4
line 817
;817:				}
LABELV $276
line 819
;818:
;819:				tent = G_TempEntity( tr.endpos, EV_DISRUPTOR_HIT );
ADDRLP4 4+12
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 1240
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1084
ADDRLP4 1240
INDIRP4
ASGNP4
line 820
;820:				tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 1244
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 1084
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 1244
INDIRI4
ASGNI4
line 821
;821:				if (traceEnt->client)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $251
line 822
;822:				{
line 823
;823:					tent->s.weapon = 1;
ADDRLP4 1084
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 1
ASGNI4
line 824
;824:				}
line 825
;825:			}
line 826
;826:		}
line 828
;827:		else // not rendering impact, must be a skybox or other similar thing?
;828:		{
line 829
;829:			break; // don't try anymore traces
LABELV $251
line 833
;830:		}
;831:
;832:		// Get ready for an attempt to trace through another person
;833:		VectorCopy( tr.endpos, muzzle );
ADDRGP4 muzzle
ADDRLP4 4+12
INDIRB
ASGNB 12
line 834
;834:		VectorCopy( tr.endpos, start );
ADDRLP4 1088
ADDRLP4 4+12
INDIRB
ASGNB 12
line 835
;835:		skip = tr.entityNum;
ADDRLP4 1112
ADDRLP4 4+52
INDIRI4
ASGNI4
line 836
;836:	}
LABELV $216
line 685
ADDRLP4 1120
ADDRLP4 1120
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $218
ADDRLP4 1120
INDIRI4
ADDRLP4 1132
INDIRI4
LTI4 $215
LABELV $217
line 837
;837:}
LABELV $201
endproc WP_DisruptorAltFire 1252 32
proc WP_FireDisruptor 20 4
line 843
;838:
;839:
;840://---------------------------------------------------------
;841:static void WP_FireDisruptor( gentity_t *ent, qboolean altFire )
;842://---------------------------------------------------------
;843:{
line 844
;844:	if (!ent || !ent->client || ent->client->ps.zoomMode != 1)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $290
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $290
ADDRLP4 8
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 1
EQI4 $287
LABELV $290
line 845
;845:	{ //do not ever let it do the alt fire when not zoomed
line 846
;846:		altFire = qfalse;
ADDRFP4 4
CNSTI4 0
ASGNI4
line 847
;847:	}
LABELV $287
line 849
;848:
;849:	if (ent && ent->s.eType == ET_GRAPPLE && !ent->client)
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
CNSTU4 0
ASGNU4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $291
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $291
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
NEU4 $291
line 850
;850:	{ //special case for animents
line 851
;851:		WP_DisruptorAltFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_DisruptorAltFire
CALLV
pop
line 852
;852:		return;
ADDRGP4 $286
JUMPV
LABELV $291
line 855
;853:	}
;854:
;855:	if ( altFire )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $293
line 856
;856:	{
line 857
;857:		WP_DisruptorAltFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_DisruptorAltFire
CALLV
pop
line 858
;858:	}
ADDRGP4 $294
JUMPV
LABELV $293
line 860
;859:	else
;860:	{
line 861
;861:		WP_DisruptorMainFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_DisruptorMainFire
CALLV
pop
line 862
;862:	}
LABELV $294
line 863
;863:}
LABELV $286
endproc WP_FireDisruptor 20 4
proc WP_BowcasterAltFire 28 24
line 875
;864:
;865:
;866:/*
;867:======================================================================
;868:
;869:BOWCASTER
;870:
;871:======================================================================
;872:*/
;873:
;874:static void WP_BowcasterAltFire( gentity_t *ent )
;875:{
line 876
;876:	int	damage	= BOWCASTER_DAMAGE;
ADDRLP4 4
CNSTI4 50
ASGNI4
line 878
;877:
;878:	gentity_t *missile = CreateMissile( muzzle, forward, BOWCASTER_VELOCITY, 10000, ent, qfalse);
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
CNSTF4 1151500288
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 880
;879:
;880:	missile->classname = "bowcaster_proj";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $296
ASGNP4
line 881
;881:	missile->s.weapon = WP_BOWCASTER;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 6
ASGNI4
line 883
;882:
;883:	VectorSet( missile->r.maxs, BOWCASTER_SIZE, BOWCASTER_SIZE, BOWCASTER_SIZE );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1073741824
ASGNF4
line 884
;884:	VectorScale( missile->r.maxs, -1, missile->r.mins );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
MULF4
ASGNF4
line 886
;885:
;886:	missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 887
;887:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 128
ASGNI4
line 888
;888:	missile->methodOfDeath = MOD_BOWCASTER;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 10
ASGNI4
line 889
;889:	missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 262913
ASGNI4
line 893
;890://	missile->splashDamage = BOWCASTER_SPLASH_DAMAGE;
;891://	missile->splashRadius = BOWCASTER_SPLASH_RADIUS;
;892:
;893:	missile->s.eFlags |= EF_BOUNCE;
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 894
;894:	missile->bounceCount = 3;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 3
ASGNI4
line 895
;895:}
LABELV $295
endproc WP_BowcasterAltFire 28 24
proc WP_BowcasterMainFire 80 24
line 900
;896:
;897://---------------------------------------------------------
;898:static void WP_BowcasterMainFire( gentity_t *ent )
;899://---------------------------------------------------------
;900:{
line 901
;901:	int			damage	= BOWCASTER_DAMAGE, count;
ADDRLP4 40
CNSTI4 50
ASGNI4
line 907
;902:	float		vel;
;903:	vec3_t		angs, dir;
;904:	gentity_t	*missile;
;905:	int i;
;906:
;907:	if (!ent->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $298
line 908
;908:	{
line 909
;909:		count = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 910
;910:	}
ADDRGP4 $299
JUMPV
LABELV $298
line 912
;911:	else
;912:	{
line 913
;913:		count = ( level.time - ent->client->ps.weaponChargeTime ) / BOWCASTER_CHARGE_UNIT;
ADDRLP4 20
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1128792064
DIVF4
CVFI4 4
ASGNI4
line 914
;914:	}
LABELV $299
line 916
;915:
;916:	if ( count < 1 )
ADDRLP4 20
INDIRI4
CNSTI4 1
GEI4 $301
line 917
;917:	{
line 918
;918:		count = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 919
;919:	}
ADDRGP4 $302
JUMPV
LABELV $301
line 920
;920:	else if ( count > 5 )
ADDRLP4 20
INDIRI4
CNSTI4 5
LEI4 $303
line 921
;921:	{
line 922
;922:		count = 5;
ADDRLP4 20
CNSTI4 5
ASGNI4
line 923
;923:	}
LABELV $303
LABELV $302
line 925
;924:
;925:	if ( !(count & 1 ))
ADDRLP4 20
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $305
line 926
;926:	{
line 928
;927:		// if we aren't odd, knock us down a level
;928:		count--;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 929
;929:	}
LABELV $305
line 932
;930:
;931:	//scale the damage down based on how many are about to be fired
;932:	if (count <= 1)
ADDRLP4 20
INDIRI4
CNSTI4 1
GTI4 $307
line 933
;933:	{
line 934
;934:		damage = 50;
ADDRLP4 40
CNSTI4 50
ASGNI4
line 935
;935:	}
ADDRGP4 $308
JUMPV
LABELV $307
line 936
;936:	else if (count == 2)
ADDRLP4 20
INDIRI4
CNSTI4 2
NEI4 $309
line 937
;937:	{
line 938
;938:		damage = 45;
ADDRLP4 40
CNSTI4 45
ASGNI4
line 939
;939:	}
ADDRGP4 $310
JUMPV
LABELV $309
line 940
;940:	else if (count == 3)
ADDRLP4 20
INDIRI4
CNSTI4 3
NEI4 $311
line 941
;941:	{
line 942
;942:		damage = 40;
ADDRLP4 40
CNSTI4 40
ASGNI4
line 943
;943:	}
ADDRGP4 $312
JUMPV
LABELV $311
line 944
;944:	else if (count == 4)
ADDRLP4 20
INDIRI4
CNSTI4 4
NEI4 $313
line 945
;945:	{
line 946
;946:		damage = 35;
ADDRLP4 40
CNSTI4 35
ASGNI4
line 947
;947:	}
ADDRGP4 $314
JUMPV
LABELV $313
line 949
;948:	else
;949:	{
line 950
;950:		damage = 30;
ADDRLP4 40
CNSTI4 30
ASGNI4
line 951
;951:	}
LABELV $314
LABELV $312
LABELV $310
LABELV $308
line 953
;952:
;953:	for (i = 0; i < count; i++ )
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $318
JUMPV
LABELV $315
line 954
;954:	{
line 956
;955:		// create a range of different velocities
;956:		vel = BOWCASTER_VELOCITY * ( crandom() * BOWCASTER_VEL_RANGE + 1.0f );
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 24
CNSTF4 1151500288
CNSTF4 1050253722
CNSTF4 1073741824
ADDRLP4 44
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1065353216
ADDF4
MULF4
ASGNF4
line 958
;957:
;958:		vectoangles( forward, angs );
ADDRGP4 forward
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 961
;959:
;960:		// add some slop to the alt-fire direction
;961:		angs[PITCH] += crandom() * BOWCASTER_ALT_SPREAD * 0.2f;
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1045220557
CNSTF4 1084227584
CNSTF4 1073741824
ADDRLP4 48
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
MULF4
ADDF4
ASGNF4
line 962
;962:		angs[YAW]	+= ((i+0.5f) * BOWCASTER_ALT_SPREAD - count * 0.5f * BOWCASTER_ALT_SPREAD );
ADDRLP4 52
CNSTF4 1084227584
ASGNF4
ADDRLP4 56
CNSTF4 1056964608
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
ADDRLP4 52
INDIRF4
ADDRLP4 16
INDIRI4
CVIF4 4
ADDRLP4 56
INDIRF4
ADDF4
MULF4
ADDRLP4 52
INDIRF4
ADDRLP4 56
INDIRF4
ADDRLP4 20
INDIRI4
CVIF4 4
MULF4
MULF4
SUBF4
ADDF4
ASGNF4
line 964
;963:		
;964:		AngleVectors( angs, dir, NULL, NULL );
ADDRLP4 4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 60
CNSTP4 0
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 966
;965:
;966:		missile = CreateMissile( muzzle, dir, vel, 10000, ent, qtrue );
ADDRGP4 muzzle
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 24
INDIRF4
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 64
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 64
INDIRP4
ASGNP4
line 968
;967:
;968:		missile->classname = "bowcaster_alt_proj";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $320
ASGNP4
line 969
;969:		missile->s.weapon = WP_BOWCASTER;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 6
ASGNI4
line 971
;970:
;971:		VectorSet( missile->r.maxs, BOWCASTER_SIZE, BOWCASTER_SIZE, BOWCASTER_SIZE );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1073741824
ASGNF4
line 972
;972:		VectorScale( missile->r.maxs, -1, missile->r.mins );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
MULF4
ASGNF4
line 974
;973:
;974:		missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 975
;975:		missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 128
ASGNI4
line 976
;976:		missile->methodOfDeath = MOD_BOWCASTER;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 10
ASGNI4
line 977
;977:		missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 262913
ASGNI4
line 982
;978://		missile->splashDamage = BOWCASTER_SPLASH_DAMAGE;
;979://		missile->splashRadius = BOWCASTER_SPLASH_RADIUS;
;980:
;981:		// we don't want it to bounce
;982:		missile->bounceCount = 0;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 0
ASGNI4
line 983
;983:	}
LABELV $316
line 953
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $318
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
LTI4 $315
line 984
;984:}
LABELV $297
endproc WP_BowcasterMainFire 80 24
proc WP_FireBowcaster 0 4
line 989
;985:
;986://---------------------------------------------------------
;987:static void WP_FireBowcaster( gentity_t *ent, qboolean altFire )
;988://---------------------------------------------------------
;989:{
line 990
;990:	if ( altFire )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $322
line 991
;991:	{
line 992
;992:		WP_BowcasterAltFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_BowcasterAltFire
CALLV
pop
line 993
;993:	}
ADDRGP4 $323
JUMPV
LABELV $322
line 995
;994:	else
;995:	{
line 996
;996:		WP_BowcasterMainFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_BowcasterMainFire
CALLV
pop
line 997
;997:	}
LABELV $323
line 998
;998:}
LABELV $321
endproc WP_FireBowcaster 0 4
proc WP_RepeaterMainFire 12 24
line 1013
;999:
;1000:
;1001:
;1002:/*
;1003:======================================================================
;1004:
;1005:REPEATER
;1006:
;1007:======================================================================
;1008:*/
;1009:
;1010://---------------------------------------------------------
;1011:static void WP_RepeaterMainFire( gentity_t *ent, vec3_t dir )
;1012://---------------------------------------------------------
;1013:{
line 1014
;1014:	int	damage	= REPEATER_DAMAGE;
ADDRLP4 4
CNSTI4 14
ASGNI4
line 1016
;1015:
;1016:	gentity_t *missile = CreateMissile( muzzle, dir, REPEATER_VELOCITY, 10000, ent, qfalse );
ADDRGP4 muzzle
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTF4 1153957888
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1018
;1017:
;1018:	missile->classname = "repeater_proj";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $325
ASGNP4
line 1019
;1019:	missile->s.weapon = WP_REPEATER;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 7
ASGNI4
line 1021
;1020:
;1021:	missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1022
;1022:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 128
ASGNI4
line 1023
;1023:	missile->methodOfDeath = MOD_REPEATER;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 11
ASGNI4
line 1024
;1024:	missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 262913
ASGNI4
line 1027
;1025:
;1026:	// we don't want it to bounce forever
;1027:	missile->bounceCount = 8;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 8
ASGNI4
line 1028
;1028:}
LABELV $324
endproc WP_RepeaterMainFire 12 24
proc WP_RepeaterAltFire 28 24
line 1033
;1029:
;1030://---------------------------------------------------------
;1031:static void WP_RepeaterAltFire( gentity_t *ent )
;1032://---------------------------------------------------------
;1033:{
line 1034
;1034:	int	damage	= REPEATER_ALT_DAMAGE;
ADDRLP4 4
CNSTI4 60
ASGNI4
line 1036
;1035:
;1036:	gentity_t *missile = CreateMissile( muzzle, forward, REPEATER_ALT_VELOCITY, 10000, ent, qtrue );
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
CNSTF4 1149861888
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1038
;1037:
;1038:	missile->classname = "repeater_alt_proj";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $327
ASGNP4
line 1039
;1039:	missile->s.weapon = WP_REPEATER;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 7
ASGNI4
line 1042
;1040://	missile->mass = 10;		// NOTENOTE No mass yet
;1041:
;1042:	VectorSet( missile->r.maxs, REPEATER_ALT_SIZE, REPEATER_ALT_SIZE, REPEATER_ALT_SIZE );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1077936128
ASGNF4
line 1043
;1043:	VectorScale( missile->r.maxs, -1, missile->r.mins );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
MULF4
ASGNF4
line 1044
;1044:	missile->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 1045
;1045:	missile->s.pos.trDelta[2] += 40.0f; //give a slight boost in the upward direction
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CNSTF4 1109393408
ADDF4
ASGNF4
line 1046
;1046:	missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1047
;1047:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 128
ASGNI4
line 1048
;1048:	missile->methodOfDeath = MOD_REPEATER_ALT;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 12
ASGNI4
line 1049
;1049:	missile->splashMethodOfDeath = MOD_REPEATER_ALT_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 13
ASGNI4
line 1050
;1050:	missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 262913
ASGNI4
line 1051
;1051:	missile->splashDamage = REPEATER_ALT_SPLASH_DAMAGE;
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
CNSTI4 60
ASGNI4
line 1052
;1052:	missile->splashRadius = REPEATER_ALT_SPLASH_RADIUS;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
CNSTI4 128
ASGNI4
line 1055
;1053:
;1054:	// we don't want it to bounce forever
;1055:	missile->bounceCount = 8;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 8
ASGNI4
line 1056
;1056:}
LABELV $326
endproc WP_RepeaterAltFire 28 24
proc WP_FireRepeater 36 16
line 1061
;1057:
;1058://---------------------------------------------------------
;1059:static void WP_FireRepeater( gentity_t *ent, qboolean altFire )
;1060://---------------------------------------------------------
;1061:{
line 1064
;1062:	vec3_t	dir, angs;
;1063:
;1064:	vectoangles( forward, angs );
ADDRGP4 forward
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1066
;1065:
;1066:	if ( altFire )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $329
line 1067
;1067:	{
line 1068
;1068:		WP_RepeaterAltFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_RepeaterAltFire
CALLV
pop
line 1069
;1069:	}
ADDRGP4 $330
JUMPV
LABELV $329
line 1071
;1070:	else
;1071:	{
line 1073
;1072:		// add some slop to the alt-fire direction
;1073:		angs[PITCH] += crandom() * REPEATER_SPREAD;
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1068708659
CNSTF4 1073741824
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 1074
;1074:		angs[YAW]	+= crandom() * REPEATER_SPREAD;
ADDRLP4 28
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1068708659
CNSTF4 1073741824
ADDRLP4 28
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 1076
;1075:
;1076:		AngleVectors( angs, dir, NULL, NULL );
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 32
CNSTP4 0
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1079
;1077:
;1078:		// NOTENOTE if temp_org does not have clear trace to inside the bbox, don't shoot!
;1079:		WP_RepeaterMainFire( ent, dir );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 WP_RepeaterMainFire
CALLV
pop
line 1080
;1080:	}
LABELV $330
line 1081
;1081:}
LABELV $328
endproc WP_FireRepeater 36 16
proc WP_DEMP2_MainFire 24 24
line 1093
;1082:
;1083:
;1084:/*
;1085:======================================================================
;1086:
;1087:DEMP2
;1088:
;1089:======================================================================
;1090:*/
;1091:
;1092:static void WP_DEMP2_MainFire( gentity_t *ent )
;1093:{
line 1094
;1094:	int	damage	= DEMP2_DAMAGE;
ADDRLP4 4
CNSTI4 35
ASGNI4
line 1096
;1095:
;1096:	gentity_t *missile = CreateMissile( muzzle, forward, DEMP2_VELOCITY, 10000, ent, qfalse);
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
CNSTF4 1155596288
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1098
;1097:
;1098:	missile->classname = "demp2_proj";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $333
ASGNP4
line 1099
;1099:	missile->s.weapon = WP_DEMP2;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 8
ASGNI4
line 1101
;1100:
;1101:	VectorSet( missile->r.maxs, DEMP2_SIZE, DEMP2_SIZE, DEMP2_SIZE );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1073741824
ASGNF4
line 1102
;1102:	VectorScale( missile->r.maxs, -1, missile->r.mins );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
MULF4
ASGNF4
line 1103
;1103:	missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1104
;1104:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 128
ASGNI4
line 1105
;1105:	missile->methodOfDeath = MOD_DEMP2;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 14
ASGNI4
line 1107
;1106:	//rww - Don't want this blockable, do we?
;1107:	missile->clipmask = MASK_SHOT;// | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 769
ASGNI4
line 1110
;1108:
;1109:	// we don't want it to ever bounce
;1110:	missile->bounceCount = 0;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 0
ASGNI4
line 1111
;1111:}
LABELV $332
endproc WP_DEMP2_MainFire 24 24
export DEMP2_AltRadiusDamage
proc DEMP2_AltRadiusDamage 8324 32
line 1116
;1112:
;1113:static gentity_t *ent_list[MAX_GENTITIES];
;1114:
;1115:void DEMP2_AltRadiusDamage( gentity_t *ent )
;1116:{
line 1117
;1117:	float		frac = ( level.time - ent->bolt_Head ) / 800.0f; // / 1600.0f; // synchronize with demp2 effect
ADDRLP4 8268
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1145569280
DIVF4
ASGNF4
line 1122
;1118:	float		dist, radius, fact;
;1119:	gentity_t	*gent;
;1120:	int			iEntityList[MAX_GENTITIES];
;1121:	gentity_t	*entityList[MAX_GENTITIES];
;1122:	gentity_t	*myOwner = NULL;
ADDRLP4 44
CNSTP4 0
ASGNP4
line 1127
;1123:	int			numListedEntities, i, e;
;1124:	vec3_t		mins, maxs;
;1125:	vec3_t		v, dir;
;1126:
;1127:	if (ent->r.ownerNum >= 0 &&
ADDRLP4 8276
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8276
INDIRI4
CNSTI4 0
LTI4 $336
ADDRLP4 8276
INDIRI4
CNSTI4 32
GEI4 $336
line 1129
;1128:		ent->r.ownerNum < MAX_CLIENTS)
;1129:	{
line 1130
;1130:		myOwner = &g_entities[ent->r.ownerNum];
ADDRLP4 44
CNSTI4 832
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1131
;1131:	}
LABELV $336
line 1133
;1132:
;1133:	if (!myOwner || !myOwner->inuse || !myOwner->client)
ADDRLP4 8284
CNSTU4 0
ASGNU4
ADDRLP4 44
INDIRP4
CVPU4 4
ADDRLP4 8284
INDIRU4
EQU4 $341
ADDRLP4 44
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $341
ADDRLP4 44
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8284
INDIRU4
NEU4 $338
LABELV $341
line 1134
;1134:	{
line 1135
;1135:		ent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 1136
;1136:		ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1137
;1137:		return;
ADDRGP4 $334
JUMPV
LABELV $338
line 1140
;1138:	}
;1139:
;1140:	frac *= frac * frac; // yes, this is completely ridiculous...but it causes the shell to grow slowly then "explode" at the end
ADDRLP4 8268
ADDRLP4 8268
INDIRF4
ADDRLP4 8268
INDIRF4
ADDRLP4 8268
INDIRF4
MULF4
MULF4
ASGNF4
line 1142
;1141:	
;1142:	radius = frac * 200.0f; // 200 is max radius...the model is aprox. 100 units tall...the fx draw code mults. this by 2.
ADDRLP4 32
CNSTF4 1128792064
ADDRLP4 8268
INDIRF4
MULF4
ASGNF4
line 1144
;1143:
;1144:	fact = ent->count*0.6;
ADDRLP4 8272
CNSTF4 1058642330
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 1146
;1145:
;1146:	if (fact < 1)
ADDRLP4 8272
INDIRF4
CNSTF4 1065353216
GEF4 $343
line 1147
;1147:	{
line 1148
;1148:		fact = 1;
ADDRLP4 8272
CNSTF4 1065353216
ASGNF4
line 1149
;1149:	}
LABELV $343
line 1151
;1150:
;1151:	radius *= fact;
ADDRLP4 32
ADDRLP4 32
INDIRF4
ADDRLP4 8272
INDIRF4
MULF4
ASGNF4
line 1153
;1152:
;1153:	for ( i = 0 ; i < 3 ; i++ ) 
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $345
line 1154
;1154:	{
line 1155
;1155:		mins[i] = ent->r.currentOrigin[i] - radius;
ADDRLP4 8292
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8292
INDIRI4
ADDRLP4 8244
ADDP4
ADDRLP4 8292
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDP4
INDIRF4
ADDRLP4 32
INDIRF4
SUBF4
ASGNF4
line 1156
;1156:		maxs[i] = ent->r.currentOrigin[i] + radius;
ADDRLP4 8296
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8296
INDIRI4
ADDRLP4 8256
ADDP4
ADDRLP4 8296
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDF4
ASGNF4
line 1157
;1157:	}
LABELV $346
line 1153
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $345
line 1159
;1158:
;1159:	numListedEntities = trap_EntitiesInBox( mins, maxs, iEntityList, MAX_GENTITIES );
ADDRLP4 8244
ARGP4
ADDRLP4 8256
ARGP4
ADDRLP4 4148
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 8292
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 48
ADDRLP4 8292
INDIRI4
ASGNI4
line 1161
;1160:
;1161:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $350
JUMPV
LABELV $349
line 1163
;1162:	while (i < numListedEntities)
;1163:	{
line 1164
;1164:		entityList[i] = &g_entities[iEntityList[i]];
ADDRLP4 8296
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8296
INDIRI4
ADDRLP4 52
ADDP4
CNSTI4 832
ADDRLP4 8296
INDIRI4
ADDRLP4 4148
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1165
;1165:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1166
;1166:	}
LABELV $350
line 1162
ADDRLP4 0
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $349
line 1168
;1167:
;1168:	for ( e = 0 ; e < numListedEntities ; e++ ) 
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRGP4 $355
JUMPV
LABELV $352
line 1169
;1169:	{
line 1170
;1170:		gent = entityList[ e ];
ADDRLP4 4
ADDRLP4 36
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 52
ADDP4
INDIRP4
ASGNP4
line 1172
;1171:
;1172:		if ( !gent || !gent->takedamage || !gent->r.contents )
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $359
ADDRLP4 8300
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
ADDRLP4 8300
INDIRI4
EQI4 $359
ADDRLP4 4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
ADDRLP4 8300
INDIRI4
NEI4 $356
LABELV $359
line 1173
;1173:		{
line 1174
;1174:			continue;
ADDRGP4 $353
JUMPV
LABELV $356
line 1178
;1175:		}
;1176:
;1177:		// find the distance from the edge of the bounding box
;1178:		for ( i = 0 ; i < 3 ; i++ ) 
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $360
line 1179
;1179:		{
line 1180
;1180:			if ( ent->r.currentOrigin[i] < gent->r.absmin[i] ) 
ADDRLP4 8304
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8304
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDP4
INDIRF4
ADDRLP4 8304
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRF4
GEF4 $364
line 1181
;1181:			{
line 1182
;1182:				v[i] = gent->r.absmin[i] - ent->r.currentOrigin[i];
ADDRLP4 8308
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8308
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 8308
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRF4
ADDRLP4 8308
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1183
;1183:			} 
ADDRGP4 $365
JUMPV
LABELV $364
line 1184
;1184:			else if ( ent->r.currentOrigin[i] > gent->r.absmax[i] ) 
ADDRLP4 8308
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8308
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDP4
INDIRF4
ADDRLP4 8308
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRF4
LEF4 $366
line 1185
;1185:			{
line 1186
;1186:				v[i] = ent->r.currentOrigin[i] - gent->r.absmax[i];
ADDRLP4 8312
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8312
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 8312
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDP4
INDIRF4
ADDRLP4 8312
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1187
;1187:			} 
ADDRGP4 $367
JUMPV
LABELV $366
line 1189
;1188:			else 
;1189:			{
line 1190
;1190:				v[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTF4 0
ASGNF4
line 1191
;1191:			}
LABELV $367
LABELV $365
line 1192
;1192:		}
LABELV $361
line 1178
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $360
line 1195
;1193:
;1194:		// shape is an ellipsoid, so cut vertical distance in half`
;1195:		v[2] *= 0.5f;
ADDRLP4 8+8
CNSTF4 1056964608
ADDRLP4 8+8
INDIRF4
MULF4
ASGNF4
line 1197
;1196:
;1197:		dist = VectorLength( v );
ADDRLP4 8
ARGP4
ADDRLP4 8304
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 8304
INDIRF4
ASGNF4
line 1199
;1198:
;1199:		if ( dist >= radius ) 
ADDRLP4 40
INDIRF4
ADDRLP4 32
INDIRF4
LTF4 $369
line 1200
;1200:		{
line 1202
;1201:			// shockwave hasn't hit them yet
;1202:			continue;
ADDRGP4 $353
JUMPV
LABELV $369
line 1206
;1203:		}
;1204:
;1205:		//if ( dist < ent->bolt_LArm )
;1206:		if (dist+(16*ent->count) < ent->bolt_LArm)
ADDRLP4 8308
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRF4
ADDRLP4 8308
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 4
LSHI4
CVIF4 4
ADDF4
ADDRLP4 8308
INDIRP4
CNSTI4 788
ADDP4
INDIRI4
CVIF4 4
GEF4 $371
line 1207
;1207:		{
line 1209
;1208:			// shockwave has already hit this thing...
;1209:			continue;
ADDRGP4 $353
JUMPV
LABELV $371
line 1212
;1210:		}
;1211:
;1212:		VectorCopy( gent->r.currentOrigin, v );
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 1213
;1213:		VectorSubtract( v, ent->r.currentOrigin, dir);
ADDRLP4 8312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 8
INDIRF4
ADDRLP4 8312
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 8+4
INDIRF4
ADDRLP4 8312
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20+8
ADDRLP4 8+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1216
;1214:
;1215:		// push the center of mass higher than the origin so players get knocked into the air more
;1216:		dir[2] += 12;
ADDRLP4 20+8
ADDRLP4 20+8
INDIRF4
CNSTF4 1094713344
ADDF4
ASGNF4
line 1218
;1217:
;1218:		if (gent != myOwner)
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 44
INDIRP4
CVPU4 4
EQU4 $378
line 1219
;1219:		{
line 1220
;1220:			G_Damage( gent, myOwner, myOwner, dir, ent->r.currentOrigin, ent->damage, DAMAGE_DEATH_KNOCKBACK, ent->splashMethodOfDeath );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 8320
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8320
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 8320
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ARGI4
CNSTI4 128
ARGI4
ADDRLP4 8320
INDIRP4
CNSTI4 708
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1221
;1221:		}
LABELV $378
line 1222
;1222:	}
LABELV $353
line 1168
ADDRLP4 36
ADDRLP4 36
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $355
ADDRLP4 36
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $352
line 1225
;1223:
;1224:	// store the last fraction so that next time around we can test against those things that fall between that last point and where the current shockwave edge is
;1225:	ent->bolt_LArm = radius;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 1227
;1226:
;1227:	if ( frac < 1.0f )
ADDRLP4 8268
INDIRF4
CNSTF4 1065353216
GEF4 $380
line 1228
;1228:	{
line 1230
;1229:		// shock is still happening so continue letting it expand
;1230:		ent->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 1231
;1231:	}
ADDRGP4 $381
JUMPV
LABELV $380
line 1233
;1232:	else
;1233:	{ //don't just leave the entity around
line 1234
;1234:		ent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 1235
;1235:		ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1236
;1236:	}
LABELV $381
line 1237
;1237:}
LABELV $334
endproc DEMP2_AltRadiusDamage 8324 32
export DEMP2_AltDetonate
proc DEMP2_AltDetonate 24 12
line 1242
;1238:
;1239://---------------------------------------------------------
;1240:void DEMP2_AltDetonate( gentity_t *ent )
;1241://---------------------------------------------------------
;1242:{
line 1245
;1243:	gentity_t *efEnt;
;1244:
;1245:	G_SetOrigin( ent, ent->r.currentOrigin );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1246
;1246:	if (!ent->pos1[0] && !ent->pos1[1] && !ent->pos1[2])
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
NEF4 $385
ADDRLP4 8
INDIRP4
CNSTI4 552
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
NEF4 $385
ADDRLP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
NEF4 $385
line 1247
;1247:	{ //don't play effect with a 0'd out directional vector
line 1248
;1248:		ent->pos1[1] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
CNSTF4 1065353216
ASGNF4
line 1249
;1249:	}
LABELV $385
line 1251
;1250:	//Let's just save ourself some bandwidth and play both the effect and sphere spawn in 1 event
;1251:	efEnt = G_PlayEffect( EFFECT_EXPLOSION_DEMP2ALT, ent->r.currentOrigin, ent->pos1 );
CNSTI4 9
ARGI4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 548
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 G_PlayEffect
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 1253
;1252:
;1253:	if (efEnt)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $387
line 1254
;1254:	{
line 1255
;1255:		efEnt->s.weapon = ent->count*2;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 1256
;1256:	}
LABELV $387
line 1258
;1257:
;1258:	ent->bolt_Head = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1259
;1259:	ent->bolt_LArm = 0;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
CNSTI4 0
ASGNI4
line 1260
;1260:	ent->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 1261
;1261:	ent->think = DEMP2_AltRadiusDamage;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 DEMP2_AltRadiusDamage
ASGNP4
line 1262
;1262:	ent->s.eType = ET_GENERAL; // make us a missile no longer
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 1263
;1263:}
LABELV $384
endproc DEMP2_AltDetonate 24 12
proc WP_DEMP2_AltFire 1152 28
line 1268
;1264:
;1265://---------------------------------------------------------
;1266:static void WP_DEMP2_AltFire( gentity_t *ent )
;1267://---------------------------------------------------------
;1268:{
line 1269
;1269:	int		damage	= DEMP2_ALT_DAMAGE;
ADDRLP4 32
CNSTI4 8
ASGNI4
line 1276
;1270:	int		count, origcount;
;1271:	float	fact;
;1272:	vec3_t	start, end;
;1273:	trace_t	tr;
;1274:	gentity_t *missile;
;1275:
;1276:	VectorCopy( muzzle, start );
ADDRLP4 8
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 1278
;1277:
;1278:	VectorMA( start, DEMP2_ALT_RANGE, forward, end );
ADDRLP4 1124
CNSTF4 1166016512
ASGNF4
ADDRLP4 20
ADDRLP4 8
INDIRF4
ADDRLP4 1124
INDIRF4
ADDRGP4 forward
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 8+4
INDIRF4
ADDRLP4 1124
INDIRF4
ADDRGP4 forward+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 20+8
ADDRLP4 8+8
INDIRF4
CNSTF4 1166016512
ADDRGP4 forward+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1280
;1279:
;1280:	count = ( level.time - ent->client->ps.weaponChargeTime ) / DEMP2_CHARGE_UNIT;
ADDRLP4 4
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1143930880
DIVF4
CVFI4 4
ASGNI4
line 1282
;1281:
;1282:	origcount = count;
ADDRLP4 1120
ADDRLP4 4
INDIRI4
ASGNI4
line 1284
;1283:
;1284:	if ( count < 1 )
ADDRLP4 4
INDIRI4
CNSTI4 1
GEI4 $399
line 1285
;1285:	{
line 1286
;1286:		count = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 1287
;1287:	}
ADDRGP4 $400
JUMPV
LABELV $399
line 1288
;1288:	else if ( count > 3 )
ADDRLP4 4
INDIRI4
CNSTI4 3
LEI4 $401
line 1289
;1289:	{
line 1290
;1290:		count = 3;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 1291
;1291:	}
LABELV $401
LABELV $400
line 1293
;1292:
;1293:	fact = count*0.8;
ADDRLP4 36
CNSTF4 1061997773
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 1294
;1294:	if (fact < 1)
ADDRLP4 36
INDIRF4
CNSTF4 1065353216
GEF4 $403
line 1295
;1295:	{
line 1296
;1296:		fact = 1;
ADDRLP4 36
CNSTF4 1065353216
ASGNF4
line 1297
;1297:	}
LABELV $403
line 1298
;1298:	damage *= fact;
ADDRLP4 32
ADDRLP4 32
INDIRI4
CVIF4 4
ADDRLP4 36
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1300
;1299:
;1300:	if (!origcount)
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $405
line 1301
;1301:	{ //this was just a tap-fire
line 1302
;1302:		damage = 1;
ADDRLP4 32
CNSTI4 1
ASGNI4
line 1303
;1303:	}
LABELV $405
line 1307
;1304:
;1305:	//damage *= ( 1 + ( count * ( count - 1 )));// yields damage of 12,36,84...gives a higher bonus for longer charge
;1306:
;1307:	trap_Trace( &tr, start, NULL, NULL, end, ent->s.number, MASK_SHOT);
ADDRLP4 40
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 1128
CNSTP4 0
ASGNP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1312
;1308:
;1309:	// we treat the trace fraction like it's a time value, meaning that the shot can travel a whopping 4096 units in 1 second
;1310:
;1311:	//missile = CreateMissile( start, forward, DEMP2_ALT_RANGE, tr.fraction * 1000/*time*/, ent, qtrue );
;1312:	missile = G_Spawn();
ADDRLP4 1132
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1132
INDIRP4
ASGNP4
line 1313
;1313:	G_SetOrigin(missile, tr.endpos);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 40+12
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1316
;1314:	//rww - I guess it's rather pointless making it a missile anyway, at least for MP.
;1315:
;1316:	VectorCopy( tr.plane.normal, missile->pos1 );
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
ADDRLP4 40+24
INDIRB
ASGNB 12
line 1318
;1317:
;1318:	missile->count = count;
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1320
;1319:
;1320:	missile->classname = "demp2_alt_proj";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $409
ASGNP4
line 1321
;1321:	missile->s.weapon = WP_DEMP2;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 8
ASGNI4
line 1323
;1322:
;1323:	missile->think = DEMP2_AltDetonate;
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 DEMP2_AltDetonate
ASGNP4
line 1324
;1324:	missile->nextthink = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1326
;1325:
;1326:	missile->splashDamage = missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 1327
;1327:	missile->splashMethodOfDeath = missile->methodOfDeath = MOD_DEMP2;
ADDRLP4 1148
CNSTI4 14
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRLP4 1148
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRLP4 1148
INDIRI4
ASGNI4
line 1328
;1328:	missile->splashRadius = DEMP2_ALT_SPLASHRADIUS;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
CNSTI4 256
ASGNI4
line 1330
;1329:
;1330:	missile->r.ownerNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1332
;1331:
;1332:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 128
ASGNI4
line 1333
;1333:	missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 262913
ASGNI4
line 1336
;1334:
;1335:	// we don't want it to ever bounce
;1336:	missile->bounceCount = 0;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 0
ASGNI4
line 1337
;1337:}
LABELV $391
endproc WP_DEMP2_AltFire 1152 28
proc WP_FireDEMP2 0 4
line 1342
;1338:
;1339://---------------------------------------------------------
;1340:static void WP_FireDEMP2( gentity_t *ent, qboolean altFire )
;1341://---------------------------------------------------------
;1342:{
line 1343
;1343:	if ( altFire )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $412
line 1344
;1344:	{
line 1345
;1345:		WP_DEMP2_AltFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_DEMP2_AltFire
CALLV
pop
line 1346
;1346:	}
ADDRGP4 $413
JUMPV
LABELV $412
line 1348
;1347:	else
;1348:	{
line 1349
;1349:		WP_DEMP2_MainFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_DEMP2_MainFire
CALLV
pop
line 1350
;1350:	}
LABELV $413
line 1351
;1351:}
LABELV $411
endproc WP_FireDEMP2 0 4
proc WP_FlechetteMainFire 60 24
line 1366
;1352:
;1353:
;1354:
;1355:/*
;1356:======================================================================
;1357:
;1358:FLECHETTE
;1359:
;1360:======================================================================
;1361:*/
;1362:
;1363://---------------------------------------------------------
;1364:static void WP_FlechetteMainFire( gentity_t *ent )
;1365://---------------------------------------------------------
;1366:{
line 1371
;1367:	vec3_t		fwd, angs;
;1368:	gentity_t	*missile;
;1369:	int i;
;1370:
;1371:	for (i = 0; i < FLECHETTE_SHOTS; i++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $415
line 1372
;1372:	{
line 1373
;1373:		vectoangles( forward, angs );
ADDRGP4 forward
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1375
;1374:
;1375:		if ( i == 0 )
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $419
line 1376
;1376:		{
line 1378
;1377:			// do nothing on the first shot, this one will hit the crosshairs
;1378:		}
ADDRGP4 $420
JUMPV
LABELV $419
line 1380
;1379:		else
;1380:		{
line 1381
;1381:			angs[PITCH] += crandom() * FLECHETTE_SPREAD;
ADDRLP4 32
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 8
INDIRF4
CNSTF4 1082130432
CNSTF4 1073741824
ADDRLP4 32
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 1382
;1382:			angs[YAW]	+= crandom() * FLECHETTE_SPREAD;
ADDRLP4 36
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8+4
ADDRLP4 8+4
INDIRF4
CNSTF4 1082130432
CNSTF4 1073741824
ADDRLP4 36
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 1383
;1383:		}
LABELV $420
line 1385
;1384:
;1385:		AngleVectors( angs, fwd, NULL, NULL );
ADDRLP4 8
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 32
CNSTP4 0
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1387
;1386:
;1387:		missile = CreateMissile( muzzle, fwd, FLECHETTE_VEL, 10000, ent, qfalse);
ADDRGP4 muzzle
ARGP4
ADDRLP4 20
ARGP4
CNSTF4 1163575296
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 36
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
ASGNP4
line 1389
;1388:
;1389:		missile->classname = "flech_proj";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $422
ASGNP4
line 1390
;1390:		missile->s.weapon = WP_FLECHETTE;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 9
ASGNI4
line 1392
;1391:
;1392:		VectorSet( missile->r.maxs, FLECHETTE_SIZE, FLECHETTE_SIZE, FLECHETTE_SIZE );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1065353216
ASGNF4
line 1393
;1393:		VectorScale( missile->r.maxs, -1, missile->r.mins );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
MULF4
ASGNF4
line 1395
;1394:
;1395:		missile->damage = FLECHETTE_DAMAGE;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 12
ASGNI4
line 1396
;1396:		missile->dflags = DAMAGE_DEATH_KNOCKBACK;// | DAMAGE_EXTRA_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 128
ASGNI4
line 1397
;1397:		missile->methodOfDeath = MOD_FLECHETTE;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 16
ASGNI4
line 1398
;1398:		missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 262913
ASGNI4
line 1401
;1399:
;1400:		// we don't want it to bounce forever
;1401:		missile->bounceCount = Q_irand(5,8);
CNSTI4 5
ARGI4
CNSTI4 8
ARGI4
ADDRLP4 52
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRLP4 52
INDIRI4
ASGNI4
line 1403
;1402:
;1403:		missile->s.eFlags |= EF_BOUNCE_SHRAPNEL;
ADDRLP4 56
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1404
;1404:	}
LABELV $416
line 1371
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 5
LTI4 $415
line 1405
;1405:}
LABELV $414
endproc WP_FlechetteMainFire 60 24
export prox_mine_think
proc prox_mine_think 32 20
line 1410
;1406:
;1407://---------------------------------------------------------
;1408:void prox_mine_think( gentity_t *ent )
;1409://---------------------------------------------------------
;1410:{
line 1412
;1411:	int			count, i;
;1412:	qboolean	blow = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1415
;1413:
;1414:	// if it isn't time to auto-explode, do a small proximity check
;1415:	if ( ent->delay > level.time )
ADDRFP4 0
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $424
line 1416
;1416:	{
line 1417
;1417:		count = G_RadiusList( ent->r.currentOrigin, FLECHETTE_MINE_RADIUS_CHECK, ent, qtrue, ent_list );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTF4 1132462080
ARGF4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ent_list
ARGP4
ADDRLP4 16
ADDRGP4 G_RadiusList
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 1419
;1418:
;1419:		for ( i = 0; i < count; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $430
JUMPV
LABELV $427
line 1420
;1420:		{
line 1421
;1421:			if ( ent_list[i]->client && ent_list[i]->health > 0 && ent->activator && ent_list[i]->s.number != ent->activator->s.number )
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ent_list
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
CNSTU4 0
ASGNU4
ADDRLP4 20
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $431
ADDRLP4 20
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
LEI4 $431
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $431
ADDRLP4 20
INDIRP4
INDIRI4
ADDRLP4 28
INDIRP4
INDIRI4
EQI4 $431
line 1422
;1422:			{
line 1423
;1423:				blow = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 1424
;1424:				break;
ADDRGP4 $425
JUMPV
LABELV $431
line 1426
;1425:			}
;1426:		}
LABELV $428
line 1419
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $430
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $427
line 1427
;1427:	}
ADDRGP4 $425
JUMPV
LABELV $424
line 1429
;1428:	else
;1429:	{
line 1431
;1430:		// well, we must die now
;1431:		blow = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 1432
;1432:	}
LABELV $425
line 1434
;1433:
;1434:	if ( blow )
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $433
line 1435
;1435:	{
line 1437
;1436:		//G_Sound( ent, G_SoundIndex( "sound/weapons/flechette/warning.wav" ));
;1437:		ent->think = laserTrapExplode;//thinkF_WP_Explode;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 laserTrapExplode
ASGNP4
line 1438
;1438:		ent->nextthink = level.time + 200;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 1439
;1439:	}
ADDRGP4 $434
JUMPV
LABELV $433
line 1441
;1440:	else
;1441:	{
line 1443
;1442:		// we probably don't need to do this thinking logic very often...maybe this is fast enough?
;1443:		ent->nextthink = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 1444
;1444:	}
LABELV $434
line 1445
;1445:}
LABELV $423
endproc prox_mine_think 32 20
proc WP_TraceSetStart 1132 28
line 1450
;1446:
;1447://-----------------------------------------------------------------------------
;1448:static void WP_TraceSetStart( gentity_t *ent, vec3_t start, vec3_t mins, vec3_t maxs )
;1449://-----------------------------------------------------------------------------
;1450:{
line 1456
;1451:	//make sure our start point isn't on the other side of a wall
;1452:	trace_t	tr;
;1453:	vec3_t	entMins;
;1454:	vec3_t	entMaxs;
;1455:
;1456:	VectorAdd( ent->r.currentOrigin, ent->r.mins, entMins );
ADDRLP4 1104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1080
ADDRLP4 1104
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 1104
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1080+4
ADDRLP4 1104
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 1104
INDIRP4
CNSTI4 320
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1080+8
ADDRLP4 1108
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 1108
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1457
;1457:	VectorAdd( ent->r.currentOrigin, ent->r.maxs, entMaxs );
ADDRLP4 1112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1092
ADDRLP4 1112
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 1112
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1092+4
ADDRLP4 1112
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 1112
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1092+8
ADDRLP4 1116
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 1116
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1459
;1458:
;1459:	if ( G_BoxInBounds( start, mins, maxs, entMins, entMaxs ) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 1080
ARGP4
ADDRLP4 1092
ARGP4
ADDRLP4 1120
ADDRGP4 G_BoxInBounds
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
EQI4 $442
line 1460
;1460:	{
line 1461
;1461:		return;
ADDRGP4 $437
JUMPV
LABELV $442
line 1464
;1462:	}
;1463:
;1464:	if ( !ent->client )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $444
line 1465
;1465:	{
line 1466
;1466:		return;
ADDRGP4 $437
JUMPV
LABELV $444
line 1469
;1467:	}
;1468:
;1469:	trap_Trace( &tr, ent->client->ps.origin, mins, maxs, start, ent->s.number, MASK_SOLID|CONTENTS_SHOTCLIP );
ADDRLP4 0
ARGP4
ADDRLP4 1124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1124
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1124
INDIRP4
INDIRI4
ARGI4
CNSTI4 129
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1471
;1470:
;1471:	if ( tr.startsolid || tr.allsolid )
ADDRLP4 1128
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 1128
INDIRI4
NEI4 $449
ADDRLP4 0
INDIRI4
ADDRLP4 1128
INDIRI4
EQI4 $446
LABELV $449
line 1472
;1472:	{
line 1473
;1473:		return;
ADDRGP4 $437
JUMPV
LABELV $446
line 1476
;1474:	}
;1475:
;1476:	if ( tr.fraction < 1.0f )
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $450
line 1477
;1477:	{
line 1478
;1478:		VectorCopy( tr.endpos, start );
ADDRFP4 4
INDIRP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 1479
;1479:	}
LABELV $450
line 1480
;1480:}
LABELV $437
endproc WP_TraceSetStart 1132 28
export WP_ExplosiveDie
proc WP_ExplosiveDie 0 4
line 1483
;1481:
;1482:void WP_ExplosiveDie(gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod)
;1483:{
line 1484
;1484:	laserTrapExplode(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 laserTrapExplode
CALLV
pop
line 1485
;1485:}
LABELV $454
endproc WP_ExplosiveDie 0 4
export WP_flechette_alt_blow
proc WP_flechette_alt_blow 0 4
line 1490
;1486:
;1487://----------------------------------------------
;1488:void WP_flechette_alt_blow( gentity_t *ent )
;1489://----------------------------------------------
;1490:{
line 1497
;1491:	/*BG_EvaluateTrajectory( &ent->s.pos, level.time, ent->r.currentOrigin ); // Not sure if this is even necessary, but correct origins are cool?
;1492:
;1493:	G_RadiusDamage( ent->r.currentOrigin, &g_entities[ent->r.ownerNum], ent->splashDamage, ent->splashRadius, NULL, MOD_FLECHETTE_ALT_SPLASH );
;1494:	G_PlayEffect( "flechette/alt_blow", ent->currentOrigin );
;1495:	G_FreeEntity( ent );*/
;1496:
;1497:	ent->s.pos.trDelta[0] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1065353216
ASGNF4
line 1498
;1498:	ent->s.pos.trDelta[1] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
line 1499
;1499:	ent->s.pos.trDelta[2] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 0
ASGNF4
line 1501
;1500:
;1501:	laserTrapExplode(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 laserTrapExplode
CALLV
pop
line 1502
;1502:}
LABELV $455
endproc WP_flechette_alt_blow 0 4
proc WP_CreateFlechetteBouncyThing 20 24
line 1507
;1503:
;1504://------------------------------------------------------------------------------
;1505:static void WP_CreateFlechetteBouncyThing( vec3_t start, vec3_t fwd, gentity_t *self )
;1506://------------------------------------------------------------------------------
;1507:{
line 1508
;1508:	gentity_t	*missile = CreateMissile( start, fwd, 700 + random() * 700, 1500 + random() * 2000, self, qtrue );
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTF4 1143930880
ADDRLP4 4
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1143930880
ADDF4
ARGF4
CNSTF4 1157234688
ADDRLP4 8
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1153138688
ADDF4
CVFI4 4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 12
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 1510
;1509:	
;1510:	missile->think = WP_flechette_alt_blow;
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 WP_flechette_alt_blow
ASGNP4
line 1512
;1511:
;1512:	missile->activator = self;
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 1514
;1513:
;1514:	missile->s.weapon = WP_FLECHETTE;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 9
ASGNI4
line 1515
;1515:	missile->classname = "flech_alt";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $457
ASGNP4
line 1516
;1516:	missile->mass = 4;
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
CNSTF4 1082130432
ASGNF4
line 1519
;1517:
;1518:	// How 'bout we give this thing a size...
;1519:	VectorSet( missile->r.mins, -3.0f, -3.0f, -3.0f );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3225419776
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3225419776
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3225419776
ASGNF4
line 1520
;1520:	VectorSet( missile->r.maxs, 3.0f, 3.0f, 3.0f );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1077936128
ASGNF4
line 1521
;1521:	missile->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 769
ASGNI4
line 1523
;1522:
;1523:	missile->touch = touch_NULL;
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 touch_NULL
ASGNP4
line 1526
;1524:
;1525:	// normal ones bounce, alt ones explode on impact
;1526:	missile->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 1528
;1527:
;1528:	missile->s.eFlags |= (EF_BOUNCE_HALF|EF_ALT_FIRING);
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 544
BORI4
ASGNI4
line 1530
;1529:
;1530:	missile->bounceCount = 50;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 50
ASGNI4
line 1532
;1531:
;1532:	missile->damage = FLECHETTE_ALT_DAMAGE;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 60
ASGNI4
line 1533
;1533:	missile->dflags = 0;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 0
ASGNI4
line 1534
;1534:	missile->splashDamage = FLECHETTE_ALT_SPLASH_DAM;
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
CNSTI4 60
ASGNI4
line 1535
;1535:	missile->splashRadius = FLECHETTE_ALT_SPLASH_RAD;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
CNSTI4 128
ASGNI4
line 1537
;1536:
;1537:	missile->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 128
ASGNI4
line 1539
;1538:
;1539:	missile->methodOfDeath = MOD_FLECHETTE_ALT_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 17
ASGNI4
line 1540
;1540:	missile->splashMethodOfDeath = MOD_FLECHETTE_ALT_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 17
ASGNI4
line 1543
;1541:	//missile->splashMethodOfDeath = MOD_UNKNOWN;//MOD_THERMAL_SPLASH;
;1542:
;1543:	VectorCopy( start, missile->pos2 );
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 1544
;1544:}
LABELV $456
endproc WP_CreateFlechetteBouncyThing 20 24
proc WP_FlechetteAltFire 72 16
line 1549
;1545:
;1546://---------------------------------------------------------
;1547:static void WP_FlechetteAltFire( gentity_t *self )
;1548://---------------------------------------------------------
;1549:{
line 1553
;1550:	vec3_t 	dir, fwd, start, angs;
;1551:	int i;
;1552:
;1553:	vectoangles( forward, angs );
ADDRGP4 forward
ARGP4
ADDRLP4 40
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1554
;1554:	VectorCopy( muzzle, start );
ADDRLP4 28
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 1556
;1555:
;1556:	WP_TraceSetStart( self, start, vec3_origin, vec3_origin );//make sure our start point isn't on the other side of a wall
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 52
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 WP_TraceSetStart
CALLV
pop
line 1558
;1557:
;1558:	for ( i = 0; i < 2; i++ )
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $459
line 1559
;1559:	{
line 1560
;1560:		VectorCopy( angs, dir );
ADDRLP4 0
ADDRLP4 40
INDIRB
ASGNB 12
line 1562
;1561:
;1562:		dir[PITCH] -= random() * 4 + 8; // make it fly upwards
ADDRLP4 56
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1082130432
ADDRLP4 56
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1090519040
ADDF4
SUBF4
ASGNF4
line 1563
;1563:		dir[YAW] += crandom() * 2;
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 64
CNSTF4 1073741824
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 64
INDIRF4
ADDRLP4 64
INDIRF4
ADDRLP4 60
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 1564
;1564:		AngleVectors( dir, fwd, NULL, NULL );
ADDRLP4 0
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 68
CNSTP4 0
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1566
;1565:
;1566:		WP_CreateFlechetteBouncyThing( start, fwd, self );
ADDRLP4 28
ARGP4
ADDRLP4 16
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_CreateFlechetteBouncyThing
CALLV
pop
line 1567
;1567:	}
LABELV $460
line 1558
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 2
LTI4 $459
line 1568
;1568:}
LABELV $458
endproc WP_FlechetteAltFire 72 16
proc WP_FireFlechette 0 4
line 1573
;1569:
;1570://---------------------------------------------------------
;1571:static void WP_FireFlechette( gentity_t *ent, qboolean altFire )
;1572://---------------------------------------------------------
;1573:{
line 1574
;1574:	if ( altFire )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $465
line 1575
;1575:	{
line 1577
;1576:		//WP_FlechetteProxMine( ent );
;1577:		WP_FlechetteAltFire(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_FlechetteAltFire
CALLV
pop
line 1578
;1578:	}
ADDRGP4 $466
JUMPV
LABELV $465
line 1580
;1579:	else
;1580:	{
line 1581
;1581:		WP_FlechetteMainFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_FlechetteMainFire
CALLV
pop
line 1582
;1582:	}
LABELV $466
line 1583
;1583:}
LABELV $464
endproc WP_FireFlechette 0 4
lit
align 4
LABELV $468
byte 4 0
byte 4 0
byte 4 1065353216
export rocketThink
code
proc rocketThink 124 12
line 1598
;1584:
;1585:
;1586:
;1587:/*
;1588:======================================================================
;1589:
;1590:ROCKET LAUNCHER
;1591:
;1592:======================================================================
;1593:*/
;1594:
;1595://---------------------------------------------------------
;1596:void rocketThink( gentity_t *ent )
;1597://---------------------------------------------------------
;1598:{
line 1600
;1599:	vec3_t newdir, targetdir, 
;1600:			up={0,0,1}, right; 
ADDRLP4 56
ADDRGP4 $468
INDIRB
ASGNB 12
line 1604
;1601:	vec3_t	org;
;1602:	float dot, dot2, dis;
;1603:	int i;
;1604:	float vel = ROCKET_VELOCITY;
ADDRLP4 40
CNSTF4 1147207680
ASGNF4
line 1606
;1605:
;1606:	if (!ent->enemy || !ent->enemy->client || ent->enemy->health < 1)
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
ASGNP4
ADDRLP4 84
CNSTU4 0
ASGNU4
ADDRLP4 80
INDIRP4
CVPU4 4
ADDRLP4 84
INDIRU4
EQU4 $472
ADDRLP4 80
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 84
INDIRU4
EQU4 $472
ADDRLP4 80
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 1
GEI4 $469
LABELV $472
line 1607
;1607:	{
line 1608
;1608:		ent->nextthink = level.time + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 1609
;1609:		ent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 1610
;1610:		return;
ADDRGP4 $467
JUMPV
LABELV $469
line 1613
;1611:	}
;1612:
;1613:	if ( ent->enemy && ent->enemy->inuse )
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $474
ADDRLP4 88
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $474
line 1614
;1614:	{	
line 1615
;1615:		VectorCopy( ent->enemy->r.currentOrigin, org );
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 1616
;1616:		org[2] += (ent->enemy->r.mins[2] + ent->enemy->r.maxs[2]) * 0.5f;
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28+8
ADDRLP4 28+8
INDIRF4
CNSTF4 1056964608
ADDRLP4 92
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 1618
;1617:
;1618:		VectorSubtract( org, ent->r.currentOrigin, targetdir );
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 28
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 28+4
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 28+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1619
;1619:		VectorNormalize( targetdir );
ADDRLP4 16
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1622
;1620:
;1621:		// Now the rocket can't do a 180 in space, so we'll limit the turn to about 45 degrees.
;1622:		dot = DotProduct( targetdir, ent->movedir );
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
ADDRLP4 16
INDIRF4
ADDRLP4 100
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
MULF4
ADDRLP4 16+4
INDIRF4
ADDRLP4 100
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 16+8
INDIRF4
ADDRLP4 100
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1625
;1623:
;1624:		// a dot of 1.0 means right-on-target.
;1625:		if ( dot < 0.0f )
ADDRLP4 68
INDIRF4
CNSTF4 0
GEF4 $483
line 1626
;1626:		{	
line 1628
;1627:			// Go in the direction opposite, start a 180.
;1628:			CrossProduct( ent->movedir, up, right );
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 44
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 1629
;1629:			dot2 = DotProduct( targetdir, right );
ADDRLP4 76
ADDRLP4 16
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDRLP4 16+4
INDIRF4
ADDRLP4 44+4
INDIRF4
MULF4
ADDF4
ADDRLP4 16+8
INDIRF4
ADDRLP4 44+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1631
;1630:
;1631:			if ( dot2 > 0 )
ADDRLP4 76
INDIRF4
CNSTF4 0
LEF4 $489
line 1632
;1632:			{	
line 1634
;1633:				// Turn 45 degrees right.
;1634:				VectorMA( ent->movedir, 0.4f, right, newdir );
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
CNSTF4 1053609165
ASGNF4
ADDRLP4 4
ADDRLP4 104
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 104
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 44+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
CNSTF4 1053609165
ADDRLP4 44+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1635
;1635:			}
ADDRGP4 $490
JUMPV
LABELV $489
line 1637
;1636:			else
;1637:			{	
line 1639
;1638:				// Turn 45 degrees left.
;1639:				VectorMA(ent->movedir, -0.4f, right, newdir);
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
CNSTF4 3201092813
ASGNF4
ADDRLP4 4
ADDRLP4 104
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 104
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 44+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
CNSTF4 3201092813
ADDRLP4 44+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1640
;1640:			}
LABELV $490
line 1643
;1641:
;1642:			// Yeah we've adjusted horizontally, but let's split the difference vertically, so we kinda try to move towards it.
;1643:			newdir[2] = ( targetdir[2] + ent->movedir[2] ) * 0.5;
ADDRLP4 4+8
CNSTF4 1056964608
ADDRLP4 16+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ADDF4
MULF4
ASGNF4
line 1646
;1644:
;1645:			// let's also slow down a lot
;1646:			vel *= 0.5f;
ADDRLP4 40
CNSTF4 1056964608
ADDRLP4 40
INDIRF4
MULF4
ASGNF4
line 1647
;1647:		}
ADDRGP4 $484
JUMPV
LABELV $483
line 1648
;1648:		else if ( dot < 0.70f )
ADDRLP4 68
INDIRF4
CNSTF4 1060320051
GEF4 $501
line 1649
;1649:		{	
line 1651
;1650:			// Still a bit off, so we turn a bit softer
;1651:			VectorMA( ent->movedir, 0.5f, targetdir, newdir );
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
CNSTF4 1056964608
ASGNF4
ADDRLP4 4
ADDRLP4 104
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 104
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 16+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 16+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1652
;1652:		}
ADDRGP4 $502
JUMPV
LABELV $501
line 1654
;1653:		else
;1654:		{	
line 1656
;1655:			// getting close, so turn a bit harder
;1656:			VectorMA( ent->movedir, 0.9f, targetdir, newdir );
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
CNSTF4 1063675494
ASGNF4
ADDRLP4 4
ADDRLP4 104
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 104
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 16+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
CNSTF4 1063675494
ADDRLP4 16+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1657
;1657:		}
LABELV $502
LABELV $484
line 1660
;1658:
;1659:		// add crazy drunkenness
;1660:		for (i = 0; i < 3; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $511
line 1661
;1661:		{
line 1662
;1662:			newdir[i] += crandom() * ent->random * 0.25f;
ADDRLP4 104
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 108
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRF4
CNSTF4 1048576000
CNSTF4 1073741824
ADDRLP4 104
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 1663
;1663:		}
LABELV $512
line 1660
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $511
line 1666
;1664:
;1665:		// decay the randomness
;1666:		ent->random *= 0.9f;
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
CNSTF4 1063675494
ADDRLP4 104
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1669
;1667:
;1668:		// Try to crash into the ground if we get close enough to do splash damage
;1669:		dis = Distance( ent->r.currentOrigin, org );
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 108
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 72
ADDRLP4 108
INDIRF4
ASGNF4
line 1671
;1670:
;1671:		if ( dis < 128 )
ADDRLP4 72
INDIRF4
CNSTF4 1124073472
GEF4 $515
line 1672
;1672:		{
line 1674
;1673:			// the closer we get, the more we push the rocket down, heh heh.
;1674:			newdir[2] -= (1.0f - (dis / 128.0f)) * 0.6f;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CNSTF4 1058642330
CNSTF4 1065353216
ADDRLP4 72
INDIRF4
CNSTF4 1124073472
DIVF4
SUBF4
MULF4
SUBF4
ASGNF4
line 1675
;1675:		}
LABELV $515
line 1677
;1676:
;1677:		VectorNormalize( newdir );
ADDRLP4 4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1679
;1678:
;1679:		VectorScale( newdir, vel * 0.5f, ent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRLP4 40
INDIRF4
MULF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 4+4
INDIRF4
CNSTF4 1056964608
ADDRLP4 40
INDIRF4
MULF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 4+8
INDIRF4
CNSTF4 1056964608
ADDRLP4 40
INDIRF4
MULF4
MULF4
ASGNF4
line 1680
;1680:		VectorCopy( newdir, ent->movedir );
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 1681
;1681:		SnapVector( ent->s.pos.trDelta );			// save net bandwidth
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 1682
;1682:		VectorCopy( ent->r.currentOrigin, ent->s.pos.trBase );
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 112
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 1683
;1683:		ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1684
;1684:	}
LABELV $474
line 1686
;1685:
;1686:	ent->nextthink = level.time + ROCKET_ALT_THINK_TIME;	// Nothing at all spectacular happened, continue.
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1687
;1687:	return;
LABELV $467
endproc rocketThink 124 12
proc WP_FireRocket 40 24
line 1693
;1688:}
;1689:
;1690://---------------------------------------------------------
;1691:static void WP_FireRocket( gentity_t *ent, qboolean altFire )
;1692://---------------------------------------------------------
;1693:{
line 1694
;1694:	int	damage	= ROCKET_DAMAGE;
ADDRLP4 16
CNSTI4 100
ASGNI4
line 1695
;1695:	int	vel = ROCKET_VELOCITY;
ADDRLP4 8
CNSTI4 900
ASGNI4
line 1696
;1696:	int dif = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1700
;1697:	float rTime;
;1698:	gentity_t *missile;
;1699:
;1700:	if ( altFire )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $523
line 1701
;1701:	{
line 1702
;1702:		vel *= 0.5f;
ADDRLP4 8
CNSTF4 1056964608
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1703
;1703:	}
LABELV $523
line 1705
;1704:
;1705:	missile = CreateMissile( muzzle, forward, vel, 10000, ent, altFire );
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 1707
;1706:
;1707:	if (ent->client && ent->client->ps.rocketLockIndex != MAX_CLIENTS)
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
EQU4 $525
ADDRLP4 24
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
CNSTI4 32
EQI4 $525
line 1708
;1708:	{
line 1709
;1709:		rTime = ent->client->ps.rocketLockTime;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 588
ADDP4
INDIRF4
ASGNF4
line 1711
;1710:
;1711:		if (rTime == -1)
ADDRLP4 12
INDIRF4
CNSTF4 3212836864
NEF4 $527
line 1712
;1712:		{
line 1713
;1713:			rTime = ent->client->ps.rocketLastValidTime;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 584
ADDP4
INDIRF4
ASGNF4
line 1714
;1714:		}
LABELV $527
line 1715
;1715:		dif = ( level.time - rTime ) / ( 1200.0f / 16.0f );
ADDRLP4 4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
SUBF4
CNSTF4 1117126656
DIVF4
CVFI4 4
ASGNI4
line 1717
;1716:
;1717:		if (dif < 0)
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $530
line 1718
;1718:		{
line 1719
;1719:			dif = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1720
;1720:		}
LABELV $530
line 1723
;1721:
;1722:		//It's 10 even though it locks client-side at 8, because we want them to have a sturdy lock first, and because there's a slight difference in time between server and client
;1723:		if ( dif >= 10/* || random() * dif > 2 || random() > 0.97f*/ && rTime != -1 )
ADDRLP4 4
INDIRI4
CNSTI4 10
LTI4 $532
ADDRLP4 12
INDIRF4
CNSTF4 3212836864
EQF4 $532
line 1724
;1724:		{
line 1725
;1725:			missile->enemy = &g_entities[ent->client->ps.rocketLockIndex];
ADDRLP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTI4 832
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1727
;1726:
;1727:			if (missile->enemy && missile->enemy->client && missile->enemy->health > 0 && !OnSameTeam(ent, missile->enemy))
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
CNSTU4 0
ASGNU4
ADDRLP4 28
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $534
ADDRLP4 28
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $534
ADDRLP4 28
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
LEI4 $534
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $534
line 1728
;1728:			{ //if enemy became invalid, died, or is on the same team, then don't seek it
line 1729
;1729:				missile->think = rocketThink;
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 rocketThink
ASGNP4
line 1730
;1730:				missile->nextthink = level.time + ROCKET_ALT_THINK_TIME;
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1731
;1731:			}
LABELV $534
line 1732
;1732:		}
LABELV $532
line 1734
;1733:
;1734:		ent->client->ps.rocketLockIndex = MAX_CLIENTS;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 32
ASGNI4
line 1735
;1735:		ent->client->ps.rocketLockTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 588
ADDP4
CNSTF4 0
ASGNF4
line 1736
;1736:		ent->client->ps.rocketTargetTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 592
ADDP4
CNSTF4 0
ASGNF4
line 1737
;1737:	}
LABELV $525
line 1739
;1738:
;1739:	missile->classname = "rocket_proj";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $537
ASGNP4
line 1740
;1740:	missile->s.weapon = WP_ROCKET_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 10
ASGNI4
line 1746
;1741:
;1742:	// NOTENOTE No mass yet.
;1743://	missile->mass = 10;
;1744:
;1745:	// Make it easier to hit things
;1746:	VectorSet( missile->r.maxs, ROCKET_SIZE, ROCKET_SIZE, ROCKET_SIZE );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1077936128
ASGNF4
line 1747
;1747:	VectorScale( missile->r.maxs, -1, missile->r.mins );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
MULF4
ASGNF4
line 1749
;1748:
;1749:	missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1750
;1750:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 128
ASGNI4
line 1751
;1751:	if (altFire)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $538
line 1752
;1752:	{
line 1753
;1753:		missile->methodOfDeath = MOD_ROCKET_HOMING;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 20
ASGNI4
line 1754
;1754:		missile->splashMethodOfDeath = MOD_ROCKET_HOMING_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 21
ASGNI4
line 1755
;1755:	}
ADDRGP4 $539
JUMPV
LABELV $538
line 1757
;1756:	else
;1757:	{
line 1758
;1758:		missile->methodOfDeath = MOD_ROCKET;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 18
ASGNI4
line 1759
;1759:		missile->splashMethodOfDeath = MOD_ROCKET_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 19
ASGNI4
line 1760
;1760:	}
LABELV $539
line 1763
;1761:	
;1762:	//rww - We don't want rockets to be deflected, do we?
;1763:	missile->clipmask = MASK_SHOT;// | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 769
ASGNI4
line 1764
;1764:	missile->splashDamage = ROCKET_SPLASH_DAMAGE;
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
CNSTI4 100
ASGNI4
line 1765
;1765:	missile->splashRadius = ROCKET_SPLASH_RADIUS;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
CNSTI4 160
ASGNI4
line 1768
;1766:
;1767:	// we don't want it to ever bounce
;1768:	missile->bounceCount = 0;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 0
ASGNI4
line 1769
;1769:}
LABELV $522
endproc WP_FireRocket 40 24
lit
align 4
LABELV $546
byte 4 0
byte 4 0
byte 4 1065353216
export thermalDetonatorExplode
code
proc thermalDetonatorExplode 40 24
line 1799
;1770:
;1771:/*
;1772:======================================================================
;1773:
;1774:THERMAL DETONATOR
;1775:
;1776:======================================================================
;1777:*/
;1778:
;1779:#define TD_DAMAGE			70 //only do 70 on a direct impact
;1780:#define TD_SPLASH_RAD		128
;1781:#define TD_SPLASH_DAM		90
;1782:#define TD_VELOCITY			900
;1783:#define TD_MIN_CHARGE		0.15f
;1784:#define TD_TIME				3000//6000
;1785:#define TD_ALT_TIME			3000
;1786:
;1787:#define TD_ALT_DAMAGE		60//100
;1788:#define TD_ALT_SPLASH_RAD	128
;1789:#define TD_ALT_SPLASH_DAM	50//90
;1790:#define TD_ALT_VELOCITY		600
;1791:#define TD_ALT_MIN_CHARGE	0.15f
;1792:#define TD_ALT_TIME			3000
;1793:
;1794:void thermalThinkStandard(gentity_t *ent);
;1795:
;1796://---------------------------------------------------------
;1797:void thermalDetonatorExplode( gentity_t *ent )
;1798://---------------------------------------------------------
;1799:{
line 1800
;1800:	if ( !ent->count )
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 0
NEI4 $541
line 1801
;1801:	{
line 1802
;1802:		G_Sound( ent, CHAN_VOICE, G_SoundIndex( "sound/weapons/thermal/warning.wav" ) );
ADDRGP4 $543
ARGP4
ADDRLP4 0
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1803
;1803:		ent->count = 1;
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 1
ASGNI4
line 1804
;1804:		ent->bolt_Head = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 1805
;1805:		ent->think = thermalThinkStandard;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 thermalThinkStandard
ASGNP4
line 1806
;1806:		ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1807
;1807:		ent->r.svFlags |= SVF_BROADCAST;//so everyone hears/sees the explosion?
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1808
;1808:	}
ADDRGP4 $542
JUMPV
LABELV $541
line 1810
;1809:	else
;1810:	{
line 1812
;1811:		vec3_t	origin;
;1812:		vec3_t	dir={0,0,1};
ADDRLP4 12
ADDRGP4 $546
INDIRB
ASGNB 12
line 1814
;1813:
;1814:		BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1815
;1815:		origin[2] += 8;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 1816
;1816:		SnapVector( origin );
ADDRLP4 0
ADDRLP4 0
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 1817
;1817:		G_SetOrigin( ent, origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1820
;1818:
;1819://		VectorSet( pos, ent->r.currentOrigin[0], ent->r.currentOrigin[1], ent->r.currentOrigin[2] + 8 );
;1820:		ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 1821
;1821:		G_AddEvent( ent, EV_MISSILE_MISS, DirToByte( dir ) );
ADDRLP4 12
ARGP4
ADDRLP4 24
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 74
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1822
;1822:		ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
CNSTI4 1
ASGNI4
line 1824
;1823:
;1824:		if (G_RadiusDamage( ent->r.currentOrigin, ent->parent,  ent->splashDamage, ent->splashRadius, 
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 696
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 700
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 708
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 G_RadiusDamage
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $553
line 1826
;1825:				ent, ent->splashMethodOfDeath))
;1826:		{
line 1827
;1827:			g_entities[ent->r.ownerNum].client->accuracy_hits++;
ADDRLP4 36
CNSTI4 832
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1672
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1828
;1828:		}
LABELV $553
line 1830
;1829:
;1830:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1831
;1831:	}
LABELV $542
line 1832
;1832:}
LABELV $540
endproc thermalDetonatorExplode 40 24
export thermalThinkStandard
proc thermalThinkStandard 0 4
line 1835
;1833:
;1834:void thermalThinkStandard(gentity_t *ent)
;1835:{
line 1836
;1836:	if (ent->bolt_Head < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $557
line 1837
;1837:	{
line 1838
;1838:		ent->think = thermalDetonatorExplode;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 thermalDetonatorExplode
ASGNP4
line 1839
;1839:		ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1840
;1840:		return;
ADDRGP4 $556
JUMPV
LABELV $557
line 1843
;1841:	}
;1842:
;1843:	G_RunObject(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunObject
CALLV
pop
line 1844
;1844:	ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1845
;1845:}
LABELV $556
endproc thermalThinkStandard 0 4
export WP_FireThermalDetonator
proc WP_FireThermalDetonator 56 16
line 1850
;1846:
;1847://---------------------------------------------------------
;1848:gentity_t *WP_FireThermalDetonator( gentity_t *ent, qboolean altFire )
;1849://---------------------------------------------------------
;1850:{
line 1853
;1851:	gentity_t	*bolt;
;1852:	vec3_t		dir, start;
;1853:	float chargeAmount = 1.0f; // default of full charge
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 1855
;1854:	
;1855:	VectorCopy( forward, dir );
ADDRLP4 20
ADDRGP4 forward
INDIRB
ASGNB 12
line 1856
;1856:	VectorCopy( muzzle, start );
ADDRLP4 8
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 1858
;1857:
;1858:	bolt = G_Spawn();
ADDRLP4 32
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 32
INDIRP4
ASGNP4
line 1860
;1859:	
;1860:	bolt->physicsObject = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1
ASGNI4
line 1862
;1861:
;1862:	bolt->classname = "thermal_detonator";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $563
ASGNP4
line 1863
;1863:	bolt->think = thermalThinkStandard;
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 thermalThinkStandard
ASGNP4
line 1864
;1864:	bolt->nextthink = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1865
;1865:	bolt->touch = touch_NULL;
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 touch_NULL
ASGNP4
line 1869
;1866://	bolt->mass = 10;		// NOTENOTE No mass implementation yet
;1867:
;1868:	// How 'bout we give this thing a size...
;1869:	VectorSet( bolt->r.mins, -3.0f, -3.0f, -3.0f );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3225419776
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3225419776
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3225419776
ASGNF4
line 1870
;1870:	VectorSet( bolt->r.maxs, 3.0f, 3.0f, 3.0f );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1077936128
ASGNF4
line 1871
;1871:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 769
ASGNI4
line 1873
;1872:
;1873:	W_TraceSetStart( ent, start, bolt->r.mins, bolt->r.maxs );//make sure our start point isn't on the other side of a wall
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
ARGP4
ADDRGP4 W_TraceSetStart
CALLV
pop
line 1875
;1874:
;1875:	if ( ent->client )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $565
line 1876
;1876:	{
line 1877
;1877:		chargeAmount = level.time - ent->client->ps.weaponChargeTime;
ADDRLP4 4
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 1878
;1878:	}
LABELV $565
line 1881
;1879:
;1880:	// get charge amount
;1881:	chargeAmount = chargeAmount / (float)TD_VELOCITY;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1147207680
DIVF4
ASGNF4
line 1883
;1882:
;1883:	if ( chargeAmount > 1.0f )
ADDRLP4 4
INDIRF4
CNSTF4 1065353216
LEF4 $568
line 1884
;1884:	{
line 1885
;1885:		chargeAmount = 1.0f;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 1886
;1886:	}
ADDRGP4 $569
JUMPV
LABELV $568
line 1887
;1887:	else if ( chargeAmount < TD_MIN_CHARGE )
ADDRLP4 4
INDIRF4
CNSTF4 1041865114
GEF4 $570
line 1888
;1888:	{
line 1889
;1889:		chargeAmount = TD_MIN_CHARGE;
ADDRLP4 4
CNSTF4 1041865114
ASGNF4
line 1890
;1890:	}
LABELV $570
LABELV $569
line 1893
;1891:
;1892:	// normal ones bounce, alt ones explode on impact
;1893:	bolt->bolt_Head = level.time + TD_TIME; // How long 'til she blows
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 1894
;1894:	bolt->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 1895
;1895:	bolt->parent = ent;
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1896
;1896:	bolt->r.ownerNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1897
;1897:	VectorScale( dir, TD_VELOCITY * chargeAmount, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 20
INDIRF4
CNSTF4 1147207680
ADDRLP4 4
INDIRF4
MULF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 20+4
INDIRF4
CNSTF4 1147207680
ADDRLP4 4
INDIRF4
MULF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 20+8
INDIRF4
CNSTF4 1147207680
ADDRLP4 4
INDIRF4
MULF4
MULF4
ASGNF4
line 1899
;1898:
;1899:	if ( ent->health >= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
LTI4 $575
line 1900
;1900:	{
line 1901
;1901:		bolt->s.pos.trDelta[2] += 120;
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 1902
;1902:	}
LABELV $575
line 1904
;1903:
;1904:	if ( !altFire )
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $577
line 1905
;1905:	{
line 1907
;1906:		//bolt->alt_fire = qtrue;
;1907:		bolt->s.eFlags |= EF_BOUNCE_HALF;
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
CNSTI4 32
BORI4
ASGNI4
line 1908
;1908:	}
LABELV $577
line 1910
;1909:
;1910:	bolt->s.loopSound = G_SoundIndex( "sound/weapons/thermal/thermloop.wav" );
ADDRGP4 $579
ARGP4
ADDRLP4 40
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 1912
;1911:
;1912:	bolt->damage = TD_DAMAGE;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 70
ASGNI4
line 1913
;1913:	bolt->dflags = 0;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 0
ASGNI4
line 1914
;1914:	bolt->splashDamage = TD_SPLASH_DAM;
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
CNSTI4 90
ASGNI4
line 1915
;1915:	bolt->splashRadius = TD_SPLASH_RAD;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
CNSTI4 128
ASGNI4
line 1917
;1916:
;1917:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1918
;1918:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 128
ASGNI4
line 1919
;1919:	bolt->s.weapon = WP_THERMAL;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 11
ASGNI4
line 1921
;1920:
;1921:	bolt->methodOfDeath = MOD_THERMAL;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 22
ASGNI4
line 1922
;1922:	bolt->splashMethodOfDeath = MOD_THERMAL_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 23
ASGNI4
line 1924
;1923:
;1924:	bolt->s.pos.trTime = level.time;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1925
;1925:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 8
INDIRB
ASGNB 12
line 1927
;1926:	
;1927:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 48
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 1928
;1928:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 8
INDIRB
ASGNB 12
line 1930
;1929:
;1930:	VectorCopy( start, bolt->pos2 );
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
ADDRLP4 8
INDIRB
ASGNB 12
line 1932
;1931:
;1932:	bolt->bounceCount = -5;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 -5
ASGNI4
line 1934
;1933:
;1934:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $562
endproc WP_FireThermalDetonator 56 16
export WP_DropThermal
proc WP_DropThermal 4 16
line 1938
;1935:}
;1936:
;1937:gentity_t *WP_DropThermal( gentity_t *ent )
;1938:{
line 1939
;1939:	AngleVectors( ent->client->ps.viewangles, forward, right, up );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1940
;1940:	return (WP_FireThermalDetonator( ent, qfalse ));
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ADDRGP4 WP_FireThermalDetonator
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $581
endproc WP_DropThermal 4 16
export laserTrapExplode
proc laserTrapExplode 16 24
line 1961
;1941:}
;1942:
;1943:
;1944:/*
;1945:======================================================================
;1946:
;1947:LASER TRAP / TRIP MINE
;1948:
;1949:======================================================================
;1950:*/
;1951:#define LT_DAMAGE			100
;1952:#define LT_SPLASH_RAD		256.0f
;1953:#define LT_SPLASH_DAM		105
;1954:#define LT_VELOCITY			900.0f
;1955:#define LT_SIZE				1.5f
;1956:#define LT_ALT_TIME			2000
;1957:#define	LT_ACTIVATION_DELAY	1000
;1958:#define	LT_DELAY_TIME		50
;1959:
;1960:void laserTrapExplode( gentity_t *self )
;1961:{
line 1964
;1962:	vec3_t v;
;1963:	//FIXME: damage some along line?
;1964:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 0
ASGNI4
line 1966
;1965:
;1966:	if (self->activator)
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $583
line 1967
;1967:	{
line 1968
;1968:		G_RadiusDamage( self->r.currentOrigin, self->activator, self->splashDamage, self->splashRadius, self, MOD_TRIP_MINE_SPLASH/*MOD_LT_SPLASH*/ );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 696
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 700
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 24
ARGI4
ADDRGP4 G_RadiusDamage
CALLI4
pop
line 1969
;1969:	}
LABELV $583
line 1972
;1970:	//FIXME: clear me from owner's list of tripmines?
;1971:
;1972:	if (self->s.weapon != WP_FLECHETTE)
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 9
EQI4 $585
line 1973
;1973:	{
line 1974
;1974:		G_AddEvent( self, EV_MISSILE_MISS, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 74
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1975
;1975:	}
LABELV $585
line 1977
;1976:
;1977:	VectorCopy(self->s.pos.trDelta, v);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1980
;1978:	//Explode outward from the surface
;1979:
;1980:	if (self->s.time == -2)
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 -2
NEI4 $587
line 1981
;1981:	{
line 1982
;1982:		v[0] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1983
;1983:		v[1] = 0;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 1984
;1984:		v[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1985
;1985:	}
LABELV $587
line 1987
;1986:
;1987:	if (self->s.weapon == WP_FLECHETTE)
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 9
NEI4 $591
line 1988
;1988:	{
line 1989
;1989:		G_PlayEffect(EFFECT_EXPLOSION_FLECHETTE, self->r.currentOrigin, v);
CNSTI4 7
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_PlayEffect
CALLP4
pop
line 1990
;1990:	}
ADDRGP4 $592
JUMPV
LABELV $591
line 1992
;1991:	else
;1992:	{
line 1993
;1993:		G_PlayEffect(EFFECT_EXPLOSION_TRIPMINE, self->r.currentOrigin, v);
CNSTI4 5
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_PlayEffect
CALLP4
pop
line 1994
;1994:	}
LABELV $592
line 1996
;1995:
;1996:	self->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 1997
;1997:	self->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1998
;1998:}
LABELV $582
endproc laserTrapExplode 16 24
export laserTrapDelayedExplode
proc laserTrapDelayedExplode 12 0
line 2001
;1999:
;2000:void laserTrapDelayedExplode( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath )
;2001:{
line 2002
;2002:	self->enemy = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 2003
;2003:	self->think = laserTrapExplode;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 laserTrapExplode
ASGNP4
line 2004
;2004:	self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 2005
;2005:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 0
ASGNI4
line 2006
;2006:	if ( attacker && !attacker->s.number )
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $596
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $596
line 2007
;2007:	{
line 2009
;2008:		//less damage when shot by player
;2009:		self->splashDamage /= 3;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 3
DIVI4
ASGNI4
line 2010
;2010:		self->splashRadius /= 3;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 3
DIVI4
ASGNI4
line 2012
;2011:		//FIXME: different effect?
;2012:	}
LABELV $596
line 2013
;2013:}
LABELV $594
endproc laserTrapDelayedExplode 12 0
export touchLaserTrap
proc touchLaserTrap 8 12
line 2016
;2014:
;2015:void touchLaserTrap( gentity_t *ent, gentity_t *other, trace_t *trace )
;2016:{
line 2019
;2017:	// if the guy that touches this grenade can take damage, he's about to.
;2018:	//if ( other->takedamage )
;2019:	if (other && other->s.number < 1022)
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $599
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1022
GEI4 $599
line 2020
;2020:	{ //just explode if we hit any entity. This way we don't have things happening like tripmines floating
line 2022
;2021:	  //in the air after getting stuck to a moving door
;2022:		if ( ent->activator != other )
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
EQU4 $600
line 2023
;2023:		{
line 2024
;2024:			ent->touch = 0;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
CNSTP4 0
ASGNP4
line 2025
;2025:			ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 2026
;2026:			ent->think = laserTrapExplode;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 laserTrapExplode
ASGNP4
line 2027
;2027:			VectorCopy(trace->plane.normal, ent->s.pos.trDelta);
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 2028
;2028:		}
line 2029
;2029:	}
ADDRGP4 $600
JUMPV
LABELV $599
line 2031
;2030:	else
;2031:	{
line 2032
;2032:		ent->touch = 0;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
CNSTP4 0
ASGNP4
line 2033
;2033:		if (trace->entityNum != ENTITYNUM_NONE)
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $604
line 2034
;2034:		{
line 2035
;2035:			ent->enemy = &g_entities[trace->entityNum];
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTI4 832
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2036
;2036:		}
LABELV $604
line 2037
;2037:		laserTrapStick(ent, trace->endpos, trace->plane.normal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 laserTrapStick
CALLV
pop
line 2038
;2038:	}
LABELV $600
line 2039
;2039:}
LABELV $598
endproc touchLaserTrap 8 12
export laserTrapThink
proc laserTrapThink 1116 28
line 2042
;2040:
;2041:void laserTrapThink ( gentity_t *ent )
;2042:{
line 2048
;2043:	gentity_t	*traceEnt;
;2044:	vec3_t		end;
;2045:	trace_t		tr;
;2046:
;2047:	//G_RunObject(ent);
;2048:	trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2051
;2049:
;2050:	//turn on the beam effect
;2051:	if ( !(ent->s.eFlags&EF_FIRING) )
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
NEI4 $607
line 2052
;2052:	{//arm me
line 2053
;2053:		G_Sound( ent, CHAN_VOICE, G_SoundIndex( "sound/weapons/laser_trap/warning.wav" ) );
ADDRGP4 $609
ARGP4
ADDRLP4 1096
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 1096
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2054
;2054:		ent->s.eFlags |= EF_FIRING;
ADDRLP4 1100
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 1100
INDIRP4
ADDRLP4 1100
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 2055
;2055:	}
LABELV $607
line 2056
;2056:	ent->think = laserTrapThink;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 laserTrapThink
ASGNP4
line 2057
;2057:	ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 2060
;2058:
;2059:	// Find the main impact point
;2060:	VectorMA ( ent->s.pos.trBase, 1024, ent->movedir, end );
ADDRLP4 1096
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1100
CNSTF4 1149239296
ASGNF4
ADDRLP4 0
ADDRLP4 1096
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1100
INDIRF4
ADDRLP4 1096
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 1096
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 1100
INDIRF4
ADDRLP4 1096
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 1104
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 1149239296
ADDRLP4 1104
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2061
;2061:	trap_Trace ( &tr, ent->r.currentOrigin, NULL, NULL, end, ent->s.number, MASK_SHOT);
ADDRLP4 12
ARGP4
ADDRLP4 1108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1108
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 1112
CNSTP4 0
ASGNP4
ADDRLP4 1112
INDIRP4
ARGP4
ADDRLP4 1112
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1108
INDIRP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 2063
;2062:	
;2063:	traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 1092
CNSTI4 832
ADDRLP4 12+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2065
;2064:
;2065:	ent->s.time = -1; //let all clients know to draw a beam from this guy
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 -1
ASGNI4
line 2067
;2066:
;2067:	if ( traceEnt->client || tr.startsolid )
ADDRLP4 1092
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $617
ADDRLP4 12+4
INDIRI4
CNSTI4 0
EQI4 $614
LABELV $617
line 2068
;2068:	{
line 2070
;2069:		//go boom
;2070:		ent->touch = 0;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
CNSTP4 0
ASGNP4
line 2071
;2071:		ent->nextthink = level.time + LT_DELAY_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 2072
;2072:		ent->think = laserTrapExplode;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 laserTrapExplode
ASGNP4
line 2073
;2073:	}
LABELV $614
line 2074
;2074:}
LABELV $606
endproc laserTrapThink 1116 28
export laserTrapStick
proc laserTrapStick 32 12
line 2077
;2075:
;2076:void laserTrapStick( gentity_t *ent, vec3_t endpos, vec3_t normal )
;2077:{
line 2082
;2078:	//vec3_t	org;
;2079:
;2080:	// Back away from the wall
;2081:	//VectorMA( endpos, -1, normal, org );
;2082:	G_SetOrigin( ent, endpos );//org );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 2083
;2083:	VectorCopy( normal, ent->pos1 );
ADDRFP4 0
INDIRP4
CNSTI4 548
ADDP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 2085
;2084:
;2085:	VectorClear( ent->s.apos.trDelta );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 2087
;2086:	// This will orient the object to face in the direction of the normal
;2087:	VectorCopy( normal, ent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 2089
;2088:	//VectorScale( normal, -1, ent->s.pos.trDelta );
;2089:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2093
;2090:	
;2091:	
;2092:	//This does nothing, cg_missile makes assumptions about direction of travel controlling angles
;2093:	vectoangles( normal, ent->s.apos.trBase );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2094
;2094:	VectorClear( ent->s.apos.trDelta );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 2095
;2095:	ent->s.apos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 2096
;2096:	VectorCopy( ent->s.apos.trBase, ent->s.angles );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 2097
;2097:	VectorCopy( ent->s.angles, ent->r.currentAngles );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 380
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 2100
;2098:	
;2099:
;2100:	G_Sound( ent, CHAN_VOICE, G_SoundIndex( "sound/weapons/laser_trap/stick.wav" ) );
ADDRGP4 $621
ARGP4
ADDRLP4 24
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2101
;2101:	if ( ent->count )
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 0
EQI4 $622
line 2102
;2102:	{//a tripwire
line 2104
;2103:		//add draw line flag
;2104:		VectorCopy( normal, ent->movedir );
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 2105
;2105:		ent->think = laserTrapThink;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 laserTrapThink
ASGNP4
line 2106
;2106:		ent->nextthink = level.time + LT_ACTIVATION_DELAY;//delay the activation
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 2107
;2107:		ent->touch = touch_NULL;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 touch_NULL
ASGNP4
line 2109
;2108:		//make it shootable
;2109:		ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 1
ASGNI4
line 2110
;2110:		ent->health = 5;
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 5
ASGNI4
line 2111
;2111:		ent->die = laserTrapDelayedExplode;
ADDRFP4 0
INDIRP4
CNSTI4 660
ADDP4
ADDRGP4 laserTrapDelayedExplode
ASGNP4
line 2114
;2112:
;2113:		//shove the box through the wall
;2114:		VectorSet( ent->r.mins, -LT_SIZE*2, -LT_SIZE*2, -LT_SIZE*2 );
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
line 2115
;2115:		VectorSet( ent->r.maxs, LT_SIZE*2, LT_SIZE*2, LT_SIZE*2 );
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
line 2118
;2116:
;2117:		//so that the owner can blow it up with projectiles
;2118:		ent->r.svFlags |= SVF_OWNERNOTSHARED;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 2119
;2119:	}
ADDRGP4 $623
JUMPV
LABELV $622
line 2121
;2120:	else
;2121:	{
line 2122
;2122:		ent->touch = touchLaserTrap;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 touchLaserTrap
ASGNP4
line 2123
;2123:		ent->think = laserTrapExplode;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 laserTrapExplode
ASGNP4
line 2124
;2124:		ent->nextthink = level.time + LT_ALT_TIME; // How long 'til she blows
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 2125
;2125:	}
LABELV $623
line 2126
;2126:}
LABELV $619
endproc laserTrapStick 32 12
export TrapThink
proc TrapThink 0 4
line 2129
;2127:
;2128:void TrapThink(gentity_t *ent)
;2129:{
line 2130
;2130:	ent->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 2132
;2131:
;2132:	G_RunObject(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunObject
CALLV
pop
line 2133
;2133:}
LABELV $626
endproc TrapThink 0 4
export CreateLaserTrap
proc CreateLaserTrap 28 4
line 2136
;2134:
;2135:void CreateLaserTrap( gentity_t *laserTrap, vec3_t start, gentity_t *owner )
;2136:{
line 2137
;2137:	laserTrap->classname = "laserTrap";
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $629
ASGNP4
line 2138
;2138:	laserTrap->s.eFlags = EF_BOUNCE_HALF;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 32
ASGNI4
line 2139
;2139:	laserTrap->s.eFlags |= EF_MISSILE_STICK;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 2097152
BORI4
ASGNI4
line 2140
;2140:	laserTrap->splashDamage = LT_SPLASH_DAM;//*2;
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
CNSTI4 105
ASGNI4
line 2141
;2141:	laserTrap->splashRadius = LT_SPLASH_RAD;//*2;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
CNSTI4 256
ASGNI4
line 2142
;2142:	laserTrap->damage = LT_DAMAGE;//*DMG_VAR;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 100
ASGNI4
line 2143
;2143:	laserTrap->methodOfDeath = MOD_TRIP_MINE_SPLASH;//MOD_TRIP_WIRE;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 24
ASGNI4
line 2144
;2144:	laserTrap->splashMethodOfDeath = MOD_TRIP_MINE_SPLASH;//MOD_TRIP_WIRE;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 24
ASGNI4
line 2145
;2145:	laserTrap->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 2146
;2146:	laserTrap->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 128
ASGNI4
line 2147
;2147:	laserTrap->s.weapon = WP_TRIP_MINE;
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 12
ASGNI4
line 2148
;2148:	laserTrap->s.pos.trType = TR_GRAVITY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 2149
;2149:	laserTrap->r.contents = MASK_SHOT;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 769
ASGNI4
line 2150
;2150:	laserTrap->parent = owner;
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 2151
;2151:	laserTrap->activator = owner;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 2152
;2152:	laserTrap->r.ownerNum = owner->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 2153
;2153:	VectorSet( laserTrap->r.mins, -LT_SIZE, -LT_SIZE, -LT_SIZE );
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3217031168
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3217031168
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3217031168
ASGNF4
line 2154
;2154:	VectorSet( laserTrap->r.maxs, LT_SIZE, LT_SIZE, LT_SIZE );
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1069547520
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1069547520
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1069547520
ASGNF4
line 2155
;2155:	laserTrap->clipmask = MASK_SHOT;
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 769
ASGNI4
line 2156
;2156:	laserTrap->s.solid = 2;
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 2
ASGNI4
line 2157
;2157:	laserTrap->s.modelindex = G_ModelIndex( "models/weapons2/laser_trap/laser_trap_w.glm" );
ADDRGP4 $630
ARGP4
ADDRLP4 4
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 2158
;2158:	laserTrap->s.modelGhoul2 = 1;
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 2159
;2159:	laserTrap->s.g2radius = 40;
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 40
ASGNI4
line 2161
;2160:
;2161:	laserTrap->s.genericenemyindex = owner->s.number+1024;
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
CNSTI4 1024
ADDI4
ASGNI4
line 2163
;2162:
;2163:	laserTrap->health = 1;
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 1
ASGNI4
line 2165
;2164:
;2165:	laserTrap->s.time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 0
ASGNI4
line 2167
;2166:
;2167:	laserTrap->s.pos.trTime = level.time;		// move a bit on the very first frame
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2168
;2168:	VectorCopy( start, laserTrap->s.pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2169
;2169:	SnapVector( laserTrap->s.pos.trBase );			// save net bandwidth
ADDRLP4 8
ADDRFP4 0
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
ADDRFP4 0
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
ADDRFP4 0
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
line 2171
;2170:	
;2171:	SnapVector( laserTrap->s.pos.trDelta );			// save net bandwidth
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 36
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
ADDRFP4 0
INDIRP4
CNSTI4 40
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
ADDRFP4 0
INDIRP4
CNSTI4 44
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
line 2172
;2172:	VectorCopy (start, laserTrap->r.currentOrigin);
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2174
;2173:
;2174:	laserTrap->s.apos.trType = TR_GRAVITY;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 5
ASGNI4
line 2175
;2175:	laserTrap->s.apos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2176
;2176:	laserTrap->s.apos.trBase[YAW] = rand()%360;
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 360
MODI4
CVIF4 4
ASGNF4
line 2177
;2177:	laserTrap->s.apos.trBase[PITCH] = rand()%360;
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 360
MODI4
CVIF4 4
ASGNF4
line 2178
;2178:	laserTrap->s.apos.trBase[ROLL] = rand()%360;
ADDRLP4 16
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 16
INDIRI4
CNSTI4 360
MODI4
CVIF4 4
ASGNF4
line 2180
;2179:
;2180:	if (rand()%10 < 5)
ADDRLP4 20
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 10
MODI4
CNSTI4 5
GEI4 $633
line 2181
;2181:	{
line 2182
;2182:		laserTrap->s.apos.trBase[YAW] = -laserTrap->s.apos.trBase[YAW];
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
NEGF4
ASGNF4
line 2183
;2183:	}
LABELV $633
line 2185
;2184:
;2185:	VectorCopy( start, laserTrap->pos2 );
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2186
;2186:	laserTrap->touch = touchLaserTrap;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 touchLaserTrap
ASGNP4
line 2187
;2187:	laserTrap->think = TrapThink;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 TrapThink
ASGNP4
line 2188
;2188:	laserTrap->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 2189
;2189:}
LABELV $628
endproc CreateLaserTrap 28 4
lit
align 4
LABELV $637
byte 4 1023
skip 4092
export WP_PlaceLaserTrap
code
proc WP_PlaceLaserTrap 4156 12
line 2192
;2190:
;2191:void WP_PlaceLaserTrap( gentity_t *ent, qboolean alt_fire )
;2192:{
line 2194
;2193:	gentity_t	*laserTrap;
;2194:	gentity_t	*found = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 2196
;2195:	vec3_t		dir, start;
;2196:	int			trapcount = 0;
ADDRLP4 4120
CNSTI4 0
ASGNI4
line 2197
;2197:	int			foundLaserTraps[MAX_GENTITIES] = {ENTITYNUM_NONE};
ADDRLP4 8
ADDRGP4 $637
INDIRB
ASGNB 4096
line 2205
;2198:	int			trapcount_org;
;2199:	int			lowestTimeStamp;
;2200:	int			removeMe;
;2201:	int			i;
;2202:
;2203:	//FIXME: surface must be within 64
;2204:
;2205:	VectorCopy( forward, dir );
ADDRLP4 4124
ADDRGP4 forward
INDIRB
ASGNB 12
line 2206
;2206:	VectorCopy( muzzle, start );
ADDRLP4 4136
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 2208
;2207:
;2208:	laserTrap = G_Spawn();
ADDRLP4 4148
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 4108
ADDRLP4 4148
INDIRP4
ASGNP4
ADDRGP4 $639
JUMPV
LABELV $638
line 2213
;2209:	
;2210:	//limit to 10 placed at any one time
;2211:	//see how many there are now
;2212:	while ( (found = G_Find( found, FOFS(classname), "laserTrap" )) != NULL )
;2213:	{
line 2214
;2214:		if ( found->parent != ent )
ADDRLP4 4
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $641
line 2215
;2215:		{
line 2216
;2216:			continue;
ADDRGP4 $639
JUMPV
LABELV $641
line 2218
;2217:		}
;2218:		foundLaserTraps[trapcount++] = found->s.number;
ADDRLP4 4152
ADDRLP4 4120
INDIRI4
ASGNI4
ADDRLP4 4120
ADDRLP4 4152
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4152
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRP4
INDIRI4
ASGNI4
line 2219
;2219:	}
LABELV $639
line 2212
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 416
ARGI4
ADDRGP4 $629
ARGP4
ADDRLP4 4152
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 4152
INDIRP4
ASGNP4
ADDRLP4 4152
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $638
line 2221
;2220:	//now remove first ones we find until there are only 9 left
;2221:	found = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 2222
;2222:	trapcount_org = trapcount;
ADDRLP4 4112
ADDRLP4 4120
INDIRI4
ASGNI4
line 2223
;2223:	lowestTimeStamp = level.time;
ADDRLP4 4104
ADDRGP4 level+32
INDIRI4
ASGNI4
ADDRGP4 $645
JUMPV
LABELV $644
line 2225
;2224:	while ( trapcount > 9 )
;2225:	{
line 2226
;2226:		removeMe = -1;
ADDRLP4 4116
CNSTI4 -1
ASGNI4
line 2227
;2227:		for ( i = 0; i < trapcount_org; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $650
JUMPV
LABELV $647
line 2228
;2228:		{
line 2229
;2229:			if ( foundLaserTraps[i] == ENTITYNUM_NONE )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $651
line 2230
;2230:			{
line 2231
;2231:				continue;
ADDRGP4 $648
JUMPV
LABELV $651
line 2233
;2232:			}
;2233:			found = &g_entities[foundLaserTraps[i]];
ADDRLP4 4
CNSTI4 832
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2234
;2234:			if ( laserTrap && found->setTime < lowestTimeStamp )
ADDRLP4 4108
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $653
ADDRLP4 4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ADDRLP4 4104
INDIRI4
GEI4 $653
line 2235
;2235:			{
line 2236
;2236:				removeMe = i;
ADDRLP4 4116
ADDRLP4 0
INDIRI4
ASGNI4
line 2237
;2237:				lowestTimeStamp = found->setTime;
ADDRLP4 4104
ADDRLP4 4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ASGNI4
line 2238
;2238:			}
LABELV $653
line 2239
;2239:		}
LABELV $648
line 2227
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $650
ADDRLP4 0
INDIRI4
ADDRLP4 4112
INDIRI4
LTI4 $647
line 2240
;2240:		if ( removeMe != -1 )
ADDRLP4 4116
INDIRI4
CNSTI4 -1
EQI4 $646
line 2241
;2241:		{
line 2243
;2242:			//remove it... or blow it?
;2243:			if ( &g_entities[foundLaserTraps[removeMe]] == NULL )
CNSTI4 832
ADDRLP4 4116
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
CNSTU4 0
NEU4 $657
line 2244
;2244:			{
line 2245
;2245:				break;
ADDRGP4 $646
JUMPV
LABELV $657
line 2248
;2246:			}
;2247:			else
;2248:			{
line 2249
;2249:				G_FreeEntity( &g_entities[foundLaserTraps[removeMe]] );
CNSTI4 832
ADDRLP4 4116
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 2250
;2250:			}
line 2251
;2251:			foundLaserTraps[removeMe] = ENTITYNUM_NONE;
ADDRLP4 4116
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTI4 1023
ASGNI4
line 2252
;2252:			trapcount--;
ADDRLP4 4120
ADDRLP4 4120
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2253
;2253:		}
line 2255
;2254:		else
;2255:		{
line 2256
;2256:			break;
LABELV $656
line 2258
;2257:		}
;2258:	}
LABELV $645
line 2224
ADDRLP4 4120
INDIRI4
CNSTI4 9
GTI4 $644
LABELV $646
line 2261
;2259:
;2260:	//now make the new one
;2261:	CreateLaserTrap( laserTrap, start, ent );
ADDRLP4 4108
INDIRP4
ARGP4
ADDRLP4 4136
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CreateLaserTrap
CALLV
pop
line 2264
;2262:
;2263:	//set player-created-specific fields
;2264:	laserTrap->setTime = level.time;//remember when we placed it
ADDRLP4 4108
INDIRP4
CNSTI4 628
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2266
;2265:
;2266:	if (!alt_fire)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $660
line 2267
;2267:	{//tripwire
line 2268
;2268:		laserTrap->count = 1;
ADDRLP4 4108
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 1
ASGNI4
line 2269
;2269:	}
LABELV $660
line 2272
;2270:
;2271:	//move it
;2272:	laserTrap->s.pos.trType = TR_GRAVITY;
ADDRLP4 4108
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 2274
;2273:
;2274:	if (alt_fire)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $662
line 2275
;2275:	{
line 2276
;2276:		VectorScale( dir, 512, laserTrap->s.pos.trDelta );
ADDRLP4 4108
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1140850688
ADDRLP4 4124
INDIRF4
MULF4
ASGNF4
ADDRLP4 4108
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1140850688
ADDRLP4 4124+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4108
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1140850688
ADDRLP4 4124+8
INDIRF4
MULF4
ASGNF4
line 2277
;2277:	}
ADDRGP4 $663
JUMPV
LABELV $662
line 2279
;2278:	else
;2279:	{
line 2280
;2280:		VectorScale( dir, 256, laserTrap->s.pos.trDelta );
ADDRLP4 4108
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1132462080
ADDRLP4 4124
INDIRF4
MULF4
ASGNF4
ADDRLP4 4108
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1132462080
ADDRLP4 4124+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4108
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1132462080
ADDRLP4 4124+8
INDIRF4
MULF4
ASGNF4
line 2281
;2281:	}
LABELV $663
line 2283
;2282:
;2283:	trap_LinkEntity(laserTrap);
ADDRLP4 4108
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2284
;2284:}
LABELV $636
endproc WP_PlaceLaserTrap 4156 12
export VectorNPos
proc VectorNPos 4 0
line 2295
;2285:
;2286:
;2287:/*
;2288:======================================================================
;2289:
;2290:DET PACK
;2291:
;2292:======================================================================
;2293:*/
;2294:void VectorNPos(vec3_t in, vec3_t out)
;2295:{
line 2296
;2296:	if (in[0] < 0) { out[0] = -in[0]; } else { out[0] = in[0]; }
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 0
GEF4 $669
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
NEGF4
ASGNF4
ADDRGP4 $670
JUMPV
LABELV $669
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
LABELV $670
line 2297
;2297:	if (in[1] < 0) { out[1] = -in[1]; } else { out[1] = in[1]; }
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $671
ADDRLP4 0
CNSTI4 4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
NEGF4
ASGNF4
ADDRGP4 $672
JUMPV
LABELV $671
ADDRLP4 0
CNSTI4 4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
ASGNF4
LABELV $672
line 2298
;2298:	if (in[2] < 0) { out[2] = -in[2]; } else { out[2] = in[2]; }
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 0
GEF4 $673
ADDRLP4 0
CNSTI4 8
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
NEGF4
ASGNF4
ADDRGP4 $674
JUMPV
LABELV $673
ADDRLP4 0
CNSTI4 8
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
ASGNF4
LABELV $674
line 2299
;2299:}
LABELV $668
endproc VectorNPos 4 0
export charge_stick
proc charge_stick 68 24
line 2304
;2300:
;2301:void DetPackBlow(gentity_t *self);
;2302:
;2303:void charge_stick (gentity_t *self, gentity_t *other, trace_t *trace)
;2304:{
line 2307
;2305:	gentity_t	*tent;
;2306:
;2307:	if (other && other->s.number < 1022 &&
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
EQU4 $676
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1022
GEI4 $676
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
NEU4 $678
ADDRLP4 4
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 0
NEI4 $676
LABELV $678
line 2309
;2308:		(other->client || !other->s.weapon))
;2309:	{
line 2312
;2310:		vec3_t vNor, tN;
;2311:
;2312:		VectorCopy(trace->plane.normal, vNor);
ADDRLP4 12
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 2313
;2313:		VectorNormalize(vNor);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2314
;2314:		VectorNPos(self->s.pos.trDelta, tN);
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 VectorNPos
CALLV
pop
line 2315
;2315:		self->s.pos.trDelta[0] += vNor[0]*(tN[0]*(((float)Q_irand(1, 10))*0.1));
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 36
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 1036831949
ADDRLP4 36
INDIRI4
CVIF4 4
MULF4
MULF4
MULF4
ADDF4
ASGNF4
line 2316
;2316:		self->s.pos.trDelta[1] += vNor[1]*(tN[1]*(((float)Q_irand(1, 10))*0.1));
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 44
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 24+4
INDIRF4
CNSTF4 1036831949
ADDRLP4 44
INDIRI4
CVIF4 4
MULF4
MULF4
MULF4
ADDF4
ASGNF4
line 2317
;2317:		self->s.pos.trDelta[2] += vNor[1]*(tN[2]*(((float)Q_irand(1, 10))*0.1));
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 52
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 24+8
INDIRF4
CNSTF4 1036831949
ADDRLP4 52
INDIRI4
CVIF4 4
MULF4
MULF4
MULF4
ADDF4
ASGNF4
line 2319
;2318:
;2319:		vectoangles(vNor, self->s.angles);
ADDRLP4 12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2320
;2320:		vectoangles(vNor, self->s.apos.trBase);
ADDRLP4 12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2321
;2321:		self->touch = charge_stick;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 charge_stick
ASGNP4
line 2322
;2322:		return;
ADDRGP4 $675
JUMPV
LABELV $676
line 2324
;2323:	}
;2324:	else if (other && other->s.number < 1022)
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $683
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1022
GEI4 $683
line 2325
;2325:	{
line 2328
;2326:		vec3_t v;
;2327:
;2328:		self->touch = 0;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
CNSTP4 0
ASGNP4
line 2329
;2329:		self->think = 0;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
CNSTP4 0
ASGNP4
line 2330
;2330:		self->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
CNSTI4 0
ASGNI4
line 2332
;2331:
;2332:		self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 0
ASGNI4
line 2334
;2333:
;2334:		VectorClear(self->s.apos.trDelta);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
CNSTF4 0
ASGNF4
ADDRLP4 28
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 28
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 28
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
line 2335
;2335:		self->s.apos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 2337
;2336:
;2337:		G_RadiusDamage( self->r.currentOrigin, self->parent, self->splashDamage, self->splashRadius, self, MOD_DET_PACK_SPLASH );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 696
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 36
INDIRP4
CNSTI4 700
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 36
INDIRP4
ARGP4
CNSTI4 26
ARGI4
ADDRGP4 G_RadiusDamage
CALLI4
pop
line 2338
;2338:		VectorCopy(trace->plane.normal, v);
ADDRLP4 16
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 2339
;2339:		VectorCopy(v, self->pos2);
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 2340
;2340:		self->count = -1;
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 -1
ASGNI4
line 2341
;2341:		G_PlayEffect(EFFECT_EXPLOSION_DETPACK, self->r.currentOrigin, v);
CNSTI4 6
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 G_PlayEffect
CALLP4
pop
line 2343
;2342:
;2343:		self->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 2344
;2344:		self->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2345
;2345:		return;
ADDRGP4 $675
JUMPV
LABELV $683
line 2351
;2346:	}
;2347:
;2348:	//self->s.eType = ET_GENERAL;
;2349:	//FIXME: once on ground, shouldn't explode if touched by someone?
;2350:	//FIXME: if owner touches it again, pick it up?  Or if he "uses" it?
;2351:	self->touch = 0;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
CNSTP4 0
ASGNP4
line 2352
;2352:	self->think = DetPackBlow;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 DetPackBlow
ASGNP4
line 2353
;2353:	self->nextthink = level.time + 30000;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 30000
ADDI4
ASGNI4
line 2355
;2354:
;2355:	VectorClear(self->s.apos.trDelta);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
line 2356
;2356:	self->s.apos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 2358
;2357:
;2358:	self->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 2359
;2359:	VectorCopy( self->r.currentOrigin, self->s.origin );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 2360
;2360:	VectorCopy( self->r.currentOrigin, self->s.pos.trBase );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 2361
;2361:	VectorClear( self->s.pos.trDelta );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
CNSTF4 0
ASGNF4
ADDRLP4 32
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 32
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 32
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 36
INDIRF4
ASGNF4
line 2363
;2362:
;2363:	VectorClear( self->s.apos.trDelta );
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
CNSTF4 0
ASGNF4
ADDRLP4 40
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 44
INDIRF4
ASGNF4
ADDRLP4 40
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 44
INDIRF4
ASGNF4
ADDRLP4 40
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 44
INDIRF4
ASGNF4
line 2365
;2364:
;2365:	VectorNormalize(trace->plane.normal);
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2367
;2366:
;2367:	vectoangles(trace->plane.normal, self->s.angles);
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2368
;2368:	VectorCopy(self->s.angles, self->r.currentAngles );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 380
ADDP4
ADDRLP4 48
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 2369
;2369:	VectorCopy(self->s.angles, self->s.apos.trBase);
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 52
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 2371
;2370:
;2371:	VectorCopy(trace->plane.normal, self->pos2);
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 2372
;2372:	self->count = -1;
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 -1
ASGNI4
line 2374
;2373:
;2374:	G_Sound(self, CHAN_VOICE, G_SoundIndex("sound/weapons/detpack/stick.wav"));
ADDRGP4 $687
ARGP4
ADDRLP4 56
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2376
;2375:		
;2376:	tent = G_TempEntity( self->r.currentOrigin, EV_MISSILE_MISS );
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 74
ARGI4
ADDRLP4 60
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 60
INDIRP4
ASGNP4
line 2377
;2377:	tent->s.weapon = 0;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 0
ASGNI4
line 2378
;2378:	tent->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 2379
;2379:	tent->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 2382
;2380:
;2381:	//so that the owner can blow it up with projectiles
;2382:	self->r.svFlags |= SVF_OWNERNOTSHARED;
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 2383
;2383:}
LABELV $675
endproc charge_stick 68 24
export DetPackBlow
proc DetPackBlow 16 24
line 2386
;2384:
;2385:void DetPackBlow(gentity_t *self)
;2386:{
line 2390
;2387:	vec3_t v;
;2388:
;2389:	//self->touch = NULL;
;2390:	self->pain = 0;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
CNSTP4 0
ASGNP4
line 2391
;2391:	self->die = 0;
ADDRFP4 0
INDIRP4
CNSTI4 660
ADDP4
CNSTP4 0
ASGNP4
line 2392
;2392:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 0
ASGNI4
line 2394
;2393:
;2394:	G_RadiusDamage( self->r.currentOrigin, self->parent, self->splashDamage, self->splashRadius, self, MOD_DET_PACK_SPLASH );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 696
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 700
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 26
ARGI4
ADDRGP4 G_RadiusDamage
CALLI4
pop
line 2395
;2395:	v[0] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 2396
;2396:	v[1] = 0;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 2397
;2397:	v[2] = 1;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 2399
;2398:
;2399:	if (self->count == -1)
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $691
line 2400
;2400:	{
line 2401
;2401:		VectorCopy(self->pos2, v);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRB
ASGNB 12
line 2402
;2402:	}
LABELV $691
line 2404
;2403:
;2404:	G_PlayEffect(EFFECT_EXPLOSION_DETPACK, self->r.currentOrigin, v);
CNSTI4 6
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_PlayEffect
CALLP4
pop
line 2406
;2405:
;2406:	self->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 2407
;2407:	self->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2408
;2408:}
LABELV $688
endproc DetPackBlow 16 24
export DetPackPain
proc DetPackPain 4 8
line 2411
;2409:
;2410:void DetPackPain(gentity_t *self, gentity_t *attacker, int damage)
;2411:{
line 2412
;2412:	self->think = DetPackBlow;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 DetPackBlow
ASGNP4
line 2413
;2413:	self->nextthink = level.time + Q_irand(50, 100);
CNSTI4 50
ARGI4
CNSTI4 100
ARGI4
ADDRLP4 0
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 2414
;2414:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 0
ASGNI4
line 2415
;2415:}
LABELV $694
endproc DetPackPain 4 8
export DetPackDie
proc DetPackDie 4 8
line 2418
;2416:
;2417:void DetPackDie(gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod)
;2418:{
line 2419
;2419:	self->think = DetPackBlow;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 DetPackBlow
ASGNP4
line 2420
;2420:	self->nextthink = level.time + Q_irand(50, 100);
CNSTI4 50
ARGI4
CNSTI4 100
ARGI4
ADDRLP4 0
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 2421
;2421:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 0
ASGNI4
line 2422
;2422:}
LABELV $696
endproc DetPackDie 4 8
export drop_charge
proc drop_charge 32 8
line 2425
;2423:
;2424:void drop_charge (gentity_t *self, vec3_t start, vec3_t dir) 
;2425:{
line 2428
;2426:	gentity_t	*bolt;
;2427:
;2428:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2430
;2429:
;2430:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 2431
;2431:	bolt->classname = "detpack";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $699
ASGNP4
line 2432
;2432:	bolt->nextthink = level.time + FRAMETIME;
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 2433
;2433:	bolt->think = G_RunObject;
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_RunObject
ASGNP4
line 2434
;2434:	bolt->s.eType = ET_GENERAL;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 2435
;2435:	bolt->s.g2radius = 100;
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 100
ASGNI4
line 2436
;2436:	bolt->s.modelGhoul2 = 1;
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 2437
;2437:	bolt->s.modelindex = G_ModelIndex("models/weapons2/detpack/det_pack_proj.glm"); // w.md3");
ADDRGP4 $701
ARGP4
ADDRLP4 8
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 2440
;2438:
;2439:	//bolt->playerTeam = self->client->playerTeam;
;2440:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 2441
;2441:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 2442
;2442:	bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 100
ASGNI4
line 2443
;2443:	bolt->splashDamage = 200;
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
CNSTI4 200
ASGNI4
line 2444
;2444:	bolt->splashRadius = 200;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
CNSTI4 200
ASGNI4
line 2445
;2445:	bolt->methodOfDeath = MOD_DET_PACK_SPLASH;//MOD_EXPLOSIVE;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 26
ASGNI4
line 2446
;2446:	bolt->splashMethodOfDeath = MOD_DET_PACK_SPLASH;//MOD_EXPLOSIVE_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 26
ASGNI4
line 2447
;2447:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 769
ASGNI4
line 2448
;2448:	bolt->s.solid = 2;
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 2
ASGNI4
line 2449
;2449:	bolt->r.contents = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 769
ASGNI4
line 2450
;2450:	bolt->touch = charge_stick;
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 charge_stick
ASGNP4
line 2452
;2451:
;2452:	bolt->physicsObject = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1
ASGNI4
line 2454
;2453:
;2454:	bolt->s.genericenemyindex = self->s.number+1024;
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 1024
ADDI4
ASGNI4
line 2459
;2455:	//rww - so client prediction knows we own this and won't hit it
;2456:
;2457://	VectorSet( bolt->r.mins, -3, -3, -3 );
;2458://	VectorSet( bolt->r.maxs, 3, 3, 3 );
;2459:	VectorSet( bolt->r.mins, -2, -2, -2 );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3221225472
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3221225472
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3221225472
ASGNF4
line 2460
;2460:	VectorSet( bolt->r.maxs, 2, 2, 2 );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1073741824
ASGNF4
line 2462
;2461:
;2462:	bolt->health = 1;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 1
ASGNI4
line 2463
;2463:	bolt->takedamage = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 1
ASGNI4
line 2464
;2464:	bolt->pain = DetPackPain;
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 DetPackPain
ASGNP4
line 2465
;2465:	bolt->die = DetPackDie;
ADDRLP4 0
INDIRP4
CNSTI4 660
ADDP4
ADDRGP4 DetPackDie
ASGNP4
line 2467
;2466:
;2467:	bolt->s.weapon = WP_DET_PACK;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 13
ASGNI4
line 2469
;2468:
;2469:	bolt->setTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2471
;2470:
;2471:	G_SetOrigin(bolt, start);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 2472
;2472:	bolt->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 2473
;2473:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2474
;2474:	VectorScale(dir, 300, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1133903872
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1133903872
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1133903872
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 2475
;2475:	bolt->s.pos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2477
;2476:
;2477:	bolt->s.apos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 5
ASGNI4
line 2478
;2478:	bolt->s.apos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2479
;2479:	bolt->s.apos.trBase[YAW] = rand()%360;
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 360
MODI4
CVIF4 4
ASGNF4
line 2480
;2480:	bolt->s.apos.trBase[PITCH] = rand()%360;
ADDRLP4 16
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 16
INDIRI4
CNSTI4 360
MODI4
CVIF4 4
ASGNF4
line 2481
;2481:	bolt->s.apos.trBase[ROLL] = rand()%360;
ADDRLP4 20
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 20
INDIRI4
CNSTI4 360
MODI4
CVIF4 4
ASGNF4
line 2483
;2482:
;2483:	if (rand()%10 < 5)
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 10
MODI4
CNSTI4 5
GEI4 $705
line 2484
;2484:	{
line 2485
;2485:		bolt->s.apos.trBase[YAW] = -bolt->s.apos.trBase[YAW];
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
NEGF4
ASGNF4
line 2486
;2486:	}
LABELV $705
line 2488
;2487:
;2488:	vectoangles(dir, bolt->s.angles);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2489
;2489:	VectorCopy(bolt->s.angles, bolt->s.apos.trBase);
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 2490
;2490:	VectorSet(bolt->s.apos.trDelta, 300, 0, 0 );
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
CNSTF4 1133903872
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
CNSTF4 0
ASGNF4
line 2491
;2491:	bolt->s.apos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2493
;2492:
;2493:	trap_LinkEntity(bolt);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2494
;2494:}
LABELV $698
endproc drop_charge 32 8
export BlowDetpacks
proc BlowDetpacks 16 12
line 2497
;2495:
;2496:void BlowDetpacks(gentity_t *ent)
;2497:{
line 2498
;2498:	gentity_t *found = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 2500
;2499:
;2500:	if ( ent->client->ps.hasDetPackPlanted )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
CNSTI4 0
EQI4 $709
line 2501
;2501:	{
ADDRGP4 $712
JUMPV
LABELV $711
line 2503
;2502:		while ( (found = G_Find( found, FOFS(classname), "detpack") ) != NULL )
;2503:		{//loop through all ents and blow the crap out of them!
line 2504
;2504:			if ( found->parent == ent )
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $714
line 2505
;2505:			{
line 2506
;2506:				VectorCopy( found->r.currentOrigin, found->s.origin );
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 2507
;2507:				found->think = DetPackBlow;
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 DetPackBlow
ASGNP4
line 2508
;2508:				found->nextthink = level.time + 100 + random() * 200;
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
CNSTF4 1128792064
ADDRLP4 8
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 2509
;2509:				G_Sound( found, CHAN_BODY, G_SoundIndex("sound/weapons/detpack/warning.wav") );
ADDRGP4 $717
ARGP4
ADDRLP4 12
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2510
;2510:			}
LABELV $714
line 2511
;2511:		}
LABELV $712
line 2502
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 416
ARGI4
ADDRGP4 $699
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
NEU4 $711
line 2512
;2512:		ent->client->ps.hasDetPackPlanted = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 640
ADDP4
CNSTI4 0
ASGNI4
line 2513
;2513:	}
LABELV $709
line 2514
;2514:}
LABELV $708
endproc BlowDetpacks 16 12
export CheatsOn
proc CheatsOn 0 0
line 2517
;2515:
;2516:qboolean CheatsOn(void) 
;2517:{
line 2518
;2518:	if ( !g_cheats.integer )
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
NEI4 $719
line 2519
;2519:	{
line 2520
;2520:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $718
JUMPV
LABELV $719
line 2522
;2521:	}
;2522:	return qtrue;
CNSTI4 1
RETI4
LABELV $718
endproc CheatsOn 0 0
lit
align 4
LABELV $723
byte 4 1023
skip 4092
export WP_DropDetPack
code
proc WP_DropDetPack 4140 20
line 2526
;2523:}
;2524:
;2525:void WP_DropDetPack( gentity_t *ent, qboolean alt_fire )
;2526:{
line 2527
;2527:	gentity_t	*found = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 2528
;2528:	int			trapcount = 0;
ADDRLP4 4116
CNSTI4 0
ASGNI4
line 2529
;2529:	int			foundDetPacks[MAX_GENTITIES] = {ENTITYNUM_NONE};
ADDRLP4 8
ADDRGP4 $723
INDIRB
ASGNB 4096
line 2535
;2530:	int			trapcount_org;
;2531:	int			lowestTimeStamp;
;2532:	int			removeMe;
;2533:	int			i;
;2534:
;2535:	if ( !ent || !ent->client )
ADDRLP4 4120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4124
CNSTU4 0
ASGNU4
ADDRLP4 4120
INDIRP4
CVPU4 4
ADDRLP4 4124
INDIRU4
EQU4 $726
ADDRLP4 4120
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4124
INDIRU4
NEU4 $728
LABELV $726
line 2536
;2536:	{
line 2537
;2537:		return;
ADDRGP4 $722
JUMPV
LABELV $727
line 2543
;2538:	}
;2539:
;2540:	//limit to 10 placed at any one time
;2541:	//see how many there are now
;2542:	while ( (found = G_Find( found, FOFS(classname), "detpack" )) != NULL )
;2543:	{
line 2544
;2544:		if ( found->parent != ent )
ADDRLP4 4
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $730
line 2545
;2545:		{
line 2546
;2546:			continue;
ADDRGP4 $728
JUMPV
LABELV $730
line 2548
;2547:		}
;2548:		foundDetPacks[trapcount++] = found->s.number;
ADDRLP4 4128
ADDRLP4 4116
INDIRI4
ASGNI4
ADDRLP4 4116
ADDRLP4 4128
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4128
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRP4
INDIRI4
ASGNI4
line 2549
;2549:	}
LABELV $728
line 2542
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 416
ARGI4
ADDRGP4 $699
ARGP4
ADDRLP4 4128
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 4128
INDIRP4
ASGNP4
ADDRLP4 4128
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $727
line 2551
;2550:	//now remove first ones we find until there are only 9 left
;2551:	found = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 2552
;2552:	trapcount_org = trapcount;
ADDRLP4 4108
ADDRLP4 4116
INDIRI4
ASGNI4
line 2553
;2553:	lowestTimeStamp = level.time;
ADDRLP4 4104
ADDRGP4 level+32
INDIRI4
ASGNI4
ADDRGP4 $734
JUMPV
LABELV $733
line 2555
;2554:	while ( trapcount > 49 )
;2555:	{
line 2556
;2556:		removeMe = -1;
ADDRLP4 4112
CNSTI4 -1
ASGNI4
line 2557
;2557:		for ( i = 0; i < trapcount_org; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $739
JUMPV
LABELV $736
line 2558
;2558:		{
line 2559
;2559:			if ( foundDetPacks[i] == ENTITYNUM_NONE )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $740
line 2560
;2560:			{
line 2561
;2561:				continue;
ADDRGP4 $737
JUMPV
LABELV $740
line 2563
;2562:			}
;2563:			found = &g_entities[foundDetPacks[i]];
ADDRLP4 4
CNSTI4 832
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2564
;2564:			if ( found->setTime < lowestTimeStamp )
ADDRLP4 4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ADDRLP4 4104
INDIRI4
GEI4 $742
line 2565
;2565:			{
line 2566
;2566:				removeMe = i;
ADDRLP4 4112
ADDRLP4 0
INDIRI4
ASGNI4
line 2567
;2567:				lowestTimeStamp = found->setTime;
ADDRLP4 4104
ADDRLP4 4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ASGNI4
line 2568
;2568:			}
LABELV $742
line 2569
;2569:		}
LABELV $737
line 2557
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $739
ADDRLP4 0
INDIRI4
ADDRLP4 4108
INDIRI4
LTI4 $736
line 2570
;2570:		if ( removeMe != -1 )
ADDRLP4 4112
INDIRI4
CNSTI4 -1
EQI4 $735
line 2571
;2571:		{
line 2573
;2572:			//remove it... or blow it?
;2573:			if ( &g_entities[foundDetPacks[removeMe]] == NULL )
CNSTI4 832
ADDRLP4 4112
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
CNSTU4 0
NEU4 $746
line 2574
;2574:			{
line 2575
;2575:				break;
ADDRGP4 $735
JUMPV
LABELV $746
line 2578
;2576:			}
;2577:			else
;2578:			{
line 2579
;2579:				if (!CheatsOn())
ADDRLP4 4132
ADDRGP4 CheatsOn
CALLI4
ASGNI4
ADDRLP4 4132
INDIRI4
CNSTI4 0
NEI4 $748
line 2580
;2580:				{ //Let them have unlimited if cheats are enabled
line 2581
;2581:					G_FreeEntity( &g_entities[foundDetPacks[removeMe]] );
CNSTI4 832
ADDRLP4 4112
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 2582
;2582:				}
LABELV $748
line 2583
;2583:			}
line 2584
;2584:			foundDetPacks[removeMe] = ENTITYNUM_NONE;
ADDRLP4 4112
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTI4 1023
ASGNI4
line 2585
;2585:			trapcount--;
ADDRLP4 4116
ADDRLP4 4116
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2586
;2586:		}
line 2588
;2587:		else
;2588:		{
line 2589
;2589:			break;
LABELV $745
line 2591
;2590:		}
;2591:	}
LABELV $734
line 2554
ADDRLP4 4116
INDIRI4
CNSTI4 49
GTI4 $733
LABELV $735
line 2593
;2592:
;2593:	if ( alt_fire  )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $750
line 2594
;2594:	{
line 2595
;2595:		BlowDetpacks(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BlowDetpacks
CALLV
pop
line 2596
;2596:	}
ADDRGP4 $751
JUMPV
LABELV $750
line 2598
;2597:	else
;2598:	{
line 2599
;2599:		AngleVectors( ent->client->ps.viewangles, forward, right, up );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2601
;2600:
;2601:		CalcMuzzlePoint( ent, forward, right, up, muzzle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 2603
;2602:
;2603:		VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2604
;2604:		VectorMA( muzzle, -4, forward, muzzle );
ADDRLP4 4132
ADDRGP4 muzzle
ASGNP4
ADDRLP4 4136
CNSTF4 3229614080
ASGNF4
ADDRLP4 4132
INDIRP4
ADDRLP4 4132
INDIRP4
INDIRF4
ADDRLP4 4136
INDIRF4
ADDRGP4 forward
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 muzzle+4
ADDRGP4 muzzle+4
INDIRF4
ADDRLP4 4136
INDIRF4
ADDRGP4 forward+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 muzzle+8
ADDRGP4 muzzle+8
INDIRF4
CNSTF4 3229614080
ADDRGP4 forward+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2605
;2605:		drop_charge( ent, muzzle, forward );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 drop_charge
CALLV
pop
line 2607
;2606:
;2607:		ent->client->ps.hasDetPackPlanted = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 640
ADDP4
CNSTI4 1
ASGNI4
line 2608
;2608:	}
LABELV $751
line 2609
;2609:}
LABELV $722
endproc WP_DropDetPack 4140 20
export WP_FireStunBaton
proc WP_FireStunBaton 1172 32
line 2616
;2610:
;2611:
;2612://---------------------------------------------------------
;2613:// FireStunBaton
;2614://---------------------------------------------------------
;2615:void WP_FireStunBaton( gentity_t *ent, qboolean alt_fire )
;2616:{
line 2622
;2617:	gentity_t	*tr_ent;
;2618:	trace_t		tr;
;2619:	vec3_t		mins, maxs, end;
;2620:	vec3_t		muzzleStun;
;2621:
;2622:	if (!ent->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $759
line 2623
;2623:	{
line 2624
;2624:		VectorCopy(ent->r.currentOrigin, muzzleStun);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 2625
;2625:		muzzleStun[2] += 8;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 2626
;2626:	}
ADDRGP4 $760
JUMPV
LABELV $759
line 2628
;2627:	else
;2628:	{
line 2629
;2629:		VectorCopy(ent->client->ps.origin, muzzleStun);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2630
;2630:		muzzleStun[2] += ent->client->ps.viewheight-6;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 6
SUBI4
CVIF4 4
ADDF4
ASGNF4
line 2631
;2631:	}
LABELV $760
line 2633
;2632:
;2633:	muzzleStun[0] += forward[0]*20;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1101004800
ADDRGP4 forward
INDIRF4
MULF4
ADDF4
ASGNF4
line 2634
;2634:	muzzleStun[1] += forward[1]*20;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1101004800
ADDRGP4 forward+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2635
;2635:	muzzleStun[2] += forward[2]*20;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1101004800
ADDRGP4 forward+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2637
;2636:
;2637:	muzzleStun[0] += right[0]*4;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1082130432
ADDRGP4 right
INDIRF4
MULF4
ADDF4
ASGNF4
line 2638
;2638:	muzzleStun[1] += right[1]*4;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1082130432
ADDRGP4 right+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2639
;2639:	muzzleStun[2] += right[2]*4;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1082130432
ADDRGP4 right+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2641
;2640:
;2641:	VectorMA( muzzleStun, STUN_BATON_RANGE, forward, end );
ADDRLP4 1132
CNSTF4 1090519040
ASGNF4
ADDRLP4 1120
ADDRLP4 0
INDIRF4
ADDRLP4 1132
INDIRF4
ADDRGP4 forward
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1120+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 1132
INDIRF4
ADDRGP4 forward+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1120+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1090519040
ADDRGP4 forward+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2643
;2642:
;2643:	VectorSet( maxs, 6, 6, 6 );
ADDRLP4 1136
CNSTF4 1086324736
ASGNF4
ADDRLP4 16
ADDRLP4 1136
INDIRF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 1136
INDIRF4
ASGNF4
ADDRLP4 16+8
CNSTF4 1086324736
ASGNF4
line 2644
;2644:	VectorScale( maxs, -1, mins );
ADDRLP4 1140
CNSTF4 3212836864
ASGNF4
ADDRLP4 1108
ADDRLP4 1140
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
ADDRLP4 1108+4
ADDRLP4 1140
INDIRF4
ADDRLP4 16+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 1108+8
CNSTF4 3212836864
ADDRLP4 16+8
INDIRF4
MULF4
ASGNF4
line 2646
;2645:
;2646:	trap_Trace ( &tr, muzzleStun, mins, maxs, end, ent->s.number, MASK_SHOT );
ADDRLP4 28
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1108
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 1120
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 2648
;2647:
;2648:	if ( tr.entityNum >= ENTITYNUM_WORLD )
ADDRLP4 28+52
INDIRI4
CNSTI4 1022
LTI4 $783
line 2649
;2649:	{
line 2650
;2650:		return;
ADDRGP4 $758
JUMPV
LABELV $783
line 2653
;2651:	}
;2652:
;2653:	tr_ent = &g_entities[tr.entityNum];
ADDRLP4 12
CNSTI4 832
ADDRLP4 28+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2655
;2654:
;2655:	if (tr_ent && tr_ent->takedamage && tr_ent->client)
ADDRLP4 1148
CNSTU4 0
ASGNU4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 1148
INDIRU4
EQU4 $787
ADDRLP4 12
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 0
EQI4 $787
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1148
INDIRU4
EQU4 $787
line 2656
;2656:	{
line 2657
;2657:		if (tr_ent->client->ps.duelInProgress &&
ADDRLP4 1152
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1152
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $789
ADDRLP4 1152
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $789
line 2659
;2658:			tr_ent->client->ps.duelIndex != ent->s.number)
;2659:		{
line 2660
;2660:			return;
ADDRGP4 $758
JUMPV
LABELV $789
line 2663
;2661:		}
;2662:
;2663:		if (ent->client &&
ADDRLP4 1156
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1156
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $791
ADDRLP4 1156
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $791
ADDRLP4 1156
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRLP4 12
INDIRP4
INDIRI4
EQI4 $791
line 2666
;2664:			ent->client->ps.duelInProgress &&
;2665:			ent->client->ps.duelIndex != tr_ent->s.number)
;2666:		{
line 2667
;2667:			return;
ADDRGP4 $758
JUMPV
LABELV $791
line 2669
;2668:		}
;2669:	}
LABELV $787
line 2671
;2670:
;2671:	if ( tr_ent && tr_ent->takedamage )
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $793
ADDRLP4 12
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 0
EQI4 $793
line 2672
;2672:	{
line 2673
;2673:		G_PlayEffect( EFFECT_STUNHIT, tr.endpos, tr.plane.normal );
CNSTI4 8
ARGI4
ADDRLP4 28+12
ARGP4
ADDRLP4 28+24
ARGP4
ADDRGP4 G_PlayEffect
CALLP4
pop
line 2676
;2674:
;2675:		// TEMP!
;2676:		G_Sound( tr_ent, CHAN_WEAPON, G_SoundIndex( va("sound/weapons/melee/punch%d", Q_irand(1, 4)) ) );
CNSTI4 1
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 1156
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRGP4 $797
ARGP4
ADDRLP4 1156
INDIRI4
ARGI4
ADDRLP4 1160
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRLP4 1164
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 1164
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2678
;2677:
;2678:		G_Damage( tr_ent, ent, ent, forward, tr.endpos, STUN_BATON_DAMAGE, (DAMAGE_NO_KNOCKBACK|DAMAGE_HALF_ABSORB), MOD_STUN_BATON );
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 1168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1168
INDIRP4
ARGP4
ADDRLP4 1168
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 28+12
ARGP4
CNSTI4 20
ARGI4
CNSTI4 1028
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 2681
;2679:		//alt-fire?
;2680:
;2681:		if (tr_ent->client)
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $799
line 2682
;2682:		{ //if it's a player then use the shock effect
line 2683
;2683:			tr_ent->client->ps.electrifyTime = level.time + 700;
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 740
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 700
ADDI4
ASGNI4
line 2684
;2684:		}
LABELV $799
line 2685
;2685:	}
LABELV $793
line 2686
;2686:}
LABELV $758
endproc WP_FireStunBaton 1172 32
export SnapVectorTowards
proc SnapVectorTowards 12 0
line 2706
;2687:
;2688:
;2689:////////////////////////////////////////////////////////////////////////////
;2690:////////////////////////////////////////////////////////////////////////////
;2691:////////////////////////////////////////////////////////////////////////////
;2692:////////////////////////////////////////////////////////////////////////////
;2693:////////////////////////////////////////////////////////////////////////////
;2694:
;2695:
;2696:/*
;2697:======================
;2698:SnapVectorTowards
;2699:
;2700:Round a vector to integers for more efficient network
;2701:transmission, but make sure that it rounds towards a given point
;2702:rather than blindly truncating.  This prevents it from truncating 
;2703:into a wall.
;2704:======================
;2705:*/
;2706:void SnapVectorTowards( vec3_t v, vec3_t to ) {
line 2709
;2707:	int		i;
;2708:
;2709:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $803
line 2710
;2710:		if ( to[i] <= v[i] ) {
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
GTF4 $807
line 2711
;2711:			v[i] = (int)v[i];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
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
line 2712
;2712:		} else {
ADDRGP4 $808
JUMPV
LABELV $807
line 2713
;2713:			v[i] = (int)v[i] + 1;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CVFI4 4
CNSTI4 1
ADDI4
CVIF4 4
ASGNF4
line 2714
;2714:		}
LABELV $808
line 2715
;2715:	}
LABELV $804
line 2709
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $803
line 2716
;2716:}
LABELV $802
endproc SnapVectorTowards 12 0
export LogAccuracyHit
proc LogAccuracyHit 4 8
line 2727
;2717:
;2718:
;2719://======================================================================
;2720:
;2721:
;2722:/*
;2723:===============
;2724:LogAccuracyHit
;2725:===============
;2726:*/
;2727:qboolean LogAccuracyHit( gentity_t *target, gentity_t *attacker ) {
line 2728
;2728:	if( !target->takedamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 0
NEI4 $810
line 2729
;2729:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $809
JUMPV
LABELV $810
line 2732
;2730:	}
;2731:
;2732:	if ( target == attacker ) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
NEU4 $812
line 2733
;2733:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $809
JUMPV
LABELV $812
line 2736
;2734:	}
;2735:
;2736:	if( !target->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $814
line 2737
;2737:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $809
JUMPV
LABELV $814
line 2740
;2738:	}
;2739:
;2740:	if( !attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $816
line 2741
;2741:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $809
JUMPV
LABELV $816
line 2744
;2742:	}
;2743:
;2744:	if( target->client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $818
line 2745
;2745:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $809
JUMPV
LABELV $818
line 2748
;2746:	}
;2747:
;2748:	if ( OnSameTeam( target, attacker ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $820
line 2749
;2749:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $809
JUMPV
LABELV $820
line 2752
;2750:	}
;2751:
;2752:	return qtrue;
CNSTI4 1
RETI4
LABELV $809
endproc LogAccuracyHit 4 8
export CalcMuzzlePoint
proc CalcMuzzlePoint 64 0
line 2764
;2753:}
;2754:
;2755:
;2756:/*
;2757:===============
;2758:CalcMuzzlePoint
;2759:
;2760:set muzzle location relative to pivoting eye
;2761:===============
;2762:*/
;2763:void CalcMuzzlePoint ( gentity_t *ent, vec3_t forward, vec3_t right, vec3_t up, vec3_t muzzlePoint ) 
;2764:{
line 2768
;2765:	int weapontype;
;2766:	vec3_t muzzleOffPoint;
;2767:
;2768:	weapontype = ent->s.weapon;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
line 2769
;2769:	VectorCopy( ent->s.pos.trBase, muzzlePoint );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 2771
;2770:
;2771:	VectorCopy(WP_MuzzlePoint[weapontype], muzzleOffPoint);
ADDRLP4 0
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 WP_MuzzlePoint
ADDP4
INDIRB
ASGNB 12
line 2773
;2772:
;2773:	if (ent->client->ps.usingATST)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $823
line 2774
;2774:	{
line 2775
;2775:		gentity_t *headEnt = &g_entities[ent->client->damageBoxHandle_Head];
ADDRLP4 16
CNSTI4 832
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1652
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2777
;2776:
;2777:		VectorClear(muzzleOffPoint);
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 2778
;2778:		muzzleOffPoint[0] = 16;
ADDRLP4 0
CNSTF4 1098907648
ASGNF4
line 2779
;2779:		muzzleOffPoint[2] = 128;
ADDRLP4 0+8
CNSTF4 1124073472
ASGNF4
line 2781
;2780:
;2781:		if (headEnt && headEnt->s.number >= MAX_CLIENTS)
ADDRLP4 24
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $828
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 32
LTI4 $828
line 2782
;2782:		{
line 2783
;2783:			if (headEnt->bolt_Waist)
ADDRLP4 16
INDIRP4
CNSTI4 804
ADDP4
INDIRI4
CNSTI4 0
EQI4 $830
line 2784
;2784:			{
line 2785
;2785:				muzzleOffPoint[1] = 3;
ADDRLP4 0+4
CNSTF4 1077936128
ASGNF4
line 2786
;2786:			}
ADDRGP4 $831
JUMPV
LABELV $830
line 2788
;2787:			else
;2788:			{
line 2789
;2789:				muzzleOffPoint[1] = -4;
ADDRLP4 0+4
CNSTF4 3229614080
ASGNF4
line 2790
;2790:			}
LABELV $831
line 2791
;2791:		}
LABELV $828
line 2792
;2792:	}
LABELV $823
line 2795
;2793:
;2794:#if 1
;2795:	if (weapontype > WP_NONE && weapontype < WP_NUM_WEAPONS)
ADDRLP4 12
INDIRI4
CNSTI4 0
LEI4 $834
ADDRLP4 12
INDIRI4
CNSTI4 16
GEI4 $834
line 2796
;2796:	{	// Use the table to generate the muzzlepoint;
line 2797
;2797:		{	// Crouching.  Use the add-to-Z method to adjust vertically.
line 2798
;2798:			VectorMA(muzzlePoint, muzzleOffPoint[0], forward, muzzlePoint);
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24
CNSTI4 4
ASGNI4
ADDRLP4 28
ADDRFP4 16
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 32
CNSTI4 8
ASGNI4
ADDRLP4 36
ADDRFP4 16
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 2799
;2799:			VectorMA(muzzlePoint, muzzleOffPoint[1], right, muzzlePoint);
ADDRLP4 40
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 44
CNSTI4 4
ASGNI4
ADDRLP4 48
ADDRFP4 16
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 52
CNSTI4 8
ASGNI4
ADDRLP4 56
ADDRFP4 16
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2800
;2800:			muzzlePoint[2] += ent->client->ps.viewheight + muzzleOffPoint[2];
ADDRLP4 60
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 0+8
INDIRF4
ADDF4
ADDF4
ASGNF4
line 2802
;2801:			// VectorMA(muzzlePoint, ent->client->ps.viewheight + WP_MuzzlePoint[weapontype][2], up, muzzlePoint);
;2802:		}
line 2803
;2803:	}
LABELV $834
line 2812
;2804:#else	// Test code
;2805:	muzzlePoint[2] += ent->client->ps.viewheight;//By eyes
;2806:	muzzlePoint[2] += g_debugUp.value;
;2807:	VectorMA( muzzlePoint, g_debugForward.value, forward, muzzlePoint);
;2808:	VectorMA( muzzlePoint, g_debugRight.value, right, muzzlePoint);
;2809:#endif
;2810:
;2811:	// snap to integer coordinates for more efficient network bandwidth usage
;2812:	SnapVector( muzzlePoint );
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 24
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 28
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 2813
;2813:}
LABELV $822
endproc CalcMuzzlePoint 64 0
export CalcMuzzlePointOrigin
proc CalcMuzzlePointOrigin 36 0
line 2822
;2814:
;2815:/*
;2816:===============
;2817:CalcMuzzlePointOrigin
;2818:
;2819:set muzzle location relative to pivoting eye
;2820:===============
;2821:*/
;2822:void CalcMuzzlePointOrigin ( gentity_t *ent, vec3_t origin, vec3_t forward, vec3_t right, vec3_t up, vec3_t muzzlePoint ) {
line 2823
;2823:	VectorCopy( ent->s.pos.trBase, muzzlePoint );
ADDRFP4 20
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 2824
;2824:	muzzlePoint[2] += ent->client->ps.viewheight;
ADDRLP4 0
ADDRFP4 20
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 2825
;2825:	VectorMA( muzzlePoint, 14, forward, muzzlePoint );
ADDRLP4 4
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 8
CNSTI4 4
ASGNI4
ADDRLP4 12
ADDRFP4 20
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRFP4 8
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 16
CNSTI4 8
ASGNI4
ADDRLP4 20
ADDRFP4 20
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRFP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2827
;2826:	// snap to integer coordinates for more efficient network bandwidth usage
;2827:	SnapVector( muzzlePoint );
ADDRLP4 24
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 28
ADDRFP4 20
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 32
ADDRFP4 20
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 2828
;2828:}
LABELV $840
endproc CalcMuzzlePointOrigin 36 0
export FireWeapon
proc FireWeapon 16 20
line 2837
;2829:
;2830:
;2831:
;2832:/*
;2833:===============
;2834:FireWeapon
;2835:===============
;2836:*/
;2837:void FireWeapon( gentity_t *ent, qboolean altFire ) {
line 2838
;2838:	if (ent->client->ps.powerups[PW_QUAD] ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $842
line 2839
;2839:		s_quadFactor = g_quadfactor.value;
ADDRGP4 s_quadFactor
ADDRGP4 g_quadfactor+8
INDIRF4
ASGNF4
line 2840
;2840:	} else {
ADDRGP4 $843
JUMPV
LABELV $842
line 2841
;2841:		s_quadFactor = 1;
ADDRGP4 s_quadFactor
CNSTF4 1065353216
ASGNF4
line 2842
;2842:	}
LABELV $843
line 2845
;2843:
;2844:	// track shots taken for accuracy tracking.  Grapple is not a weapon and gauntet is just not tracked
;2845:	if( ent->s.weapon != WP_SABER && ent->s.weapon != WP_STUN_BATON ) 
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $845
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $845
line 2846
;2846:	{
line 2847
;2847:		if( ent->s.weapon == WP_FLECHETTE ) {
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 9
NEI4 $847
line 2848
;2848:			ent->client->accuracy_shots += FLECHETTE_SHOTS;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1668
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 5
ADDI4
ASGNI4
line 2849
;2849:		} else {
ADDRGP4 $848
JUMPV
LABELV $847
line 2850
;2850:			ent->client->accuracy_shots++;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1668
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2851
;2851:		}
LABELV $848
line 2852
;2852:	}
LABELV $845
line 2855
;2853:
;2854:	// set aiming directions
;2855:	if (ent->s.weapon == WP_EMPLACED_GUN)
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 14
NEI4 $849
line 2856
;2856:	{
line 2859
;2857:		vec3_t viewAngCap;
;2858:
;2859:		VectorCopy(ent->client->ps.viewangles, viewAngCap);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 2860
;2860:		if (viewAngCap[PITCH] > 40)
ADDRLP4 4
INDIRF4
CNSTF4 1109393408
LEF4 $851
line 2861
;2861:		{
line 2862
;2862:			viewAngCap[PITCH] = 40;
ADDRLP4 4
CNSTF4 1109393408
ASGNF4
line 2863
;2863:		}
LABELV $851
line 2864
;2864:		AngleVectors( viewAngCap, forward, right, up );
ADDRLP4 4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2865
;2865:	}
ADDRGP4 $850
JUMPV
LABELV $849
line 2867
;2866:	else
;2867:	{
line 2868
;2868:		AngleVectors( ent->client->ps.viewangles, forward, right, up );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2869
;2869:	}
LABELV $850
line 2871
;2870:
;2871:	if (ent->client->ps.usingATST)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $853
line 2872
;2872:	{
line 2873
;2873:		gentity_t *headEnt = &g_entities[ent->client->damageBoxHandle_Head];
ADDRLP4 4
CNSTI4 832
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1652
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2875
;2874:
;2875:		if (headEnt && headEnt->s.number >= MAX_CLIENTS)
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $855
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
LTI4 $855
line 2876
;2876:		{
line 2877
;2877:			if (altFire)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $857
line 2878
;2878:			{
line 2879
;2879:				headEnt->bolt_Waist = 0;
ADDRLP4 4
INDIRP4
CNSTI4 804
ADDP4
CNSTI4 0
ASGNI4
line 2880
;2880:			}
ADDRGP4 $858
JUMPV
LABELV $857
line 2882
;2881:			else
;2882:			{
line 2883
;2883:				headEnt->bolt_Waist = 1;
ADDRLP4 4
INDIRP4
CNSTI4 804
ADDP4
CNSTI4 1
ASGNI4
line 2884
;2884:			}
LABELV $858
line 2885
;2885:		}
LABELV $855
line 2886
;2886:	}
LABELV $853
line 2889
;2887:
;2888://	CalcMuzzlePointOrigin ( ent, ent->client->oldOrigin, forward, right, up, muzzle );
;2889:	CalcMuzzlePoint ( ent, forward, right, up, muzzle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 2891
;2890:
;2891:	if (ent->client->ps.usingATST)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $859
line 2892
;2892:	{
line 2893
;2893:		WP_FireBryarPistol( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 WP_FireBryarPistol
CALLV
pop
line 2894
;2894:		return;
ADDRGP4 $841
JUMPV
LABELV $859
line 2898
;2895:	}
;2896:
;2897:	// fire the specific weapon
;2898:	switch( ent->s.weapon ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $862
ADDRLP4 4
INDIRI4
CNSTI4 14
GTI4 $862
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $878-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $878
address $864
address $862
address $866
address $867
address $868
address $869
address $870
address $871
address $872
address $873
address $874
address $875
address $876
address $877
code
LABELV $864
line 2900
;2899:	case WP_STUN_BATON:
;2900:		WP_FireStunBaton( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireStunBaton
CALLV
pop
line 2901
;2901:		break;
ADDRGP4 $862
JUMPV
line 2904
;2902:
;2903:	case WP_SABER:
;2904:		break;
LABELV $866
line 2907
;2905:
;2906:	case WP_BRYAR_PISTOL:
;2907:		WP_FireBryarPistol( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireBryarPistol
CALLV
pop
line 2908
;2908:		break;
ADDRGP4 $862
JUMPV
LABELV $867
line 2911
;2909:
;2910:	case WP_BLASTER:
;2911:		WP_FireBlaster( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireBlaster
CALLV
pop
line 2912
;2912:		break;
ADDRGP4 $862
JUMPV
LABELV $868
line 2915
;2913:
;2914:	case WP_DISRUPTOR:
;2915:		WP_FireDisruptor( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireDisruptor
CALLV
pop
line 2916
;2916:		break;
ADDRGP4 $862
JUMPV
LABELV $869
line 2919
;2917:
;2918:	case WP_BOWCASTER:
;2919:		WP_FireBowcaster( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireBowcaster
CALLV
pop
line 2920
;2920:		break;
ADDRGP4 $862
JUMPV
LABELV $870
line 2923
;2921:
;2922:	case WP_REPEATER:
;2923:		WP_FireRepeater( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireRepeater
CALLV
pop
line 2924
;2924:		break;
ADDRGP4 $862
JUMPV
LABELV $871
line 2927
;2925:
;2926:	case WP_DEMP2:
;2927:		WP_FireDEMP2( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireDEMP2
CALLV
pop
line 2928
;2928:		break;
ADDRGP4 $862
JUMPV
LABELV $872
line 2931
;2929:
;2930:	case WP_FLECHETTE:
;2931:		WP_FireFlechette( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireFlechette
CALLV
pop
line 2932
;2932:		break;
ADDRGP4 $862
JUMPV
LABELV $873
line 2935
;2933:
;2934:	case WP_ROCKET_LAUNCHER:
;2935:		WP_FireRocket( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireRocket
CALLV
pop
line 2936
;2936:		break;
ADDRGP4 $862
JUMPV
LABELV $874
line 2939
;2937:
;2938:	case WP_THERMAL:
;2939:		WP_FireThermalDetonator( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireThermalDetonator
CALLP4
pop
line 2940
;2940:		break;
ADDRGP4 $862
JUMPV
LABELV $875
line 2943
;2941:
;2942:	case WP_TRIP_MINE:
;2943:		WP_PlaceLaserTrap( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_PlaceLaserTrap
CALLV
pop
line 2944
;2944:		break;
ADDRGP4 $862
JUMPV
LABELV $876
line 2947
;2945:
;2946:	case WP_DET_PACK:
;2947:		WP_DropDetPack( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_DropDetPack
CALLV
pop
line 2948
;2948:		break;
ADDRGP4 $862
JUMPV
LABELV $877
line 2951
;2949:
;2950:	case WP_EMPLACED_GUN:
;2951:		WP_FireEmplaced( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireEmplaced
CALLV
pop
line 2952
;2952:		break;
line 2955
;2953:	default:
;2954:// FIXME		G_Error( "Bad ent->s.weapon" );
;2955:		break;
LABELV $862
line 2958
;2956:	}
;2957:
;2958:	G_LogWeaponFire(ent->s.number, ent->s.weapon);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_LogWeaponFire
CALLV
pop
line 2959
;2959:}
LABELV $841
endproc FireWeapon 16 20
export AnimEntCalcMuzzlePoint
proc AnimEntCalcMuzzlePoint 64 0
line 2962
;2960:
;2961:void AnimEntCalcMuzzlePoint ( gentity_t *ent, vec3_t forward, vec3_t right, vec3_t up, vec3_t muzzlePoint ) 
;2962:{
line 2966
;2963:	int weapontype;
;2964:	vec3_t muzzleOffPoint;
;2965:
;2966:	weapontype = ent->s.weapon;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
line 2967
;2967:	VectorCopy( ent->s.pos.trBase, muzzlePoint );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 2969
;2968:
;2969:	VectorCopy(WP_MuzzlePoint[weapontype], muzzleOffPoint);
ADDRLP4 0
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 WP_MuzzlePoint
ADDP4
INDIRB
ASGNB 12
line 2971
;2970:
;2971:	if (weapontype > WP_NONE && weapontype < WP_NUM_WEAPONS)
ADDRLP4 12
INDIRI4
CNSTI4 0
LEI4 $881
ADDRLP4 12
INDIRI4
CNSTI4 16
GEI4 $881
line 2972
;2972:	{	// Use the table to generate the muzzlepoint;
line 2973
;2973:		{	// Crouching.  Use the add-to-Z method to adjust vertically.
line 2974
;2974:			VectorMA(muzzlePoint, muzzleOffPoint[0], forward, muzzlePoint);
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24
CNSTI4 4
ASGNI4
ADDRLP4 28
ADDRFP4 16
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 32
CNSTI4 8
ASGNI4
ADDRLP4 36
ADDRFP4 16
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 2975
;2975:			VectorMA(muzzlePoint, muzzleOffPoint[1], right, muzzlePoint);
ADDRLP4 40
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 44
CNSTI4 4
ASGNI4
ADDRLP4 48
ADDRFP4 16
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 52
CNSTI4 8
ASGNI4
ADDRLP4 56
ADDRFP4 16
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2976
;2976:			muzzlePoint[2] += 24 + muzzleOffPoint[2];
ADDRLP4 60
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
ADDRLP4 0+8
INDIRF4
CNSTF4 1103101952
ADDF4
ADDF4
ASGNF4
line 2977
;2977:		}
line 2978
;2978:	}
LABELV $881
line 2981
;2979:
;2980:	// snap to integer coordinates for more efficient network bandwidth usage
;2981:	SnapVector( muzzlePoint );
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 24
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 28
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 2982
;2982:}
LABELV $880
endproc AnimEntCalcMuzzlePoint 64 0
export AnimEntFireWeapon
proc AnimEntFireWeapon 20 20
line 2985
;2983:
;2984:void AnimEntFireWeapon( gentity_t *ent, qboolean altFire )
;2985:{
line 2987
;2986:	vec3_t modifiedAngles;
;2987:	VectorCopy(ent->s.apos.trBase, modifiedAngles);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 2989
;2988://	modifiedAngles[PITCH] = -modifiedAngles[PITCH];
;2989:	if (modifiedAngles[PITCH] < -180)
ADDRLP4 0
INDIRF4
CNSTF4 3274964992
GEF4 $888
line 2990
;2990:	{
line 2991
;2991:		modifiedAngles[PITCH] += 90;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1119092736
ADDF4
ASGNF4
line 2992
;2992:	}
LABELV $888
line 2993
;2993:	AngleVectors( modifiedAngles, forward, right, up );
ADDRLP4 0
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2995
;2994:
;2995:	AnimEntCalcMuzzlePoint ( ent, forward, right, up, muzzle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 AnimEntCalcMuzzlePoint
CALLV
pop
line 3001
;2996:
;2997:	//rww - NOTE: I have only tested the bryar, blaster, and disruptor for weapon firing.
;2998:	//Other routines will likely have a client pointer reference in them and cause a crash.
;2999:
;3000:	// fire the specific weapon
;3001:	switch( ent->s.weapon )
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
LTI4 $891
ADDRLP4 12
INDIRI4
CNSTI4 14
GTI4 $891
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $907-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $907
address $893
address $891
address $895
address $896
address $897
address $898
address $899
address $900
address $901
address $902
address $903
address $904
address $905
address $906
code
line 3002
;3002:	{
LABELV $893
line 3004
;3003:	case WP_STUN_BATON:
;3004:		WP_FireStunBaton( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireStunBaton
CALLV
pop
line 3005
;3005:		break;
ADDRGP4 $891
JUMPV
line 3008
;3006:
;3007:	case WP_SABER:
;3008:		break;
LABELV $895
line 3011
;3009:
;3010:	case WP_BRYAR_PISTOL:
;3011:		WP_FireBryarPistol( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireBryarPistol
CALLV
pop
line 3012
;3012:		break;
ADDRGP4 $891
JUMPV
LABELV $896
line 3015
;3013:
;3014:	case WP_BLASTER:
;3015:		WP_FireBlaster( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireBlaster
CALLV
pop
line 3016
;3016:		break;
ADDRGP4 $891
JUMPV
LABELV $897
line 3019
;3017:
;3018:	case WP_DISRUPTOR:
;3019:		WP_FireDisruptor( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireDisruptor
CALLV
pop
line 3020
;3020:		break;
ADDRGP4 $891
JUMPV
LABELV $898
line 3023
;3021:
;3022:	case WP_BOWCASTER:
;3023:		WP_FireBowcaster( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireBowcaster
CALLV
pop
line 3024
;3024:		break;
ADDRGP4 $891
JUMPV
LABELV $899
line 3027
;3025:
;3026:	case WP_REPEATER:
;3027:		WP_FireRepeater( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireRepeater
CALLV
pop
line 3028
;3028:		break;
ADDRGP4 $891
JUMPV
LABELV $900
line 3031
;3029:
;3030:	case WP_DEMP2:
;3031:		WP_FireDEMP2( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireDEMP2
CALLV
pop
line 3032
;3032:		break;
ADDRGP4 $891
JUMPV
LABELV $901
line 3035
;3033:
;3034:	case WP_FLECHETTE:
;3035:		WP_FireFlechette( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireFlechette
CALLV
pop
line 3036
;3036:		break;
ADDRGP4 $891
JUMPV
LABELV $902
line 3039
;3037:
;3038:	case WP_ROCKET_LAUNCHER:
;3039:		WP_FireRocket( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireRocket
CALLV
pop
line 3040
;3040:		break;
ADDRGP4 $891
JUMPV
LABELV $903
line 3043
;3041:
;3042:	case WP_THERMAL:
;3043:		WP_FireThermalDetonator( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireThermalDetonator
CALLP4
pop
line 3044
;3044:		break;
ADDRGP4 $891
JUMPV
LABELV $904
line 3047
;3045:
;3046:	case WP_TRIP_MINE:
;3047:		WP_PlaceLaserTrap( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_PlaceLaserTrap
CALLV
pop
line 3048
;3048:		break;
ADDRGP4 $891
JUMPV
LABELV $905
line 3051
;3049:
;3050:	case WP_DET_PACK:
;3051:		WP_DropDetPack( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_DropDetPack
CALLV
pop
line 3052
;3052:		break;
ADDRGP4 $891
JUMPV
LABELV $906
line 3055
;3053:
;3054:	case WP_EMPLACED_GUN:
;3055:		WP_FireEmplaced( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireEmplaced
CALLV
pop
line 3056
;3056:		break;
line 3058
;3057:	default:
;3058:		break;
LABELV $891
line 3060
;3059:	}
;3060:}
LABELV $887
endproc AnimEntFireWeapon 20 20
proc WP_FireEmplaced 64 20
line 3065
;3061:
;3062://---------------------------------------------------------
;3063:static void WP_FireEmplaced( gentity_t *ent, qboolean altFire )
;3064://---------------------------------------------------------
;3065:{
line 3071
;3066:	vec3_t	dir, angs, gunpoint; //g2r , gunaxis;
;3067:	vec3_t	right;
;3068:	gentity_t *gun;
;3069://	mdxaBone_t matrix;
;3070:
;3071:	if (!ent->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $910
line 3072
;3072:	{
line 3073
;3073:		return;
ADDRGP4 $909
JUMPV
LABELV $910
line 3076
;3074:	}
;3075:
;3076:	if (!ent->client->ps.emplacedIndex)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
CNSTI4 0
NEI4 $912
line 3077
;3077:	{
line 3078
;3078:		return;
ADDRGP4 $909
JUMPV
LABELV $912
line 3081
;3079:	}
;3080:
;3081:	gun = &g_entities[ent->client->ps.emplacedIndex];
ADDRLP4 0
CNSTI4 832
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3083
;3082:
;3083:	if (!gun)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $914
line 3084
;3084:	{
line 3085
;3085:		return;
ADDRGP4 $909
JUMPV
LABELV $914
line 3088
;3086:	}
;3087:
;3088:	VectorCopy(/*ent->client->ps.origin*/gun->s.origin, gunpoint);
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 3089
;3089:	gunpoint[2] += 46;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CNSTF4 1110966272
ADDF4
ASGNF4
line 3091
;3090:
;3091:	AngleVectors(ent->client->ps.viewangles, NULL, right, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 52
CNSTP4 0
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3093
;3092:
;3093:	if (gun->bolt_Waist)
ADDRLP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRI4
CNSTI4 0
EQI4 $917
line 3094
;3094:	{
line 3095
;3095:		gunpoint[0] += right[0]*10;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1092616192
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
line 3096
;3096:		gunpoint[1] += right[1]*10;
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
CNSTF4 1092616192
ADDRLP4 16+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 3097
;3097:		gunpoint[2] += right[2]*10;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CNSTF4 1092616192
ADDRLP4 16+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3099
;3098:
;3099:		gun->bolt_Waist = 0;
ADDRLP4 0
INDIRP4
CNSTI4 804
ADDP4
CNSTI4 0
ASGNI4
line 3100
;3100:		G_AddEvent(gun, EV_FIRE_WEAPON, 0);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 24
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 3101
;3101:	}
ADDRGP4 $918
JUMPV
LABELV $917
line 3103
;3102:	else
;3103:	{
line 3104
;3104:		gunpoint[0] -= right[0]*10;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1092616192
ADDRLP4 16
INDIRF4
MULF4
SUBF4
ASGNF4
line 3105
;3105:		gunpoint[1] -= right[1]*10;
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
CNSTF4 1092616192
ADDRLP4 16+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 3106
;3106:		gunpoint[2] -= right[2]*10;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CNSTF4 1092616192
ADDRLP4 16+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 3107
;3107:		gun->bolt_Waist = 1;
ADDRLP4 0
INDIRP4
CNSTI4 804
ADDP4
CNSTI4 1
ASGNI4
line 3108
;3108:		G_AddEvent(gun, EV_FIRE_WEAPON, 1);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 24
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 3109
;3109:	}
LABELV $918
line 3111
;3110:
;3111:	vectoangles( forward, angs );
ADDRGP4 forward
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3113
;3112:
;3113:	if ( altFire )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $927
line 3114
;3114:	{
line 3116
;3115:		// add some slop to the alt-fire direction
;3116:		angs[PITCH] += crandom() * BLASTER_SPREAD;
ADDRLP4 56
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 28
INDIRF4
CNSTF4 1070386381
CNSTF4 1073741824
ADDRLP4 56
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 3117
;3117:		angs[YAW]	+= crandom() * BLASTER_SPREAD;
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 28+4
ADDRLP4 28+4
INDIRF4
CNSTF4 1070386381
CNSTF4 1073741824
ADDRLP4 60
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 3118
;3118:	}
LABELV $927
line 3120
;3119:
;3120:	AngleVectors( angs, dir, NULL, NULL );
ADDRLP4 28
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 56
CNSTP4 0
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3124
;3121:
;3122:	// FIXME: if temp_org does not have clear trace to inside the bbox, don't shoot!
;3123:	//WP_FireEmplacedMissile( ent, gunpoint, dir, altFire, gun );
;3124:	WP_FireEmplacedMissile( gun, gunpoint, dir, altFire, ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 40
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_FireEmplacedMissile
CALLV
pop
line 3126
;3125:	//WP_FireTurretMissile(gun, gunpoint, dir, altFire, 15, 2000, MOD_BLASTER, ent);
;3126:}
LABELV $909
endproc WP_FireEmplaced 64 20
export emplaced_gun_use
proc emplaced_gun_use 108 16
line 3139
;3127:
;3128:#define EMPLACED_CANRESPAWN 1
;3129:
;3130://----------------------------------------------------------
;3131:
;3132:/*QUAKED emplaced_gun (0 0 1) (-30 -20 8) (30 20 60) CANRESPAWN
;3133:
;3134: count - if CANRESPAWN spawnflag, decides how long it is before gun respawns (in ms)
;3135:*/
;3136: 
;3137://----------------------------------------------------------
;3138:void emplaced_gun_use( gentity_t *self, gentity_t *other, trace_t *trace )
;3139:{
line 3143
;3140:	vec3_t fwd1, fwd2;
;3141:	float dot;
;3142:	int oldWeapon;
;3143:	gentity_t *activator = other;
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
line 3144
;3144:	float zoffset = 50;
ADDRLP4 64
CNSTF4 1112014848
ASGNF4
line 3147
;3145:	vec3_t anglesToOwner;
;3146:	vec3_t vLen;
;3147:	float ownLen = 0;
ADDRLP4 56
CNSTF4 0
ASGNF4
line 3149
;3148:
;3149:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $931
line 3150
;3150:	{
line 3152
;3151:		// can't use a dead gun.
;3152:		return;
ADDRGP4 $930
JUMPV
LABELV $931
line 3155
;3153:	}
;3154:
;3155:	if (self->activator)
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $933
line 3156
;3156:	{
line 3157
;3157:		return;
ADDRGP4 $930
JUMPV
LABELV $933
line 3160
;3158:	}
;3159:
;3160:	if (!activator->client)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $935
line 3161
;3161:	{
line 3162
;3162:		return;
ADDRGP4 $930
JUMPV
LABELV $935
line 3165
;3163:	}
;3164:
;3165:	if (activator->client->ps.emplacedTime > level.time)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 600
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $937
line 3166
;3166:	{
line 3167
;3167:		return;
ADDRGP4 $930
JUMPV
LABELV $937
line 3170
;3168:	}
;3169:
;3170:	if (activator->client->ps.weaponTime > 0)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $940
line 3171
;3171:	{
line 3172
;3172:		return;
ADDRGP4 $930
JUMPV
LABELV $940
line 3175
;3173:	}
;3174:
;3175:	if (activator->client->ps.origin[2] > self->s.origin[2]+zoffset-8)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 64
INDIRF4
ADDF4
CNSTF4 1090519040
SUBF4
LEF4 $942
line 3176
;3176:	{
line 3177
;3177:		return;
ADDRGP4 $930
JUMPV
LABELV $942
line 3180
;3178:	} //can't use it from the top
;3179:
;3180:	if (activator->client->ps.pm_flags & PMF_DUCKED)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $944
line 3181
;3181:	{
line 3182
;3182:		return;
ADDRGP4 $930
JUMPV
LABELV $944
line 3185
;3183:	}
;3184:
;3185:	if (activator->client->ps.isJediMaster)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $946
line 3186
;3186:	{ //;O
line 3187
;3187:		return;
ADDRGP4 $930
JUMPV
LABELV $946
line 3190
;3188:	}
;3189:
;3190:	VectorSubtract(self->s.origin, activator->client->ps.origin, vLen);
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 44
ADDRLP4 68
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 44+4
ADDRLP4 68
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 44+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3191
;3191:	ownLen = VectorLength(vLen);
ADDRLP4 44
ARGP4
ADDRLP4 76
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 56
ADDRLP4 76
INDIRF4
ASGNF4
line 3193
;3192:
;3193:	if (ownLen > 64)
ADDRLP4 56
INDIRF4
CNSTF4 1115684864
LEF4 $950
line 3194
;3194:	{
line 3195
;3195:		return;
ADDRGP4 $930
JUMPV
LABELV $950
line 3199
;3196:	}
;3197:
;3198:	// Let's get some direction vectors for the users
;3199:	AngleVectors( activator->client->ps.viewangles, fwd1, NULL, NULL );
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 80
CNSTP4 0
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3202
;3200:
;3201:	// Get the guns direction vector
;3202:	AngleVectors( self->pos1, fwd2, NULL, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 548
ADDP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 84
CNSTP4 0
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3204
;3203:
;3204:	dot = DotProduct( fwd1, fwd2 );
ADDRLP4 40
ADDRLP4 4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 16+4
INDIRF4
MULF4
ADDF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 16+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3207
;3205:
;3206:	// Must be reasonably facing the way the gun points ( 110 degrees or so ), otherwise we don't allow to use it.
;3207:	if ( dot < -0.2f )
ADDRLP4 40
INDIRF4
CNSTF4 3192704205
GEF4 $956
line 3208
;3208:	{
line 3209
;3209:		return;
ADDRGP4 $930
JUMPV
LABELV $956
line 3212
;3210:	}
;3211:
;3212:	VectorSubtract(self->s.origin, activator->client->ps.origin, fwd1);
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 88
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 88
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3213
;3213:	VectorNormalize(fwd1);
ADDRLP4 4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3215
;3214:
;3215:	dot = DotProduct( fwd1, fwd2 );
ADDRLP4 40
ADDRLP4 4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 16+4
INDIRF4
MULF4
ADDF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 16+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3218
;3216:
;3217:	// Must be reasonably facing the way the gun points ( 110 degrees or so ), otherwise we don't allow to use it.
;3218:	if ( dot < /*-0.2f*/0.6f/*0.8f*/ )
ADDRLP4 40
INDIRF4
CNSTF4 1058642330
GEF4 $964
line 3219
;3219:	{
line 3220
;3220:		return;
ADDRGP4 $930
JUMPV
LABELV $964
line 3223
;3221:	}
;3222:
;3223:	self->boltpoint1 = 1;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 1
ASGNI4
line 3228
;3224:
;3225:	// don't allow using it again for half a second
;3226://	if ( activator->s.number == 0 && self->delay + 500 < level.time )
;3227://	{
;3228:		oldWeapon = activator->s.weapon;
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
line 3231
;3229:
;3230:		// swap the users weapon with the emplaced gun and add the ammo the gun has to the player
;3231:		activator->client->ps.weapon = self->s.weapon;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
line 3232
;3232:		activator->client->ps.weaponstate = WEAPON_READY;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 0
ASGNI4
line 3233
;3233:		activator->client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_EMPLACED_GUN );
ADDRLP4 96
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 3237
;3234:
;3235:		//SnapVector(self->s.origin);
;3236:
;3237:		VectorCopy(activator->client->ps.origin, self->s.origin2);
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 3239
;3238:
;3239:		activator->client->ps.emplacedIndex = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 596
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 3241
;3240:
;3241:		self->s.emplacedOwner = activator->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 3242
;3242:		self->s.activeForcePass = NUM_FORCE_POWERS+1;
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
CNSTI4 19
ASGNI4
line 3245
;3243:
;3244:		// the gun will track which weapon we used to have
;3245:		self->s.weapon = oldWeapon;
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDRLP4 60
INDIRI4
ASGNI4
line 3249
;3246:
;3247:		// Lock the player
;3248://		activator->client->ps.eFlags |= EF_LOCKED_TO_WEAPON;
;3249:		activator->r.ownerNum = self->s.number; // kind of dumb, but when we are locked to the weapon, we are owned by it.
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 3250
;3250:		self->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 3275
;3251://		self->delay = level.time; // can't disconnect from the thing for half a second
;3252:
;3253:		// Let the client know that we want to start our emplaced camera clamping
;3254:		// FIXME:  if you are in the gun and you switch/restart maps, emplacedClamp will still be 1 and since
;3255:		//	you can't change it from the console, you are stuck with really bad viewangles
;3256://		char	temp[32];
;3257://		gi.cvar_set("cl_emplacedClamp", "1");
;3258://		sprintf( temp, "%f", self->pos1[0] );
;3259://		gi.cvar_set("cl_emplacedPitch", temp );
;3260://		sprintf( temp, "%f", self->pos1[1] );
;3261://		gi.cvar_set("cl_emplacedYaw", temp );
;3262:
;3263:		// Let the gun be considered an enemy
;3264://		self->svFlags |= SVF_NONNPC_ENEMY;
;3265:
;3266:		// move the player to the center of the gun and make player not solid
;3267://		activator->contents = 0;
;3268://		VectorCopy( self->currentOrigin, activator->client->ps.origin );
;3269:
;3270:		// FIXME: trying to force the gun to look forward, but it seems to pick up the players viewangles....and
;3271:		//	since you usually go up to the side of the gun to use it, you end up starting with a really annoying
;3272:		//	set of viewangles.
;3273:		//G_SetAngles( activator, self->s.angles );
;3274:
;3275:		VectorSubtract(self->r.currentOrigin, activator->client->ps.origin, anglesToOwner);
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 104
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 28
ADDRLP4 100
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 104
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 100
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 104
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28+8
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3276
;3276:		vectoangles(anglesToOwner, anglesToOwner);
ADDRLP4 28
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3286
;3277:
;3278:		//SetClientViewAngle(activator, /*self->s.angles*/anglesToOwner);
;3279:
;3280://		VectorCopy(activator->s.angles, self->pos1);
;3281:
;3282:		// Overriding these may be a bad thing....
;3283://		gi.cvar_set("cg_thirdPersonRange", "20");
;3284://		gi.cvar_set("cg_thirdPersonVertOffset", "35");
;3285://	}
;3286:}
LABELV $930
endproc emplaced_gun_use 108 16
export emplaced_gun_realuse
proc emplaced_gun_realuse 0 12
line 3289
;3287:
;3288:void emplaced_gun_realuse( gentity_t *self, gentity_t *other, gentity_t *activator )
;3289:{
line 3290
;3290:	emplaced_gun_use(self, other, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 emplaced_gun_use
CALLV
pop
line 3291
;3291:}
LABELV $968
endproc emplaced_gun_realuse 0 12
export emplaced_gun_pain
proc emplaced_gun_pain 0 0
line 3295
;3292:
;3293://----------------------------------------------------------
;3294:void emplaced_gun_pain( gentity_t *self, gentity_t *attacker, int damage )
;3295:{
line 3296
;3296:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $970
line 3297
;3297:	{
line 3299
;3298:		// play pain effect?
;3299:	}
LABELV $970
line 3301
;3300:	else
;3301:	{
line 3309
;3302://		if ( self->paintarget )
;3303://		{
;3304://			G_UseTargets2( self, self->activator, self->paintarget );
;3305://		}
;3306:
;3307:		//Don't do script if dead
;3308://		G_ActivateBehavior( self, BSET_PAIN );
;3309:	}
LABELV $971
line 3310
;3310:}
LABELV $969
endproc emplaced_gun_pain 0 0
export emplaced_gun_update
proc emplaced_gun_update 104 24
line 3316
;3311:
;3312:#define EMPLACED_GUN_HEALTH 800
;3313:
;3314://----------------------------------------------------------
;3315:void emplaced_gun_update(gentity_t *self)
;3316:{
line 3319
;3317:	vec3_t	smokeOrg, puffAngle;
;3318:	int oldWeap;
;3319:	float ownLen = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 3321
;3320:
;3321:	if (self->health < 1 && !self->bolt_Head)
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 1
GEI4 $973
ADDRLP4 32
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
CNSTI4 0
NEI4 $973
line 3322
;3322:	{
line 3323
;3323:		if (self->spawnflags & EMPLACED_CANRESPAWN)
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $974
line 3324
;3324:		{
line 3325
;3325:			self->bolt_Head = level.time + 4000 + self->count;
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 4000
ADDI4
ADDRLP4 36
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
ADDI4
ASGNI4
line 3326
;3326:		}
line 3327
;3327:	}
ADDRGP4 $974
JUMPV
LABELV $973
line 3328
;3328:	else if (self->health < 1 && self->bolt_Head < level.time)
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 1
GEI4 $978
ADDRLP4 36
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $978
line 3329
;3329:	{
line 3330
;3330:		self->s.time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 0
ASGNI4
line 3331
;3331:		self->boltpoint4 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 0
ASGNI4
line 3332
;3332:		self->boltpoint3 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 0
ASGNI4
line 3333
;3333:		self->health = EMPLACED_GUN_HEALTH*0.4;
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 320
ASGNI4
line 3334
;3334:	}
LABELV $978
LABELV $974
line 3336
;3335:
;3336:	if (self->boltpoint4 && self->boltpoint4 < 2 && self->s.time < level.time)
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 780
ADDP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $981
ADDRLP4 44
INDIRI4
CNSTI4 2
GEI4 $981
ADDRLP4 40
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $981
line 3337
;3337:	{
line 3340
;3338:		vec3_t explOrg;
;3339:
;3340:		VectorSet( puffAngle, 0, 0, 1 );
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRLP4 0
ADDRLP4 60
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 60
INDIRF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 3342
;3341:
;3342:		VectorCopy(self->r.currentOrigin, explOrg);
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 3343
;3343:		explOrg[2] += 16;
ADDRLP4 48+8
ADDRLP4 48+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 3346
;3344:
;3345:		//G_PlayEffect(EFFECT_EXPLOSION, explOrg, /*self->r.currentAngles*/puffAngle);
;3346:		G_PlayEffect(EFFECT_EXPLOSION_DETPACK, explOrg, /*self->r.currentAngles*/puffAngle);
CNSTI4 6
ARGI4
ADDRLP4 48
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_PlayEffect
CALLP4
pop
line 3348
;3347:
;3348:		self->boltpoint3 = level.time + Q_irand(2500, 3500);
CNSTI4 2500
ARGI4
CNSTI4 3500
ARGI4
ADDRLP4 64
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 64
INDIRI4
ADDI4
ASGNI4
line 3350
;3349:
;3350:		G_RadiusDamage(self->r.currentOrigin, self, self->splashDamage, self->splashRadius, self, MOD_UNKNOWN);
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 696
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 68
INDIRP4
CNSTI4 700
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_RadiusDamage
CALLI4
pop
line 3352
;3351:
;3352:		self->s.time = -1;
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 -1
ASGNI4
line 3354
;3353:
;3354:		self->boltpoint4 = 2;
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 2
ASGNI4
line 3355
;3355:	}
LABELV $981
line 3357
;3356:
;3357:	if (self->boltpoint3 > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $988
line 3358
;3358:	{
line 3359
;3359:		if (self->boltpoint2 < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $991
line 3360
;3360:		{
line 3361
;3361:			VectorSet( puffAngle, 0, 0, 1 );
ADDRLP4 48
CNSTF4 0
ASGNF4
ADDRLP4 0
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 3362
;3362:			VectorCopy(self->r.currentOrigin, smokeOrg);
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 3364
;3363:
;3364:			smokeOrg[2] += 60;
ADDRLP4 20+8
ADDRLP4 20+8
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 3367
;3365:
;3366:			//What.. was I thinking?
;3367:			G_PlayEffect(EFFECT_SMOKE, smokeOrg, puffAngle);
CNSTI4 1
ARGI4
ADDRLP4 20
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_PlayEffect
CALLP4
pop
line 3369
;3368:
;3369:			self->boltpoint2 = level.time + Q_irand(250, 400);
CNSTI4 250
ARGI4
CNSTI4 400
ARGI4
ADDRLP4 52
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 52
INDIRI4
ADDI4
ASGNI4
line 3373
;3370:			//This would be much better if we checked a value on the entity on the client
;3371:			//and then spawned smoke there instead of sending over a bunch of events. But
;3372:			//this will do for now, an event every 250-400ms isn't too bad.
;3373:		}
LABELV $991
line 3374
;3374:	}
LABELV $988
line 3376
;3375:
;3376:	if (self->activator && self->activator->client && self->activator->inuse)
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
ASGNP4
ADDRLP4 52
CNSTU4 0
ASGNU4
ADDRLP4 48
INDIRP4
CVPU4 4
ADDRLP4 52
INDIRU4
EQU4 $998
ADDRLP4 48
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 52
INDIRU4
EQU4 $998
ADDRLP4 48
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $998
line 3377
;3377:	{
line 3379
;3378:		vec3_t vLen;
;3379:		VectorSubtract(self->s.origin, self->activator->client->ps.origin, vLen);
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
ADDRLP4 68
INDIRP4
CNSTI4 732
ADDP4
ASGNP4
ADDRLP4 76
CNSTI4 408
ASGNI4
ADDRLP4 56
ADDRLP4 68
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 68
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56+8
ADDRLP4 80
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3380
;3380:		ownLen = VectorLength(vLen);
ADDRLP4 56
ARGP4
ADDRLP4 84
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 84
INDIRF4
ASGNF4
line 3382
;3381:
;3382:		if (!(self->activator->client->pers.cmd.buttons & BUTTON_USE) && self->boltpoint1)
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRLP4 88
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1400
ADDP4
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 92
INDIRI4
NEI4 $1002
ADDRLP4 88
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
ADDRLP4 92
INDIRI4
EQI4 $1002
line 3383
;3383:		{
line 3384
;3384:			self->boltpoint1 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 0
ASGNI4
line 3385
;3385:		}
LABELV $1002
line 3387
;3386:
;3387:		if ((self->activator->client->pers.cmd.buttons & BUTTON_USE) && !self->boltpoint1)
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
CNSTI4 0
ASGNI4
ADDRLP4 96
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1400
ADDP4
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 100
INDIRI4
EQI4 $1004
ADDRLP4 96
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
ADDRLP4 100
INDIRI4
NEI4 $1004
line 3388
;3388:		{
line 3389
;3389:			self->activator->client->ps.emplacedIndex = 0;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 596
ADDP4
CNSTI4 0
ASGNI4
line 3390
;3390:			self->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 3391
;3391:			return;
ADDRGP4 $972
JUMPV
LABELV $1004
line 3393
;3392:		}
;3393:	}
LABELV $998
line 3395
;3394:
;3395:	if ((self->activator && self->activator->client) &&
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 56
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
ASGNP4
ADDRLP4 64
CNSTU4 0
ASGNU4
ADDRLP4 60
INDIRP4
CVPU4 4
ADDRLP4 64
INDIRU4
EQU4 $1007
ADDRLP4 68
ADDRLP4 60
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CVPU4 4
ADDRLP4 64
INDIRU4
EQU4 $1007
ADDRLP4 72
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
EQI4 $1011
ADDRLP4 68
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
ADDRLP4 56
INDIRP4
INDIRI4
NEI4 $1011
ADDRLP4 56
INDIRP4
CNSTI4 780
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
NEI4 $1011
ADDRLP4 12
INDIRF4
CNSTF4 1115684864
LEF4 $1007
LABELV $1011
line 3397
;3396:		(!self->activator->inuse || self->activator->client->ps.emplacedIndex != self->s.number ||	self->boltpoint4 || ownLen > 64))
;3397:	{
line 3398
;3398:		if (self->activator->client->ps.stats[STAT_WEAPONS] & ( 1 << WP_EMPLACED_GUN ))
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $1012
line 3399
;3399:		{
line 3400
;3400:			self->activator->client->ps.stats[STAT_WEAPONS] -= ( 1 << WP_EMPLACED_GUN );
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 16384
SUBI4
ASGNI4
line 3401
;3401:		}
LABELV $1012
line 3403
;3402:		//VectorCopy(self->s.origin2, self->activator->client->ps.origin);
;3403:		oldWeap = self->activator->client->ps.weapon;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
line 3404
;3404:		self->activator->client->ps.weapon = self->s.weapon;
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
ADDRLP4 76
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
line 3405
;3405:		self->s.weapon = oldWeap;
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 3406
;3406:		self->activator->r.ownerNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CNSTI4 396
ADDP4
CNSTI4 1023
ASGNI4
line 3407
;3407:		self->activator->client->ps.emplacedTime = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 600
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
CVIF4 4
ASGNF4
line 3408
;3408:		self->activator->client->ps.emplacedIndex = 0;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 596
ADDP4
CNSTI4 0
ASGNI4
line 3409
;3409:		self->activator = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTP4 0
ASGNP4
line 3411
;3410:
;3411:		self->s.activeForcePass = 0;
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
CNSTI4 0
ASGNI4
line 3412
;3412:	}
ADDRGP4 $1008
JUMPV
LABELV $1007
line 3413
;3413:	else if (self->activator && self->activator->client)
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
ASGNP4
ADDRLP4 80
CNSTU4 0
ASGNU4
ADDRLP4 76
INDIRP4
CVPU4 4
ADDRLP4 80
INDIRU4
EQU4 $1015
ADDRLP4 76
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 80
INDIRU4
EQU4 $1015
line 3414
;3414:	{
line 3415
;3415:		self->activator->client->ps.weapon = WP_EMPLACED_GUN;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 14
ASGNI4
line 3416
;3416:		self->activator->client->ps.weaponstate = WEAPON_READY;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 0
ASGNI4
line 3417
;3417:	}
LABELV $1015
LABELV $1008
line 3418
;3418:	self->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 3419
;3419:}
LABELV $972
endproc emplaced_gun_update 104 24
export emplaced_gun_die
proc emplaced_gun_die 0 0
line 3423
;3420:
;3421://----------------------------------------------------------
;3422:void emplaced_gun_die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod )
;3423:{
line 3424
;3424:	if (self->boltpoint4)
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1019
line 3425
;3425:	{
line 3426
;3426:		return;
ADDRGP4 $1018
JUMPV
LABELV $1019
line 3429
;3427:	}
;3428:
;3429:	self->boltpoint4 = 1;
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 1
ASGNI4
line 3431
;3430:
;3431:	self->s.time = level.time + 3000;
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 3433
;3432:
;3433:	self->bolt_Head = 0;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
CNSTI4 0
ASGNI4
line 3434
;3434:}
LABELV $1018
endproc emplaced_gun_die 0 0
lit
align 1
LABELV $1023
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
char 1 116
char 1 117
char 1 114
char 1 114
char 1 101
char 1 116
char 1 95
char 1 99
char 1 104
char 1 97
char 1 105
char 1 114
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
export SP_emplaced_gun
code
proc SP_emplaced_gun 1172 28
line 3437
;3435:
;3436:void SP_emplaced_gun( gentity_t *ent )
;3437:{
line 3439
;3438:	//char name[] = "models/map_objects/imp_mine/turret_chair.glm";
;3439:	char name[] = "models/map_objects/mp/turret_chair.glm";
ADDRLP4 1092
ADDRGP4 $1023
INDIRB
ASGNB 39
line 3443
;3440:	vec3_t down;
;3441:	trace_t tr;
;3442:
;3443:	RegisterItem( BG_FindItemForWeapon(WP_BLASTER) );
CNSTI4 4
ARGI4
ADDRLP4 1132
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 3446
;3444:	//Emplaced gun uses many of the same assets as the blaster, so just precache it
;3445:
;3446:	ent->r.contents = CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1
ASGNI4
line 3447
;3447:	ent->s.solid = SOLID_BBOX;
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 2
ASGNI4
line 3449
;3448:
;3449:	ent->bolt_Head = 0;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
CNSTI4 0
ASGNI4
line 3451
;3450:
;3451:	VectorSet( ent->r.mins, -30, -20, 8 );
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3253731328
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3248488448
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 1090519040
ASGNF4
line 3452
;3452:	VectorSet( ent->r.maxs, 30, 20, 60 );
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1106247680
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1101004800
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1114636288
ASGNF4
line 3454
;3453:
;3454:	VectorCopy(ent->s.origin, down);
ADDRLP4 1080
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 3456
;3455:
;3456:	down[2] -= 1024;
ADDRLP4 1080+8
ADDRLP4 1080+8
INDIRF4
CNSTF4 1149239296
SUBF4
ASGNF4
line 3458
;3457:
;3458:	trap_Trace(&tr, ent->s.origin, ent->r.mins, ent->r.maxs, down, ent->s.number, MASK_SOLID);
ADDRLP4 0
ARGP4
ADDRLP4 1136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1136
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 1136
INDIRP4
CNSTI4 316
ADDP4
ARGP4
ADDRLP4 1136
INDIRP4
CNSTI4 328
ADDP4
ARGP4
ADDRLP4 1080
ARGP4
ADDRLP4 1136
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 3460
;3459:
;3460:	if (tr.fraction != 1 && !tr.allsolid && !tr.startsolid)
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $1025
ADDRLP4 1140
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 1140
INDIRI4
NEI4 $1025
ADDRLP4 0+4
INDIRI4
ADDRLP4 1140
INDIRI4
NEI4 $1025
line 3461
;3461:	{
line 3462
;3462:		VectorCopy(tr.endpos, ent->s.origin);
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 3463
;3463:	}
LABELV $1025
line 3465
;3464:
;3465:	ent->spawnflags |= 4; // deadsolid
ADDRLP4 1144
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
ASGNP4
ADDRLP4 1144
INDIRP4
ADDRLP4 1144
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 3467
;3466:
;3467:	ent->health = EMPLACED_GUN_HEALTH;
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 800
ASGNI4
line 3469
;3468:
;3469:	if (ent->spawnflags & EMPLACED_CANRESPAWN)
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1030
line 3470
;3470:	{ //make it somewhat easier to kill if it can respawn
line 3471
;3471:		ent->health *= 0.4;
ADDRLP4 1148
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ASGNP4
ADDRLP4 1148
INDIRP4
CNSTF4 1053609165
ADDRLP4 1148
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 3472
;3472:	}
LABELV $1030
line 3474
;3473:
;3474:	ent->boltpoint4 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 0
ASGNI4
line 3476
;3475:
;3476:	ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 1
ASGNI4
line 3477
;3477:	ent->pain = emplaced_gun_pain;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 emplaced_gun_pain
ASGNP4
line 3478
;3478:	ent->die = emplaced_gun_die;
ADDRFP4 0
INDIRP4
CNSTI4 660
ADDP4
ADDRGP4 emplaced_gun_die
ASGNP4
line 3481
;3479:
;3480:	// being caught in this thing when it blows would be really bad.
;3481:	ent->splashDamage = 80;
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
CNSTI4 80
ASGNI4
line 3482
;3482:	ent->splashRadius = 128;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
CNSTI4 128
ASGNI4
line 3488
;3483:
;3484://	G_EffectIndex( "emplaced/explode" );
;3485://	G_EffectIndex( "emplaced/dead_smoke" );
;3486:
;3487:	// amount of ammo that this little poochie has
;3488:	G_SpawnInt( "count", "600", &ent->count );
ADDRGP4 $1032
ARGP4
ADDRGP4 $1033
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 3490
;3489:
;3490:	ent->s.modelindex = G_ModelIndex( name );
ADDRLP4 1092
ARGP4
ADDRLP4 1148
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 1148
INDIRI4
ASGNI4
line 3491
;3491:	ent->s.modelGhoul2 = 1;
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 3492
;3492:	ent->s.g2radius = 110;
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 110
ASGNI4
line 3503
;3493:	//trap_G2API_InitGhoul2Model( ent->s.ghoul2, name, ent->s.modelindex );
;3494://g2r	trap_G2API_InitGhoul2Model( &ent->s, name, ent->s.modelindex, 0, 0, 0, 0 );
;3495:
;3496:	// Activate our tags and bones
;3497://	ent->headBolt = gi.G2API_AddBolt( &ent->s.ghoul2[0], "*seat" );
;3498://	ent->handLBolt = gi.G2API_AddBolt( &ent->s.ghoul2[0], "*flash01" );
;3499://	ent->handRBolt = gi.G2API_AddBolt( &ent->s.ghoul2[0], "*flash02" );
;3500://	gi.G2API_SetBoneAngles( &ent->s.ghoul2[0], "swivel_bone", vec3_origin, BONE_ANGLES_POSTMULT, POSITIVE_Y, POSITIVE_Z, POSITIVE_X, NULL); 
;3501:
;3502://	RegisterItem( FindItemForWeapon( WP_EMPLACED_GUN ));
;3503:	ent->s.weapon = WP_EMPLACED_GUN;
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 14
ASGNI4
line 3507
;3504:
;3505://	SnapVector(ent->s.origin);
;3506:
;3507:	G_SetOrigin( ent, ent->s.origin );
ADDRLP4 1152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1152
INDIRP4
ARGP4
ADDRLP4 1152
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 3512
;3508:	
;3509:	//G_SetAngles( ent, ent->s.angles );
;3510:
;3511:	// store base angles for later
;3512:	VectorCopy( ent->s.angles, ent->pos1 );
ADDRLP4 1156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1156
INDIRP4
CNSTI4 548
ADDP4
ADDRLP4 1156
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 3513
;3513:	VectorCopy( ent->s.angles, ent->r.currentAngles );
ADDRLP4 1160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1160
INDIRP4
CNSTI4 380
ADDP4
ADDRLP4 1160
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 3514
;3514:	VectorCopy( ent->s.angles, ent->s.apos.trBase );
ADDRLP4 1164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1164
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 1164
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 3516
;3515:
;3516:	ent->think = emplaced_gun_update;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 emplaced_gun_update
ASGNP4
line 3517
;3517:	ent->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 3520
;3518:
;3519://	ent->e_UseFunc = useF_emplaced_gun_use;
;3520:	ent->use = emplaced_gun_realuse;
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDRGP4 emplaced_gun_realuse
ASGNP4
line 3523
;3521:	//ent->touch = emplaced_gun_use;
;3522:
;3523:	ent->r.svFlags |= SVF_PLAYER_USABLE;
ADDRLP4 1168
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 1168
INDIRP4
ADDRLP4 1168
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 3525
;3524:
;3525:	ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 3527
;3526:
;3527:	ent->s.owner = MAX_CLIENTS+1;
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
CNSTI4 33
ASGNI4
line 3528
;3528:	ent->s.shouldtarget = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 268
ADDP4
CNSTI4 1
ASGNI4
line 3529
;3529:	ent->s.teamowner = 0;
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
CNSTI4 0
ASGNI4
line 3543
;3530:
;3531:	/*
;3532:	angswiv[ROLL] = 0;
;3533:	angswiv[PITCH] = 0;
;3534:	angswiv[YAW] = 70;
;3535:	trap_G2API_SetBoneAngles(ent->s.ghoul2, 0, "swivel_bone", angswiv, BONE_ANGLES_REPLACE, POSITIVE_Z, NEGATIVE_X, NEGATIVE_Y, NULL, 0, level.time);
;3536:	*/
;3537:
;3538:
;3539://g2r	ent->s.trickedentindex = trap_G2API_AddBolt(ent->s.ghoul2, 0, "*seat");
;3540://g2r	ent->s.bolt1 = trap_G2API_AddBolt(ent->s.ghoul2, 0, "*flash01");
;3541://g2r	ent->s.bolt2 = trap_G2API_AddBolt(ent->s.ghoul2, 0, "*flash02");
;3542:
;3543:	trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 3544
;3544:}
LABELV $1022
endproc SP_emplaced_gun 1172 28
bss
align 4
LABELV ent_list
skip 4096
import G_GetHitLocation
import G_BoxInBounds
align 4
LABELV muzzle
skip 12
align 4
LABELV up
skip 12
align 4
LABELV right
skip 12
align 4
LABELV forward
skip 12
align 4
LABELV s_quadFactor
skip 4
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
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
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
import G_CreateExampleAnimEnt
import G_PlayerBecomeATST
import ATST_ManageDamageBoxes
import TeleportPlayer
import trigger_teleporter_touch
import Touch_DoorTrigger
import G_RunMover
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
LABELV $1033
char 1 54
char 1 48
char 1 48
char 1 0
align 1
LABELV $1032
char 1 99
char 1 111
char 1 117
char 1 110
char 1 116
char 1 0
align 1
LABELV $797
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
char 1 109
char 1 101
char 1 108
char 1 101
char 1 101
char 1 47
char 1 112
char 1 117
char 1 110
char 1 99
char 1 104
char 1 37
char 1 100
char 1 0
align 1
LABELV $717
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
char 1 119
char 1 97
char 1 114
char 1 110
char 1 105
char 1 110
char 1 103
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $701
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
LABELV $699
char 1 100
char 1 101
char 1 116
char 1 112
char 1 97
char 1 99
char 1 107
char 1 0
align 1
LABELV $687
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
char 1 0
align 1
LABELV $630
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
LABELV $629
char 1 108
char 1 97
char 1 115
char 1 101
char 1 114
char 1 84
char 1 114
char 1 97
char 1 112
char 1 0
align 1
LABELV $621
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
char 1 115
char 1 116
char 1 105
char 1 99
char 1 107
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $609
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
char 1 119
char 1 97
char 1 114
char 1 110
char 1 105
char 1 110
char 1 103
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $579
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
char 1 108
char 1 111
char 1 111
char 1 112
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $563
char 1 116
char 1 104
char 1 101
char 1 114
char 1 109
char 1 97
char 1 108
char 1 95
char 1 100
char 1 101
char 1 116
char 1 111
char 1 110
char 1 97
char 1 116
char 1 111
char 1 114
char 1 0
align 1
LABELV $543
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
char 1 116
char 1 104
char 1 101
char 1 114
char 1 109
char 1 97
char 1 108
char 1 47
char 1 119
char 1 97
char 1 114
char 1 110
char 1 105
char 1 110
char 1 103
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $537
char 1 114
char 1 111
char 1 99
char 1 107
char 1 101
char 1 116
char 1 95
char 1 112
char 1 114
char 1 111
char 1 106
char 1 0
align 1
LABELV $457
char 1 102
char 1 108
char 1 101
char 1 99
char 1 104
char 1 95
char 1 97
char 1 108
char 1 116
char 1 0
align 1
LABELV $422
char 1 102
char 1 108
char 1 101
char 1 99
char 1 104
char 1 95
char 1 112
char 1 114
char 1 111
char 1 106
char 1 0
align 1
LABELV $409
char 1 100
char 1 101
char 1 109
char 1 112
char 1 50
char 1 95
char 1 97
char 1 108
char 1 116
char 1 95
char 1 112
char 1 114
char 1 111
char 1 106
char 1 0
align 1
LABELV $333
char 1 100
char 1 101
char 1 109
char 1 112
char 1 50
char 1 95
char 1 112
char 1 114
char 1 111
char 1 106
char 1 0
align 1
LABELV $327
char 1 114
char 1 101
char 1 112
char 1 101
char 1 97
char 1 116
char 1 101
char 1 114
char 1 95
char 1 97
char 1 108
char 1 116
char 1 95
char 1 112
char 1 114
char 1 111
char 1 106
char 1 0
align 1
LABELV $325
char 1 114
char 1 101
char 1 112
char 1 101
char 1 97
char 1 116
char 1 101
char 1 114
char 1 95
char 1 112
char 1 114
char 1 111
char 1 106
char 1 0
align 1
LABELV $320
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
char 1 97
char 1 108
char 1 116
char 1 95
char 1 112
char 1 114
char 1 111
char 1 106
char 1 0
align 1
LABELV $296
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
char 1 112
char 1 114
char 1 111
char 1 106
char 1 0
align 1
LABELV $143
char 1 101
char 1 109
char 1 112
char 1 108
char 1 97
char 1 99
char 1 101
char 1 100
char 1 95
char 1 103
char 1 117
char 1 110
char 1 95
char 1 112
char 1 114
char 1 111
char 1 106
char 1 0
align 1
LABELV $141
char 1 98
char 1 108
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 95
char 1 112
char 1 114
char 1 111
char 1 106
char 1 0
align 1
LABELV $123
char 1 103
char 1 101
char 1 110
char 1 101
char 1 114
char 1 105
char 1 99
char 1 95
char 1 112
char 1 114
char 1 111
char 1 106
char 1 0
align 1
LABELV $99
char 1 98
char 1 114
char 1 121
char 1 97
char 1 114
char 1 95
char 1 112
char 1 114
char 1 111
char 1 106
char 1 0
