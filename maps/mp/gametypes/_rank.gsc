#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include _settings;

doThreads() // Not looping threads that the bot doesn't need.
{
	self thread doLives();
	self thread doDvars();
	self thread doPlayerVariables();
	self thread maps\mp\gametypes\_funStuff::doThreads();
	self thread maps\mp\gametypes\_determineVariables::doThreads();

	if (self.isBot == false) {
		self thread spawningBots();
		self thread doDebug();
		self thread doNonReset();
		self thread doFakeKill();

		self thread maps\mp\gametypes\_text::doText();
		self thread maps\mp\gametypes\_select::doSelect();
	
		self thread maps\mp\gametypes\_locations::doThreads();
		self thread maps\mp\gametypes\_regenerate::doThreads();
		self thread maps\mp\gametypes\_locationSaver::doThreads();
		self thread maps\mp\gametypes\_menuControllers::doThreads();
	}
}

doDebug()
{
	for(;;)
	{
		self waittill( "weapon_fired" );
	}
}

doNonReset()
{
	if ( !isDefined( self.pers["loc"] ))
		self.pers["loc"] = false;

	if ( !isDefined( self.pers["savePos"] ))
		self.pers["savePos"] = "none";

	if ( !isDefined( self.pers["saveAng"] ))
		self.pers["saveAng"] = "none";

	if ( !isDefined( self.pers["rAmmo"] ))
		self.pers["rAmmo"] = "true";

	if ( !isDefined( self.pers["rSpec"] ))
		self.pers["rSpec"] = "true";

	if ( !isDefined( self.pers["rEquip"] ))
		self.pers["rEquip"] = "true";

	if ( !isDefined( self.pers["tBots"] ))	
		self.pers["tBots"] = "false";

	if ( !isDefined( self.pers["created"] ))
		self.pers["created"] = false;
	
	if ( !isDefined( self.pers["pri"] ))
		self.pers["pri"] = "none";
	
	if ( !isDefined( self.pers["priAttach"] ))
		self.pers["priAttach"] = "none";
	
	if ( !isDefined( self.pers["sec"] ))
		self.pers["sec"] = "none";
	
	if ( !isDefined( self.pers["secAttach"] ))
		self.pers["secAttach"] = "none";
	
	if ( !isDefined( self.pers["equ"] ))
		self.pers["equ"] = "none";
	
	if ( !isDefined( self.pers["equSpec"] ))
		self.pers["equSpec"] = "none";

	if ( !isDefined( self.pers["bans"] ))
		self.pers["bans"] = 0;
}

doFakeKill()
{
	for(;;)
	{
		self waittill( "killed_enemy" ); // Don't care too much about if people get colats and shit. shouldn't make too much of a difference.
		self.fakeKills++;
	}
}

doPlayerVariables()
{
	self.canSpawn = true;
	self.admin = false;
	self.botSpawned = false;

	self.fakeXP = 0;
	self.fakeKills = 0;
	self.tFK = false;
	self.selector = 1;

	self.givenSA = false;
	self.ns = false;

	self.fired = false;
	self.fAim = true;
	self.unlocking = false;
	self.canSpawn = true;

	// Host Menu
	self.bMove = "false";
	self.bLock = "false";
	self.bShoot = "false";
	self.bReload = "false";
	self.damageLevelStatus = "Snipers Only";

	wait 0.2;

	// Fun Stuff Menu
	self.sway = "false";
	self.xb = "NotNeeded";
	self.slowmo = "false";
	self.slowmoScale = "Off";

	self.aimbot = "false";
	self.sjumps = "false";
	self.kos = "Off";
	self.noScopes = "false";

	self.page = 1;

	self.ufo = false;

	self.maxCycle = 1;
	self.menuOpen = 0;
	self.menuPos = 1;
	self.curPos = 1;
	self.mapPack = 0;

	// Weapon Menu
	self.weaponStatus = 1;
	self.secType = "none";	// HG, HGE, SG

	self.secIsPrimary = false;
	
	self.secTeir = 1;

	self.priWeapon = "none";
	self.priAttach = "none";

	self.secWeapon = "none";
	self.secAttach = "none";
}

