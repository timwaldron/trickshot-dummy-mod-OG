#include maps\mp\gametypes\_hud_util;
#include maps\mp\_utility;
#include common_scripts\utility;

/*
	WARNING: Cluster-fuck below.
*/

doThreads()
{
	self thread doLocation1();
	self thread doLocation2();
	self thread doLocation3();
	self thread doLocation4();
}

doLocation1()
{

	for(;;)
	{
		self notifyOnPlayerCommand("as3", "+actionslot 3");
		self waittill("as3");
		
		if (self.menuOpen == 1) {
			if (self.menuPos == 1) {

				if (getdvar("mapname") == "mp_afghan") {
					self setOrigin((1930, 2640, 460));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_derail") {
					self setOrigin((1770, 3222, 460));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_estate") {
					self setOrigin((-2626, 1087, -29));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_favela") {
					self setOrigin((-300, -454, 330));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_highrise") {
					self setOrigin((-2745.45, 6800 - randomInt(800), 3250));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_nightshift") {
					self setOrigin((-2131, -360, 160));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_invasion") {
					self setOrigin((670, -1114, 500));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_checkpoint") {
					self setOrigin((-700, -200, 400));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_quarry") {
					self setOrigin((-4270 - randomInt(500), -160, 370));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_rundown") {
					self setOrigin((938, -502, 250));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_rust") {
					self setOrigin((683.246, 1066.97, 266.611));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_boneyard") {
					self setOrigin((-1500, 822, 170));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_subbase") {
					self setOrigin((700, -1100, 290));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_terminal") {
					self setOrigin((2000, 4350, 305));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_underpass") {
					self setOrigin((1122, 940, 670));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_brecourt") {
					self setOrigin((1078, -2377, 270));
					self.menuOpen = 0;
					self freezeControls(false);
				}
			}
		}
		wait 0.1;
	}
}
doLocation2()
{
	for(;;)
	{
		self notifyOnPlayerCommand("as4", "+actionslot 4");
		self waittill("as4");

		if (self.menuOpen == 1) {
			if (self.menuPos == 1) {

				if (getdvar("mapname") == "mp_afghan") {
					self setOrigin((1250, 1580, 450));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_derail") {
					self setOrigin((60, -2633, 360));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_estate") {
					self setOrigin((606, 810, 360));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_favela") {
					self setOrigin((137, 155, 323));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_highrise") {
					self setOrigin((-1630.05, 8476.14, 3300));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_nightshift") {
					self setOrigin((-250, 150, 200));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_invasion") {
					self setOrigin((-2890, -2440, 450));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_checkpoint") {
					self setOrigin((-771, 1555, 175));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_quarry") {
					self setOrigin((-3730, 1725, 295));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_rundown") {
					self setOrigin((-700, -200, 215));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_rust") {
					// No spot
				} else if (getdvar("mapname") == "mp_boneyard") {
					self setOrigin((425, 425, 100));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_subbase") {
					self setOrigin((210, 210, 350));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_terminal") {
					self setOrigin((1000, 3180, 200));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_underpass") {
					self setOrigin((2800, 300, 480));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_brecourt") {
					self setOrigin((-2944, 342, 250));
					self.menuOpen = 0;
					self freezeControls(false);
				}
			}
		}
		wait 0.1;
	}
}
doLocation3()
{
	for(;;)
	{
		self notifyOnPlayerCommand("smoke", "+smoke");
		self waittill("smoke");

		if (self.menuOpen == 1) {
			if (self.menuPos == 1) {

				if (getdvar("mapname") == "mp_afghan") {
					self setOrigin((1715, 780, 266));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_derail") {
					// No spot
				} else if (getdvar("mapname") == "mp_estate") {
					self setOrigin((1215, 3512, 360));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_favela") {
					self setOrigin((-847, 314, 310));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_highrise") {
					self setOrigin((-108.495, 6121.45, 3110));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_nightshift") {
					self setOrigin((-600, -1914, 170));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_invasion") {
					self setOrigin((-2000, -3000, 450));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_checkpoint") {
					self setOrigin((854, 844, 270));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_quarry") {
					self setOrigin((-4782, 800, 250));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_rundown") {
					self setOrigin((-1227, -838, 200));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_rust") {
					// No spot
				} else if (getdvar("mapname") == "mp_boneyard") {
					self setOrigin((2200, 350, 12));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_subbase") {
					self setOrigin((-650, -1700, 280));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_terminal") {
					self setOrigin((600, 3800, 370));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_underpass") {
					self setOrigin((-50, 1450, 550));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_brecourt") {
					// No spot
				}
			}
		}
		wait 0.1;
	}
}

doLocation4()
{
	for(;;)
	{
		self notifyOnPlayerCommand("activate", "+activate");
		self waittill("activate");

		if (self.menuOpen == 1) {
			if (self.menuPos == 1) {

				if (getdvar("mapname") == "mp_afghan") {
					// No spot
				} else if (getdvar("mapname") == "mp_derail") {
					// No spot
				} else if (getdvar("mapname") == "mp_estate") {
					self setOrigin((-2845, 3407, -100));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_favela") {
					// No spot
				} else if (getdvar("mapname") == "mp_highrise") {
					self setOrigin((-132.1, 7777.6, 3173.6));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_nightshift") {
					// No spot
				} else if (getdvar("mapname") == "mp_invasion") {
					// No spot
				} else if (getdvar("mapname") == "mp_checkpoint") {
					// No spot
				} else if (getdvar("mapname") == "mp_quarry") {
					self setOrigin((-3992.64, -1964.77, 528.125));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_rundown") {
					// No spot
				} else if (getdvar("mapname") == "mp_rust") {
					// No spot
				} else if (getdvar("mapname") == "mp_terminal") {
					self setOrigin((613, 2448, 600));
					self.menuOpen = 0;
					self freezeControls(false);
				} else if (getdvar("mapname") == "mp_underpass") {
					// No spot
				} else if (getdvar("mapname") == "mp_brecourt") {
					// No spot
				}
			}
		}
		wait 0.1;
	}
}