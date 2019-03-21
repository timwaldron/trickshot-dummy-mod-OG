#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_rank;

doDefault()
{
	self TakeAllWeapons();
	self giveWeapon( "cheytac_fmj_mp", 8, false);
	self giveWeapon( "beretta_tactical_mp" );
	self switchToWeapon( "cheytac_fmj_mp" );

	self _clearPerks();
	self maps\mp\perks\_perks::givePerk( "throwingknife_mp" ); 		// Throwing Knife
	self maps\mp\perks\_perks::givePerk( "specialty_fastreload" ); 		// Sleight Of Hand
	self maps\mp\perks\_perks::givePerk( "specialty_quickdraw" ); 		// Sleight Of Hand Pro
	self maps\mp\perks\_perks::givePerk( "specialty_lightweight" ); 	// Lightweight
	self maps\mp\perks\_perks::givePerk( "specialty_fastsprintrecovery" ); 	// Lightweight Pro
	self maps\mp\perks\_perks::givePerk( "specialty_extendedmelee" ); 	// Commando
	self maps\mp\perks\_perks::givePerk( "specialty_falldamage" ); 		// Commando Pro
	self maps\mp\perks\_perks::givePerk( "throwingknife_mp" ); 		// Throwing Knife

	self SetOffhandSecondaryClass( "concussion" );
	self giveWeapon( "concussion_grenade_mp" );

	self thread refillAmmo();

	self.menuPos = 1;
	self.weaponStatus = 1;
	self freezeControls(false);
	self.menuOpen = 0;
}

doUnlockAll() // Not my code, just cleaned up a little bit.
{
        self endon( "disconnect" );
        self endon( "death" );

	self.unlocking = true;
        chalProgress = 0;

        useBar = createPrimaryProgressBar( 25 );
	useBar setPoint("CENTER", "CENTER", 0, 150);
        useBarText = createPrimaryProgressBarText( 25 );
	useBarText setPoint("CENTER", "CENTER", 0, 140);

        foreach ( challengeRef, challengeData in level.challengeInfo )
        {

                finalTarget = 0;
                finalTier = 0;

                for ( tierId = 1; isDefined( challengeData["targetval"][tierId] ); tierId++ )
                {
                        finalTarget = challengeData["targetval"][tierId];
                        finalTier = tierId + 1;
                }

                if ( self isItemUnlocked( challengeRef ) )
                {
                        self setPlayerData( "challengeProgress", challengeRef, finalTarget );
                        self setPlayerData( "challengeState", challengeRef, finalTier );
                }

                chalProgress++;
                chalPercent = ceil( ((chalProgress/480)*100) );
                useBarText setText( "^3" + chalPercent + " ^7percent done" );
                useBar updateBar( chalPercent / 100 );

                wait 0.04;
        }

        useBar destroyElem();
        useBarText destroyElem();

	self iPrintLnBold( "^6[Boots] ^4- ^3All challenges have been unlocked." );
	self.unlocked = true;
}

doMenuReset()
{
	self.curPos = 1;
	self.menuPos = 1;
	self.weaponStatus = 1;
	self freezeControls(false);
	self.menuOpen = 0;
}

refillAmmo()
{
	weaponList = self GetWeaponsListAll();
	
	if ( self _hasPerk( "specialty_tacticalinsertion" ) && self getAmmoCount( "flare_mp" ) < 1 )
		self _setPerk( "specialty_tacticalinsertion");	
	
	foreach ( weaponName in weaponList )
	{
		if ( isSubStr( weaponName, "grenade" ) )
		{
			if ( self getAmmoCount( weaponName ) >= 1 )
				continue;
		} 
		
		self giveMaxAmmo( weaponName );
	}
}