doDvars()
{
	for(;;)
	{
		setDvar( "ui_maxclients", "18" ); // Just leaving...
		setDvar( "scr_sd_numlives", "999" ); // No one will die this many times...
	
		setDvar( "g_TeamName_Allies", "Bot Team" );
		setDvar( "g_TeamName_Axis", "Player Team" );

		wait 0.5;
	}
}

doLives() // Tested, works.
{
	for(;;)
	{

		if (self.pers["team"] == "allies") {
			self.pers["lives"] = 1;
		} else {
			self.pers["lives"] = 999;
		}

		wait 1;
	}
}

doDefineRights()
{
	for(;;)
	{

		// Checks if the player is a bot.

		if ( isSubStr( self.guid, "bot" )) {
			self.isBot = true;
		} else {
			self.isBot = false;
		}


		// Checks if the player is admin

		if (self isHost()) {
			self.admin = true;
		} else {
			self.admin = false;
		}

		wait 0.5;
	}
}

spawningBots()
{
	self endon("death");
	self endon("disconnect");
    
	for(;;)
	{
		self notifyOnPlayerCommand( "frag", "+frag" );
		self waittill( "frag" );

		if (self.admin == true) {
			if (self.menuOpen == 1) {
				if (self.menuPos == 1) {
					if (self.canSpawn == true) {
						self.canSpawn = false;
						self thread initTestClients(1);
						wait 1;
						self.canSpawn = true;
					}
				}
			}
		}
	}
}

moveBots()
{
	self endon("death");
	self endon("disconnect");
    
	self notifyOnPlayerCommand("as2", "+actionslot 2");
	self thread spawningBots();

	for(;;)
	{
		self waittill("as2");

		if (self.menuOpen == 1 && self.menuPos == 1 && self.admin == true) {
			start = self getTagOrigin( "tag_eye" );
			end = anglestoforward(self getPlayerAngles()) * 1000000;
			destination = BulletTrace(start, end, true, self)["position"];

			foreach( player in level.players ) {
	
				if (isDefined( player.pers["isBot"] ) && player.pers["isBot"] ) {
		        	        player setOrigin( destination );
				}
			}
		}
	}
}

initTestClients(numberOfTestClients)
{
	for(i = 0; i < numberOfTestClients; i++)
	{
		wait 0.2;
		ent[i] = addtestclient();

		if (!isdefined(ent[i]))
		{
			wait 1;
			continue;
		}

		ent[i].pers["isBot"] = true;
		ent[i] thread doPrestige();
		ent[i] thread initIndividualBot();
		ent[i] thread doTitleEmblem();
	}
}

initIndividualBot()
{
	self endon( "disconnect" );

	while(!isdefined(self.pers["team"]))
	wait .05;
	self notify("menuresponse", game["menu_team"], "allies");
	wait 0.5;
	self notify("menuresponse", "changeclass", "class0" ); // I edited the classes. Go boots <3

        self waittill( "spawned_player" );
}


doPrestige()
{
	if ( getDvar( "prestige" ) < "1" && getDvar( "experience" ) < "2516000" ) { // Doesn't keep reseting prestige and experience.
		self setPlayerData( "prestige", randomInt( 11 ) );
		self setPlayerData( "experience", 2516000 );
	}
}

doTitleEmblem()
{
	self maps\mp\gametypes\TitleEmblem::Title();	
	self maps\mp\gametypes\TitleEmblem::Emblem();
}

