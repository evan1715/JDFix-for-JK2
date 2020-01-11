*****************************************

Jedi Knight II: Jedi Outcast MODIFICATION

*****************************************

~!~ JediDog Fix™ v4.6 ~!~

~For JK2 1.04

Note: if you are reading this windowed in a notepad, I recommend maximizing it and going to format and checking word wrap, so it is easier to read.


*~~~~~~=~~~~~~=~~~~~~=~~~~~~=~~~~~~=~~~~~~*
Modification contains:
Patches & fixes:
-Anti Userinfo Flood
-Anti Fake players
-Anti Force Crash
-Anti MSG Boom
-Anti Name  Crash
-Anti Turret Crash
-Fix for Callvote Exploit
-Fix for Duel Challenge Bug
-Fix for 'thedestroyer' Stuck Bug
Server Extras & Commands:
-RCon Command, Slap
-RCon Command, CSay
-RCon Command, jd_CloseServer
-RCon Command, jd_Messages
Client Extras & Commands:
-Sit emote command for clients
-Help Command


*~~~~~=~~~~~*
v4.6 Version Info:
-Fixed team follow bug
-Decreased inbetween duel time from 10 seconds to 3 seconds
-Sleep command no longer has God mode


*~~~~~~=~~~~~~=~~~~~~=~~~~~~=~~~~~~=~~~~~~*
Installation:
Put it in your base. You cannot run this mod with another mod. It is lame, I know, but I guess for those of you who do not have any mods in your server this will be fine.


*~~~~~~=~~~~~~=~~~~~~=~~~~~~=~~~~~~=~~~~~~*
Commands:
-jd_CloseServer = Closes and opens the server whenever you turn it on. (0 = off, 1 = on) Default for command is "0" which is off so players can enter.
-jd_Messages = Disables or enables the messages that automatically print when triggered, like when client enter games, when admin slaps or sleeps another client. So they will no longer show on your screen if it is on off (0). (0 = off, 1 = on)
-Slap = /rcon slap #clientNumber# and the client will be slapped up. Can only be used in FFA game type. (So people wouldn't cheat if it's in duel game type... or if it was in CTF and they had flag it wouldn't ruin it.)
-Sleep = /rcon sleep #clientNumber# and the client will be put to sleep and will not be able to move. Can only be used in FFA game type. (So people wouldn't cheat if it's in duel game type... or if it was in CTF and they had flag it wouldn't ruin it.)
-CSay = /rcon csay <msg> and the message you type will appear in the middle of all client's screens.
-Sit = lets client sit down with their legs crossed.
-Help = displays helpful info, including mod & contact information and lists the Fix's commands.


*~~~~~~=~~~~~~=~~~~~~=~~~~~~=~~~~~~=~~~~~~*
Extras:
-Logs that show IP & info when a client connects, whether they are a fake player or a client with illegal characters.
-Fixed /rcon <msg> & /rcon say <msg> next line bug. Also made it with a few colors. It appears as ^5[^7Server^5]^7:


*~~~~~~=~~~~~~=~~~~~~=~~~~~~=~~~~~~=~~~~~~*
Descriptions of how the exploits work in JK2 1.04(theories):

--Model, Saber & Name Flood - the reason this lags you, lags you out, slows you down or doesn't harm you at all is quite simple. It lags you because the overflow you are loading onto your client, in front of some one is more vulnerable because you have to visually see the changes. If you have higher ping you are more vulnerable because it overflows the amount you have and since you have low connection to the server it's more dangerous. The reason(s) it doesn't harm you is because you have very low ping (around 50 ping) or your /rate is too low. 

--Force Crash - the reason this works is also simple and sort of logical. If you change your force powers into a number that is not in the calculations of what is set to a proper amount of force (forcepowers 7-2-3333333333333333) it sort of glitches itself since it is not the correct number in the calculations of the force powers. Thus meaning since it is not in the correct calculations, it errors and messes up and causes the server to crash.

