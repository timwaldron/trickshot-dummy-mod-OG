#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

// Not the easiest way, but I understand it the best.

doText()
{

	Menu1 = self createFontString("default", 2);	// Main Menu Text
	Menu1 setPoint("CENTER", "CENTER", 0, -150);
	Menu2 = self createFontString("default", 1.75); // Sub Menu Text
	Menu2 setPoint("CENTER", "CENTER", 0, -125);
	Menu3 = self createFontString("default", 1.75); // Sub Sub Menu Text
	Menu3 setPoint("CENTER", "CENTER", 0, -105);

	subMenu1 = self createFontString("default", 1.5);
	subMenu1 setPoint("CENTER", "CENTER", -200, -150);
	subMenu2 = self createFontString("default", 1.5);
	subMenu2 setPoint("CENTER", "CENTER", 200, -150);

	preRelease = self createFontString( "default", 2 );
	preRelease setPoint( "CENTER", "CENTER", -375, -120 );

	Text1 = self createFontString("default", 1.5);
	Text1 setPoint("CENTER", "CENTER", 0, -80);
	Text2 = self createFontString("default", 1.5);
	Text2 setPoint("CENTER", "CENTER", 0, -60);
	Text3 = self createFontString("default", 1.5);
	Text3 setPoint("CENTER", "CENTER", 0, -40);
	Text4 = self createFontString("default", 1.5);
	Text4 setPoint("CENTER", "CENTER", 0, -20);
	Text5 = self createFontString("default", 1.5);
	Text5 setPoint("CENTER", "CENTER", 0, 0);
	Text6 = self createFontString("default", 1.5);
	Text6 setPoint("CENTER", "CENTER", 0, 20);
	Text7 = self createFontString("default", 1.5);
	Text7 setPoint("CENTER", "CENTER", 0, 40);
	Text8 = self createFontString("default", 1.5);
	Text8 setPoint("CENTER", "CENTER", 0, 60);
	Text9 = self createFontString("default", 1.5);
	Text9 setPoint("CENTER", "CENTER", 0, 80);
	Text10 = self createFontString("default", 1.5);
	Text10 setPoint("CENTER", "CENTER", 0, 100);
	Text11 = self createFontString("default", 1.5);
	Text11 setPoint("CENTER", "CENTER", 0, 120);

	Left1 = self createFontString("default", 1.5);
	Left1 setPoint("CENTER", "CENTER", -300, -40);

	Close1 = self createFontString("default", 2);
	Close1 setPoint("CENTER", "CENTER", 0, 160);

	User1 = self createFontString("objective", 1);
	User1 setPoint("CENTER", "CENTER", -220, 120);

	curGT = "none";

	for(;;)
	{

		if ( getDvar( "g_gametype" ) == "sd" )
			curGT = "^2Search and Destroy";

		else if ( getDvar( "g_gametype" ) == "war" )
			curGT = "^2Team Deathmatch";

		else if ( getDvar( "g_gametype" ) == "dm" )
			curGT = "^2Free For All";

		else
			curGT = "^1This Gametype Not Supported";

		self.equ = [];
		self.equ[0] = "Claymore";
		self.equ[1] = "C4";

		self.tEqu = [];
		self.tEqu[0] = "claymore_mp";
		self.tEqu[1] = "c4_mp";

		preRelease setText( "^3Pre-Release" );

		if (self.menuOpen == 0) {
			Menu1 setText( "" );
			Menu2 setText( "" );
			Menu3 setText( "" );
			subMenu1 setText( "" );
			subMenu2 setText( "" );
			Text1 setText( "" );
			Text2 setText( "" );
			Text3 setText( "" );
			Text4 setText( "" );
			Text5 setText( "" );
			Text6 setText( "" );
			Text7 setText( "" );
			Text8 setText( "" );
			Text9 setText( "" );
			Text10 setText( "" );
			Text11 setText( "" );
			Left1 setText( "" );
			Close1 setText( "" );
			User1 setText( "" );

		} else if (self.menuOpen == 1) {

			// Setting all text to none because it reads down the page, so it will apply the text at the correct IF-statements.

			Menu1 setText( "" );
			Menu2 setText( "" );
			Menu3 setText( "" );
			subMenu1 setText( "" );
			subMenu2 setText( "" );
			Text1 setText( "" );
			Text2 setText( "" );
			Text3 setText( "" );
			Text4 setText( "" );
			Text5 setText( "" );
			Text6 setText( "" );
			Text7 setText( "" );
			Text8 setText( "" );
			Text9 setText( "" );
			Text10 setText( "" );
			Text11 setText( "" );
			Close1 setText( "" );

			Close1 setText( "^2Press ^3[{+actionslot 1}] ^2to ^3close the menu" );


			if (self.menuOpen == 1) { // This will be avaliable for every player
				if (self.menuPos == 1) {
	
					subMenu1 setText( "^3Character Preferences" );
			// Teleports
					subMenu2 setText( "^3Equipment" );
	
				} else if (self.menuPos == 2) {
	
					subMenu1 setText( "^3Teleports" );
			// Equipment
					subMenu2 setText( "^3Weapons" );
	
				} else if (self.menuPos == 3) {
	
					subMenu1 setText( "^3Equipment" );
			// Weapons
					subMenu2 setText( "^3Killstreaks" );
	
				}  else if (self.menuPos == 4) {
	
					subMenu1 setText( "^3Weapons" );
			// Killstreak
					subMenu2 setText( "^3Character Preferences" );
	
				} else if (self.menuPos == 5) { // Char. Prefs.
	
					subMenu1 setText( "^3Killstreaks" );
			// Character Prefs.
					subMenu2 setText( "^3Teleports" );
	
				}
			}


			Left1 setText( "^3[{+moveleft}] ^2to cycle menu left.\n^3[{+moveright}] ^2to cycle menu right.\n^3[{+forward}] ^2to move up on the menu.\n^3[{+back}] ^2to move down on the menu.\n^3[{+gostand}] ^2to make your selection." );

			// Teleport Menu
			if (self.menuPos == 1) {

				if (self.admin == true) {
					Text1 setText( "^2Press ^3[{+frag}] ^2to ^3spawn 1 bot" );
					Text2 setText( "^2Press ^3[{+actionslot 2}] ^2to ^3move bots to crosshairs" );
				}

				if (getdvar("mapname") == "mp_afghan") {
					Menu1 setText( "^6Afghan Teleport Menu" );
					Text3 setText( "^2Press ^3[{+actionslot 3}] ^2to teleport to: ^5Top of the rocks" );
					Text4 setText( "^2Press ^3[{+actionslot 4}] ^2to teleport to: ^5Top of the wing" );
					Text5 setText( "^2Press ^3[{+smoke}] ^2to teleport to: ^5Above Bombsite A" );
				} else if (getdvar("mapname") == "mp_derail") {
					Menu1 setText( "^6Derail Teleport Menu" );
					Text3 setText( "^2Press ^3[{+actionslot 3}] ^2to teleport to: ^5Ledge near Bombsite A" );
					Text4 setText( "^2Press ^3[{+actionslot 4}] ^2to teleport to: ^5Above NovaStar" );
				} else if (getdvar("mapname") == "mp_estate") {
					Menu1 setText( "^6Estate Teleport Menu" );
					Text3 setText( "^2Press ^3[{+actionslot 3}] ^2to teleport to: ^5Above TF141 Spawn" );
					Text4 setText( "^2Press ^3[{+actionslot 4}] ^2to teleport to: ^5Bed above Bombsite A" );
					Text5 setText( "^2Press ^3[{+smoke}] ^2to teleport to: ^5Above fishing hut" );
					Text6 setText( "^2Press ^3[{+activate}] ^2to teleport to: ^5Above power grid" );
				} else if (getdvar("mapname") == "mp_favela") {
					Menu1 setText( "^6Favela Teleport Menu" );
					Text3 setText( "^2Press ^3[{+actionslot 3}] ^2to teleport to: ^5Infront of Campers Shack" );
					Text4 setText( "^2Press ^3[{+actionslot 4}] ^2to teleport to: ^5Above Soccor courts" );
					Text5 setText( "^2Press ^3[{+smoke}] ^2to teleport to: ^5Next to water tank" );
				} else if (getdvar("mapname") == "mp_highrise") {
					Menu1 setText( "^6Highrise Teleport Menu" );
					Text3 setText( "^2Press ^3[{+actionslot 3}] ^2to teleport to: ^5Top of Highrise" );
					Text4 setText( "^2Press ^3[{+actionslot 4}] ^2to teleport to: ^5Top of Crane" );
					Text5 setText( "^2Press ^3[{+smoke}] ^2to teleport to: ^5Platform above Bombsite B" );
					Text6 setText( "^2Press ^3[{+activate}] ^2to teleport to: ^5Climb Spot of Crane" );
				} else if (getdvar("mapname") == "mp_nightshift") {
					Menu1 setText( "^6Skidrow Teleport Menu" );
					Text3 setText( "^2Press ^3[{+actionslot 3}] ^2to teleport to: ^5Building near Bombsite B" );
					Text4 setText( "^2Press ^3[{+actionslot 4}] ^2to teleport to: ^5Next to water tank" );
					Text5 setText( "^2Press ^3[{+smoke}] ^2to teleport to: ^5Above alley-way" );
				} else if (getdvar("mapname") == "mp_invasion") {
					Menu1 setText( "^6Invasion Teleport Menu" );
					Text3 setText( "^2Press ^3[{+actionslot 3}] ^2to teleport to: ^5Next to American Flag" );
					Text4 setText( "^2Press ^3[{+actionslot 4}] ^2to teleport to: ^5Above OpFor spawn" );
					Text5 setText( "^2Press ^3[{+smoke}] ^2to teleport to: ^5Above the Coffee Shop" );
				} else if (getdvar("mapname") == "mp_checkpoint") {
					Menu1 setText( "^6Karachi Teleport Menu" );
					Text3 setText( "^2Press ^3[{+actionslot 3}] ^2to teleport to: ^5Platform near Bombsite A" );
					Text4 setText( "^2Press ^3[{+actionslot 4}] ^2to teleport to: ^5The top of the truck" );
					Text5 setText( "^2Press ^3[{+smoke}] ^2to teleport to: ^5Next to Kashmir Hotel" );
				} else if (getdvar("mapname") == "mp_quarry") {
					Menu1 setText( "^6Quarry Teleport Menu" );
					Text3 setText( "^2Press ^3[{+actionslot 3}] ^2to teleport to: ^5Platform near Bombsite A" );
					Text4 setText( "^2Press ^3[{+actionslot 4}] ^2to teleport to: ^5Above A080 Tank" );
					Text5 setText( "^2Press ^3[{+smoke}] ^2to teleport to: ^5Above Transportadora" );
					Text6 setText( "^2Press ^3[{+activate}] ^2to teleport to: ^5Top of Quarry" );
				} else if (getdvar("mapname") == "mp_rundown") {
					Menu1 setText( "^6Rundown Teleport Menu" );
					Text3 setText( "^2Press ^3[{+actionslot 3}] ^2to teleport to: ^5Above Barateiro" );
					Text4 setText( "^2Press ^3[{+actionslot 4}] ^2to teleport to: ^5Camping Shack" );
					Text5 setText( "^2Press ^3[{+smoke}] ^2to teleport to: ^5House above the river" );
				} else if (getdvar("mapname") == "mp_rust") {
					Menu1 setText( "^6Rust Teleport Menu" );
					Text3 setText( "^2Press ^3[{+actionslot 3}] ^2to teleport to: ^5Top of Rust" );
				} else if (getdvar("mapname") == "mp_boneyard") {
					Menu1 setText( "^6Scrapyard Teleport Menu" );
					Text3 setText( "^2Press ^3[{+actionslot 3}] ^2to teleport to: ^5Above TF141 Spawn" );
					Text4 setText( "^2Press ^3[{+actionslot 4}] ^2to teleport to: ^5On top of plane shell" );
					Text5 setText( "^2Press ^3[{+smoke}] ^2to teleport to: ^5Upstairs in the office" );
				} else if (getdvar("mapname") == "mp_subbase") {
					Menu1 setText( "^6Sub Base Teleport Menu" );
					Text3 setText( "^2Press ^3[{+actionslot 3}] ^2to teleport to: ^5Communications Room" );
					Text4 setText( "^2Press ^3[{+actionslot 4}] ^2to teleport to: ^5Roof near Bombsite A" );
					Text5 setText( "^2Press ^3[{+smoke}] ^2to teleport to: ^5Above packing area" );
				} else if (getdvar("mapname") == "mp_terminal") {
					Menu1 setText( "^6Terminal Teleport Menu" );
					Text3 setText( "^2Press ^3[{+actionslot 3}] ^2to teleport to: ^5Above Bombsite A" );
					Text4 setText( "^2Press ^3[{+actionslot 4}] ^2to teleport to: ^5Wing of plane" );
					Text5 setText( "^2Press ^3[{+smoke}] ^2to teleport to: ^5Top of plane" );
					Text6 setText( "^2Press ^3[{+activate}] ^2to teleport to: ^5Top of wing" );
				} else if (getdvar("mapname") == "mp_underpass") {
					Menu1 setText( "^6Underpass Teleport Menu" );
					Text3 setText( "^2Press ^3[{+actionslot 3}] ^2to teleport to: ^5Circular platform" );
					Text4 setText( "^2Press ^3[{+actionslot 4}] ^2to teleport to: ^5Roof near Bombsite B" );
					Text5 setText( "^2Press ^3[{+smoke}] ^2to teleport to: ^5Roof near Bombsite A" );
				} else if (getdvar("mapname") == "mp_brecourt") {
					Menu1 setText( "^6Wasteland Teleport Menu" );
					Text3 setText( "^2Press ^3[{+actionslot 3}] ^2to teleport to: ^5Top of roofless house" );
					Text4 setText( "^2Press ^3[{+actionslot 4}] ^2to teleport to: ^5Top of helicopter" );
				} else {
					Menu1 setText( "^1ERROR" );
					Text3 setText( "^1This map is not supported!\nJust use the UFO feature." );
				}

				Text8 setText( "^2Press ^3[{+melee}] ^2to ^5save ^2your current location" );

				if (self.ufo == false) {
					Text7 setText( "^2Press ^3[{+gostand}] ^2to ^5enter ^2into ^5UFO mode" );
				} else {
					Text7 setText( "^2Press ^3[{+gostand}] ^2to ^5exit ^2out of ^5UFO mode" );
				}
				
				if (self.pers["loc"] == false) {
					Text9 setText( "^2You have to ^5save ^2a location to ^5load ^2it." );
				} else if (self.pers["loc"] == true) {
					Text9 setText( "^2Press ^3[{+reload}] ^2to ^5load ^2your saved location" );
				}

			} else if (self.menuPos == 2) {

				Menu1 setText( "^6Equipment Menu" );

				if (self.curPos == 1) {
					Text1 setText( "^2Frag Grenade" );
				} else if (self.curPos != 1) {
					Text1 setText( "^1Frag Grenade" );
				}

				if (self.curPos == 2) {
					Text2 setText( "^2Semtex Grenade" );
				} else if (self.curPos != 2) {
					Text2 setText( "^1Semtex Grenade" );
				}

				if (self.curPos == 3) {
					Text3 setText( "^2Throwing Knife" );
				} else if (self.curPos != 3) {
					Text3 setText( "^1Throwing Knife" );
				}

				if (self.curPos == 4) {
					Text4 setText( "^2Tactical Insertion" );
				} else if (self.curPos != 4) {
					Text4 setText( "^1Tactical Insertion" );
				}

				if (self.curPos == 5) {
					Text5 setText( "^2Blast Shield" );
				} else if (self.curPos != 5) {
					Text5 setText( "^1Blast Shield" );
				}

				if (self.curPos == 6) {
					Text6 setText( "^2Claymore" );
				} else if (self.curPos != 6) {
					Text6 setText( "^1Claymore" );
				}

				if (self.curPos == 7) {
					Text7 setText( "^2C4" );
				} else if (self.curPos != 7) {
					Text7 setText( "^1C4" );
				}

				if (self.curPos == 8) {
					Menu2 setText( "^2Press ^3[{+reload}] ^2to ^3cycle" );
					Text8 setText( "^2Tactical Insertion With: ^3" + self.equ[ self.selector - 1 ] );
				} else if (self.curPos != 8) {
					Text8 setText( "^1Tactical Insertion With: ^3" + self.equ[ self.selector - 1 ] );
				}

			} else if (self.menuPos == 3) {
				
				Menu1 setText( "^6Weapons Menu" );
			
				if (self.weaponStatus == 1) {

					if (self.secIsPrimary == true) {

						if (self.weaponStatus == 1) {
							Menu2 setText( "^2Press ^3[{+reload}] ^2to ^3switch teirs" );

							if (self.secTeir == 1) {
								Menu3 setText( "^6Current Teir: ^2Assualt Rifles" );
							} else if (self.secTeir == 2) {
								Menu3 setText( "^6Current Teir: ^2Sub Machine Guns" );
							} else if (self.secTeir == 3) {
								Menu3 setText( "^6Current Teir: ^2Sniper Rifles" );
							} else if (self.secTeir == 4) {
								Menu3 setText( "^6Current Teir: ^2Light Machine Guns" );
							} else if (self.secTeir == 5) {
								Menu3 setText( "^6Current Teir: ^2Riot Shield" );
							}
						} else {
							Menu2 setText( "" );
							Menu3 setText( "" );
						}
					} else {
						Menu2 setText( "^3Choose a primary weapon" );
						Menu3 setText( "" );
					}

					if (self.secIsPrimary == true) {

						if (self.secTeir == 1) {

							if (self.curPos == 1) {
								Text1 setText( "^2M4A1" );
							} else if (self.curPos != 1) {
								Text1 setText( "^1M4A1" );
							}

							if (self.curPos == 2) {
								Text2 setText( "^2Famas" );
							} else if (self.curPos != 2) {
								Text2 setText( "^1Famas" );
							}

							if (self.curPos == 3) {
								Text3 setText( "^2SCAR-H" );
							} else if (self.curPos != 3) {
								Text3 setText( "^1SCAR-H" );
							}
	
							if (self.curPos == 4) {
								Text4 setText( "^2TAR-21" );
							} else if (self.curPos != 4) {
								Text4 setText( "^1TAR-21" );
							}
	
							if (self.curPos == 5) {
								Text5 setText( "^2FAL" );
							} else if (self.curPos != 5) {
								Text5 setText( "^1FAL" );
							}
	
							if (self.curPos == 6) {
								Text6 setText( "^2M16A4" );
							} else if (self.curPos != 6) {
								Text6 setText( "^1M16A4" );
							}
	
							if (self.curPos == 7) {
								Text7 setText( "^2ACR" );
							} else if (self.curPos != 7) {
								Text7 setText( "^1ACR" );
							}
	
							if (self.curPos == 8) {
								Text8 setText( "^2F2000" );
							} else if (self.curPos != 8) {
								Text8 setText( "^1F2000" );
							}
	
							if (self.curPos == 9) {
								Text9 setText( "^2AK-47" );
							} else if (self.curPos != 9) {
								Text9 setText( "^1AK-47" );
							}
		
						} else if (self.secTeir == 2) {

							if (self.curPos == 1) {
								Text1 setText( "^2MP5K" );
							} else if (self.curPos != 1) {
								Text1 setText( "^1MP5K" );
							}
	
							if (self.curPos == 2) {
								Text2 setText( "^2UMP 45" );
							} else if (self.curPos != 2) {
								Text2 setText( "^1UMP 45" );
							}
	
							if (self.curPos == 3) {
								Text3 setText( "^2Vector" );
							} else if (self.curPos != 3) {
								Text3 setText( "^1Vector" );
							}
	
							if (self.curPos == 4) {
								Text4 setText( "^2P90" );
							} else if (self.curPos != 4) {
								Text4 setText( "^1P90" );
							}
	
							if (self.curPos == 5) {
								Text5 setText( "^2Mini-Uzi" );
							} else if (self.curPos != 5) {
								Text5 setText( "^1Mini-Uzi" );
							}
	
						} else if (self.secTeir == 3) {

							if (self.curPos == 1) {
								Text1 setText( "^2Intervention" );
							} else if (self.curPos != 1) {
								Text1 setText( "^1Intervention" );
							}
							
							if (self.curPos == 2) {
								Text2 setText( "^2Barrett .50cal" );
							} else if (self.curPos != 2) {
								Text2 setText( "^1Barrett .50cal" );
							}
		
							if (self.curPos == 3) {
								Text3 setText( "^2WA2000" );
							} else if (self.curPos != 3) {
								Text3 setText( "^1WA2000" );
							}
		
							if (self.curPos == 4) {
								Text4 setText( "^2M21" );
							} else if (self.curPos != 4) {
								Text4 setText( "^1M21" );
							}
	
						} else if (self.secTeir == 4) {

							if (self.curPos == 1) {
								Text1 setText( "^2L86 LSW" );
							} else if (self.curPos != 1) {
								Text1 setText( "^1L86 LSW" );
							}
							
							if (self.curPos == 2) {
								Text2 setText( "^2MG4" );
							} else if (self.curPos != 2) {
								Text2 setText( "^1MG4" );
							}
		
							if (self.curPos == 3) {
								Text3 setText( "^2RPD" );
							} else if (self.curPos != 3) {
								Text3 setText( "^1RPD" );
							}
		
							if (self.curPos == 4) {
								Text4 setText( "^2AUG H Bar" );
							} else if (self.curPos != 4) {
								Text4 setText( "^1AUG H Bar" );
							}
		
							if (self.curPos == 5) {
								Text5 setText( "^2M240" );
							} else if (self.curPos != 5) {
								Text5 setText( "^1M240" );
							}
	
						} else if (self.secTeir == 5) {

							Text1 setText( "^2Riotshield" );
						}
					} else {
						if (self.curPos == 1) {
							Text1 setText( "^2Intervention" );
						} else if (self.curPos != 1) {
							Text1 setText( "^1Intervention" );
						}
							
						if (self.curPos == 2) {
							Text2 setText( "^2Barrett .50cal" );
						} else if (self.curPos != 2) {
							Text2 setText( "^1Barrett .50cal" );
						}
	
						if (self.curPos == 3) {
							Text3 setText( "^2WA2000" );
						} else if (self.curPos != 3) {
							Text3 setText( "^1WA2000" );
						}
	
						if (self.curPos == 4) {
							Text4 setText( "^2M21" );
						} else if (self.curPos != 4) {
							Text4 setText( "^1M21" );
						}
	
						if (self.curPos == 5) {
							Text5 setText( "^2Default Trickshot Class" );
						} else if (self.curPos != 5) {
							Text5 setText( "^1Default Trickshot Class" );
						}
	
						if (self.curPos == 6) {
							if (self.pers["created"] == false) {
								Text6 setText( "^2Create a class to use this feature" );
							} else {
								Text6 setText( "^2Load last saved class" );
							}
						} else if (self.curPos != 6) {
							if (self.pers["created"] == false) {
								Text6 setText( "^1Create a class to use this feature" );
							} else {
								Text6 setText( "^1Load last saved class" );
							}
						}
					}

				} else if (self.weaponStatus == 2) { // Sniper Rifle
					Menu2 setText( "^3Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^2None" );
					} else if (self.curPos != 1) {
						Text1 setText( "^1None" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^2Silencer" );
					} else if (self.curPos != 2) {
						Text2 setText( "^1Silencer" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^2ACOG" );
					} else if (self.curPos != 3) {
						Text3 setText( "^1ACOG" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^2FMJ" );
					} else if (self.curPos != 4) {
						Text4 setText( "^1FMJ" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^2Heartbeat Sensor" );
					} else if (self.curPos != 5) {
						Text5 setText( "^1Heartbeat Sensor" );
					}

					if (self.curPos == 6) {
						Text6 setText( "^2Thermal Scope" );
					} else if (self.curPos != 6) {
						Text6 setText( "^1Thermal Scope" );
					}

					if (self.curPos == 7) {
						Text7 setText( "^2Extended Mags" );
					} else if (self.curPos != 7) {
						Text7 setText( "^1Extended Mags" );
					}

				} else if (self.weaponStatus == 3) { // Developing.
					Menu2 setText( "^3Choose a secondary weapon" );

					if (self.curPos == 1) {
						Text1 setText( "^2Machine Pistols" );
						Text2 setText( "^1Handguns" );
						Text3 setText( "^1Shotguns" );
						Text4 setText( "^1Launchers" );
						Text5 setText( "^1One Man Army" );
						Text6 setText( "^1Second Primary" );
					} else if (self.curPos == 2) {
						Text1 setText( "^1Machine Pistols" );
						Text2 setText( "^2Handguns" );
						Text3 setText( "^1Shotguns" );
						Text4 setText( "^1Launchers" );
						Text5 setText( "^1One Man Army" );
						Text6 setText( "^1Second Primary" );
					} else if (self.curPos == 3) {
						Text1 setText( "^1Machine Pistols" );
						Text2 setText( "^1Handguns" );
						Text3 setText( "^2Shotguns" );
						Text4 setText( "^1Launchers" );
						Text5 setText( "^1One Man Army" );
						Text6 setText( "^1Second Primary" );
					} else if (self.curPos == 4) {
						Text1 setText( "^1Machine Pistols" );
						Text2 setText( "^1Handguns" );
						Text3 setText( "^1Shotguns" );
						Text4 setText( "^2Launchers" );
						Text5 setText( "^1One Man Army" );
						Text6 setText( "^1Second Primary" );
					} else if (self.curPos == 5) {
						Text1 setText( "^1Machine Pistols" );
						Text2 setText( "^1Handguns" );
						Text3 setText( "^1Shotguns" );
						Text4 setText( "^1Launchers" );
						Text5 setText( "^2One Man Army" );
						Text6 setText( "^1Second Primary" );
					} else if (self.curPos == 6) {
						Text1 setText( "^1Machine Pistols" );
						Text2 setText( "^1Handguns" );
						Text3 setText( "^1Shotguns" );
						Text4 setText( "^1Launchers" );
						Text5 setText( "^1One Man Army" );
						Text6 setText( "^2Second Primary" );
					}

				} else if (self.weaponStatus == 4) { // Pistols
					Menu2 setText( "^3Choose a pistol" );

					if (self.curPos == 1) {
						Text1 setText( "^2USP .45" );
						Text2 setText( "^1.44 Magnum" );
						Text3 setText( "^1M9" );
						Text4 setText( "^1Desert Eagle" );
						Text5 setText( "^1Back" );
						Text6 setText( "" );
						Text7 setText( "" );
					} else if (self.curPos == 2) {
						Text1 setText( "^1USP .45" );
						Text2 setText( "^2.44 Magnum" );
						Text3 setText( "^1M9" );
						Text4 setText( "^1Desert Eagle" );
						Text5 setText( "^1Back" );
						Text6 setText( "" );
						Text7 setText( "" );
					} else if (self.curPos == 3) {
						Text1 setText( "^1USP .45" );
						Text2 setText( "^1.44 Magnum" );
						Text3 setText( "^2M9" );
						Text4 setText( "^1Desert Eagle" );
						Text5 setText( "^1Back" );
						Text6 setText( "" );
						Text7 setText( "" );
					} else if (self.curPos == 4) {
						Text1 setText( "^1USP .45" );
						Text2 setText( "^1.44 Magnum" );
						Text3 setText( "^1M9" );
						Text4 setText( "^2Desert Eagle" );
						Text5 setText( "^1Back" );
						Text6 setText( "" );
						Text7 setText( "" );
					} else if (self.curPos == 5) {
						Text1 setText( "^1USP .45" );
						Text2 setText( "^1.44 Magnum" );
						Text3 setText( "^1M9" );
						Text4 setText( "^1Desert Eagle" );
						Text5 setText( "^2Back" );
						Text6 setText( "" );
						Text7 setText( "" );
					}
				} else if (self.weaponStatus == 5) { // USP | M9
					Menu2 setText( "^3Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^2None" );
						Text2 setText( "^1FMJ" );
						Text3 setText( "^1Silencer" );
						Text4 setText( "^1Akimbo" );
						Text5 setText( "^1Tactical Knife" );
						Text6 setText( "^1Extended Mags" );
						Text7 setText( "" );
					} else if (self.curPos == 2) {
						Text1 setText( "^1None" );
						Text2 setText( "^2FMJ" );
						Text3 setText( "^1Silencer" );
						Text4 setText( "^1Akimbo" );
						Text5 setText( "^1Tactical Knife" );
						Text6 setText( "^1Extended Mags" );
						Text7 setText( "" );
					} else if (self.curPos == 3) {
						Text1 setText( "^1None" );
						Text2 setText( "^1FMJ" );
						Text3 setText( "^2Silencer" );
						Text4 setText( "^1Akimbo" );
						Text5 setText( "^1Tactical Knife" );
						Text6 setText( "^1Extended Mags" );
						Text7 setText( "" );
					} else if (self.curPos == 4) {
						Text1 setText( "^1None" );
						Text2 setText( "^1FMJ" );
						Text3 setText( "^1Silencer" );
						Text4 setText( "^2Akimbo" );
						Text5 setText( "^1Tactical Knife" );
						Text6 setText( "^1Extended Mags" );
						Text7 setText( "" );
					} else if (self.curPos == 5) {
						Text1 setText( "^1None" );
						Text2 setText( "^1FMJ" );
						Text3 setText( "^1Silencer" );
						Text4 setText( "^1Akimbo" );
						Text5 setText( "^2Tactical Knife" );
						Text6 setText( "^1Extended Mags" );
						Text7 setText( "" );
					} else if (self.curPos == 6) {
						Text1 setText( "^1None" );
						Text2 setText( "^1FMJ" );
						Text3 setText( "^1Silencer" );
						Text4 setText( "^1Akimbo" );
						Text5 setText( "^1Tactical Knife" );
						Text6 setText( "^2Extended Mags" );
						Text7 setText( "" );
					}
				} else if (self.weaponStatus == 6) { // .44 Magnum | Desert Eagle
					Menu2 setText( "^3Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^2None" );
						Text2 setText( "^1FMJ" );
						Text3 setText( "^1Akimbo" );
						Text4 setText( "^1Tactical Knife" );
						Text5 setText( "" );
						Text6 setText( "" );
						Text7 setText( "" );
					} else if (self.curPos == 2) {
						Text1 setText( "^1None" );
						Text2 setText( "^2FMJ" );
						Text3 setText( "^1Akimbo" );
						Text4 setText( "^1Tactical Knife" );
						Text5 setText( "" );
						Text6 setText( "" );
						Text7 setText( "" );
					} else if (self.curPos == 3) {
						Text1 setText( "^1None" );
						Text2 setText( "^1FMJ" );
						Text3 setText( "^2Akimbo" );
						Text4 setText( "^1Tactical Knife" );
						Text5 setText( "" );
						Text6 setText( "" );
						Text7 setText( "" );
					} else if (self.curPos == 4) {
						Text1 setText( "^1None" );
						Text2 setText( "^1FMJ" );
						Text3 setText( "^1Akimbo" );
						Text4 setText( "^2Tactical Knife" );
						Text5 setText( "" );
						Text6 setText( "" );
						Text7 setText( "" );
					}
				} else if (self.weaponStatus == 7) { // Shotguns
					Menu2 setText( "^3Choose a shotgun" );

					if (self.curPos == 1) {
						Text1 setText( "^2Spas12" );
						Text2 setText( "^1AA12" );
						Text3 setText( "^1Striker" );
						Text4 setText( "^1Ranger" );
						Text5 setText( "^1M1014" );
						Text6 setText( "^1Model 1887" );
						Text7 setText( "^1Back" );
					} else if (self.curPos == 2) {
						Text1 setText( "^1Spas12" );
						Text2 setText( "^2AA12" );
						Text3 setText( "^1Striker" );
						Text4 setText( "^1Ranger" );
						Text5 setText( "^1M1014" );
						Text6 setText( "^1Model 1887" );
						Text7 setText( "^1Back" );
					} else if (self.curPos == 3) {
						Text1 setText( "^1Spas12" );
						Text2 setText( "^1AA12" );
						Text3 setText( "^2Striker" );
						Text4 setText( "^1Ranger" );
						Text5 setText( "^1M1014" );
						Text6 setText( "^1Model 1887" );
						Text7 setText( "^1Back" );
					} else if (self.curPos == 4) {
						Text1 setText( "^1Spas12" );
						Text2 setText( "^1AA12" );
						Text3 setText( "^1Striker" );
						Text4 setText( "^2Ranger" );
						Text5 setText( "^1M1014" );
						Text6 setText( "^1Model 1887" );
						Text7 setText( "^1Back" );
					} else if (self.curPos == 5) {
						Text1 setText( "^1Spas12" );
						Text2 setText( "^1AA12" );
						Text3 setText( "^1Striker" );
						Text4 setText( "^1Ranger" );
						Text5 setText( "^2M1014" );
						Text6 setText( "^1Model 1887" );
						Text7 setText( "^1Back" );
					} else if (self.curPos == 6) {
						Text1 setText( "^1Spas12" );
						Text2 setText( "^1AA12" );
						Text3 setText( "^1Striker" );
						Text4 setText( "^1Ranger" );
						Text5 setText( "^1M1014" );
						Text6 setText( "^2Model 1887" );
						Text7 setText( "^1Back" );
					} else if (self.curPos == 7) {
						Text1 setText( "^1Spas12" );
						Text2 setText( "^1AA12" );
						Text3 setText( "^1Striker" );
						Text4 setText( "^1Ranger" );
						Text5 setText( "^1M1014" );
						Text6 setText( "^1Model 1887" );
						Text7 setText( "^2Back" );
					}
				} else if (self.weaponStatus == 8) { // Spas 12 | AA12 | Striker | M1014
					Menu2 setText( "^3Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^2None" );
						Text2 setText( "^1Red Dot Sight" );
						Text3 setText( "^1Silencer" );
						Text4 setText( "^1Grip" );
						Text5 setText( "^1FMJ" );
						Text6 setText( "^1Holographic Sight" );
						Text7 setText( "^1Extended Mags" );
					} else if (self.curPos == 2) {
						Text1 setText( "^1None" );
						Text2 setText( "^2Red Dot Sight" );
						Text3 setText( "^1Silencer" );
						Text4 setText( "^1Grip" );
						Text5 setText( "^1FMJ" );
						Text6 setText( "^1Holographic Sight" );
						Text7 setText( "^1Extended Mags" );
					} else if (self.curPos == 3) {
						Text1 setText( "^1None" );
						Text2 setText( "^1Red Dot Sight" );
						Text3 setText( "^2Silencer" );
						Text4 setText( "^1Grip" );
						Text5 setText( "^1FMJ" );
						Text6 setText( "^1Holographic Sight" );
						Text7 setText( "^1Extended Mags" );
					} else if (self.curPos == 4) {
						Text1 setText( "^1None" );
						Text2 setText( "^1Red Dot Sight" );
						Text3 setText( "^1Silencer" );
						Text4 setText( "^2Grip" );
						Text5 setText( "^1FMJ" );
						Text6 setText( "^1Holographic Sight" );
						Text7 setText( "^1Extended Mags" );
					} else if (self.curPos == 5) {
						Text1 setText( "^1None" );
						Text2 setText( "^1Red Dot Sight" );
						Text3 setText( "^1Silencer" );
						Text4 setText( "^1Grip" );
						Text5 setText( "^2FMJ" );
						Text6 setText( "^1Holographic Sight" );
						Text7 setText( "^1Extended Mags" );
					} else if (self.curPos == 6) {
						Text1 setText( "^1None" );
						Text2 setText( "^1Red Dot Sight" );
						Text3 setText( "^1Silencer" );
						Text4 setText( "^1Grip" );
						Text5 setText( "^1FMJ" );
						Text6 setText( "^2Holographic Sight" );
						Text7 setText( "^1Extended Mags" );
					} else if (self.curPos == 7) {
						Text1 setText( "^1None" );
						Text2 setText( "^1Red Dot Sight" );
						Text3 setText( "^1Silencer" );
						Text4 setText( "^1Grip" );
						Text5 setText( "^1FMJ" );
						Text6 setText( "^1Holographic Sight" );
						Text7 setText( "^2Extended Mags" );
					}
				} else if (self.weaponStatus == 9) { // Ranger | Model 1887
					Menu2 setText( "^3Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^2None" );
						Text2 setText( "^1FMJ" );
						Text3 setText( "^1Akimbo" );
					} else if (self.curPos == 2) {
						Text1 setText( "^1None" );
						Text2 setText( "^2FMJ" );
						Text3 setText( "^1Akimbo" );
					} else if (self.curPos == 3) {
						Text1 setText( "^1None" );
						Text2 setText( "^1FMJ" );
						Text3 setText( "^2Akimbo" );
					}
				} else if (self.weaponStatus == 10) {
					Menu2 setText( "^3Choose a launcher" );

					if (self.curPos == 1) {
						Text1 setText( "^2AT4-HS" );
						Text2 setText( "^1Thumper" );
						Text3 setText( "^1Stinger" );
						Text4 setText( "^1Javelin" );
						Text5 setText( "^1RPG-7" );
						Text6 setText( "^1Back" );
					} else if (self.curPos == 2) {
						Text1 setText( "^1AT4-HS" );
						Text2 setText( "^2Thumper" );
						Text3 setText( "^1Stinger" );
						Text4 setText( "^1Javelin" );
						Text5 setText( "^1RPG-7" );
						Text6 setText( "^1Back" );
					} else if (self.curPos == 3) {
						Text1 setText( "^1AT4-HS" );
						Text2 setText( "^1Thumper" );
						Text3 setText( "^2Stinger" );
						Text4 setText( "^1Javelin" );
						Text5 setText( "^1RPG-7" );
						Text6 setText( "^1Back" );
					} else if (self.curPos == 4) {
						Text1 setText( "^1AT4-HS" );
						Text2 setText( "^1Thumper" );
						Text3 setText( "^1Stinger" );
						Text4 setText( "^2Javelin" );
						Text5 setText( "^1RPG-7" );
						Text6 setText( "^1Back" );
					} else if (self.curPos == 5) {
						Text1 setText( "^1AT4-HS" );
						Text2 setText( "^1Thumper" );
						Text3 setText( "^1Stinger" );
						Text4 setText( "^1Javelin" );
						Text5 setText( "^2RPG-7" );
						Text6 setText( "^1Back" );
					} else if (self.curPos == 6) {
						Text1 setText( "^1AT4-HS" );
						Text2 setText( "^1Thumper" );
						Text3 setText( "^1Stinger" );
						Text4 setText( "^1Javelin" );
						Text5 setText( "^1RPG-7" );
						Text6 setText( "^2Back" );
					}
				} else if (self.weaponStatus == 11) {
					Menu2 setText( "^3Choose a machine pistol" );

					if (self.curPos == 1) {
						Text1 setText( "^2PP2000" );
					} else if (self.curPos != 1) {
						Text1 setText( "^1PP2000" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^2G18" );
					} else if (self.curPos != 2) {
						Text2 setText( "^1G18" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^2M93 Raffica" );
					} else if (self.curPos != 3) {
						Text3 setText( "^1M93 Raffica" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^2TMP" );
					} else if (self.curPos != 4) {
						Text4 setText( "^1TMP" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^2Back" );
					} else if (self.curPos != 5) {
						Text5 setText( "^1Back" );
					}
				} else if (self.weaponStatus == 12) {
					Menu2 setText( "^3Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^2None" );
					} else if (self.curPos != 1) {
						Text1 setText( "^1None" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^2Red Dot Sight" );
					} else if (self.curPos != 2) {
						Text2 setText( "^1Red Dot Sight" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^2Silencer" );
					} else if (self.curPos != 3) {
						Text3 setText( "^1Silencer" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^2FMJ" );
					} else if (self.curPos != 4) {
						Text4 setText( "^1FMJ" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^2Akimbo" );
					} else if (self.curPos != 5) {
						Text5 setText( "^1Akimbo" );
					}

					if (self.curPos == 6) {
						Text6 setText( "^2Holographic Sight" );
					} else if (self.curPos != 6) {
						Text6 setText( "^1Holographic Sight" );
					}

					if (self.curPos == 7) {
						Text7 setText( "^2Extended Mags" );
					} else if (self.curPos != 7) {
						Text7 setText( "^1Extended Mags" );
					}

				} else if (self.weaponStatus == 13) {
					Menu2 setText( "^3Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^2None" );
					} else if (self.curPos != 1) {
						Text1 setText( "^1None" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^2Grenade Launcher" );
					} else if (self.curPos != 2) {
						Text2 setText( "^1Grenade Launcher" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^2Red Dot Sight" );
					} else if (self.curPos != 3) {
						Text3 setText( "^1Red Dot Sight" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^2Silencer" );
					} else if (self.curPos != 4) {
						Text4 setText( "^1Silencer" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^2ACOG Scope" );
					} else if (self.curPos != 5) {
						Text5 setText( "^1ACOG Scope" );
					}

					if (self.curPos == 6) {
						Text6 setText( "^2FMJ" );
					} else if (self.curPos != 6) {
						Text6 setText( "^1FMJ" );
					}

					if (self.curPos == 7) {
						Text7 setText( "^2Shotgun Attachment" );
					} else if (self.curPos != 7) {
						Text7 setText( "^1Shotgun Attachment" );
					}

					if (self.curPos == 8) {
						Text8 setText( "^2Holographic Sight" );
					} else if (self.curPos != 8) {
						Text8 setText( "^1Holographic Sight" );
					}

					if (self.curPos == 9) {
						Text9 setText( "^2Heartbeat Sensor" );
					} else if (self.curPos != 9) {
						Text9 setText( "^1Heartbeat Sensor" );
					}

					if (self.curPos == 10) {
						Text10 setText( "^2Thermal Scope" );
					} else if (self.curPos != 10) {
						Text10 setText( "^1Thermal Scope" );
					}

					if (self.curPos == 11) {
						Text11 setText( "^2Extended Mags" );
					} else if (self.curPos != 11) {
						Text11 setText( "^1Extended Mags" );
					}

				} else if (self.weaponStatus == 14) {
					Menu2 setText( "^3Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^2None" );
					} else if (self.curPos != 1) {
						Text1 setText( "^1None" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^2Rapid Fire" );
					} else if (self.curPos != 2) {
						Text2 setText( "^1Rapid Fire" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^2Red Dot Sight" );
					} else if (self.curPos != 3) {
						Text3 setText( "^1Red Dot Sight" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^2Silencer" );
					} else if (self.curPos != 4) {
						Text4 setText( "^1Silencer" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^2ACOG Scope" );
					} else if (self.curPos != 5) {
						Text5 setText( "^1ACOG Scope" );
					}

					if (self.curPos == 6) {
						Text6 setText( "^2FMJ" );
					} else if (self.curPos != 6) {
						Text6 setText( "^1FMJ" );
					}

					if (self.curPos == 7) {
						Text7 setText( "^2Akimbo" );
					} else if (self.curPos != 7) {
						Text7 setText( "^1Akimbo" );
					}

					if (self.curPos == 8) {
						Text8 setText( "^2Holographic Sight" );
					} else if (self.curPos != 8) {
						Text8 setText( "^1Holographic Sight" );
					}

					if (self.curPos == 9) {
						Text9 setText( "^2Thermal Scope" );
					} else if (self.curPos != 9) {
						Text9 setText( "^1Thermal Scope" );
					}

					if (self.curPos == 10) {
						Text10 setText( "^2Extended Mags" );
					} else if (self.curPos != 10) {
						Text10 setText( "^1Extended Mags" );
					}
				} else if (self.weaponStatus == 15) {
					Menu2 setText( "^3Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^2None" );
					} else if (self.curPos != 1) {
						Text1 setText( "^1None" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^2Grip" );
					} else if (self.curPos != 2) {
						Text2 setText( "^1Grip" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^2Red Dot Sight" );
					} else if (self.curPos != 3) {
						Text3 setText( "^1Red Dot Sight" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^2Silencer" );
					} else if (self.curPos != 4) {
						Text4 setText( "^1Silencer" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^2ACOG Scope" );
					} else if (self.curPos != 5) {
						Text5 setText( "^1ACOG Scope" );
					}

					if (self.curPos == 6) {
						Text6 setText( "^2FMJ" );
					} else if (self.curPos != 6) {
						Text6 setText( "^1FMJ" );
					}

					if (self.curPos == 7) {
						Text7 setText( "^2Holographic Sight" );
					} else if (self.curPos != 7) {
						Text7 setText( "^1Holographic Sight" );
					}

					if (self.curPos == 8) {
						Text8 setText( "^2Heartbeat Sensor" );
					} else if (self.curPos != 8) {
						Text8 setText( "^1Heartbeat Sensor" );
					}

					if (self.curPos == 9) {
						Text9 setText( "^2Thermal Scope" );
					} else if (self.curPos != 9) {
						Text9 setText( "^1Thermal Scope" );
					}

					if (self.curPos == 10) {
						Text10 setText( "^2Extended Mags" );
					} else if (self.curPos != 10) {
						Text10 setText( "^1Extended Mags" );
					}
				} else if (self.weaponStatus == 16) {
					Menu2 setText( "^7Do you want to save this class?" );

					if (self.curPos == 1) {
						Text1 setText( "^2No" );
					} else if (self.curPos != 1) {
						Text1 setText( "^1No" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^2Yes" );
					} else if (self.curPos != 2) {
						Text2 setText( "^1Yes" );
					}
				}
			} else if (self.menuPos == 4) {
				Menu1 setText( "^6Killstreak Menu" );

				if (self.curPos == 1) {
					Text1 setText( "^2UAV" );
				} else if (self.curPos != 1) {
					Text1 setText( "^1UAV" );
				}

				if (self.curPos == 2) {
					Text2 setText( "^2Care Package" );
				} else if (self.curPos != 2) {
					Text2 setText( "^1Care Package" );
				}

				if (self.curPos == 3) {
					Text3 setText( "^2Sentry Gun" );
				} else if (self.curPos != 3) {
					Text3 setText( "^1Sentry Gun" );
				}

				if (self.curPos == 4) {
					Text4 setText( "^2Predator Missile" );
				} else if (self.curPos != 4) {
					Text4 setText( "^1Predator Missile" );
				}

			} else if (self.menuPos == 5) {
				Menu1 setText( "^6Character Preferences" );

				if (self.curPos == 1) {
					Text1 setText( "^2Set Ammo In Stock To 0" );
				} else if (self.curPos != 1) {
					Text1 setText( "^1Set Ammo In Stock To 0" );
				}

				if (self.curPos == 2) {
					Text2 setText( "^2Set Ammo In Clip To 0" );
				} else if (self.curPos != 2) {
					Text2 setText( "^1Set Ammo In Clip To 0" );
				}

				if (self.curPos == 3) {
					Text3 setText( "^2Refill Everything" );
				} else if (self.curPos != 3) {
					Text3 setText( "^1Refill Everything" );
				}

				if (self.curPos == 4) {
					Text4 setText( "^2Regen. Ammo On Reload: ^3" + self.pers["rAmmo"] );
				} else if (self.curPos != 4) {
					Text4 setText( "^1Regen. Ammo On Reload: ^3" + self.pers["rAmmo"] );
				}

				if (self.curPos == 5) {
					Text5 setText( "^2Regen. Special Grenades On Reload: ^3" + self.pers["rSpec"] );
				} else if (self.curPos != 5) {
					Text5 setText( "^1Regen. Special Grenades On Reload: ^3" + self.pers["rSpec"] );
				}

				if (self.curPos == 6) {
					Text6 setText( "^2Regen. Equipment On Reload: ^3" + self.pers["rEquip"] );
				} else if (self.curPos != 6) {
					Text6 setText( "^1Regen. Equipment On Reload: ^3" + self.pers["rEquip"] );
				}

				if (self.curPos == 7) {
					Text7 setText( "^2Instant Level 70" );
				} else if (self.curPos != 7) {
					Text7 setText( "^1Instant Level 70" );
				}

				if (self.curPos == 8) {
					Text8 setText( "^2Unlock All Challenges" );
				} else if (self.curPos != 8) {
					Text8 setText( "^1Unlock All Challenges" );
				}

			}
		} else if (self.menuOpen == 2) {

			Menu1 setText( "" );
			Menu2 setText( "" );
			Menu3 setText( "" );
			subMenu1 setText( "" );
			subMenu2 setText( "" );
			Text1 setText( "" );
			Text2 setText( "" );
			Text3 setText( "" );
			Text4 setText( "" );
			Text5 setText( "" );
			Text6 setText( "" );
			Text7 setText( "" );
			Text8 setText( "" );
			Text9 setText( "" );
			Text10 setText( "" );
			Text11 setText( "" );
			Close1 setText( "" );

			Close1 setText( "^2Press ^3[{+actionslot 2}] ^2to ^3close the menu" );
	
				if (self.menuPos == 1) {
	
					subMenu1 setText( "^3Ban List Menu" );
			// Match Settings
					subMenu2 setText( "^3Fun Stuff" );
	
				} else if (self.menuPos == 2) {
	
					subMenu1 setText( "^3Match Settings" );
			// Fun Stuff
					subMenu2 setText( "^3Change Map" );
	
				} else if (self.menuPos == 3) {
	
					subMenu1 setText( "^3Fun Stuff" );
			// Change Map
					subMenu2 setText( "^3Gametype Settings" );

				} else if (self.menuPos == 4) {
	
					subMenu1 setText( "^3Change Map" );
			// Gametype Settings
					subMenu2 setText( "^3x" );
	
				} else if (self.menuPos == 5) { // Ban List
	
					subMenu1 setText( "^3Gametype Settings" );
			// x
					subMenu2 setText( "^3Match Settings" );

				}

			if (self.menuPos == 1) {
				Menu1 setText( "^6Match Settings" );
				
				if (self.curPos == 1) {
					Text1 setText( "^2Bots Move: ^3" + self.bMove );
				} else if (self.curPos != 1) {
					Text1 setText( "^1Bots Move: ^3" + self.bMove );
				}

				if (self.curPos == 2) {
					Text2 setText( "^2Bots Shoot: ^3" + self.bShoot );
				} else if (self.curPos != 2) {
					Text2 setText( "^1Bots Shoot: ^3" + self.bShoot );
				}

				if (self.curPos == 3) {
					Text3 setText( "^2Bots Reload: ^3" + self.bReload );
				} else if (self.curPos != 3) {
					Text3 setText( "^1Bots Reload: ^3" + self.bReload );
				}

				if (self.curPos == 4) {
					Text4 setText( "^2Bots Lock On: ^3" + self.bLock );
				} else if (self.curPos != 4) {
					Text4 setText( "^1Bots Lock On: ^3" + self.bLock );
				}

				if (self.curPos == 5) {
					Text5 setText( "^2Damage: ^3" + self.damageLevelStatus );
				} else if (self.curPos != 5) {
					Text5 setText( "^1Damage: ^3" + self.damageLevelStatus );
				}

			} else if (self.menuPos == 2) {
				Menu1 setText( "^6Fun Stuff Menu" );

				if (self.curPos == 1) {
					Text1 setText( "^2Aimbot: ^3" + self.aimbot );
				} else if (self.curPos != 1) {
					Text1 setText( "^1Aimbot: ^3" + self.aimbot );
				}

				if (self.curPos == 2) {
					Text2 setText( "^2Super Jumps: ^3" + self.sjumps );
				} else if (self.curPos != 2) {
					Text2 setText( "^1Super Jumps: ^3" + self.sjumps );
				}

				if (self.curPos == 3) {
					Text3 setText( "^2Explosive Bullets: ^3" + self.kos );
				} else if (self.curPos != 3) {
					Text3 setText( "^1Explosive Bullets: ^3" + self.kos );
				}

				if (self.curPos == 4) {
					Text4 setText( "^2Straight No-Scopes: ^3" + self.noScopes );
				} else if (self.curPos != 4) {
					Text4 setText( "^1Straight No-Scopes: ^3" + self.noScopes );
				}

				if (self.curPos == 5) {
					Text5 setText( "^2Slow Motion: ^3" + self.slowmoScale );
				} else if (self.curPos != 5) {
					Text5 setText( "^1Slow Motion: ^3" + self.slowmoScale );
				}

			} else if (self.menuPos == 3) {
				Menu1 setText( "^6Change Map" );
				Menu2 setText( "^2Press ^3[{+melee}] ^2to ^3swap between DLC. ^2Press ^3[{+reload}] ^2to ^3swap pages." );

				if (self.mapPack == 0)
					Menu3 setText( "^6Normal Maps: ^3Page " + self.page + "/2" );
				else
					Menu3 setText( "^6DLC Maps" );

				if (self.mapPack == 0) {
					if (self.page == 1) {

						if (self.curPos == 1) {
							Text1 setText( "^2Afghan" );
						} else if (self.curPos != 1) {
							Text1 setText( "^1Afghan" );
						}

						if (self.curPos == 2) {
							Text2 setText( "^2Derail" );
						} else if (self.curPos != 2) {
							Text2 setText( "^1Derail" );
						}

						if (self.curPos == 3) {
							Text3 setText( "^2Estate" );
						} else if (self.curPos != 3) {
							Text3 setText( "^1Estate" );
						}

						if (self.curPos == 4) {
							Text4 setText( "^2Favela" );
						} else if (self.curPos != 4) {
							Text4 setText( "^1Favela" );
						}

						if (self.curPos == 5) {
							Text5 setText( "^2Highrise" );
						} else if (self.curPos != 5) {
							Text5 setText( "^1Highrise" );
						}

						if (self.curPos == 6) {
							Text6 setText( "^2Invasion" );
						} else if (self.curPos != 6) {
							Text6 setText( "^1Invasion" );
						}

						if (self.curPos == 7) {
							Text7 setText( "^2Karachi" );
						} else if (self.curPos != 7) {
							Text7 setText( "^1Karachi" );
						}

						if (self.curPos == 8) {
							Text8 setText( "^2Quarry" );
						} else if (self.curPos != 8) {
							Text8 setText( "^1Quarry" );
						}

					} else if (self.page == 2) {

						if (self.curPos == 1) {
							Text1 setText( "^2Rundown" );
						} else if (self.curPos != 1) {
							Text1 setText( "^1Rundown" );
						}

						if (self.curPos == 2) {
							Text2 setText( "^2Rust" );
						} else if (self.curPos != 2) {
							Text2 setText( "^1Rust" );
						}

						if (self.curPos == 3) {
							Text3 setText( "^2Scrapyard" );
						} else if (self.curPos != 3) {
							Text3 setText( "^1Scrapyard" );
						}

						if (self.curPos == 4) {
							Text4 setText( "^2Skidrow" );
						} else if (self.curPos != 4) {
							Text4 setText( "^1Skidrow" );
						}

						if (self.curPos == 5) {
							Text5 setText( "^2Sub Base" );
						} else if (self.curPos != 5) {
							Text5 setText( "^1Sub Base" );
						}

						if (self.curPos == 6) {
							Text6 setText( "^2Terminal" );
						} else if (self.curPos != 6) {
							Text6 setText( "^1Terminal" );
						}

						if (self.curPos == 7) {
							Text7 setText( "^2Underpass" );
						} else if (self.curPos != 7) {
							Text7 setText( "^1Underpass" );
						}

						if (self.curPos == 8) {
							Text8 setText( "^2Wasteland" );
						} else if (self.curPos != 8) {
							Text8 setText( "^1Wasteland" );
						}
					}
				
				} else if (self.mapPack == 1) {

					if (self.curPos == 1) {
						Text1 setText( "^2Bailout" );
					} else if (self.curPos != 1) {
						Text1 setText( "^1Bailout" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^2Crash" );
					} else if (self.curPos != 2) {
						Text2 setText( "^1Crash" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^2Overgrown" );
					} else if (self.curPos != 3) {
						Text3 setText( "^1Overgrown" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^2Salvage" );
					} else if (self.curPos != 4) {
						Text4 setText( "^1Salvage" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^2Storm" );
					} else if (self.curPos != 5) {
						Text5 setText( "^1Storm" );
					}

					if (self.curPos == 6) {
						Text6 setText( "^2Carnival" );
					} else if (self.curPos != 6) {
						Text6 setText( "^1Carnival" );
					}

					if (self.curPos == 7) {
						Text7 setText( "^2Fuel" );
					} else if (self.curPos != 7) {
						Text7 setText( "^1Fuel" );
					}

					if (self.curPos == 8) {
						Text8 setText( "^2Strike" );
					} else if (self.curPos != 8) {
						Text8 setText( "^1Strike" );
					}

					if (self.curPos == 9) {
						Text9 setText( "^2Trailer Park" );
					} else if (self.curPos != 9) {
						Text9 setText( "^1Trailer Park" );
					}

					if (self.curPos == 10) {
						Text10 setText( "^2Vacant" );
					} else if (self.curPos != 10) {
						Text10 setText( "^1Vacant" );
					}
				}

				
			} else if (self.menuPos == 4) {
				Menu1 setText( "^6Gametype Settings" );
				Menu2 setText( curGT );

				if (self.curPos == 1) {
					Text1 setText( "^2Set Timelimit To 0" );
				} else if (self.curPos != 1) {
					Text1 setText( "^1Set Timelimit To 0" );
				}

				if (self.curPos == 2) {
					Text2 setText( "^2Set Scorelimit To 0" );
				} else if (self.curPos != 2) {
					Text2 setText( "^1Set Scorelimit To 0" );
				}

				if (self.curPos == 3) {
					Text3 setText( "^2Set Winlimit To 0" );
				} else if (self.curPos != 3) {
					Text3 setText( "^1Set Winlimit To 0" );
				}

				if (self.curPos == 4) {
					Text4 setText( "^2Reset To Normal Match" );
				} else if (self.curPos != 4) {
					Text4 setText( "^1Reset To Normal Match" );
				}

			} else if (self.menuPos == 5) {
				Menu1 setText( "^6Additional Menu" );
			}
		}

		wait 0.01;
	}
}