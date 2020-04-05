# Attention!
I have started rewriting this mod from the ground up. [I would suggest you to use that version](https://github.com/timwaldron/trickshot-dummy-mod)  
<br>

# Trickshot Dummy Mod - Original
This is a modification for Call of Duty: Modern Warfare 2.  

I created this mod around 2012. I thought if I have this project in my GitHub it may remind me to mess around with it.

I haven't tested this mod with any recent variants of Modern Warfare 2 (IW4x/FourDeltaOne) but I'm highly confident that this will still work.  
<br>

# How to use this mod?
This is a very long-winded answer if you aren't familiar with Mods & Call of Duty, but I'll try and condense it as much as possible.  
<br>

## Prerequisites  

+ ~Own a copy of [Call of Duty: Modern Warfare 2](https://store.steampowered.com/app/10180/Call_of_Duty_Modern_Warfare_2/) for PC.~
+ Play Modern Warfare 2 for free at https://iw4x.org/.
  - IW4x adds things like dedicated servers and mod support (including custom weapons and maps). View [the Wiki](https://github.com/Jawesome99/IW4x/wiki) for more information.
  - To install **IW4x** follow [this guide](https://iw4x.org/installGuide.html). It's also [open source](https://github.com/IW4x/iw4x-client).
<br>

## Installing the mod  

1. Download this repository as a ZIP file.
2. Open your Modern Warfare 2 directory (It will contain either `iw4x.exe` or `iw4mp.exe`).
3. If there isn't a `mods` folder, create it.
4. Extract this repository in the `mods` folder.
   + E.G. `/MW2-directory/mods/trickshot-dummy-mod/<repository-contents>`
5. Run `IW4x.exe` and click on the Mods button at the main menu.
6. Select the folder you extracted this repository into (E.G. `trickshot-dummy-mod`).
7. Start a private match (preferably using the Search & Destroy gametype).
8. Have fun and practice some trickshots!  
<br>

# Fun Files
Here's a list of files that contain fun stuff. If you're making your own mod feel free to poke around and extract some functions: 
+ `<root>\maps\mp\gametypes\_funStuff.gsc` (Obviously, lol)
  - Contains functions for aimbots & insta-kill (EB/explosive bullets).
+ `<root>\maps\mp\gametypes\_locationSaver.gsc`
  - Contains functions to toggle spectator-mode (UFO/Flying mode).
+ `<root>\maps\mp\gametypes\_select.gsc`
  - Contains functions for changing players' weapons/perks/equipment
  - Unlock everything (all weapons/attatchments/camos/challenges/titles/badges, etc).
+ `<root>\maps\mp\gametypes\_rank.gsc` (_The_ classic)
  - Contains functions for creating bots & setting DVAR's.
+ `<root>\maps\mp\gametypes\_regenerate.gsc`
  - Contains functions for refilling specific types of equipment (ammo/grenades/special equipment).


# Features
This feature list has been pulled from a forum post I made around 2013.  
<br>

Main features:
+ Actionslot 1 (Default key 'n') to Open/Close the menu 'Teleport/Main Menu'.
+ Ammo in your stock regenerates two seconds you reload.
+ Equipment regenerates four seconds after being used.
+ Special grenades regenerate six seconds after being used.
+ Unlimited lives (E.G Suicide shots in Search and Destroy).
+ Wherever a bot is placed is where they will respawn next.
+ Name of the current menu you're in, in purple.
+ Forward/Back keys to navigate up and down in the menu.
+ Left/Right keys to swap menus (Yellow names indicate what menu you'll swap into).
+ Jump key to make your selection.
+ Snipers are a 1 shot kill.
+ Players can only be on the player team
+ Bots can only be on the bot team.
+ Removed all splashes (1 shot 1 kill, first blood, longshot).
+ Removed all challenge splashes (500 Intervention kills)
+ You can't open the menu for 2 seconds after you have killed someone.
+ You can't open the menu while you're dead.  
<br>


Teleport/Main Menu: (Now supports DLC maps)
+ Grenade key to spawn 1 bot.
+ Actionslot 2 (Default key '5') to Move bots.
+ Actionslot 3 (Default key '3') to teleport to first location.
+ Actionslot 4 (Default key '4') to teleport to second location.
+ Smoke grenade key to teleport to third location.
+ Activate/Use key to teleport to fourth location.
+ Jump key to toggle in and out of UFO mode.
+ Melee key to save your position.
+ Reload key to load your position.
+ Forward key to set your respawn point at your position.  
<br>

Equipment Menu:
+ Spawn the follow equipment
  - Frag Grenade
  - Semtex Grenade
  - Throwing Knife
  - Tactical Insertion
  - Blast Shield
  - Claymore
  - C4
  - Alternative Tactical Insertion (glowstick).
  - Tactical Insertion with: (Claymore/C4, use reload key to toggle).  
<br>

Custom Class/Weapons Menu:
+ Choose a sniper as a primary weapon:
  - Choose an attachment.
  - Choose a secondary weapon: Machine Pistol, Handgun, Shotgun, Launcher, One Man Army, Second Primary.
  - Choose secondary weapon's attachment.
+ Default Trickshot Class:
  - Intervention w/ FMJ & Fall Camo.
  - M9 w/ Tactical Knife.
  - Throwing Knife.
  - Stun Grenades.
+ Load last saved class
+ Give created class on spawn  
<br>

Killstreak Menu:
+ UAV.
+ Care Package.
+ Sentry Gun.
+ Predator Missile.  
<br>

Character preferences menu:
+ Set ammo in stock to 0
+ Set ammo in clip to 0
+ Refill Everything - Regenerate everything in your class.
+ Regenerate ammo after reloading - `true/false`
+ Regenerate special grenades after use - `true/false`
+ Regenerate Equipment after use - `true/false`
+ Use custom spawn point - `true/false`: You know that thing I said you could set at the start of this post?
+ Performance Mode - `true/false`: Enables `r_fullbright` and disables `fx_enable` to increase performance/FPS
+ Commit suicide  
<br>

`The following menus are only accessible by admins/the host.`

Match Settings menu:
+ Damage mode:
  - Snipers only: Snipers kill, anything else won't even register a hit.
  - Snipers and hitmarkers: Snipers can kill, but any other type of damage hits them for 1 hp.
  - Normal damage: Just like a public match.
+ Explosive bullets: (Will not work with 'normal damage' selected)
  - Off: Not active.
  - Close: If bullet lands ~4 meters away, it will kill them.
  - In 360 Field-of-view: If you can turn and see the bot, regardless of where you're looking you will kill them.
  - Everywhere: If you shot, you kill them.
+ Crosshair size:
  - Commando: Regular size.
  - Steady Aim: The size of steady aim.
  - Straight: Crosshair is a little '+' in the middle of your screen. (Will revert to the Steady Aim size for the killcam)
+ Slow motion: (Speed reverts to normal for the killcam, I advise using yawspeed to spin for smoother looking killcams)
  - Off: Normal speed.
  - 75 Percent: 75 Percent speed.
  - 50 Percent: 50 Percent speed.
  - 25 Percent: 25 Percent speed.
+ Host Migration: (Put `/bind 'key' +hm` in the console, then press that key to use it)
  - Single use allowed: Anyone can use it at any time.
  - Admin toggles for everyone: When the admin presses their host migration key, it simulates it for everyone.
+ Low care package drop - `true/false`: When true the care package gets dropped at the marker, not 30m above it.  
<br>

Change map menu:
+ Reload key to swap between DLC and normal maps.
+ Melee key to change to the second page in normal maps.  
<br>

Bot settings menu:
+ Control bot: (Applies when you move bots)
  - Use Reload/Melee key to cycle between players.
  - All: Move all bots to that position.
  - Bot name: Moves specific bots.
  - Player name: Does nothing.  
<br>

Kick Player Menu:
+ Press jump to kick a player
  - Once there is more than 9 players use the reload key to swap to the second page.
  - Cannot kick the host.  
  <br>

Some binds:
+ Open the console and type:  
  Feature | Command/Bind
  --- | --- 
  Simulate Final Stand perk effect|`/bind <key> +fs`
  Give custom created class loadout|`/bind <key> +gl`
  Simulate a host migration|`/bind <key> +hm`  
<br>


# The end!
Cool! Because you stuck it out to the end here's a programming story from this project...  
<br>

There is a file.  

That file is named **_text.gsc**.  

That file lives at `<root>\maps\mp\gametypes\_text.gsc`  

What's so special about that file?  

Well, that file contains a comment.  

And that comment lives on line 5.  

What does it say?  

> // Not the easiest way, but I understand it the best.  

Why does that matter? There's nothing wrong with admitting something is above your head.  

Well, **_text.gsc** is the file that contains all the text for every menu/sub menu within the mod.

So, what does my comment mean? What wasn't the easiest way, but I understood it the best?

**Updating the text when a player is in the menu.**

You might be thinking; _Oh, well there is probably some event/trigger you can set up to detect when a player interacts with the menu and update the text accordingly_.  

And if you were thinking that then **DING! DING! DING!** You're absolutely right, you can do something like that!  

But me? Well I didn't know such a power existed...  

I decided to write a single _super_ function that would handle it all for me; `doText()`  
+ This single function has about 1600 lines of code.
+ It's also encapsulated in an infinite `for` loop, with a 10 millisecond sleep function at the end to prevent the game from going non-responsive.
+ If you search `if (` in the file you will get 409 results.  

But wait, there's one more!

Line 107, another comment from past me is pure wisdom!

Right under the line

>`} else if (self.menuOpen == 1) {`

You will find:

> // Setting all text to none because it reads down the page, so it will apply the text at the correct IF-statements.

So yeah, **_text.gsc**; The legendary file with 1 function that contains more than 1600 lines of code and over 400 if-statements.

<hr>

That's my story, sorry if it wasn't a very good one.  
I still cringe a little bit inside when I think about that file, but hey, it works.  