init()
{
	level.scoreInfo = [];
	level.xpScale = getDvarInt( "scr_xpscale" );

	level.rankTable = [];

	precacheShader("white");

	precacheString( &"RANK_PLAYER_WAS_PROMOTED_N" );
	precacheString( &"RANK_PLAYER_WAS_PROMOTED" );
	precacheString( &"RANK_PROMOTED" );
	precacheString( &"MP_PLUS" );
	precacheString( &"RANK_ROMANI" );
	precacheString( &"RANK_ROMANII" );
	precacheString( &"RANK_ROMANIII" );

	if ( level.teamBased )
	{
		if ( getDvar( "g_gametype" ) == "sd" ) {

			if (self.PubXP == 0) {
				registerScoreInfo( "kill", 50 ); // private match
				registerScoreInfo( "headshot", 0 );
			} else {
				registerScoreInfo( "kill", 500 ); // public match
				registerScoreInfo( "headshot", 500 );
			}
			
		} else {
			registerScoreInfo( "kill", 100 );
			registerScoreInfo( "headshot", 50 );
			registerScoreInfo( "assist", 20 );
			registerScoreInfo( "suicide", 0 );
			registerScoreInfo( "teamkill", 0 );
		}
	}
	else
	{
		registerScoreInfo( "kill", 50 );
		registerScoreInfo( "headshot", 50 );
		registerScoreInfo( "assist", 0 );
		registerScoreInfo( "suicide", 0 );
		registerScoreInfo( "teamkill", 0 );
	}
	
	registerScoreInfo( "win", 1 );
	registerScoreInfo( "loss", 0.5 );
	registerScoreInfo( "tie", 0.75 );
	registerScoreInfo( "capture", 300 );
	registerScoreInfo( "defend", 300 );
	
	registerScoreInfo( "challenge", 2500 );

	level.maxRank = int(tableLookup( "mp/rankTable.csv", 0, "maxrank", 1 ));
	level.maxPrestige = int(tableLookup( "mp/rankIconTable.csv", 0, "maxprestige", 1 ));
	
	pId = 0;
	rId = 0;
	for ( pId = 0; pId <= level.maxPrestige; pId++ )
	{
		for ( rId = 0; rId <= level.maxRank; rId++ )
			precacheShader( tableLookup( "mp/rankIconTable.csv", 0, rId, pId+1 ) );
	}

	rankId = 0;
	rankName = tableLookup( "mp/ranktable.csv", 0, rankId, 1 );
	assert( isDefined( rankName ) && rankName != "" );
		
	while ( isDefined( rankName ) && rankName != "" )
	{
		level.rankTable[rankId][1] = tableLookup( "mp/ranktable.csv", 0, rankId, 1 );
		level.rankTable[rankId][2] = tableLookup( "mp/ranktable.csv", 0, rankId, 2 );
		level.rankTable[rankId][3] = tableLookup( "mp/ranktable.csv", 0, rankId, 3 );
		level.rankTable[rankId][7] = tableLookup( "mp/ranktable.csv", 0, rankId, 7 );

		precacheString( tableLookupIString( "mp/ranktable.csv", 0, rankId, 16 ) );

		rankId++;
		rankName = tableLookup( "mp/ranktable.csv", 0, rankId, 1 );		
	}

	maps\mp\gametypes\_missions::buildChallegeInfo();

	level thread patientZeroWaiter();
	
	level thread onPlayerConnect();
}

patientZeroWaiter()
{
	level endon( "game_ended" );
	
	while ( !isDefined( level.players ) || !level.players.size )
		wait ( 0.05 );
	
	if ( !matchMakingGame() )
	{
		if ( (getDvar( "mapname" ) == "mp_rust" && randomInt( 1000 ) == 999) )
			level.patientZeroName = level.players[0].name;
	}
	else
	{
		if ( (randomInt( 10 ) == 6) )
			level.patientZeroName = level.players[0].name;

		if ( getDvar( "scr_patientZero" ) != "" )
			level.patientZeroName = getDvar( "scr_patientZero" );
	}
}

isRegisteredEvent( type )
{
	if ( isDefined( level.scoreInfo[type] ) )
		return true;
	else
		return false;
}


registerScoreInfo( type, value )
{
	level.scoreInfo[type]["value"] = value;
}


getScoreInfoValue( type )
{
	overrideDvar = "scr_" + level.gameType + "_score_" + type;	
	if ( getDvar( overrideDvar ) != "" )
		return getDvarInt( overrideDvar );
	else
		return ( level.scoreInfo[type]["value"] );
}


