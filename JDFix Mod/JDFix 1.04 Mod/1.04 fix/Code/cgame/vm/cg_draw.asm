data
export menuScoreboard
align 4
LABELV menuScoreboard
byte 4 0
export bluehudtint
align 4
LABELV bluehudtint
byte 4 1056964608
byte 4 1056964608
byte 4 1065353216
byte 4 1065353216
export redhudtint
align 4
LABELV redhudtint
byte 4 1065353216
byte 4 1056964608
byte 4 1056964608
byte 4 1065353216
export showPowersName
align 4
LABELV showPowersName
address $129
address $130
address $131
address $132
address $133
address $134
address $135
address $136
address $137
address $138
address $139
address $140
address $141
address $142
address $143
address $144
address $145
address $146
byte 4 0
export MenuFontToHandle
code
proc MenuFontToHandle 4 0
file "../cg_draw.c"
line 56
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_draw.c -- draw all of the graphical elements during
;4:// active (after loading) gameplay
;5:
;6:#include "cg_local.h"
;7:
;8:#include "../ui/ui_shared.h"
;9:
;10:qboolean CG_WorldCoordToScreenCoordFloat(vec3_t worldCoord, float *x, float *y);
;11:qboolean CG_CalcMuzzlePoint( int entityNum, vec3_t muzzle );
;12:
;13:// used for scoreboard
;14:extern displayContextDef_t cgDC;
;15:menuDef_t *menuScoreboard = NULL;
;16:vec4_t	bluehudtint = {0.5, 0.5, 1.0, 1.0};
;17:vec4_t	redhudtint = {1.0, 0.5, 0.5, 1.0};
;18:float	*hudTintColor;
;19:
;20:int sortedTeamPlayers[TEAM_MAXOVERLAY];
;21:int	numSortedTeamPlayers;
;22:
;23:int lastvalidlockdif;
;24:
;25:extern float zoomFov; //this has to be global client-side
;26:
;27:char systemChat[256];
;28:char teamChat1[256];
;29:char teamChat2[256];
;30:
;31:char *showPowersName[] = 
;32:{
;33:	"HEAL2",//FP_HEAL
;34:	"JUMP2",//FP_LEVITATION
;35:	"SPEED2",//FP_SPEED
;36:	"PUSH2",//FP_PUSH
;37:	"PULL2",//FP_PULL
;38:	"MINDTRICK2",//FP_TELEPTAHY
;39:	"GRIP2",//FP_GRIP
;40:	"LIGHTNING2",//FP_LIGHTNING
;41:	"DARK_RAGE2",//FP_RAGE
;42:	"PROTECT2",//FP_PROTECT
;43:	"ABSORB2",//FP_ABSORB
;44:	"TEAM_HEAL2",//FP_TEAM_HEAL
;45:	"TEAM_REPLENISH2",//FP_TEAM_FORCE
;46:	"DRAIN2",//FP_DRAIN
;47:	"SEEING2",//FP_SEE
;48:	"SABER_OFFENSE2",//FP_SABERATTACK
;49:	"SABER_DEFENSE2",//FP_SABERDEFEND
;50:	"SABER_THROW2",//FP_SABERTHROW
;51:	NULL
;52:};
;53:
;54:
;55:int MenuFontToHandle(int iMenuFont)
;56:{
line 57
;57:	switch (iMenuFont)
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $150
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $153
ADDRLP4 0
INDIRI4
CNSTI4 3
EQI4 $156
ADDRGP4 $148
JUMPV
line 58
;58:	{
LABELV $150
line 59
;59:		case FONT_SMALL:	return cgDC.Assets.qhSmallFont;
ADDRGP4 cgDC+260+12
INDIRI4
RETI4
ADDRGP4 $147
JUMPV
LABELV $153
line 60
;60:		case FONT_MEDIUM:	return cgDC.Assets.qhMediumFont;
ADDRGP4 cgDC+260+16
INDIRI4
RETI4
ADDRGP4 $147
JUMPV
LABELV $156
line 61
;61:		case FONT_LARGE:	return cgDC.Assets.qhBigFont;
ADDRGP4 cgDC+260+20
INDIRI4
RETI4
ADDRGP4 $147
JUMPV
LABELV $148
line 64
;62:	}
;63:
;64:	return cgDC.Assets.qhMediumFont;
ADDRGP4 cgDC+260+16
INDIRI4
RETI4
LABELV $147
endproc MenuFontToHandle 4 0
export CG_Text_Width
proc CG_Text_Width 12 12
line 68
;65:}
;66:
;67:int CG_Text_Width(const char *text, float scale, int iMenuFont) 
;68:{
line 69
;69:	int iFontIndex = MenuFontToHandle(iMenuFont);
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 MenuFontToHandle
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 71
;70:
;71:	return trap_R_Font_StrLenPixels(text, iFontIndex, scale);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 trap_R_Font_StrLenPixels
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
LABELV $161
endproc CG_Text_Width 12 12
export CG_Text_Height
proc CG_Text_Height 12 8
line 75
;72:}
;73:
;74:int CG_Text_Height(const char *text, float scale, int iMenuFont) 
;75:{
line 76
;76:	int iFontIndex = MenuFontToHandle(iMenuFont);
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 MenuFontToHandle
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 78
;77:
;78:	return trap_R_Font_HeightPixels(iFontIndex, scale);
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 trap_R_Font_HeightPixels
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
LABELV $162
endproc CG_Text_Height 12 8
export CG_Text_Paint
proc CG_Text_Paint 20 28
line 83
;79:}
;80:
;81:#include "../qcommon/qfiles.h"	// for STYLE_BLINK etc
;82:void CG_Text_Paint(float x, float y, float scale, vec4_t color, const char *text, float adjust, int limit, int style, int iMenuFont) 
;83:{
line 84
;84:	int iStyleOR = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 85
;85:	int iFontIndex = MenuFontToHandle(iMenuFont);
ADDRFP4 32
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 MenuFontToHandle
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 87
;86:	
;87:	switch (style)
ADDRLP4 12
ADDRFP4 28
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
LTI4 $196
ADDRLP4 12
INDIRI4
CNSTI4 6
GTI4 $196
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $205
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $205
address $198
address $199
address $200
address $201
address $202
address $203
address $204
code
line 88
;88:	{
LABELV $198
line 89
;89:	case  ITEM_TEXTSTYLE_NORMAL:			iStyleOR = 0;break;					// JK2 normal text
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $197
JUMPV
LABELV $199
line 90
;90:	case  ITEM_TEXTSTYLE_BLINK:				iStyleOR = STYLE_BLINK;break;		// JK2 fast blinking
ADDRLP4 0
CNSTI4 1073741824
ASGNI4
ADDRGP4 $197
JUMPV
LABELV $200
line 91
;91:	case  ITEM_TEXTSTYLE_PULSE:				iStyleOR = STYLE_BLINK;break;		// JK2 slow pulsing
ADDRLP4 0
CNSTI4 1073741824
ASGNI4
ADDRGP4 $197
JUMPV
LABELV $201
line 92
;92:	case  ITEM_TEXTSTYLE_SHADOWED:			iStyleOR = (int)STYLE_DROPSHADOW;break;	// JK2 drop shadow ( need a color for this )
ADDRLP4 0
CNSTU4 2147483648
CVUI4 4
ASGNI4
ADDRGP4 $197
JUMPV
LABELV $202
line 93
;93:	case  ITEM_TEXTSTYLE_OUTLINED:			iStyleOR = (int)STYLE_DROPSHADOW;break;	// JK2 drop shadow ( need a color for this )
ADDRLP4 0
CNSTU4 2147483648
CVUI4 4
ASGNI4
ADDRGP4 $197
JUMPV
LABELV $203
line 94
;94:	case  ITEM_TEXTSTYLE_OUTLINESHADOWED:	iStyleOR = (int)STYLE_DROPSHADOW;break;	// JK2 drop shadow ( need a color for this )
ADDRLP4 0
CNSTU4 2147483648
CVUI4 4
ASGNI4
ADDRGP4 $197
JUMPV
LABELV $204
line 95
;95:	case  ITEM_TEXTSTYLE_SHADOWEDMORE:		iStyleOR = (int)STYLE_DROPSHADOW;break;	// JK2 drop shadow ( need a color for this )
ADDRLP4 0
CNSTU4 2147483648
CVUI4 4
ASGNI4
LABELV $196
LABELV $197
line 98
;96:	}
;97:
;98:	trap_R_Font_DrawString(	x,		// int ox
ADDRFP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 4
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
BORI4
ARGI4
ADDRFP4 24
INDIRI4
CNSTI4 0
NEI4 $207
ADDRLP4 16
CNSTI4 -1
ASGNI4
ADDRGP4 $208
JUMPV
LABELV $207
ADDRLP4 16
ADDRFP4 24
INDIRI4
ASGNI4
LABELV $208
ADDRLP4 16
INDIRI4
ARGI4
ADDRFP4 8
INDIRF4
ARGF4
ADDRGP4 trap_R_Font_DrawString
CALLV
pop
line 106
;99:							y,		// int oy
;100:							text,	// const char *text
;101:							color,	// paletteRGBA_c c
;102:							iStyleOR | iFontIndex,	// const int iFontHandle
;103:							!limit?-1:limit,		// iCharLimit (-1 = none)
;104:							scale	// const float scale = 1.0f
;105:							);
;106:}
LABELV $195
endproc CG_Text_Paint 20 28
data
align 4
LABELV $210
byte 4 1
code
proc CG_DrawZoomMask 96 36
line 165
;107:
;108:/*
;109:qboolean CG_WorldCoordToScreenCoord(vec3_t worldCoord, int *x, int *y)
;110:
;111:  Take any world coord and convert it to a 2D virtual 640x480 screen coord
;112:*/
;113:/*
;114:qboolean CG_WorldCoordToScreenCoordFloat(vec3_t worldCoord, float *x, float *y)
;115:{
;116:	int	xcenter, ycenter;
;117:	vec3_t	local, transformed;
;118:
;119://	xcenter = cg.refdef.width / 2;//gives screen coords adjusted for resolution
;120://	ycenter = cg.refdef.height / 2;//gives screen coords adjusted for resolution
;121:	
;122:	//NOTE: did it this way because most draw functions expect virtual 640x480 coords
;123:	//	and adjust them for current resolution
;124:	xcenter = 640 / 2;//gives screen coords in virtual 640x480, to be adjusted when drawn
;125:	ycenter = 480 / 2;//gives screen coords in virtual 640x480, to be adjusted when drawn
;126:
;127:	VectorSubtract (worldCoord, cg.refdef.vieworg, local);
;128:
;129:	transformed[0] = DotProduct(local,vright);
;130:	transformed[1] = DotProduct(local,vup);
;131:	transformed[2] = DotProduct(local,vfwd);		
;132:
;133:	// Make sure Z is not negative.
;134:	if(transformed[2] < 0.01)
;135:	{
;136:		return qfalse;
;137:	}
;138:	// Simple convert to screen coords.
;139:	float xzi = xcenter / transformed[2] * (90.0/cg.refdef.fov_x);
;140:	float yzi = ycenter / transformed[2] * (90.0/cg.refdef.fov_y);
;141:
;142:	*x = xcenter + xzi * transformed[0];
;143:	*y = ycenter - yzi * transformed[1];
;144:
;145:	return qtrue;
;146:}
;147:
;148:qboolean CG_WorldCoordToScreenCoord( vec3_t worldCoord, int *x, int *y )
;149:{
;150:	float	xF, yF;
;151:	qboolean retVal = CG_WorldCoordToScreenCoordFloat( worldCoord, &xF, &yF );
;152:	*x = (int)xF;
;153:	*y = (int)yF;
;154:	return retVal;
;155:}
;156:*/
;157:
;158:/*
;159:================
;160:CG_DrawZoomMask
;161:
;162:================
;163:*/
;164:static void CG_DrawZoomMask( void )
;165:{
line 176
;166:	vec4_t		color1;
;167:	float		level;
;168:	static qboolean	flip = qtrue;
;169:
;170://	int ammo = cg_entities[0].gent->client->ps.ammo[weaponData[cent->currentState.weapon].ammoIndex];
;171:	float cx, cy;
;172://	int val[5];
;173:	float max, fi;
;174:
;175:	// Check for Binocular specific zooming since we'll want to render different bits in each case
;176:	if ( cg.predictedPlayerState.zoomMode == 2 )
ADDRGP4 cg+96+1332
INDIRI4
CNSTI4 2
NEI4 $211
line 177
;177:	{
line 182
;178:		int val, i;
;179:		float off;
;180:
;181:		// zoom level
;182:		level = (float)(80.0f - cg.predictedPlayerState.zoomFov) / 80.0f;
ADDRLP4 48
CNSTF4 1117782016
ASGNF4
ADDRLP4 32
ADDRLP4 48
INDIRF4
ADDRGP4 cg+96+1344
INDIRF4
SUBF4
ADDRLP4 48
INDIRF4
DIVF4
ASGNF4
line 185
;183:
;184:		// ...so we'll clamp it
;185:		if ( level < 0.0f )
ADDRLP4 32
INDIRF4
CNSTF4 0
GEF4 $217
line 186
;186:		{
line 187
;187:			level = 0.0f;
ADDRLP4 32
CNSTF4 0
ASGNF4
line 188
;188:		}
ADDRGP4 $218
JUMPV
LABELV $217
line 189
;189:		else if ( level > 1.0f )
ADDRLP4 32
INDIRF4
CNSTF4 1065353216
LEF4 $219
line 190
;190:		{
line 191
;191:			level = 1.0f;
ADDRLP4 32
CNSTF4 1065353216
ASGNF4
line 192
;192:		}
LABELV $219
LABELV $218
line 195
;193:
;194:		// Using a magic number to convert the zoom level to scale amount
;195:		level *= 162.0f;
ADDRLP4 32
CNSTF4 1126301696
ADDRLP4 32
INDIRF4
MULF4
ASGNF4
line 198
;196:
;197:		// draw blue tinted distortion mask, trying to make it as small as is necessary to fill in the viewable area
;198:		trap_R_SetColor( colorTable[CT_WHITE] );
ADDRGP4 colorTable+128
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 199
;199:		CG_DrawPic( 34, 48, 570, 362, cgs.media.binocularStatic );
CNSTF4 1107820544
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1141800960
ARGF4
CNSTF4 1135935488
ARGF4
ADDRGP4 cgs+70296+540
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 202
;200:	
;201:		// Black out the area behind the numbers
;202:		trap_R_SetColor( colorTable[CT_BLACK]);
ADDRGP4 colorTable+16
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 203
;203:		CG_DrawPic( 212, 367, 200, 40, cgs.media.whiteShader );
CNSTF4 1129578496
ARGF4
CNSTF4 1136099328
ARGF4
CNSTF4 1128792064
ARGF4
CNSTF4 1109393408
ARGF4
ADDRGP4 cgs+70296+4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 206
;204:
;205:		// Numbers should be kind of greenish
;206:		color1[0] = 0.2f;
ADDRLP4 0
CNSTF4 1045220557
ASGNF4
line 207
;207:		color1[1] = 0.4f;
ADDRLP4 0+4
CNSTF4 1053609165
ASGNF4
line 208
;208:		color1[2] = 0.2f;
ADDRLP4 0+8
CNSTF4 1045220557
ASGNF4
line 209
;209:		color1[3] = 0.3f;
ADDRLP4 0+12
CNSTF4 1050253722
ASGNF4
line 210
;210:		trap_R_SetColor( color1 );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 214
;211:
;212:		// Draw scrolling numbers, use intervals 10 units apart--sorry, this section of code is just kind of hacked
;213:		//	up with a bunch of magic numbers.....
;214:		val = ((int)((cg.refdefViewAngles[YAW] + 180) / 10)) * 10;
ADDRLP4 40
CNSTI4 10
ADDRGP4 cg+3984+4
INDIRF4
CNSTF4 1127481344
ADDF4
CNSTF4 1092616192
DIVF4
CVFI4 4
MULI4
ASGNI4
line 215
;215:		off = (cg.refdefViewAngles[YAW] + 180) - val;
ADDRLP4 44
ADDRGP4 cg+3984+4
INDIRF4
CNSTF4 1127481344
ADDF4
ADDRLP4 40
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 217
;216:
;217:		for ( i = -10; i < 30; i += 10 )
ADDRLP4 36
CNSTI4 -10
ASGNI4
LABELV $234
line 218
;218:		{
line 219
;219:			val -= 10;
ADDRLP4 40
ADDRLP4 40
INDIRI4
CNSTI4 10
SUBI4
ASGNI4
line 221
;220:
;221:			if ( val < 0 )
ADDRLP4 40
INDIRI4
CNSTI4 0
GEI4 $238
line 222
;222:			{
line 223
;223:				val += 360;
ADDRLP4 40
ADDRLP4 40
INDIRI4
CNSTI4 360
ADDI4
ASGNI4
line 224
;224:			}
LABELV $238
line 228
;225:
;226:			// we only want to draw the very far left one some of the time, if it's too far to the left it will
;227:			//	poke outside the mask.
;228:			if (( off > 3.0f && i == -10 ) || i > -10 )
ADDRLP4 44
INDIRF4
CNSTF4 1077936128
LEF4 $243
ADDRLP4 36
INDIRI4
CNSTI4 -10
EQI4 $242
LABELV $243
ADDRLP4 36
INDIRI4
CNSTI4 -10
LEI4 $240
LABELV $242
line 229
;229:			{
line 231
;230:				// draw the value, but add 200 just to bump the range up...arbitrary, so change it if you like
;231:				CG_DrawNumField( 155 + i * 10 + off * 10, 374, 3, val + 200, 24, 14, NUM_FONT_CHUNKY, qtrue );
CNSTI4 10
ADDRLP4 36
INDIRI4
MULI4
CNSTI4 155
ADDI4
CVIF4 4
CNSTF4 1092616192
ADDRLP4 44
INDIRF4
MULF4
ADDF4
CVFI4 4
ARGI4
CNSTI4 374
ARGI4
ADDRLP4 52
CNSTI4 3
ASGNI4
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 40
INDIRI4
CNSTI4 200
ADDI4
ARGI4
CNSTI4 24
ARGI4
CNSTI4 14
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_DrawNumField
CALLV
pop
line 232
;232:				CG_DrawPic( 245 + (i-1) * 10 + off * 10, 376, 6, 6, cgs.media.whiteShader );
ADDRLP4 56
CNSTI4 10
ASGNI4
ADDRLP4 56
INDIRI4
ADDRLP4 36
INDIRI4
MULI4
ADDRLP4 56
INDIRI4
SUBI4
CNSTI4 245
ADDI4
CVIF4 4
CNSTF4 1092616192
ADDRLP4 44
INDIRF4
MULF4
ADDF4
ARGF4
CNSTF4 1136394240
ARGF4
ADDRLP4 60
CNSTF4 1086324736
ASGNF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRGP4 cgs+70296+4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 233
;233:			}
LABELV $240
line 234
;234:		}
LABELV $235
line 217
ADDRLP4 36
ADDRLP4 36
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 30
LTI4 $234
line 236
;235:
;236:		CG_DrawPic( 212, 367, 200, 28, cgs.media.binocularOverlay );
CNSTF4 1129578496
ARGF4
CNSTF4 1136099328
ARGF4
CNSTF4 1128792064
ARGF4
CNSTF4 1105199104
ARGF4
ADDRGP4 cgs+70296+544
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 238
;237:
;238:		color1[0] = sin( cg.time * 0.01f ) * 0.5f + 0.5f;
CNSTF4 1008981770
ADDRGP4 cg+64
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 52
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0
CNSTF4 1056964608
ADDRLP4 52
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 239
;239:		color1[0] = color1[0] * color1[0];
ADDRLP4 56
ADDRLP4 0
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 56
INDIRF4
ADDRLP4 56
INDIRF4
MULF4
ASGNF4
line 240
;240:		color1[1] = color1[0];
ADDRLP4 0+4
ADDRLP4 0
INDIRF4
ASGNF4
line 241
;241:		color1[2] = color1[0];
ADDRLP4 0+8
ADDRLP4 0
INDIRF4
ASGNF4
line 242
;242:		color1[3] = 1.0f;
ADDRLP4 0+12
CNSTF4 1065353216
ASGNF4
line 244
;243:
;244:		trap_R_SetColor( color1 );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 246
;245:
;246:		CG_DrawPic( 82, 94, 16, 16, cgs.media.binocularCircle );
CNSTF4 1118044160
ARGF4
CNSTF4 1119617024
ARGF4
ADDRLP4 60
CNSTF4 1098907648
ASGNF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRGP4 cgs+70296+524
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 249
;247:
;248:		// Flickery color
;249:		color1[0] = 0.7f + crandom() * 0.1f;
ADDRLP4 64
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
CNSTF4 1036831949
CNSTF4 1073741824
ADDRLP4 64
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
CNSTF4 1060320051
ADDF4
ASGNF4
line 250
;250:		color1[1] = 0.8f + crandom() * 0.1f;
ADDRLP4 68
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+4
CNSTF4 1036831949
CNSTF4 1073741824
ADDRLP4 68
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
CNSTF4 1061997773
ADDF4
ASGNF4
line 251
;251:		color1[2] = 0.7f + crandom() * 0.1f;
ADDRLP4 72
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+8
CNSTF4 1036831949
CNSTF4 1073741824
ADDRLP4 72
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
CNSTF4 1060320051
ADDF4
ASGNF4
line 252
;252:		color1[3] = 1.0f;
ADDRLP4 0+12
CNSTF4 1065353216
ASGNF4
line 253
;253:		trap_R_SetColor( color1 );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 255
;254:	
;255:		CG_DrawPic( 0, 0, 640, 480, cgs.media.binocularMask );
ADDRLP4 76
CNSTF4 0
ASGNF4
ADDRLP4 76
INDIRF4
ARGF4
ADDRLP4 76
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRGP4 cgs+70296+528
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 257
;256:
;257:		CG_DrawPic( 4, 282 - level, 16, 16, cgs.media.binocularArrow );
CNSTF4 1082130432
ARGF4
CNSTF4 1133314048
ADDRLP4 32
INDIRF4
SUBF4
ARGF4
ADDRLP4 80
CNSTF4 1098907648
ASGNF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRGP4 cgs+70296+532
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 260
;258:
;259:		// The top triangle bit randomly flips 
;260:		if ( flip )
ADDRGP4 $210
INDIRI4
CNSTI4 0
EQI4 $261
line 261
;261:		{
line 262
;262:			CG_DrawPic( 330, 60, -26, -30, cgs.media.binocularTri );
CNSTF4 1134886912
ARGF4
CNSTF4 1114636288
ARGF4
CNSTF4 3251634176
ARGF4
CNSTF4 3253731328
ARGF4
ADDRGP4 cgs+70296+536
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 263
;263:		}
ADDRGP4 $262
JUMPV
LABELV $261
line 265
;264:		else
;265:		{
line 266
;266:			CG_DrawPic( 307, 40, 26, 30, cgs.media.binocularTri );
CNSTF4 1134133248
ARGF4
CNSTF4 1109393408
ARGF4
CNSTF4 1104150528
ARGF4
CNSTF4 1106247680
ARGF4
ADDRGP4 cgs+70296+536
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 267
;267:		}
LABELV $262
line 269
;268:
;269:		if ( random() > 0.98f && ( cg.time & 1024 ))
ADDRLP4 84
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1065017672
LEF4 $212
ADDRGP4 cg+64
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $212
line 270
;270:		{
line 271
;271:			flip = !flip;
ADDRLP4 92
ADDRGP4 $210
ASGNP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $271
ADDRLP4 88
CNSTI4 1
ASGNI4
ADDRGP4 $272
JUMPV
LABELV $271
ADDRLP4 88
CNSTI4 0
ASGNI4
LABELV $272
ADDRLP4 92
INDIRP4
ADDRLP4 88
INDIRI4
ASGNI4
line 272
;272:		}
line 273
;273:	}
ADDRGP4 $212
JUMPV
LABELV $211
line 274
;274:	else if ( cg.predictedPlayerState.zoomMode)
ADDRGP4 cg+96+1332
INDIRI4
CNSTI4 0
EQI4 $273
line 275
;275:	{
line 277
;276:		// disruptor zoom mode
;277:		level = (float)(50.0f - zoomFov) / 50.0f;//(float)(80.0f - zoomFov) / 80.0f;
ADDRLP4 36
CNSTF4 1112014848
ASGNF4
ADDRLP4 32
ADDRLP4 36
INDIRF4
ADDRGP4 zoomFov
INDIRF4
SUBF4
ADDRLP4 36
INDIRF4
DIVF4
ASGNF4
line 280
;278:
;279:		// ...so we'll clamp it
;280:		if ( level < 0.0f )
ADDRLP4 32
INDIRF4
CNSTF4 0
GEF4 $277
line 281
;281:		{
line 282
;282:			level = 0.0f;
ADDRLP4 32
CNSTF4 0
ASGNF4
line 283
;283:		}
ADDRGP4 $278
JUMPV
LABELV $277
line 284
;284:		else if ( level > 1.0f )
ADDRLP4 32
INDIRF4
CNSTF4 1065353216
LEF4 $279
line 285
;285:		{
line 286
;286:			level = 1.0f;
ADDRLP4 32
CNSTF4 1065353216
ASGNF4
line 287
;287:		}
LABELV $279
LABELV $278
line 290
;288:
;289:		// Using a magic number to convert the zoom level to a rotation amount that correlates more or less with the zoom artwork. 
;290:		level *= 103.0f;
ADDRLP4 32
CNSTF4 1120796672
ADDRLP4 32
INDIRF4
MULF4
ASGNF4
line 293
;291:
;292:		// Draw target mask
;293:		trap_R_SetColor( colorTable[CT_WHITE] );
ADDRGP4 colorTable+128
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 294
;294:		CG_DrawPic( 0, 0, 640, 480, cgs.media.disruptorMask );
ADDRLP4 40
CNSTF4 0
ASGNF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRGP4 cgs+70296+504
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 297
;295:
;296:		// apparently 99.0f is the full zoom level
;297:		if ( level >= 99 )
ADDRLP4 32
INDIRF4
CNSTF4 1120272384
LTF4 $284
line 298
;298:		{
line 300
;299:			// Fully zoomed, so make the rotating insert pulse
;300:			color1[0] = 1.0f; 
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 301
;301:			color1[1] = 1.0f;
ADDRLP4 0+4
CNSTF4 1065353216
ASGNF4
line 302
;302:			color1[2] = 1.0f;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 303
;303:			color1[3] = 0.7f + sin( cg.time * 0.01f ) * 0.3f;
CNSTF4 1008981770
ADDRGP4 cg+64
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 44
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0+12
CNSTF4 1050253722
ADDRLP4 44
INDIRF4
MULF4
CNSTF4 1060320051
ADDF4
ASGNF4
line 305
;304:
;305:			trap_R_SetColor( color1 );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 306
;306:		}
LABELV $284
line 309
;307:
;308:		// Draw rotating insert
;309:		CG_DrawRotatePic2( 320, 240, 640, 480, -level, cgs.media.disruptorInsert );
CNSTF4 1134559232
ARGF4
CNSTF4 1131413504
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRLP4 32
INDIRF4
NEGF4
ARGF4
ADDRGP4 cgs+70296+508
INDIRI4
ARGI4
ADDRGP4 CG_DrawRotatePic2
CALLV
pop
line 337
;310:
;311:		// Increase the light levels under the center of the target
;312://		CG_DrawPic( 198, 118, 246, 246, cgs.media.disruptorLight );
;313:
;314:		// weirdness.....converting ammo to a base five number scale just to be geeky.
;315:/*		val[0] = ammo % 5;
;316:		val[1] = (ammo / 5) % 5;
;317:		val[2] = (ammo / 25) % 5;
;318:		val[3] = (ammo / 125) % 5;
;319:		val[4] = (ammo / 625) % 5;
;320:		
;321:		color1[0] = 0.2f;
;322:		color1[1] = 0.55f + crandom() * 0.1f;
;323:		color1[2] = 0.5f + crandom() * 0.1f;
;324:		color1[3] = 1.0f;
;325:		trap_R_SetColor( color1 );
;326:
;327:		for ( int t = 0; t < 5; t++ )
;328:		{
;329:			cx = 320 + sin( (t*10+45)/57.296f ) * 192;
;330:			cy = 240 + cos( (t*10+45)/57.296f ) * 192;
;331:
;332:			CG_DrawRotatePic2( cx, cy, 24, 38, 45 - t * 10, trap_R_RegisterShader( va("gfx/2d/char%d",val[4-t] )));
;333:		}
;334:*/
;335:		//max = ( cg_entities[0].gent->health / 100.0f );
;336:
;337:		max = cg.snap->ps.ammo[weaponData[WP_DISRUPTOR].ammoIndex] / (float)ammoData[weaponData[WP_DISRUPTOR].ammoIndex].max;
ADDRLP4 44
CNSTI4 2
ASGNI4
ADDRLP4 28
ADDRGP4 weaponData+280
INDIRI4
ADDRLP4 44
INDIRI4
LSHI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 452
ADDP4
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 weaponData+280
INDIRI4
ADDRLP4 44
INDIRI4
LSHI4
ADDRGP4 ammoData
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 338
;338:		if ( max > 1.0f )
ADDRLP4 28
INDIRF4
CNSTF4 1065353216
LEF4 $295
line 339
;339:		{
line 340
;340:			max = 1.0f;
ADDRLP4 28
CNSTF4 1065353216
ASGNF4
line 341
;341:		}
LABELV $295
line 343
;342:
;343:		color1[0] = (1.0f - max) * 2.0f; 
ADDRLP4 0
CNSTF4 1073741824
CNSTF4 1065353216
ADDRLP4 28
INDIRF4
SUBF4
MULF4
ASGNF4
line 344
;344:		color1[1] = max * 1.5f;
ADDRLP4 0+4
CNSTF4 1069547520
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 345
;345:		color1[2] = 0.0f;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 346
;346:		color1[3] = 1.0f;
ADDRLP4 0+12
CNSTF4 1065353216
ASGNF4
line 349
;347:
;348:		// If we are low on health, make us flash
;349:		if ( max < 0.15f && ( cg.time & 512 ))
ADDRLP4 28
INDIRF4
CNSTF4 1041865114
GEF4 $300
ADDRGP4 cg+64
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $300
line 350
;350:		{
line 351
;351:			VectorClear( color1 );
ADDRLP4 48
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 48
INDIRF4
ASGNF4
line 352
;352:		}
LABELV $300
line 354
;353:
;354:		if ( color1[0] > 1.0f )
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
LEF4 $305
line 355
;355:		{
line 356
;356:			color1[0] = 1.0f;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 357
;357:		}
LABELV $305
line 359
;358:
;359:		if ( color1[1] > 1.0f )
ADDRLP4 0+4
INDIRF4
CNSTF4 1065353216
LEF4 $307
line 360
;360:		{
line 361
;361:			color1[1] = 1.0f;
ADDRLP4 0+4
CNSTF4 1065353216
ASGNF4
line 362
;362:		}
LABELV $307
line 364
;363:
;364:		trap_R_SetColor( color1 );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 366
;365:
;366:		max *= 58.0f;
ADDRLP4 28
CNSTF4 1114112000
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 368
;367:
;368:		for (fi = 18.5f; fi <= 18.5f + max; fi+= 3 ) // going from 15 to 45 degrees, with 5 degree increments
ADDRLP4 16
CNSTF4 1100218368
ASGNF4
ADDRGP4 $314
JUMPV
LABELV $311
line 369
;369:		{
line 370
;370:			cx = 320 + sin( (fi+90.0f)/57.296f ) * 190;
ADDRLP4 16
INDIRF4
CNSTF4 1119092736
ADDF4
CNSTF4 1113927451
DIVF4
ARGF4
ADDRLP4 48
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 20
CNSTF4 1128136704
ADDRLP4 48
INDIRF4
MULF4
CNSTF4 1134559232
ADDF4
ASGNF4
line 371
;371:			cy = 240 + cos( (fi+90.0f)/57.296f ) * 190;
ADDRLP4 16
INDIRF4
CNSTF4 1119092736
ADDF4
CNSTF4 1113927451
DIVF4
ARGF4
ADDRLP4 52
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 24
CNSTF4 1128136704
ADDRLP4 52
INDIRF4
MULF4
CNSTF4 1131413504
ADDF4
ASGNF4
line 373
;372:
;373:			CG_DrawRotatePic2( cx, cy, 12, 24, 90 - fi, cgs.media.disruptorInsertTick );
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
CNSTF4 1094713344
ARGF4
CNSTF4 1103101952
ARGF4
CNSTF4 1119092736
ADDRLP4 16
INDIRF4
SUBF4
ARGF4
ADDRGP4 cgs+70296+516
INDIRI4
ARGI4
ADDRGP4 CG_DrawRotatePic2
CALLV
pop
line 374
;374:		}
LABELV $312
line 368
ADDRLP4 16
ADDRLP4 16
INDIRF4
CNSTF4 1077936128
ADDF4
ASGNF4
LABELV $314
ADDRLP4 16
INDIRF4
ADDRLP4 28
INDIRF4
CNSTF4 1100218368
ADDF4
LEF4 $311
line 376
;375:
;376:		if ( cg.predictedPlayerState.weaponstate == WEAPON_CHARGING_ALT )
ADDRGP4 cg+96+152
INDIRI4
CNSTI4 5
NEI4 $317
line 377
;377:		{
line 378
;378:			trap_R_SetColor( colorTable[CT_WHITE] );
ADDRGP4 colorTable+128
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 381
;379:
;380:			// draw the charge level
;381:			max = ( cg.time - cg.predictedPlayerState.weaponChargeTime ) / ( 50.0f * 30.0f ); // bad hardcodedness 50 is disruptor charge unit and 30 is max charge units allowed.
ADDRLP4 28
ADDRGP4 cg+64
INDIRI4
ADDRGP4 cg+96+48
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1153138688
DIVF4
ASGNF4
line 383
;382:
;383:			if ( max > 1.0f )
ADDRLP4 28
INDIRF4
CNSTF4 1065353216
LEF4 $325
line 384
;384:			{
line 385
;385:				max = 1.0f;
ADDRLP4 28
CNSTF4 1065353216
ASGNF4
line 386
;386:			}
LABELV $325
line 388
;387:
;388:			trap_R_DrawStretchPic(257, 435, 134*max, 34, 0, 0, max, 1, cgs.media.disruptorChargeShader);
CNSTF4 1132494848
ARGF4
CNSTF4 1138327552
ARGF4
CNSTF4 1124466688
ADDRLP4 28
INDIRF4
MULF4
ARGF4
CNSTF4 1107820544
ARGF4
ADDRLP4 52
CNSTF4 0
ASGNF4
ADDRLP4 52
INDIRF4
ARGF4
ADDRLP4 52
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 cgs+70296+520
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 389
;389:		}
LABELV $317
line 393
;390://		trap_R_SetColor( colorTable[CT_WHITE] );
;391://		CG_DrawPic( 0, 0, 640, 480, cgs.media.disruptorMask );
;392:
;393:	}
LABELV $273
LABELV $212
line 394
;394:}
LABELV $209
endproc CG_DrawZoomMask 96 36
export CG_Draw3DModel
proc CG_Draw3DModel 584 12
line 403
;395:
;396:
;397:/*
;398:================
;399:CG_Draw3DModel
;400:
;401:================
;402:*/
;403:void CG_Draw3DModel( float x, float y, float w, float h, qhandle_t model, qhandle_t skin, vec3_t origin, vec3_t angles ) {
line 407
;404:	refdef_t		refdef;
;405:	refEntity_t		ent;
;406:
;407:	if ( !cg_draw3dIcons.integer || !cg_drawIcons.integer ) {
ADDRLP4 580
CNSTI4 0
ASGNI4
ADDRGP4 cg_draw3dIcons+12
INDIRI4
ADDRLP4 580
INDIRI4
EQI4 $334
ADDRGP4 cg_drawIcons+12
INDIRI4
ADDRLP4 580
INDIRI4
NEI4 $330
LABELV $334
line 408
;408:		return;
ADDRGP4 $329
JUMPV
LABELV $330
line 411
;409:	}
;410:
;411:	memset( &refdef, 0, sizeof( refdef ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 413
;412:
;413:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 368
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 414
;414:	AnglesToAxis( angles, ent.axis );
ADDRFP4 28
INDIRP4
ARGP4
ADDRLP4 368+12
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 415
;415:	VectorCopy( origin, ent.origin );
ADDRLP4 368+52
ADDRFP4 24
INDIRP4
INDIRB
ASGNB 12
line 416
;416:	ent.hModel = model;
ADDRLP4 368+8
ADDRFP4 16
INDIRI4
ASGNI4
line 417
;417:	ent.customSkin = skin;
ADDRLP4 368+136
ADDRFP4 20
INDIRI4
ASGNI4
line 418
;418:	ent.renderfx = RF_NOSHADOW;		// no stencil shadows
ADDRLP4 368+4
CNSTI4 64
ASGNI4
line 420
;419:
;420:	refdef.rdflags = RDF_NOWORLDMODEL;
ADDRLP4 0+76
CNSTI4 1
ASGNI4
line 422
;421:
;422:	AxisClear( refdef.viewaxis );
ADDRLP4 0+36
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 424
;423:
;424:	refdef.fov_x = 30;
ADDRLP4 0+16
CNSTF4 1106247680
ASGNF4
line 425
;425:	refdef.fov_y = 30;
ADDRLP4 0+20
CNSTF4 1106247680
ASGNF4
line 427
;426:
;427:	refdef.x = x;
ADDRLP4 0
ADDRFP4 0
INDIRF4
CVFI4 4
ASGNI4
line 428
;428:	refdef.y = y;
ADDRLP4 0+4
ADDRFP4 4
INDIRF4
CVFI4 4
ASGNI4
line 429
;429:	refdef.width = w;
ADDRLP4 0+8
ADDRFP4 8
INDIRF4
CVFI4 4
ASGNI4
line 430
;430:	refdef.height = h;
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
CVFI4 4
ASGNI4
line 432
;431:
;432:	refdef.time = cg.time;
ADDRLP4 0+72
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 434
;433:
;434:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 435
;435:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 368
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 436
;436:	trap_R_RenderScene( &refdef );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 437
;437:}
LABELV $329
endproc CG_Draw3DModel 584 12
export CG_DrawHead
proc CG_DrawHead 4 20
line 447
;438:
;439:/*
;440:================
;441:CG_DrawHead
;442:
;443:Used for both the status bar and the scoreboard
;444:================
;445:*/
;446:void CG_DrawHead( float x, float y, float w, float h, int clientNum, vec3_t headAngles ) 
;447:{
line 450
;448:	clientInfo_t	*ci;
;449:
;450:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 0
CNSTI4 788
ADDRFP4 16
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 452
;451:
;452:	CG_DrawPic( x, y, w, h, ci->modelIcon );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 455
;453:
;454:	// if they are deferred, draw a cross out
;455:	if ( ci->deferred ) 
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRI4
CNSTI4 0
EQI4 $351
line 456
;456:	{
line 457
;457:		CG_DrawPic( x, y, w, h, cgs.media.deferShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 cgs+70296+108
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 458
;458:	}
LABELV $351
line 459
;459:}
LABELV $349
endproc CG_DrawHead 4 20
export CG_DrawFlagModel
proc CG_DrawFlagModel 72 32
line 468
;460:
;461:/*
;462:================
;463:CG_DrawFlagModel
;464:
;465:Used for both the status bar and the scoreboard
;466:================
;467:*/
;468:void CG_DrawFlagModel( float x, float y, float w, float h, int team, qboolean force2D ) {
line 475
;469:	qhandle_t		cm;
;470:	float			len;
;471:	vec3_t			origin, angles;
;472:	vec3_t			mins, maxs;
;473:	qhandle_t		handle;
;474:
;475:	if ( !force2D && cg_draw3dIcons.integer ) {
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRFP4 20
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $356
ADDRGP4 cg_draw3dIcons+12
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $356
line 477
;476:
;477:		VectorClear( angles );
ADDRLP4 64
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 64
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 64
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 64
INDIRF4
ASGNF4
line 479
;478:
;479:		cm = cgs.media.redFlagModel;
ADDRLP4 48
ADDRGP4 cgs+70296+36
INDIRI4
ASGNI4
line 482
;480:
;481:		// offset the origin y and z to center the flag
;482:		trap_R_ModelBounds( cm, mins, maxs );
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 trap_R_ModelBounds
CALLV
pop
line 484
;483:
;484:		origin[2] = -0.5 * ( mins[2] + maxs[2] );
ADDRLP4 12+8
CNSTF4 3204448256
ADDRLP4 24+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDF4
MULF4
ASGNF4
line 485
;485:		origin[1] = 0.5 * ( mins[1] + maxs[1] );
ADDRLP4 12+4
CNSTF4 1056964608
ADDRLP4 24+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDF4
MULF4
ASGNF4
line 489
;486:
;487:		// calculate distance so the flag nearly fills the box
;488:		// assume heads are taller than wide
;489:		len = 0.5 * ( maxs[2] - mins[2] );		
ADDRLP4 52
CNSTF4 1056964608
ADDRLP4 36+8
INDIRF4
ADDRLP4 24+8
INDIRF4
SUBF4
MULF4
ASGNF4
line 490
;490:		origin[0] = len / 0.268;	// len / tan( fov/2 )
ADDRLP4 12
ADDRLP4 52
INDIRF4
CNSTF4 1049179980
DIVF4
ASGNF4
line 492
;491:
;492:		angles[YAW] = 60 * sin( cg.time / 2000.0 );;
ADDRGP4 cg+64
INDIRI4
CVIF4 4
CNSTF4 1157234688
DIVF4
ARGF4
ADDRLP4 68
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0+4
CNSTF4 1114636288
ADDRLP4 68
INDIRF4
MULF4
ASGNF4
line 494
;493:
;494:		if( team == TEAM_RED ) {
ADDRFP4 16
INDIRI4
CNSTI4 1
NEI4 $373
line 495
;495:			handle = cgs.media.redFlagModel;
ADDRLP4 56
ADDRGP4 cgs+70296+36
INDIRI4
ASGNI4
line 496
;496:		} else if( team == TEAM_BLUE ) {
ADDRGP4 $374
JUMPV
LABELV $373
ADDRFP4 16
INDIRI4
CNSTI4 2
NEI4 $377
line 497
;497:			handle = cgs.media.blueFlagModel;
ADDRLP4 56
ADDRGP4 cgs+70296+40
INDIRI4
ASGNI4
line 498
;498:		} else if( team == TEAM_FREE ) {
ADDRGP4 $378
JUMPV
LABELV $377
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $355
line 499
;499:			handle = cgs.media.neutralFlagModel;
ADDRLP4 56
ADDRGP4 cgs+70296+44
INDIRI4
ASGNI4
line 500
;500:		} else {
line 501
;501:			return;
LABELV $382
LABELV $378
LABELV $374
line 503
;502:		}
;503:		CG_Draw3DModel( x, y, w, h, handle, 0, origin, angles );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 56
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 504
;504:	} else if ( cg_drawIcons.integer ) {
ADDRGP4 $357
JUMPV
LABELV $356
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
EQI4 $385
line 507
;505:		gitem_t *item;
;506:
;507:		if( team == TEAM_RED ) {
ADDRFP4 16
INDIRI4
CNSTI4 1
NEI4 $388
line 508
;508:			item = BG_FindItemForPowerup( PW_REDFLAG );
CNSTI4 4
ARGI4
ADDRLP4 68
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 64
ADDRLP4 68
INDIRP4
ASGNP4
line 509
;509:		} else if( team == TEAM_BLUE ) {
ADDRGP4 $389
JUMPV
LABELV $388
ADDRFP4 16
INDIRI4
CNSTI4 2
NEI4 $390
line 510
;510:			item = BG_FindItemForPowerup( PW_BLUEFLAG );
CNSTI4 5
ARGI4
ADDRLP4 68
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 64
ADDRLP4 68
INDIRP4
ASGNP4
line 511
;511:		} else if( team == TEAM_FREE ) {
ADDRGP4 $391
JUMPV
LABELV $390
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $355
line 512
;512:			item = BG_FindItemForPowerup( PW_NEUTRALFLAG );
CNSTI4 6
ARGI4
ADDRLP4 68
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 64
ADDRLP4 68
INDIRP4
ASGNP4
line 513
;513:		} else {
line 514
;514:			return;
LABELV $393
LABELV $391
LABELV $389
line 516
;515:		}
;516:		if (item) {
ADDRLP4 64
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $394
line 517
;517:		  CG_DrawPic( x, y, w, h, cg_items[ ITEM_INDEX(item) ].icon );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
CNSTI4 56
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 518
;518:		}
LABELV $394
line 519
;519:	}
LABELV $385
LABELV $357
line 520
;520:}
LABELV $355
endproc CG_DrawFlagModel 72 32
export DrawAmmo
proc DrawAmmo 8 0
line 528
;521:
;522:/*
;523:================
;524:DrawAmmo
;525:================
;526:*/
;527:void DrawAmmo()
;528:{
line 531
;529:	int x, y;
;530:
;531:	x = SCREEN_WIDTH-80;
ADDRLP4 0
CNSTI4 560
ASGNI4
line 532
;532:	y = SCREEN_HEIGHT-80;
ADDRLP4 4
CNSTI4 400
ASGNI4
line 534
;533:
;534:}
LABELV $397
endproc DrawAmmo 8 0
export CG_DrawHUDLeftFrame1
proc CG_DrawHUDLeftFrame1 4 20
line 542
;535:
;536:/*
;537:================
;538:CG_DrawHUDLeftFrame1
;539:================
;540:*/
;541:void CG_DrawHUDLeftFrame1(int x,int y)
;542:{
line 544
;543:	// Inner gray wire frame
;544:	trap_R_SetColor( hudTintColor );
ADDRGP4 hudTintColor
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 545
;545:	CG_DrawPic(   x, y, 80, 80, cgs.media.HUDInnerLeft );			
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
CNSTF4 1117782016
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 cgs+70296+1244
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 546
;546:}
LABELV $398
endproc CG_DrawHUDLeftFrame1 4 20
export CG_DrawHUDLeftFrame2
proc CG_DrawHUDLeftFrame2 4 20
line 554
;547:
;548:/*
;549:================
;550:CG_DrawHUDLeftFrame2
;551:================
;552:*/
;553:void CG_DrawHUDLeftFrame2(int x,int y)
;554:{
line 556
;555:	// Inner gray wire frame
;556:	trap_R_SetColor( hudTintColor );
ADDRGP4 hudTintColor
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 557
;557:	CG_DrawPic(   x, y, 80, 80, cgs.media.HUDLeftFrame );		// Metal frame
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
CNSTF4 1117782016
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 cgs+70296+1160
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 558
;558:}
LABELV $401
endproc CG_DrawHUDLeftFrame2 4 20
export DrawHealthArmor
proc DrawHealthArmor 72 32
line 566
;559:
;560:/*
;561:================
;562:DrawHealthArmor
;563:================
;564:*/
;565:void DrawHealthArmor(int x,int y)
;566:{
line 574
;567:	vec4_t calcColor;
;568:	float	armorPercent,hold,healthPercent;
;569:	playerState_t	*ps;
;570:
;571:	int healthAmt;
;572:	int armorAmt;
;573:
;574:	ps = &cg.snap->ps;
ADDRLP4 20
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 576
;575:
;576:	healthAmt = ps->stats[STAT_HEALTH];
ADDRLP4 32
ADDRLP4 20
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
line 577
;577:	armorAmt = ps->stats[STAT_ARMOR];
ADDRLP4 28
ADDRLP4 20
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ASGNI4
line 579
;578:
;579:	if (healthAmt > ps->stats[STAT_MAX_HEALTH])
ADDRLP4 32
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LEI4 $406
line 580
;580:	{
line 581
;581:		healthAmt = ps->stats[STAT_MAX_HEALTH];
ADDRLP4 32
ADDRLP4 20
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 582
;582:	}
LABELV $406
line 584
;583:
;584:	if (armorAmt > 100)
ADDRLP4 28
INDIRI4
CNSTI4 100
LEI4 $408
line 585
;585:	{
line 586
;586:		armorAmt = 100;
ADDRLP4 28
CNSTI4 100
ASGNI4
line 587
;587:	}
LABELV $408
line 589
;588:
;589:	trap_R_SetColor( colorTable[CT_WHITE] );
ADDRGP4 colorTable+128
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 590
;590:	CG_DrawPic(   x, y, 80, 80, cgs.media.HUDLeftFrame );		// Circular black background
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 40
CNSTF4 1117782016
ASGNF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRGP4 cgs+70296+1160
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 593
;591:
;592:	//	Outer Armor circular
;593:	memcpy(calcColor, colorTable[CT_GREEN], sizeof(vec4_t));
ADDRLP4 0
ARGP4
ADDRGP4 colorTable+48
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 595
;594:
;595:	hold = armorAmt-(ps->stats[STAT_MAX_HEALTH]/2);
ADDRLP4 36
ADDRLP4 28
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 2
DIVI4
SUBI4
CVIF4 4
ASGNF4
line 596
;596:	armorPercent = (float) hold/(ps->stats[STAT_MAX_HEALTH]/2);
ADDRLP4 16
ADDRLP4 36
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
DIVF4
ASGNF4
line 597
;597:	if (armorPercent <0)
ADDRLP4 16
INDIRF4
CNSTF4 0
GEF4 $414
line 598
;598:	{
line 599
;599:		armorPercent = 0;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 600
;600:	}
LABELV $414
line 601
;601:	calcColor[0] *= armorPercent;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 602
;602:	calcColor[1] *= armorPercent;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 603
;603:	calcColor[2] *= armorPercent;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 604
;604:	trap_R_SetColor( calcColor);					
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 605
;605:	CG_DrawPic(   x, y, 80, 80, cgs.media.HUDArmor1 );			
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 44
CNSTF4 1117782016
ASGNF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRGP4 cgs+70296+1164
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 608
;606:
;607:	// Inner Armor circular
;608:	if (armorPercent>0)
ADDRLP4 16
INDIRF4
CNSTF4 0
LEF4 $420
line 609
;609:	{
line 610
;610:		armorPercent = 1;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 611
;611:	}
ADDRGP4 $421
JUMPV
LABELV $420
line 613
;612:	else
;613:	{
line 614
;614:		armorPercent = (float) armorAmt/(ps->stats[STAT_MAX_HEALTH]/2);
ADDRLP4 16
ADDRLP4 28
INDIRI4
CVIF4 4
ADDRLP4 20
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
DIVF4
ASGNF4
line 615
;615:	}
LABELV $421
line 616
;616:	memcpy(calcColor, colorTable[CT_GREEN], sizeof(vec4_t));
ADDRLP4 0
ARGP4
ADDRGP4 colorTable+48
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 617
;617:	calcColor[0] *= armorPercent;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 618
;618:	calcColor[1] *= armorPercent;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 619
;619:	calcColor[2] *= armorPercent;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 620
;620:	trap_R_SetColor( calcColor);					
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 621
;621:	CG_DrawPic(   x, y, 80, 80, cgs.media.HUDArmor2 );			//	Inner Armor circular
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 48
CNSTF4 1117782016
ASGNF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRGP4 cgs+70296+1168
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 623
;622:
;623:	if (ps->stats[STAT_ARMOR])	// Is there armor? Draw the HUD Armor TIC
ADDRLP4 20
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
CNSTI4 0
EQI4 $427
line 624
;624:	{
line 626
;625:		// Make tic flash if inner armor is at 50% (25% of full armor)
;626:		if (armorPercent<.5)		// Do whatever the flash timer says
ADDRLP4 16
INDIRF4
CNSTF4 1056964608
GEF4 $429
line 627
;627:		{
line 628
;628:			if (cg.HUDTickFlashTime < cg.time)			// Flip at the same time
ADDRGP4 cg+13764
INDIRF4
ADDRGP4 cg+64
INDIRI4
CVIF4 4
GEF4 $428
line 629
;629:			{
line 630
;630:				cg.HUDTickFlashTime = cg.time + 100;
ADDRGP4 cg+13764
ADDRGP4 cg+64
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ASGNF4
line 631
;631:				if (cg.HUDArmorFlag)
ADDRGP4 cg+13768
INDIRI4
CNSTI4 0
EQI4 $437
line 632
;632:				{
line 633
;633:					cg.HUDArmorFlag = qfalse;
ADDRGP4 cg+13768
CNSTI4 0
ASGNI4
line 634
;634:				}
ADDRGP4 $428
JUMPV
LABELV $437
line 636
;635:				else
;636:				{
line 637
;637:					cg.HUDArmorFlag = qtrue;
ADDRGP4 cg+13768
CNSTI4 1
ASGNI4
line 638
;638:				}
line 639
;639:			}
line 640
;640:		}
ADDRGP4 $428
JUMPV
LABELV $429
line 642
;641:		else
;642:		{
line 643
;643:			cg.HUDArmorFlag=qtrue;
ADDRGP4 cg+13768
CNSTI4 1
ASGNI4
line 644
;644:		}
line 645
;645:	}
ADDRGP4 $428
JUMPV
LABELV $427
line 647
;646:	else						// No armor? Don't show it.
;647:	{
line 648
;648:		cg.HUDArmorFlag=qfalse;
ADDRGP4 cg+13768
CNSTI4 0
ASGNI4
line 649
;649:	}
LABELV $428
line 651
;650:
;651:	memcpy(calcColor, colorTable[CT_RED], sizeof(vec4_t));
ADDRLP4 0
ARGP4
ADDRGP4 colorTable+32
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 652
;652:	healthPercent = (float) healthAmt/ps->stats[STAT_MAX_HEALTH];
ADDRLP4 24
ADDRLP4 32
INDIRI4
CVIF4 4
ADDRLP4 20
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 653
;653:	calcColor[0] *= healthPercent;
ADDRLP4 0
ADDRLP4