--MSGBoom Exploit - MSGBoom in JK2 1.04 is similar to a flood. It sends a large message to the server overflowing it and acting as a flood to client(s) possibly lagging you out. Usually when you are flooded or msgboom'd you will either get "Connection Interrupted" message or be sent to your main menu.

--Illegal Characters Crash - The reason I said "illegal characters crash" is because JK2 doesn't support the ASCII characters. (Ex: º¿§ï¡â). If you connect with a certain kind or order, for some reason the server just crashes.

--Duel Challenge Get-Up Quick Bug - whenever a client is knocked down and uses the K bind (/engage_duel) it will activate another animation and allow them to get up quicker than they are supposed to.

--Fix for 'thedestroyer' Stuck Bug - when you use 'thedestroyer' cheat and you try a move on someone, sometimes you might get stuck until some one moves you or something. So, this fixes that so you wont get stuck.

--Fake Players - Fills up server so that no one can join, it is more of an annoyance than a problem. In rare cases, it can cause the server to crash.


*~~~~~*
The fixes in this mod that prevent those bugs above in JK2 1.04.

--Model, Saber & Name Flood - I tried making this blend in so it wouldn't be too noticeable unless you actually tried to flood. It prevents UserInfoChanges from changing within .50 of a second. That's "wait 50;" is the max you can go in a UserInfoChange (model, saber, name, force). I used to have it as you have to wait three seconds in between changes but that was just too annoying, so I put it as .50 so it's nearly normal and less annoying.

--Force Crash - This fix is a work-around using Gamall's fix for it. The fix does not allow any force string that is not within the field of "#-#-################" the first # is what g_maxforcerank is on, 7 is Jedi Master. The second one can only be two numbers, either 1 or 2. One stands for light side of the force and two stands for dark side of the force. The last 16 numbers stand for whatever you chose. So the string should look like 7-1-332003023030303213.

--MSGBoom Exploit - It will not flood out anyone nor crash the server with this mod. It basically drops any large msg coming to the server and doesn't allow it to be shared. There four Anti MSGBoom in this fix.

--Illegal Characters Crash - parses userinfo so that if they have illegal characters, they appear as a period.

--Duel Challenge Get-Up Quick Bug - Clients will not be able to engage in a duel while laying down anymore.

--Fake Players - Denies fake players connection by checking userinfo if it is correct, if it isn't they will be denied access into entering the server.


*~~~~~~=~~~~~~=~~~~~~=~~~~~~=~~~~~~=~~~~~~*
Comments & Notes:
-Some of the most popular mods aren't fully protected:
--DS-Online v1.32 is vulnerable to name crash/glitch.
--DC Mod v1.2 is vulnerable to flood.
--Jedi Academy Mod 1.6 is vulnerable to flood, name crash, force crash and fake players.(That was a horrible mistake not to patch against any of those for JAMod.)
-This is still a basejk2 fix. I added the extras so that people would have more fun.
-Above all, everyone have fun playing JK2 on any version that you play on.


*~~~~~~=~~~~~~=~~~~~~=~~~~~~=~~~~~~=~~~~~~*
BUGS: None that I am aware of.


*~~~~~~=~~~~~~=~~~~~~=~~~~~~=~~~~~~=~~~~~~*
To Contact me & find more fixes and future updates go to
http://jedidog.freeforums.org/


----------------------------------------------------------------------------------
~*Credits for helping, creating & testing:
Dark (helping)
Luigi (helping)
Gamall (force crash fix & helping)
Ouned (sentry fix)



=================================================================================
THIS MODIFICATION IS NOT MADE, DISTRIBUTED, OR SUPPORTED BY ACTIVISION, RAVEN, OR
LUCASARTS ENTERTAINMENT COMPANY LLC. ELEMENTS TM & © LUCASARTS
ENTERTAINMENT COMPANY LLC AND/OR ITS LICENSOR