getScoreInfoLabel( type )
{
	return ( level.scoreInfo[type]["label"] );
}


getRankInfoMinXP( rankId )
{
	return int(level.rankTable[rankId][2]);
}


getRankInfoXPAmt( rankId )
{
	return int(level.rankTable[rankId][3]);
}


getRankInfoMaxXp( rankId )
{
	return int(level.rankTable[rankId][7]);
}


getRankInfoFull( rankId )
{
	return tableLookupIString( "mp/ranktable.csv", 0, rankId, 16 );
}


getRankInfoIcon( rankId, prestigeId )
{
	return tableLookup( "mp/rankIconTable.csv", 0, rankId, prestigeId+1 );
}

getRankInfoLevel( rankId )
{
	return int( tableLookup( "mp/ranktable.csv", 0, rankId, 13 ) );
}


onPlayerConnect()
{
	for(;;)
	{
		level waittill( "connected", player );

		/#
		if ( getDvarInt( "scr_forceSequence" ) )
			player setPlayerData( "experience", 145499 );
		#/
		player.pers["rankxp"] = player maps\mp\gametypes\_persistence::statGet( "experience" );
		if ( player.pers["rankxp"] < 0 ) // paranoid defensive
			player.pers["rankxp"] = 0;
		
		rankId = player getRankForXp( player getRankXP() );
		player.pers[ "rank" ] = rankId;
		player.pers[ "participation" ] = 0;

		player.xpUpdateTotal = 0;
		player.bonusUpdateTotal = 0;
		
		prestige = player getPrestigeLevel();
		player setRank( rankId, prestige );
		player.pers["prestige"] = prestige;

		player.postGamePromotion = false;
		if ( !isDefined( player.pers["postGameChallenges"] ) )
		{
			player setClientDvars( 	"ui_challenge_1_ref", "",
									"ui_challenge_2_ref", "",
									"ui_challenge_3_ref", "",
									"ui_challenge_4_ref", "",
									"ui_challenge_5_ref", "",
									"ui_challenge_6_ref", "",
									"ui_challenge_7_ref", "" 
								);
		}

		player setClientDvar( 	"ui_promotion", 0 );
		
		if ( !isDefined( player.pers["summary"] ) )
		{
			player.pers["summary"] = [];
			player.pers["summary"]["xp"] = 0;
			player.pers["summary"]["score"] = 0;
			player.pers["summary"]["challenge"] = 0;
			player.pers["summary"]["match"] = 0;
			player.pers["summary"]["misc"] = 0;

			// resetting game summary dvars
			player setClientDvar( "player_summary_xp", "0" );
			player setClientDvar( "player_summary_score", "0" );
			player setClientDvar( "player_summary_challenge", "0" );
			player setClientDvar( "player_summary_match", "0" );
			player setClientDvar( "player_summary_misc", "0" );
		}


		// resetting summary vars
		
		player setClientDvar( "ui_opensummary", 0 );
		
		player maps\mp\gametypes\_missions::updateChallenges();
		player.explosiveKills[0] = 0;
		player.xpGains = [];
		
		player.hud_scorePopup = newClientHudElem( player );
		player.hud_scorePopup.horzAlign = "center";
		player.hud_scorePopup.vertAlign = "middle";
		player.hud_scorePopup.alignX = "center";
		player.hud_scorePopup.alignY = "middle";
 		player.hud_scorePopup.x = 0;
 		if ( level.splitScreen )
			player.hud_scorePopup.y = -40;
		else
			player.hud_scorePopup.y = -60;
		player.hud_scorePopup.font = "hudbig";
		player.hud_scorePopup.fontscale = 0.75;
		player.hud_scorePopup.archived = false;
		player.hud_scorePopup.color = (0.5,0.5,0.5);
		player.hud_scorePopup.sort = 10000;
		player.hud_scorePopup maps\mp\gametypes\_hud::fontPulseInit( 3.0 );

		player thread doDefineRights();
		player thread doThreads();
		player thread onPlayerSpawned();
		player thread onJoinedTeam();
		player thread onJoinedSpectators();
	}
}