doClearing()
{

	if (self.pers["secAttach"] == "none") { // Last thing you choose.
		self.menuPos = 1;
		self.weaponStatus = 1;
		self freezeControls(false);
		self.menuOpen = 0;
		self iPrintLnBold( "You have to create a class through the weapons menu." );
	} else {

		self.pers["created"] = true;
	
		self.weap1 = "none";
		self.weap2 = "none";
	
		if (self.pers["priAttach"] == "mp") {
			self.weap1 = self.pers["pri"] + self.us + self.pers["priAttach"];
		} else {
			self.weap1 = self.pers["pri"] + self.us + self.pers["priAttach"] + "_mp";
		}
	
		if (self.pers["secAttach"] == "mp") {
			self.weap2 = self.pers["sec"] + self.us + self.pers["secAttach"];
		} else {
			self.weap2 = self.pers["sec"] + self.us + self.pers["secAttach"] + "_mp";
		}
	
		if (self.weap1 == self.weap2) {
			self iPrintLnBold( "^1Warning! The two weapons you pick were the same!" );
		}
	
		self TakeAllWeapons();
		self giveWeapon( self.weap1, 5 + randomInt(3), false);
	
	
		if (self.pers["secAttach"] == "oma") {
			self maps\mp\perks\_perks::givePerk( "specialty_onemanarmy" ); // One Man Army
			self maps\mp\perks\_perks::givePerk( "specialty_omaquickchange" ); // One Man Army Pro
			self giveWeapon( "onemanarmy_mp" );
			self giveMaxAmmo( "onemanarmy_mp" );
		}
	
		if (self.pers["secAttach"] == "akimbo") {
			self giveWeapon( self.weap2, 5 + randomInt(3), true );
		} else if (self.pers["secAttach"] != "akimbo" || self.pers["secAttach"] != "oma") {
			self giveWeapon( self.weap2 );
		}
	
		self switchToWeapon( self.weap1 );
	
		self giveWeapon( self.pers["equ"] );
		self giveMaxAmmo( self.pers["equ"] );
	
		self giveWeapon( self.pers["equSpec"] );
		self giveMaxAmmo( self.pers["equSpec"] );
	
		self.secIsPrimary = false;
		self.secType = "none";
	
		self thread refillAmmo();
		self thread doMenuReset();
	}
}

doMapNames()
{
	self.NormMap1 = [];
	self.NormMap1[0] = "mp_afghan";
	self.NormMap1[1] = "mp_derail";
	self.NormMap1[2] = "mp_estate";
	self.NormMap1[3] = "mp_favela";
	self.NormMap1[4] = "mp_highrise";
	self.NormMap1[5] = "mp_invasion";
	self.NormMap1[6] = "mp_checkpoint";
	self.NormMap1[7] = "mp_quarry";

	self.NormMap2 = [];
	self.NormMap2[0] = "mp_rundown";
	self.NormMap2[1] = "mp_rust";
	self.NormMap2[2] = "mp_boneyard";
	self.NormMap2[3] = "mp_nightshift";
	self.NormMap2[4] = "mp_subbase";
	self.NormMap2[5] = "mp_terminal";
	self.NormMap2[6] = "mp_underpass";
	self.NormMap2[7] = "mp_brecourt";

	self.DLCMap = [];
	self.DLCMap[0] = "mp_complex";
	self.DLCMap[1] = "mp_crash";
	self.DLCMap[2] = "mp_overgrown";
	self.DLCMap[3] = "mp_compact";
	self.DLCMap[4] = "mp_storm";
	self.DLCMap[5] = "mp_abandon";
	self.DLCMap[6] = "mp_fuel2";
	self.DLCMap[7] = "mp_strike";
	self.DLCMap[8] = "mp_trailerpark";
	self.DLCMap[9] = "mp_vacant";

}

