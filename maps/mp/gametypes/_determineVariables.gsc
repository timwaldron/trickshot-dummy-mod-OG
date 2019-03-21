#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

doThreads()
{
	self thread doNS();
	self thread doBotsMove();
	self thread doTimescale();
	self thread doBotsShoot();
	self thread doBotsReload();
	self thread doBotLock();
	self thread doNoScopes();
	self thread doAimbot();
	self thread doSuperJumps();
	self thread doInstaKill();
	self thread doDetermineDamage();
}

doNS() // New theory.
{

	for(;;)
	{

		foreach( player in level.players ) {

			// Toggling it on and off.

			if ( getdvar( "g_gravity" ) == "800" ) {

				self setClientDvar( "perk_weapSpreadMultiplier", "1" ); // Commando

			} else if ( getdvar( "g_gravity" ) == "799" ) {

				self setClientDvar( "perk_weapSpreadMultiplier", "0.65" ); // Steady Aim

			} else if ( getdvar( "g_gravity" ) == "798" ) {

				self setClientDvar( "perk_weapSpreadMultiplier", "0.001" ); // Straight Noscopes

			}
		}

		wait 0.1;
	}
}

doTimescale()
{
	for(;;)
	{
		if ( getdvar( "timescale" ) == "1" ) {

			self.slowmo = "false";
			self.slowmoScale = "Off";

		} else if ( getdvar( "timescale" ) == "0.75" ) {

			self.slowmo = "true";
			self.slowmoScale = "75 Percent";

		} else if ( getdvar( "timescale" ) == "0.5" ) {

			self.slowmo = "true";
			self.slowmoScale = "50 Percent";

		} else if ( getdvar( "timescale" ) == "0.25" ) {

			self.slowmo = "true";
			self.slowmoScale = "25 Percent";

		} else if ( getdvar( "timescale" ) == "20" ) {

			self.slowmo = "true";
			self.slowmoScale = "Super Fast";

		}

		wait 0.1;
	}
}

doBotsMove()
{
	for(;;)
	{
		if ( getdvar( "testClients_doMove" ) == "0" ) {
			
			self.bMove = "false";

		} else if ( getdvar( "testClients_doMove" ) == "1" ) {

			self.bMove = "true";
		}
		
		wait 0.1;
	}
}

doBotsShoot()
{
	for(;;)
	{
		if ( getdvar( "testClients_doAttack" ) == "0" ) {
			
			self.bShoot = "false";

		} else if ( getdvar( "testClients_doAttack" ) == "1" ) {

			self.bShoot = "true";
		}
		
		wait 0.1;
	}
}

doBotsReload()
{
	for(;;)
	{
		if ( getdvar( "testClients_doReload" ) == "0" ) {
			
			self.bReload = "false";

		} else if ( getdvar( "testClients_doReload" ) == "1" ) {

			self.bReload = "true";
		}
		
		wait 0.1;
	}
}

doBotLock()
{
	for(;;)
	{
		if ( getdvar( "cg_airstrikeKillCamNearBlurEnd" ) == "100" ) {
			
			self.bLock = "false";

		} else if ( getdvar( "cg_airstrikeKillCamNearBlurEnd" ) == "101" ) {

			self.bLock = "true";
		}
		
		wait 0.1;
	}
}

doNoScopes()
{
	for(;;)
	{

		if ( getdvar( "g_gravity" ) == "800" ) {

			self.noScopes = "Commando";

		} else if ( getdvar( "g_gravity" ) == "799" ) {

			self.noScopes = "Steady Aim";

		} else if ( getdvar( "g_gravity" ) == "798" ) {

			self.noScopes = "Straight No-Scopes";

		}

		wait 0.1;
	}
}

// Fun Stuff

doAimbot()
{
	for(;;)
	{

		if ( getdvar( "g_allowvote" ) == "0" ) {

			self.aimbot = "true";

		} else if ( getdvar( "g_allowvote" ) == "1" ) {

			self.aimbot = "false";

		}

		wait 0.1;
	}
}

doSuperJumps()
{
	for(;;)
	{

		if ( getdvar( "jump_height" ) == "200" ) {

			self.sjumps = "true";

		} else if ( getdvar( "jump_height" ) == "39" ) {

			self.sjumps = "false";

		}

		wait 0.1;
	}
}

/*
	bg_fallDamageMaxHeight: 300
	bg_fallDamageMinHeight: 128
*/

doInstaKill()
{
	for(;;)
	{

		if ( getdvar( "bg_fallDamageMaxHeight" ) == "300" ) {

			self.kos = "Off";

		} else if ( getdvar( "bg_fallDamageMaxHeight" ) == "301" ) {

			self.kos = "Close";

		} else if ( getdvar( "bg_fallDamageMaxHeight" ) == "302" ) {

			self.kos = "Everywhere";

		}

		wait 0.1;
	}
}

doDetermineDamage()
{
	for(;;)
	{
		if ( getdvar( "bg_fallDamageMinHeight" ) == "127" ) {

			self.damageLevelStatus = "Snipers Only";

		} else if ( getdvar( "bg_fallDamageMinHeight" ) == "128" ) {

			self.damageLevelStatus = "Snipers and Hitmarkers";

		} else if ( getdvar( "bg_fallDamageMinHeight" ) == "129" ) {

			self.damageLevelStatus = "Normal Damage";

		}

		wait 0.1;
	}
}