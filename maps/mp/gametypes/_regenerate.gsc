#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

doThreads()
{
	self thread doAmmoRegen();
	self thread doEquipRegen();
	self thread doSpecEquipRegen();
}

doAmmoRegen()
{
	for(;;)
	{

		self notifyOnPlayerCommand( "reload", "+reload" );
		self waittill( "reload" );

		wait 2;
		if (self.pers["rAmmo"] == "true") {
			currentWeapon = self getCurrentWeapon();
			self giveMaxAmmo( currentWeapon );
		}
	}
}

doEquipRegen() // Chroniicz
{

	for(;;)
	{
		self notifyOnPlayerCommand( "frag", "+frag" );
		self waittill( "frag" );

		currentOffhand = self GetCurrentOffhand();
		self.pers["equ"] = currentOffhand;

		wait 4;

		if (self.pers["rEquip"] == "true") {
			self setWeaponAmmoClip( currentOffhand, 9999 );
			self GiveMaxAmmo( currentOffhand );
		}
	}
}

doSpecEquipRegen() // Boots
{

	for(;;)
	{
		self notifyOnPlayerCommand( "smoke", "+smoke" );
		self waittill( "smoke" );

		currentOffhand = self GetCurrentOffhand();
		self.pers["equSpec"] = currentOffhand;

		wait 6;

		if (self.pers["rSpec"] == "true") {
			self giveWeapon( self.pers["equSpec"] );
			self giveMaxAmmo( currentOffhand );
			self setWeaponAmmoClip( currentOffhand, 9999 );
		}
	}
}