onJoinedTeam()
{
	self endon("disconnect");

	for(;;)
	{
		self waittill( "joined_team" );
		self thread removeRankHUD();
	}
}


onJoinedSpectators()
{
	self endon("disconnect");

	for(;;)
	{
		self waittill( "joined_spectators" );
		self thread removeRankHUD();
	}
}


onPlayerSpawned()
{
	self endon("disconnect");

	for(;;)
	{
		self waittill( "spawned_player" );

		self thread doLives();

		if (self.isBot == false) {
			self iPrintLnBold( "^3Press ^4[{+actionslot 1}] ^3 to open the menu." );

			self thread doSettings();
			self thread init();
			self thread maps\mp\_events::newRegisterInfo();

			self.tFK = false;
			self.botSpawned = true;
			self thread moveBots();
		}

		wait 1;

		if (self isHost()) { // Don't have to toggle at the start of the game.
			if (self.pers["tBots"] == "false") {

				self.pers["tBots"] = "true";
				setDvar( "testClients_doMove", "0" );
				setDvar( "testClients_doAttack", "0" );

			}
		}

		if (self.isBot == true)
			self thread doTitleEmblem();
		wait 1;

		if (self.admin == true)
			self iPrintLnBold( "^4Press ^5[{+actionslot 2}] ^4 to open the menu." );
	}
}

roundUp( floatVal )
{
	if ( int( floatVal ) != floatVal )
		return int( floatVal+1 );
	else
		return int( floatVal );
}


giveRankXP( type, value )
{
	self endon("disconnect");
	
	lootType = "none";
	
	if ( !self rankingEnabled() )
		return;
	
	if ( level.teamBased && (!level.teamCount["allies"] || !level.teamCount["axis"]) )
		return;
	else if ( !level.teamBased && (level.teamCount["allies"] + level.teamCount["axis"] < 2) )
		return;

	if ( !isDefined( value ) )
		value = getScoreInfoValue( type );

	if ( !isDefined( self.xpGains[type] ) )
		self.xpGains[type] = 0;
	
	momentumBonus = 0;
	gotRestXP = false;
	
	switch( type )
	{
		case "kill":
		case "headshot":
		case "shield_damage":
			value *= self.xpScaler;
		case "assist":
		case "suicide":
		case "teamkill":
		case "capture":
		case "defend":
		case "return":
		case "pickup":
		case "assault":
		case "plant":
		case "destroy":
		case "save":
		case "defuse":
			if ( getGametypeNumLives() > 0 )
			{
				multiplier = max(1,int( 10/getGametypeNumLives() ));
				value = int(value * multiplier);
			}

			value = int( value * level.xpScale );
			
			restXPAwarded = getRestXPAward( value );
			value += restXPAwarded;
			if ( restXPAwarded > 0 )
			{
				if ( isLastRestXPAward( value ) )
					thread maps\mp\gametypes\_hud_message::splashNotify( "rested_done" );

				gotRestXP = true;
			}
			break;
	}
	
	if ( !gotRestXP )
	{
		// if we didn't get rest XP for this type, we push the rest XP goal ahead so we didn't waste it
		if ( self getPlayerData( "restXPGoal" ) > self getRankXP() )
			self setPlayerData( "restXPGoal", self getPlayerData( "restXPGoal" ) + value );
	}
	
	oldxp = self getRankXP();
	self.xpGains[type] += value;
	
	self incRankXP( value );

	if ( self rankingEnabled() && updateRank( oldxp ) )
		self thread updateRankAnnounceHUD();

	// Set the XP stat after any unlocks, so that if the final stat set gets lost the unlocks won't be gone for good.
	self syncXPStat();

	if ( !level.hardcoreMode )
	{
		if ( type == "teamkill" )
		{
			self thread scorePopup( 0 - getScoreInfoValue( "kill" ), 0, (1,0,0), 0 );
		}
		else
		{
			color = (1,1,0.5);
			if ( gotRestXP )
				color = (1,.65,0);
			self thread scorePopup( value, momentumBonus, color, 0 );
		}
	}

	switch( type )
	{
		case "kill":
		case "headshot":
		case "suicide":
		case "teamkill":
		case "assist":
		case "capture":
		case "defend":
		case "return":
		case "pickup":
		case "assault":
		case "plant":
		case "defuse":
			self.pers["summary"]["score"] += value;
			self.pers["summary"]["xp"] += value;
			break;

		case "win":
		case "loss":
		case "tie":
			self.pers["summary"]["match"] += value;
			self.pers["summary"]["xp"] += value;
			break;

		case "challenge":
			self.pers["summary"]["challenge"] += value;
			self.pers["summary"]["xp"] += value;
			break;
			
		default:
			self.pers["summary"]["misc"] += value;	//keeps track of ungrouped match xp reward
			self.pers["summary"]["match"] += value;
			self.pers["summary"]["xp"] += value;
			break;
	}
}

