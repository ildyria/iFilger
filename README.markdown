# iFilger

## About

iFilger is a very minimal buff/debuff tracking addon that will allow you to track buffs/debuffs on yourself, target, pets, focus, etc, and also can be used to track cooldowns.

Buffs/debuffs/cooldowns can be displayed as both bars and icons, and stack sizes and durations will be shown.

Only the buffs/debuffs/cooldowns you want will be displayed, the addon uses a whitelist system and you have to tell it exactly what you want it to show. 

The default config is VERY bar/icon spammy, you'll probably want to go through and comment out a bunch of stuff for a usable setup.

## Installation
Download the zip file and unzip it. You will find the README, a folder named iFilger and a folder named Tukui_iFilger. Copy both folders (iFilger, not ildyria-iFilger-somerandomnumbers) into you World of Warcraft\Interface\AddOns\ folder.
Tukui_iFilger is for those who already have Tukui (dependant version).
iFilger is for the one who do not have Tukui (stand alone version).
Launch the game and enjoy !

## Configuration and moving bars
All configuration must be done by directly editing config/config.lua.

A guide can be found here : http://www.tukui.org/forums/topic.php?id=8310#post-81958

Moving the bars

	To move buffs, use /mifilger .
	To reset buff positions, use /rifilger

iFilger is a modified version of Filger with the core of Tukui, all credit goes their authors! 

## Credits
Elv, Tukz, Jasje, Nils Ruesch, Shestak, Affli, Garagar, hidekki, Sapz, Asphyxia, FourOne, mTx, Varuljin 

## What's next ? 
I've in mind to make config a little more easier coz now, i need to keep update both version (stand alone and not).
I need to make Tukui_iFilger disable if iFilger is enable so it doesn't create matters.
I may try to make iFilger_config seperate to the addon so it doesn't depend on which version you want to use (stand alone or not).