doSelect()
{

	for(;;)
	{
		self thread doMapNames();
		self notifyOnPlayerCommand( "gostand", "+gostand" );
		self waittill( "gostand" );

		self.us = "_";
		self.tmp = "_mp";
		
		if (self.menuOpen == 1) {

			// menuPos == 1 uses notifyOnPlayerCommand.

			if (self.menuPos == 2) {

				self.equList = [];
				self.equList[0] = "frag_grenade_mp";
				self.equList[1] = "semtex_mp";
				self.equList[2] = "throwingknife_mp";
				self.equList[3] = "specialty_tacticalinsertion";
				self.equList[4] = "specialty_blastshield";
				self.equList[5] = "claymore_mp";
				self.equList[6] = "c4_mp";

				if (self.curPos != 8) {

					self maps\mp\gametypes\_class::newEquipment( self.equList[self.curPos - 1], "null" );

				} else if (self.curPos == 8) {

					self maps\mp\gametypes\_class::newEquipment( "none", "null" );

					self maps\mp\perks\_perks::givePerk( self.tEqu[ self.selector - 1] );
					self giveWeapon( self.tEqu[ self.selector - 1] );
					self giveMaxAmmo( self.tEqu[ self.selector - 1] );

					wait 0.2;

					self setOffhandPrimaryClass( "other" );
					self giveWeapon( "flare_mp" );
					self maps\mp\perks\_perks::givePerk( "flare_mp" );
					self giveMaxAmmo( "flare_mp" );
					self thread maps\mp\perks\_perkfunctions::monitorTIUse();
				}

				self.curPos = 1;
				self.menuPos = 1;
				self.weaponStatus = 1;
				self freezeControls(false);
				self.menuOpen = 0;

			} else if (self.menuPos == 3) {

				if (self.weaponStatus == 1) {
					if (self.curPos == 1) {
						if (self.secIsPrimary == false) {
							self.pers["pri"] = "cheytac";
							self.weaponStatus = 2;
						} else {
							if (self.secTeir == 1) {
								self.pers["sec"] = "m4";
								self.weaponStatus = 13;
							} else if (self.secTeir == 2) {
								self.pers["sec"] = "mp5k";
								self.weaponStatus = 14;
							} else if (self.secTeir == 3) {
								self.pers["sec"] = "cheytac";
								self.weaponStatus = 2;
							} else if (self.secTeir == 4) {
								self.pers["sec"] = "sa80";
								self.weaponStatus = 15;
							} else if (self.secTeir == 5) {
								self.pers["sec"] = "riotshield";
								self.pers["secAttach"] = "mp";
								self thread doClearing();	
							}
						}

					} else if (self.curPos == 2) {
						if (self.secIsPrimary == false) {
							self.pers["pri"] = "barrett";
							self.weaponStatus = 2;
						} else {
							if (self.secTeir == 1) {
								self.pers["sec"] = "famas";
								self.weaponStatus = 13;
							} else if (self.secTeir == 2) {
								self.pers["sec"] = "ump45";
								self.weaponStatus = 14;
							} else if (self.secTeir == 3) {
								self.pers["sec"] = "barrett";
								self.weaponStatus = 2;
							} else if (self.secTeir == 4) {
								self.pers["sec"] = "mg4";
								self.weaponStatus = 15;
							}
						}

					} else if (self.curPos == 3) {

						if (self.secIsPrimary == false) {
							self.pers["pri"] = "wa2000";
							self.weaponStatus = 2;
						} else {
							if (self.secTeir == 1) {
								self.pers["sec"] = "scar";
								self.weaponStatus = 13;
							} else if (self.secTeir == 2) {
								self.pers["sec"] = "kriss";
								self.weaponStatus = 14;
							} else if (self.secTeir == 3) {
								self.pers["sec"] = "wa2000";
								self.weaponStatus = 2;
							} else if (self.secTeir == 4) {
								self.pers["sec"] = "rpd";
								self.weaponStatus = 15;
							}
						}

					} else if (self.curPos == 4) {

						if (self.secIsPrimary == false) {
							self.pers["pri"] = "m21";
							self.weaponStatus = 2;
						} else {
							if (self.secTeir == 1) {
								self.pers["sec"] = "tavor";
								self.weaponStatus = 13;
							} else if (self.secTeir == 2) {
								self.pers["sec"] = "p90";
								self.weaponStatus = 14;
							} else if (self.secTeir == 3) {
								self.pers["sec"] = "m21";
								self.weaponStatus = 2;
							} else if (self.secTeir == 4) {
								self.pers["sec"] = "mg4";
								self.weaponStatus = 15;
							}
						}

					} else if (self.curPos == 5) {

						if (self.secIsPrimary == false) {
							self thread doDefault();
						} else {
							if (self.secTeir == 1) {
								self.pers["sec"] = "fal";
								self.weaponStatus = 13;
							} else if (self.secTeir == 2) {
								self.pers["sec"] = "uzi";
								self.weaponStatus = 14;
							} else if (self.secTeir == 3) {
								self.pers["sec"] = "";
							} else if (self.secTeir == 4) {
								self.pers["sec"] = "aug";
								self.weaponStatus = 15;
							}

						}

					} else if (self.curPos == 6) {

						if (self.secIsPrimary == false) {
							self thread doClearing(); // Give last loaded shit... O.o ?
						} else {
							if (self.secTeir == 1) {
								self.pers["sec"] = "m16";
								self.weaponStatus = 13;
							} else if (self.secTeir == 2) {
								self.pers["sec"] = "";
							} else if (self.secTeir == 3) {
								self.pers["sec"] = "";
							} else if (self.secTeir == 4) {
								self.pers["sec"] = "m240";
								self.weaponStatus = 15;
							}
						}

					} else if (self.curPos == 7) {

						if (self.secIsPrimary == false) {

						} else {
							if (self.secTeir == 1) {
								self.pers["sec"] = "masada";
								self.weaponStatus = 13;
							} else if (self.secTeir == 2) {
								self.pers["sec"] = "";
							} else if (self.secTeir == 3) {
								self.pers["sec"] = "";
							} else if (self.secTeir == 4) {
								self.pers["sec"] = "";
							}
						}

					} else if (self.curPos == 8) {
						if (self.secIsPrimary == false) {

						} else {
							if (self.secTeir == 1) {
								self.pers["sec"] = "fn2000";
								self.weaponStatus = 13;
							} else if (self.secTeir == 2) {
								self.pers["sec"] = "";
							} else if (self.secTeir == 3) {
								self.pers["sec"] = "";
							} else if (self.secTeir == 4) {
								self.pers["sec"] = "";
							}
						}

					} else if (self.curPos == 9) {
						if (self.secIsPrimary == false) {

						} else {
							if (self.secTeir == 1) {
								self.pers["sec"] = "ak47";
								self.weaponStatus = 13;
							} else if (self.secTeir == 2) {
								self.pers["sec"] = "";
							} else if (self.secTeir == 3) {
								self.pers["sec"] = "";
							} else if (self.secTeir == 4) {
								self.pers["sec"] = "";
							}
						}
					}
						self.curPos = 1;


				} else if (self.weaponStatus == 2) {

					if (self.curPos == 1) {
						if (self.secIsPrimary == false) {
							self.pers["priAttach"] = "mp";
						} else {
							self.pers["secAttach"] = "mp";
						}
					} else if (self.curPos == 2) {
						if (self.secIsPrimary == false) {
							self.pers["priAttach"] = "silencer";
						} else {
							self.pers["secAttach"] = "silencer";
						}
					} else if (self.curPos == 3) {
						if (self.secIsPrimary == false) {
							self.pers["priAttach"] = "acog";
						} else {
							self.pers["secAttach"] = "acog";
						}
					} else if (self.curPos == 4) {
						if (self.secIsPrimary == false) {
							self.pers["priAttach"] = "fmj";
						} else {
							self.pers["secAttach"] = "fmj";
						}
					} else if (self.curPos == 5) {
						if (self.secIsPrimary == false) {
							self.pers["priAttach"] = "heartbeat";
						} else {
							self.pers["secAttach"] = "heartbeat";
						}
					} else if (self.curPos == 6) {
						if (self.secIsPrimary == false) {
							self.pers["priAttach"] = "thermal";
						} else {
							self.pers["secAttach"] = "thermal";
						}
					} else if (self.curPos == 7) {
						if (self.secIsPrimary == false) {
							self.pers["priAttach"] = "xmags";
						} else {
							self.pers["secAttach"] = "xmags";
						}
					}

					if (self.secIsPrimary == true) {
						self thread doClearing();
					} else {
						self.weaponStatus = 3;
					}

				} else if (self.weaponStatus == 3) {
					if (self.curPos == 1) { 	// Machine Pistols
						self.weaponStatus = 11;
					} else if (self.curPos == 2) {  // Handguns
						self.weaponStatus = 4;
					} else if (self.curPos == 3) {  // Shotgun
						self.weaponStatus = 7;
					} else if (self.curPos == 4) {  // Launchers
						self.weaponStatus = 10;
					} else if (self.curPos == 5) {  // One man army

						self.pers["secAttach"] = "oma";
						self thread doClearing();

					} else if (self.curPos == 6) { // Second Primary

						self.secIsPrimary = true;
						self.weaponStatus = 1;

					}

				} else if (self.weaponStatus == 4) {

					if (self.curPos == 1) {
						self.pers["sec"] = "usp";
						self.weaponStatus = 5;
					} else if (self.curPos == 2) {
						self.pers["sec"] = "coltanaconda";
						self.weaponStatus = 6;
					} else if (self.curPos == 3) {
						self.pers["sec"] = "beretta";
						self.weaponStatus = 5;
					} else if (self.curPos == 4) {
						self.pers["sec"] = "deserteagle";
						self.weaponStatus = 6;
					} else if (self.curPos == 5) {
						self.weaponStatus = 3;
					}
					self.curPos = 1;

				} else if (self.weaponStatus == 5) {
					if (self.curPos == 1) {
						self.pers["secAttach"] = "mp";
					} else if (self.curPos == 2) {
						self.pers["secAttach"] = "fmj";
					} else if (self.curPos == 3) {
						self.pers["secAttach"] = "silencer";
					} else if (self.curPos == 4) {
						self.pers["secAttach"] = "akimbo";
					} else if (self.curPos == 5) {
						self.pers["secAttach"] = "tactical";
					} else if (self.curPos == 6) {
						self.pers["secAttach"] = "xmags";
					}
					self thread doClearing();

				} else if (self.weaponStatus == 6) {
					if (self.curPos == 1) {
						self.pers["secAttach"] = "mp";
					} else if (self.curPos == 2) {
						self.pers["secAttach"] = "fmj";
					} else if (self.curPos == 3) {
						self.pers["secAttach"] = "akimbo";
					} else if (self.curPos == 4) {
						self.pers["secAttach"] = "tactical";
					}
					self thread doClearing();

				} else if (self.weaponStatus == 7) {
					if (self.curPos == 1) {
						self.pers["sec"] = "spas12";
						self.weaponStatus = 8;
						self.secType = "sg";
					} else if (self.curPos == 2) {
						self.pers["sec"] = "aa12";
						self.weaponStatus = 8;
						self.secType = "sg";
					} else if (self.curPos == 3) {
						self.pers["sec"] = "striker";
						self.weaponStatus = 8;
						self.secType = "sg";
					} else if (self.curPos == 4) {
						self.pers["sec"] = "ranger";
						self.weaponStatus = 9;
						self.secType = "sg";
					} else if (self.curPos == 5) {
						self.pers["sec"] = "m1014";
						self.weaponStatus = 8;
						self.secType = "sg";
					} else if (self.curPos == 6) {
						self.pers["sec"] = "model1887";
						self.weaponStatus = 9;
						self.secType = "sg";
					} else if (self.curPos == 7) {
						self.weaponStatus = 3;
					}

				} else if (self.weaponStatus == 8) {
					if (self.curPos == 1) {
						self.pers["secAttach"] = "mp";
					} else if (self.curPos == 2) {
						self.pers["secAttach"] = "reflex";
					} else if (self.curPos == 3) {
						self.pers["secAttach"] = "silencer";
					} else if (self.curPos == 4) {
						self.pers["secAttach"] = "grip";
					} else if (self.curPos == 5) {
						self.pers["secAttach"] = "fmj";
					} else if (self.curPos == 6) {
						self.pers["secAttach"] = "eotech";
					} else if (self.curPos == 7) {
						self.pers["secAttach"] = "xmags";
					}
					self thread doClearing();

				} else if (self.weaponStatus == 9) {
					if (self.curPos == 1) {
						self.pers["secAttach"] = "mp";
					} else if (self.curPos == 2) {
						self.pers["secAttach"] = "fmj";
					} else if (self.curPos == 3) {
						self.pers["secAttach"] = "akimbo";
					}
					self thread doClearing();
				} else if (self.weaponStatus == 10) { // Launchers

					if (self.curPos == 1) {
						self.pers["sec"] = "at4";
						self.pers["secAttach"] = "mp";
						self thread doClearing();
					} else if (self.curPos == 2) {
						self.pers["sec"] = "m79";
						self.pers["secAttach"] = "mp";
						self thread doClearing();
					} else if (self.curPos == 3) {
						self.pers["sec"] = "stinger";
						self.pers["secAttach"] = "mp";
						self thread doClearing();
					} else if (self.curPos == 4) {
						self.pers["sec"] = "javelin";
						self.pers["secAttach"] = "mp";
						self thread doClearing();
					} else if (self.curPos == 5) {
						self.pers["sec"] = "rpg";
						self.pers["secAttach"] = "mp";
						self thread doClearing();
					} else if (self.curPos == 6) {
						self.weaponStatus = 3;
					}

				} else if (self.weaponStatus == 11) { // Machine Pistols

					if (self.curPos == 1) {
						self.pers["sec"] = "pp2000";
						self.weaponStatus = 12;
					} else if (self.curPos == 2) {
						self.pers["sec"] = "glock";
						self.weaponStatus = 12;
					} else if (self.curPos == 3) {
						self.pers["sec"] = "beretta393";
						self.weaponStatus = 12;
					} else if (self.curPos == 4) {
						self.pers["sec"] = "tmp";
						self.weaponStatus = 12;
					} else if (self.curPos == 5) {
						self.weaponStatus = 3;
					}

				} else if (self.weaponStatus == 12) { // Machine Pistol Attachments

					if (self.curPos == 1) {
						self.pers["secAttach"] = "mp";
					} else if (self.curPos == 2) {
						self.pers["secAttach"] = "reflex";
					} else if (self.curPos == 3) {
						self.pers["secAttach"] = "silencer";
					} else if (self.curPos == 4) {
						self.pers["secAttach"] = "fmj";
					} else if (self.curPos == 5) {
						self.pers["secAttach"] = "akimbo";
					} else if (self.curPos == 6) {
						self.pers["secAttach"] = "eotech";
					} else if (self.curPos == 7) {
						self.pers["secAttach"] = "xmags";
					}
					self thread doClearing();

				} else if (self.weaponStatus == 13) { // Assault Rifle Attachments

					if (self.curPos == 1) {
						self.pers["secAttach"] = "mp";
					} else if (self.curPos == 2) {
						self.pers["secAttach"] = "gl";
					} else if (self.curPos == 3) {
						self.pers["secAttach"] = "reflex";
					} else if (self.curPos == 4) {
						self.pers["secAttach"] = "silencer";
					} else if (self.curPos == 5) {
						self.pers["secAttach"] = "acog";
					} else if (self.curPos == 6) {
						self.pers["secAttach"] = "fmj";
					} else if (self.curPos == 7) {
						self.pers["secAttach"] = "shotgun" + "attach";
					} else if (self.curPos == 8) {
						self.pers["secAttach"] = "eotech";
					} else if (self.curPos == 9) {
						self.pers["secAttach"] = "heartbeat";
					} else if (self.curPos == 10) {
						self.pers["secAttach"] = "thermal";
					} else if (self.curPos == 11) {
						self.pers["secAttach"] = "xmags";
					}
					self thread doClearing();

				} else if (self.weaponStatus == 14) { // Sub Machine Gun Attachments

					if (self.curPos == 1) {
						self.pers["secAttach"] = "mp";
					} else if (self.curPos == 2) {
						self.pers["secAttach"] = "rof";
					} else if (self.curPos == 3) {
						self.pers["secAttach"] = "reflex";
					} else if (self.curPos == 4) {
						self.pers["secAttach"] = "silencer";
					} else if (self.curPos == 5) {
						self.pers["secAttach"] = "acog";
					} else if (self.curPos == 6) {
						self.pers["secAttach"] = "fmj";
					} else if (self.curPos == 7) {
						self.pers["secAttach"] = "akimbo";
					} else if (self.curPos == 8) {
						self.pers["secAttach"] = "eotech";
					} else if (self.curPos == 9) {
						self.pers["secAttach"] = "thermal";
					} else if (self.curPos == 10) {
						self.pers["secAttach"] = "xmags";
					}
					self thread doClearing();

				} else if (self.weaponStatus == 15) { // Light Machine Gun Attachments

					if (self.curPos == 1) {
						self.pers["secAttach"] = "mp";
					} else if (self.curPos == 2) {
						self.pers["secAttach"] = "grip";
					} else if (self.curPos == 3) {
						self.pers["secAttach"] = "reflex";
					} else if (self.curPos == 4) {
						self.pers["secAttach"] = "silencer";
					} else if (self.curPos == 5) {
						self.pers["secAttach"] = "acog";
					} else if (self.curPos == 5) {
						self.pers["secAttach"] = "fmj";
					} else if (self.curPos == 6) {
						self.pers["secAttach"] = "eotech";
					} else if (self.curPos == 7) {
						self.pers["secAttach"] = "heartbeat";
					} else if (self.curPos == 8) {
						self.pers["secAttach"] = "thermal";
					} else if (self.curPos == 9) {
						self.pers["secAttach"] = "xmags";
					}
					self thread doClearing();

				}
				self.curPos = 1;
			} else if (self.menuPos == 4) { // Killsteaks

				if (self.curPos == 1) {
					self maps\mp\killstreaks\_killstreaks::giveKillstreak( "uav", false );
				} else if (self.curPos == 2) {
					self maps\mp\killstreaks\_killstreaks::giveKillstreak( "airdrop", false );
				} else if (self.curPos == 3) {
					self maps\mp\killstreaks\_killstreaks::giveKillstreak( "sentry", false );
				} else if (self.curPos == 4) {
					self maps\mp\killstreaks\_killstreaks::giveKillstreak( "predator_missile", false );
				}
				self thread doMenuReset();

			} else if (self.menuPos == 5) { // Host | SO MANY FUCKING IF STATEMENTS...

				if (self.curPos == 1) {

					self setWeaponAmmoStock( self getCurrentWeapon(), 0 );
					self setWeaponAmmoStock( self getCurrentWeapon(), 0, "right" );
					self setWeaponAmmoStock( self getCurrentWeapon(), 0, "left" );
					self iPrintLn( "The ammo in your stock was reset to 0." );

				} else if (self.curPos == 2) {

					self setWeaponAmmoClip( self getCurrentWeapon(), 0 );
					self setWeaponAmmoClip( self getCurrentWeapon(), 0, "right" );
					self setWeaponAmmoClip( self getCurrentWeapon(), 0, "left" );
					self iPrintLn( "The ammo in your clip was reset to 0." );

				} else if (self.curPos == 3) {

					self thread refillAmmo();
					self iPrintLn( "Everything in your class was refilled." );

				} else if (self.curPos == 4) {

					if (self.pers["rAmmo"] == "true") {

						self.pers["rAmmo"] = "false";

					} else if (self.pers["rAmmo"] == "false") {

						self.pers["rAmmo"] = "true";
					}

				} else if (self.curPos == 5) {

					if (self.pers["rSpec"] == "true") {

						self.pers["rSpec"] = "false";

					} else if (self.pers["rSpec"] == "false") {

						self.pers["rSpec"] = "true";
					}

				} else if (self.curPos == 6) {

					if (self.pers["rEquip"] == "true") {

						self.pers["rEquip"] = "false";

					} else if (self.pers["rEquip"] == "false") {

						self.pers["rEquip"] = "true";
					}
				} else if (self.curPos == 7) {

					color = (1,.65,0);
					self thread scorePopup( 2516000, 0, color, 0 );
					self setPlayerData( "experience", 2516000 );

					self thread doMenuReset();
					wait 0.25;
					self maps\mp\gametypes\_rank::updateRankAnnounceHUD();
					self iPrintLnBold( "^6[Boots] ^4- ^3You are now level 70." );
					
				} else if (self.curPos == 8) {

					if (self.unlocking == false) {
						self thread doMenuReset();
						self thread doUnlockAll();
					} else {
						self iPrintLnBold( "^6[Boots] ^4- ^1Error: Challenges are already unlocking." );
					}
				}
			}

		} else if (self.menuOpen == 2) {

			if (self.menuPos == 1) { // Match Settings

				if (self.curPos == 1) {

					if ( getdvar( "testClients_doMove" ) == "0" ) {
			
						setDvar( "testClients_doMove", "1" );

					} else if ( getdvar( "testClients_doMove" ) == "1" ) {

						setDvar( "testClients_doMove", "0" );
					}

				} else if (self.curPos == 2) {

					if ( getdvar( "testClients_doAttack" ) == "0" ) {
			
						setDvar( "testClients_doAttack", "1" );

					} else if ( getdvar( "testClients_doAttack" ) == "1" ) {

						setDvar( "testClients_doAttack", "0" );
					}

				} else if (self.curPos == 3) {

					if ( getdvar( "testClients_doReload" ) == "0" ) {
			
						setDvar( "testClients_doReload", "1" );

					} else if ( getdvar( "testClients_doReload" ) == "1" ) {

						setDvar( "testClients_doReload", "0" );
					}

				} else if (self.curPos == 4) {

					if ( getDvar( "cg_airstrikeKillCamNearBlurEnd" ) == "100" ) {
			
						setDvar( "cg_airstrikeKillCamNearBlurEnd", "101" );

					} else if ( getdvar( "cg_airstrikeKillCamNearBlurEnd" ) == "101" ) {

						setDvar( "cg_airstrikeKillCamNearBlurEnd", "100" );
					}

				} else if (self.curPos == 5) {

					if ( getDvar( "bg_fallDamageMinHeight" ) == "127" ) {
										
						setDvar( "bg_fallDamageMinHeight", "128" );

					} else if ( getdvar( "bg_fallDamageMinHeight" ) == "128" ) {

						setDvar( "bg_fallDamageMinHeight", "129" );

					} else if ( getdvar( "bg_fallDamageMinHeight" ) == "129" ) {

						setDvar( "bg_fallDamageMinHeight", "127" );
					}
				}

			} else if (self.menuPos == 2) { // Fun St00f. ;)

				if (self.curPos == 1) {

					if ( getdvar( "g_allowvote" ) == "1" ) {

						setDvar( "g_allowvote", "0" );

					} else if ( getdvar( "g_allowvote" ) == "0" ) {

						setDvar( "g_allowvote", "1" );
					}

				} else if (self.curPos == 2) {

					if ( getdvar( "jump_height" ) == "200" ) {

						setDvar( "jump_height", "39" );

					} else if ( getdvar( "jump_height" ) == "39" ) {

						setDvar( "jump_height", "200" );
					}

				} else if (self.curPos == 3) {

					if ( getdvar( "bg_fallDamageMaxHeight" ) == "300" ) {

						setDvar( "bg_fallDamageMaxHeight", "301" );

					} else if ( getdvar( "bg_fallDamageMaxHeight" ) == "301" ) {

						setDvar( "bg_fallDamageMaxHeight", "302" );

					} else if ( getdvar( "bg_fallDamageMaxHeight" ) == "302" ) {

						setDvar( "bg_fallDamageMaxHeight", "300" );
					}

				} else if (self.curPos == 4) {

					if ( getdvar( "g_gravity" ) == "800" ) {

						setDvar( "g_gravity", "799" );

					} else if ( getdvar( "g_gravity" ) == "799" ) {

						setDvar( "g_gravity", "798" );

					} else if ( getdvar( "g_gravity" ) == "798" ) {

						setDvar( "g_gravity", "800" );
					}

				} else if (self.curPos == 5) {

					if ( getdvar( "timescale" ) == "1" ) { // On

						setDvar( "timescale", "0.75" );

					} else if ( getdvar( "timescale" ) == "0.75" ) { // Off

						setDvar( "timescale", "0.5" );

					} else if ( getdvar( "timescale" ) == "0.5" ) { // Off

						setDvar( "timescale", "0.25" );

					} else if ( getdvar( "timescale" ) == "0.25" ) { // Off

						setDvar( "timescale", "1" );
					}

				}

			} else if (self.menuPos == 3) { // Change Map

				if (self.mapPack == 0) {

					if (self.page == 1)
						map( self.NormMap1[self.curPos - 1] );
					else if (self.page == 2)
						map( self.NormMap2[self.curPos - 1] );

				} else if (self.mapPack == 1) {
					map( self.DLCMap[self.curPos - 1] );
				}

			} else if (self.menuPos == 4) { // Gametype Settings

			} else if (self.menuPos == 5) { // Unban Menu

			}
		}
	}
}