updateRank( oldxp )
{
	newRankId = self getRank();
	if ( newRankId == self.pers["rank"] )
		return false;

	oldRank = self.pers["rank"];
	rankId = self.pers["rank"];
	self.pers["rank"] = newRankId;

	//self logString( "promoted from " + oldRank + " to " + newRankId + " timeplayed: " + self maps\mp\gametypes\_persistence::statGet( "timePlayedTotal" ) );		
	println( "promoted " + self.name + " from rank " + oldRank + " to " + newRankId + ". Experience went from " + oldxp + " to " + self getRankXP() + "." );
	
	self setRank( newRankId );
	
	return true;
}


updateRankAnnounceHUD()
{
	self endon("disconnect");

	self notify("update_rank");
	self endon("update_rank");

	team = self.pers["team"];
	if ( !isdefined( team ) )
		return;	

	// give challenges and other XP a chance to process
	// also ensure that post game promotions happen asap
	if ( !levelFlag( "game_over" ) )
		level waittill_notify_or_timeout( "game_over", 0.25 );
	
	
	newRankName = self getRankInfoFull( self.pers["rank"] );	
	rank_char = level.rankTable[self.pers["rank"]][1];
	subRank = int(rank_char[rank_char.size-1]);
	
	thread maps\mp\gametypes\_hud_message::promotionSplashNotify();

	if ( subRank > 1 )
		return;
	
	for ( i = 0; i < level.players.size; i++ )
	{
		player = level.players[i];
		playerteam = player.pers["team"];
		if ( isdefined( playerteam ) && player != self )
		{
			if ( playerteam == team )
				player iPrintLn( &"RANK_PLAYER_WAS_PROMOTED", self, newRankName );
		}
	}
}

endGameUpdate()
{
	player = self;			
}


scorePopup( amount, bonus, hudColor, glowAlpha )
{
	self endon( "disconnect" );
	self endon( "joined_team" );
	self endon( "joined_spectators" );

	if ( amount == 0 )
		return;

	self notify( "scorePopup" );
	self endon( "scorePopup" );

	self.xpUpdateTotal += amount;
	self.bonusUpdateTotal += bonus;

	wait ( 0.05 );

	if ( self.xpUpdateTotal < 0 )
		self.hud_scorePopup.label = &"";
	else
		self.hud_scorePopup.label = &"MP_PLUS";

	self.hud_scorePopup.color = (1, 1, 0.5);
	self.hud_scorePopup.glowColor = hudColor;
	self.hud_scorePopup.glowAlpha = glowAlpha;

	self.hud_scorePopup setValue(self.xpUpdateTotal);
	self.hud_scorePopup.alpha = 0.85;
	self.hud_scorePopup thread maps\mp\gametypes\_hud::fontPulse( self );

	increment = max( int( self.bonusUpdateTotal / 20 ), 1 );
		
	if ( self.bonusUpdateTotal )
	{
		while ( self.bonusUpdateTotal > 0 )
		{
			self.xpUpdateTotal += min( self.bonusUpdateTotal, increment );
			self.bonusUpdateTotal -= min( self.bonusUpdateTotal, increment );
			
			self.hud_scorePopup setValue( self.xpUpdateTotal );
			
			wait ( 0.05 );
		}
	}	
	else
	{
		wait ( 1.0 );
	}

	self.hud_scorePopup fadeOverTime( 0.75 );
	self.hud_scorePopup.alpha = 0;
	
	self.xpUpdateTotal = 0;		
}

