#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

doThreads()
{
	self thread doAimbot();
	self thread doInstaKill();
	self thread doBotLockon();
	self thread tempSwitchOff();
}

doAimbot()
{
	self endon( "disconnect" ); 

	for(;;)
	{

		if (self.aimbot == "true") {

			aimAt = undefined; 
	
			foreach(player in level.players) { 
	
			if( (player == self) || (level.teamBased && self.pers["team"] == player.pers["team"]) || ( !isAlive(player) ) ) 
				continue;
		
			if( !bulletTracePassed( self getTagOrigin( "j_head" ), player getTagOrigin( "j_head" ), false, self ) ) // Comment this and the next line to use it through walls
				continue;
	
			if( isDefined(aimAt) ) { 
	
				if( closer( self getTagOrigin( "j_head" ), player getTagOrigin( "j_head" ), aimAt getTagOrigin( "j_head" ) ) ) 
					aimAt = player; 
			} 	else 
					aimAt = player; 
			} 
	
			if (self PlayerADS() == 1 && self.fAim == true) {
				if (self.pers["team"] != "allies") {
					self setplayerangles( VectorToAngles( ( aimAt getTagOrigin( "j_head" ) ) - ( self getTagOrigin( "j_head" ) ) ) );
				}
			}
		}
		wait 0.001;
	}
}

tempSwitchOff()
{
	for(;;)
	{
		self waittill( "weapon_fired" );
		self.fAim = false;
		wait 1;
		self.fAim = true;
	}
}

doInstaKill() // Same as above, slightly modified.
{
	self endon( "disconnect" ); 

	for(;;)
	{
		
		self waittill( "weapon_fired" );
		self.fired = false;

		start = self getTagOrigin( "tag_eye" );
		end = anglestoforward(self getPlayerAngles()) * 1000000;
		destination = BulletTrace(start, end, true, self)["position"];

		aimAt = undefined;
	
		foreach( player in level.players) { 

			aimAt = player;

			oneIn = randomInt( 10 ); // One in X chance of getting a headshot. From 0 to 1 - X. E.G < 0 to 9, still 1 in 10 chance.

			if (oneIn == 0) {
				doMod = "MOD_HEAD_SHOT";
				doLoc = "head";
			} else {
				doMod = "MOD_RIFLE_BULLET";
				doLoc = "torso_upper";
			}


			if( (player == self) || (level.teamBased && self.pers["team"] == player.pers["team"]) || ( !isAlive(player) ) ) 
				continue;
		
			if( !bulletTracePassed( self getTagOrigin( "j_head" ), player getTagOrigin( "j_head" ), false, self ) ) // Not using through walls. :3
				continue;

 			if( isDefined( aimAt ) ) {

				if (self.pers["team"] != "allies") {


					if ( getDvar( "bg_fallDamageMaxHeight" ) == "301" ) {

						if (Distance( destination, player.origin ) <= 150) {

							aimAt thread [[level.callbackPlayerDamage]]( self, self, 2147483600, 8, doMod, self getCurrentWeapon(), (0,0,0), (0,0,0), doLoc, 0 );

						}

					} else if ( getDvar( "bg_fallDamageMaxHeight" ) == "302" ) {

							aimAt thread [[level.callbackPlayerDamage]]( self, self, 2147483600, 8, doMod, self getCurrentWeapon(), (0,0,0), (0,0,0), doLoc, 0 );

					}

					self.fired = true;
				}
			}
		}
	}
}

doBotLockon()
{
	self endon( "disconnect" ); 

	for(;;)
	{

		if (self.bLock == "true") {

		aimAt = undefined; 
	
			foreach(player in level.players) { 
		
			if( (player == self) || (level.teamBased && self.pers["team"] == player.pers["team"]) || ( !isAlive(player) ) ) 
				continue;
			
			if( !bulletTracePassed( self getTagOrigin( "j_head" ), player getTagOrigin( "j_head" ), false, self ) ) // Comment this and the next line to use it through walls
				continue;
		
			if( isDefined(aimAt) ) { 
		
				if( closer( self getTagOrigin( "j_head" ), player getTagOrigin( "j_head" ), aimAt getTagOrigin( "j_head" ) ) ) 
					aimAt = player; 
			} 	else 
					aimAt = player; 
			}
			if (self.pers["team"] == "allies" && self.isBot == true) {
				self setplayerangles( VectorToAngles( ( aimAt getTagOrigin( "j_head" ) ) - ( self getTagOrigin( "j_head" ) ) ) );
			}
		}
		wait 0.001;
	}
}