#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

doThreads()
{
	self thread doUP();
	self thread doDOWN();
	self thread doSwapMenuLEFT();
	self thread doMenuSwapTeirs();
	self thread doSwapMenuRIGHT();
	self thread doMenuControllerNorm();
	self thread doMenuControllerAdmin();
	self thread doSwitchPages();

	self thread doDeterminMaxCycle();
}

doSwitchPages()
{
	for(;;)
	{
		self notifyOnPlayerCommand( "melee", "+melee" );
		self waittill( "melee" );

		if (self.menuOpen == 2) {

			if (self.menuPos == 3) {
				self.curPos = 1;
				self.mapPack++;

				if (self.mapPack > 1)
					self.mapPack = 0;

			}

		}
	}
}

doMenuSwapTeirs()
{

	for(;;)
	{
		self notifyOnPlayerCommand( "reload", "+reload" );
		self waittill( "reload" );
		
		if (self.menuOpen == 1) {

			if (self.menuPos == 2) {

				if (self.curPos == 8) {
					self.selector++;

					if (self.selector > 2)
						self.selector = 1;
				}

			} else if (self.menuPos == 3) {
				if (self.secIsPrimary == true) {				
					self.curPos = 1;
					self.secTeir++;

					if (self.secTeir > 5)
						self.secTeir = 1;
				}
			}

		} else if (self.menuOpen == 2) {

			if (self.menuPos == 3) { // Kick player menu.
				self.curPos = 1;
				self.page++;

				if (self.page > 2)
					self.page = 1;

			}
		}
	}
}

doMenuControllerNorm()
{

	for(;;)
	{
		self notifyOnPlayerCommand( "as1", "+actionslot 1" );
		self waittill( "as1" );

		if (self.menuOpen == 0) {

			self.menuOpen = 1;
			self freezeControls(true);
			self.curPos = 1;
			self.menuPos = 1;
			self.weaponStatus = 1;

		} else if (self.menuOpen == 1) {

			self.menuOpen = 0;
			self freezeControls(false);
			self.curPos = 1;
			self.menuPos = 1;
			self.weaponStatus = 1;
		}
	}
}

doMenuControllerAdmin()
{
	for(;;)
	{
		self notifyOnPlayerCommand( "as2", "+actionslot 2" );
		self waittill( "as2" );

		if (self.admin == true) {
			if (self.menuOpen == 0) {
	
				self.menuOpen = 2;
				self freezeControls(true);
				self.curPos = 1;
				self.menuPos = 1;
	
			} else if (self.menuOpen == 2) {
	
				self.menuOpen = 0;
				self freezeControls(false);
				self.curPos = 1;
				self.menuPos = 1;
			}
		}
	}
}

doSwapMenuRIGHT()
{


	for(;;)
	{
		self notifyOnPlayerCommand( "moveright", "+moveright" );
		self waittill( "moveright" );

		self.curPos = 1;
		self.page = 1;

		if (self.menuOpen == 1) {

			self.menuPos++;

			if (self.menuPos > 5) {
				self.menuPos = 1;
			}

		} else if (self.menuOpen == 2) {

			self.menuPos++;

			if (self.menuPos > 5) {
				self.menuPos = 1;
			}
		}
	}
}

doSwapMenuLEFT()
{


	for(;;)
	{
		self notifyOnPlayerCommand( "moveleft", "+moveleft" );
		self waittill( "moveleft" );
		
		self.curPos = 1;
		self.page = 1;

		if (self.menuOpen == 1) {

			self.menuPos--;

			if (self.menuPos < 1) {
				self.menuPos = 5;
			}

		} else if (self.menuOpen == 2) {

			self.menuPos--;

			if (self.menuPos < 1) {
				self.menuPos = 5;
			}
		}
	}
}

doDeterminMaxCycle() // Much cleaner way of the 'Up/Down' menu. :3
{
	for(;;)
	{
		if (self.menuOpen == 1) {
			if (self.menuPos == 2) { // Equipment
	
				self.maxCycle = 8;
	
			} else if (self.menuPos == 3) { // Weapons
	
				if (self.weaponStatus == 1) {
					if (self.secIsPrimary == true) {
						if (self.secTeir == 1) {
							self.maxCycle = 9;
						} else if (self.secTeir == 2) {
							self.maxCycle = 5;
						} else if (self.secTeir == 3) {
							self.maxCycle = 4;
						} else if (self.secTeir == 4) {
							self.maxCycle = 5;
						} else if (self.secTeir == 5) {
							self.maxCycle = 1;
						}
					} else {
						self.maxCycle = 6;
					}
				} else if (self.weaponStatus == 2) {
					self.maxCycle = 7;
				} else if (self.weaponStatus == 3) {
					self.maxCycle = 6;
				} else if (self.weaponStatus == 4) {
					self.maxCycle = 5;
				} else if (self.weaponStatus == 5) {
					self.maxCycle = 6;
				} else if (self.weaponStatus == 6) {
					self.maxCycle = 4;
				} else if (self.weaponStatus == 7) {
					self.maxCycle = 7;
				} else if (self.weaponStatus == 8) {
					self.maxCycle = 7;
				} else if (self.weaponStatus == 9) {
					self.maxCycle = 3;
				} else if (self.weaponStatus == 10) {
					self.maxCycle = 6;
				} else if (self.weaponStatus == 11) {
					self.maxCycle = 5;
				} else if (self.weaponStatus == 12) {
					self.maxCycle = 7;
				} else if (self.weaponStatus == 13) {
					self.maxCycle = 11;
				} else if (self.weaponStatus == 14) {
					self.maxCycle = 10;
				} else if (self.weaponStatus == 15) {
					self.maxCycle = 10;
				} else if (self.weaponStatus == 16) {
					self.maxCycle = 3;
				}
	
			} else if (self.menuPos == 4) { // Killstreak
				self.maxCycle = 4;
			} else if (self.menuPos == 5) { // Character Prefs.
				self.maxCycle = 8;
			}

		} else if (self.menuOpen == 2) {

			if (self.menuPos == 1) { // Match Settings
				self.maxCycle = 5;
			} else if (self.menuPos == 2) { // Fun Stuff
				self.maxCycle = 5;
			} else if (self.menuPos == 3) { // Change Map

				if (self.mapPack == 0)
					self.maxCycle = 8;
				else if (self.mapPack == 1)
					self.maxCycle = 10;
			}
		}

		wait 0.1;
	}
}

doUP()
{
	for(;;)
	{
		self notifyOnPlayerCommand( "forward", "+forward" );
		self waittill( "forward" );
		
		if (self.menuOpen == 1 || self.menuOpen == 2) {

			self.curPos--;

			if (self.curPos < 1) {
				self.curPos = self.maxCycle;
			}
		}
	}
}

doDOWN()
{
	for(;;)
	{
		self notifyOnPlayerCommand( "back", "+back" );
		self waittill( "back" );
		
		if (self.menuOpen == 1 || self.menuOpen == 2) {

			self.curPos++;

			if (self.curPos > self.maxCycle) {
				self.curPos = 1;
			}
		}
	}
}