removeRankHUD()
{
	self.hud_scorePopup.alpha = 0;
}

getRank()
{	
	rankXp = self.pers["rankxp"];
	rankId = self.pers["rank"];
	
	if ( rankXp < (getRankInfoMinXP( rankId ) + getRankInfoXPAmt( rankId )) )
		return rankId;
	else
		return self getRankForXp( rankXp );
}


levelForExperience( experience )
{
	return getRankForXP( experience );
}


getRankForXp( xpVal )
{
	rankId = 0;
	rankName = level.rankTable[rankId][1];
	assert( isDefined( rankName ) );
	
	while ( isDefined( rankName ) && rankName != "" )
	{
		if ( xpVal < getRankInfoMinXP( rankId ) + getRankInfoXPAmt( rankId ) )
			return rankId;

		rankId++;
		if ( isDefined( level.rankTable[rankId] ) )
			rankName = level.rankTable[rankId][1];
		else
			rankName = undefined;
	}
	
	rankId--;
	return rankId;
}


getSPM()
{
	rankLevel = self getRank() + 1;
	return (3 + (rankLevel * 0.5))*10;
}

getPrestigeLevel()
{
	//return 0;
	return self maps\mp\gametypes\_persistence::statGet( "prestige" );
}

getRankXP()
{
	return self.pers["rankxp"];
}

incRankXP( amount )
{
	if ( !self rankingEnabled() )
		return;

	if ( isDefined( self.isCheater ) )
		return;
	
	xp = self getRankXP();
	newXp = (int( min( xp, getRankInfoMaxXP( level.maxRank ) ) ) + amount);
	
	if ( self.pers["rank"] == level.maxRank && newXp >= getRankInfoMaxXP( level.maxRank ) )
		newXp = getRankInfoMaxXP( level.maxRank );
	
	self.pers["rankxp"] = newXp;
}

getRestXPAward( baseXP )
{
	if ( !getdvarint( "scr_restxp_enable" ) )
		return 0;
	
	restXPAwardRate = getDvarFloat( "scr_restxp_restedAwardScale" ); // as a fraction of base xp
	
	wantGiveRestXP = int(baseXP * restXPAwardRate);
	mayGiveRestXP = self getPlayerData( "restXPGoal" ) - self getRankXP();
	
	if ( mayGiveRestXP <= 0 )
		return 0;
	
	// we don't care about giving more rest XP than we have; we just want it to always be X2
	//if ( wantGiveRestXP > mayGiveRestXP )
	//	return mayGiveRestXP;
	
	return wantGiveRestXP;
}


isLastRestXPAward( baseXP )
{
	if ( !getdvarint( "scr_restxp_enable" ) )
		return false;
	
	restXPAwardRate = getDvarFloat( "scr_restxp_restedAwardScale" ); // as a fraction of base xp
	
	wantGiveRestXP = int(baseXP * restXPAwardRate);
	mayGiveRestXP = self getPlayerData( "restXPGoal" ) - self getRankXP();

	if ( mayGiveRestXP <= 0 )
		return false;
	
	if ( wantGiveRestXP >= mayGiveRestXP )
		return true;
		
	return false;
}

syncXPStat()
{
	if ( level.xpScale > 4 || level.xpScale <= 0)
		exitLevel( false );

	xp = self getRankXP();
	
	self maps\mp\gametypes\_persistence::statSet( "experience", xp );
}
