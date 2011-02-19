--[[
	
	Filger
	Copyright (c) 2009, Nils Ruesch
	All rights reserved.
	
]]

local configmode = false;
local spells = {
--[[	["DEATHKNIGHT"] = {
		{
			Name = "Self",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = SpellName()"Horn of Winter", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Scent of Blood", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Bloody Vengence", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Aboniable Might", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Vampiric Blood", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Sudden Doom", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Blade Barrier", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Icy Talons", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Lichborne", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Killing Machine", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Death Chill", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Unbreakable Armor", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Acclimation", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Path of Frost", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
		},
		{
			Name = "Target",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = SpellName()"Strangulate", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Chains of Ice", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Frost Fever", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Death and Decay", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Blood Plague", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Unholy Blight", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Mark of Blood", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
		},
		{
			Name = "Cooldowns",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = SpellName()13, size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()14, size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Strangulate", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Blood Tap", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Dark Command", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Death Pact", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Mind Freeze", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Icebound Fortitude", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Horn of Winter", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Empower Rune Weapon", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Howling Blast", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Death Grip", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Raise Dead", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Anti-Magic Shell", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Army of the Dead", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Death and Decay", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Mark of Blood", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Vampiric Blood", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Dancing Rune Weapon", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Lichborne", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Hungering Cold", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Unbreakable Armor", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Anti-Magic Zone", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Bone Shield", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Summon Gargoyle", size = 26, scale = 1, filter = "CD", barWidth = 104 },
		},
	},]]
	["DRUID"] = {
		{
			Name = "Self",
			Direction = "UP",
			Spacing = 3,
			Mode = "ICON",
			
			{ spellName = SpellName(1850), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Dash
			{ spellName = SpellName(29166), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Innervate
			{ spellName = SpellName(8936), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Regrowth
			{ spellName = SpellName(33763), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Lifebloom
			{ spellName = SpellName(774), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Rejuvenation
			{ spellName = SpellName(48438), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Wild Growth
			{ spellName = SpellName(22812), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Barkskin
			{ spellName = SpellName(16689), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Nature's Grasp
			{ spellName = SpellName(50334), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Berserk
			{ spellName = SpellName(5217), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Tiger's Fury
			{ spellName = SpellName(61336), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Survival Instincts
			{ spellName = SpellName(5229), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Enrage
			{ spellName = SpellName(22842), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Frenzied Regeneration
		},
		{
			Name = "Target",
			Direction = "LEFT",
			Spacing = 3,
			Mode = "ICON",
			
			{ spellName = SpellName(33786), size = 52, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Cyclone
			{ spellName = SpellName(339), size = 52, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Entangling Roots
			{ spellName = SpellName(8921), size = 52, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Moonfire
			{ spellName = SpellName(91565), size = 52, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Fearie Fire
			{ spellName = SpellName(2637), size = 52, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Hibernate
			{ spellName = SpellName(5570), size = 52, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Insect Swarm
			{ spellName = SpellName(5209), size = 52, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Challenging Roar
			{ spellName = SpellName(5211), size = 52, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Bash
			{ spellName = SpellName(22570), size = 52, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Maim
			{ spellName = SpellName(99), size = 52, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Demoralizing Roar
			{ spellName = SpellName(9005), size = 52, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Pounce
			{ spellName = SpellName(1822), size = 52, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Rake
			{ spellName = SpellName(33745), size = 52, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Lacerate
			{ spellName = SpellName(33878), size = 52, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Mangle
			{ spellName = SpellName(1079), size = 52, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Rip
			{ spellName = SpellName(8936), size = 52, scale = 1, unitId = "target", caster = "player", filter = "BUFF", barWidth = 104 }, --Regrowth
			{ spellName = SpellName(33763), size = 52, scale = 1, unitId = "target", caster = "player", filter = "BUFF", barWidth = 104 }, --Lifebloom
			{ spellName = SpellName(774), size = 52, scale = 1, unitId = "target", caster = "player", filter = "BUFF", barWidth = 104 }, --Rejuvenation
			{ spellName = SpellName(48438), size = 52, scale = 1, unitId = "target", caster = "player", filter = "BUFF", barWidth = 104 }, --Wild Growth
			{ spellName = SpellName(29166), size = 52, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Innervate
			{ spellName = SpellName(48483), size = 52, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Infected Wounds
		},
		{
			Name = "Cooldowns",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = 13, size = 26, scale = 1, filter = "CD", barWidth = 104 }, --
			{ spellName = 14, size = 26, scale = 1, filter = "CD", barWidth = 104 }, --
			{ spellName = SpellName(29166), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Innervate
			{ spellName = SpellName(22812), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Barkskin
			{ spellName = SpellName(16689), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Nature's Grasp
			{ spellName = SpellName(48505), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Starfall
			{ spellName = SpellName(6795), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Growl
			{ spellName = SpellName(5229), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Enrage
			{ spellName = SpellName(16857), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Faerie Fire (Feral)
			{ spellName = SpellName(16979), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Feral Charge
			{ spellName = SpellName(5209), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Challenging Roar
			{ spellName = SpellName(22842), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Frenzied Regeneration
			{ spellName = SpellName(5211), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Bash
			{ spellName = SpellName(80965), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Skull Bash
			{ spellName = SpellName(5215), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Prowl
			{ spellName = SpellName(1850), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Dash
			{ spellName = SpellName(22570), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Maim
			{ spellName = SpellName(8998), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Cower
			{ spellName = SpellName(5217), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Tiger's Fury
			{ spellName = SpellName(33878), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Mangle (Bear)
			{ spellName = SpellName(20484), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Rebirth
			{ spellName = SpellName(740), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Tranquility
			{ spellName = SpellName(48438), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --
		},
	},
--[[	["HUNTER"] = {
		{
			Name = "Self",
			Direction = "UP",
			Spacing = 3,
			Mode = "ICON",
			
			{ spellName = SpellName()"Eagle Eye", size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Eyes of the Beast", size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Kill Command", size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Masters Call", size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Mend Pet", size = 52, scale = 1, unitId = "pet", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Rapid Fire", size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Feign Death", size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Deterrence", size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Missdirection", size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Improved Aspect of the Hawk", size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Frenzy", size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Ferocious Inspiration", size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Bestial Wrath", size = 52, scale = 1, unitId = "pet", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Cobra Strikes", size = 52, scale = 1, unitId = "pet", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Rapid Killing", size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Improved Steady Shot", size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Lock and Load", size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Expose Weakness", size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Master Tactican", size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Sniper Training", size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
		},
		{
			Name = "Target",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = SpellName()"Scare Beast", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Concussive Shot", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Scorpid Sting", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Viper Sting", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Hunters Mark", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Serpent Sting", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Aimed Shot", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Wing Clip", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Frost Trap", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Freezing Trap", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Explosive Trap", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Counterattack", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Immolation Trap", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Black Arrow", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Explosive Shot", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Wyvern Sting", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Intimidation", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Concussive Barrage", size = 26, scale = 1, unitId = "target", caster = "player", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Piercing Shots", size = 26, scale = 1, unitId = "target", caster = "player", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Silencing Shot", size = 26, scale = 1, unitId = "target", caster = "player", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Entrapment", size = 26, scale = 1, unitId = "target", caster = "player", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Scatter Shot", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
		},
		{
			Name = "Cooldowns",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = SpellName()13, size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()14, size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Feed Pet", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Scare Beast", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Kill Command", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Master's Call", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Concussive Shot", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Distractiong Shot", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Rapid Fire", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Flare", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Viper Sting", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Arcane Shot", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Aimed Shot", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Kill Shot", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Multi Shot", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Disengage", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Frost Trap", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Feign Death", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Deterrence", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Missdirection", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Raptor Strike", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Counterattack", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Explosive Shot", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Freezing Arrow", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Mongoose Bite", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Wyvern Sting", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Intimidation", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Bestial Wrath", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Readiness", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Silencing Shot", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Chimera Shot", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Scatter Shot", size = 26, scale = 1, filter = "CD", barWidth = 104 },
		},
	},]]
	["MAGE"] = {
		{
			Name = "Self",
			Direction = "UP",
			Spacing = 3,
			Mode = "ICON",

			{ spellName = SpellName(36032), size = 52, scale = 1, unitId = "player", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Arcane Blast
			{ spellName = SpellName(12042), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Arcane Power
			{ spellName = SpellName(31642), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Blazing Speed
			{ spellName = SpellName(57761), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Brain Freeze
			{ spellName = SpellName(12536), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Clearcasting
			{ spellName = SpellName(83074), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Fingers of Frost
			{ spellName = SpellName(54646), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Focus Magic
			{ spellName = SpellName(44448), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Hot Streak
--			{ spellName = SpellName(11426), size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Ice Barrier
			{ spellName = SpellName(45438), size = 52, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 }, --Ice Block
			{ spellName = SpellName(12472), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Icy Veins
			{ spellName = SpellName(12357), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Impact
--			{ spellName = SpellName(44395), size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Incanter's Absorption
			{ spellName = SpellName(66), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Invisibility
--			{ spellName = SpellName(54486), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Missile Barrage
			{ spellName = SpellName(543), size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 }, --Mage Ward
			{ spellName = SpellName(12043), size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 }, --Presence of Mind
			{ spellName = SpellName(34295), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Pyromaniac
			
			{ spellName = SpellName(91007), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Dire Magic (Bell of Enraging Resonance)
			{ spellName = SpellName(74223), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Hurricane
			{ spellName = SpellName(75172), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Lightweave
			{ spellName = SpellName(74242), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Power Torrent
			{ spellName = SpellName(91024), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Revelation (Theralion's Mirror)
			{ spellName = SpellName(79476), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Volcanic Power
			{ spellName = SpellName(90355), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Ancient Hysteria
			{ spellName = SpellName(2825), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Bloodlust
			{ spellName = SpellName(32182), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Heroism
			{ spellName = SpellName(80353), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Time Warp
		},
		{
			Name = "Target",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = SpellName(11113), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Blast Wave
			{ spellName = SpellName(11129), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Combustion
--			{ spellName = SpellName(120), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Cone of Cold
			{ spellName = SpellName(12873), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Critical Mass
			{ spellName = SpellName(44572), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Deep Freeze
--			{ spellName = SpellName(31661), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Dragon's Breath
			{ spellName = SpellName(33395), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Freeze
			{ spellName = SpellName(122), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Frost Nova
			{ spellName = SpellName(116), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Frostbolt
			{ spellName = SpellName(44614), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Frostfire Bolt
			{ spellName = SpellName(12846), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Ignite
			{ spellName = SpellName(12357), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Impact
--			{ spellName = SpellName(12488), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Improved Blizzard
--			{ spellName = SpellName(120), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Improved Cone of Cold
			{ spellName = SpellName(12598), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Improved Counterspell
			{ spellName = SpellName(44457), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Living Bomb
			{ spellName = SpellName(118), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Polymorph
			{ spellName = SpellName(11366), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Pyroblast
			{ spellName = SpellName(92315), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Pyroblast!
--			{ spellName = SpellName(54787), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Shattered Barrier
			{ spellName = SpellName(31589), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Slow
		},
		{
			Name = "Cooldowns",
			Direction = "ICON",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = 13, size = 26, scale = 1, filter = "CD", barWidth = 104 }, --
			{ spellName = 14, size = 26, scale = 1, filter = "CD", barWidth = 104 }, --
--			{ spellName = SpellName(1953), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Blink
			{ spellName = SpellName(12051), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Evocation
			{ spellName = SpellName(2139), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Counterspell
			{ spellName = SpellName(66), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Invisibility
			{ spellName = SpellName(55342), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Mirror Image
			{ spellName = SpellName(12043), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Presence of Mind
			{ spellName = SpellName(12042), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Arcane Power
			{ spellName = SpellName(36799), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Mana Gem
			{ spellName = SpellName(543), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Mage Ward
			{ spellName = SpellName(1463), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Mana Shield
			{ spellName = SpellName(80353), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Time Warp

--			{ spellName = SpellName(11113), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Blast Wave
--			{ spellName = SpellName(31661), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Dragon's Breath
			{ spellName = SpellName(11129), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Combustion
			{ spellName = SpellName(82731), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Flame Orb
--			{ spellName = SpellName(2136), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Fire Blast

			{ spellName = SpellName(45438), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Ice Block
			{ spellName = SpellName(12472), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Icy Veins
			{ spellName = SpellName(11958), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Cold Snap
			{ spellName = SpellName(44572), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Deep Freeze
			{ spellName = SpellName(82676), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Ring of Frost
--			{ spellName = SpellName(31687), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Summon Water Elemental
--			{ spellName = SpellName(122), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Frost Nova
--			{ spellName = SpellName(120), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Cone of Cold
			{ spellName = SpellName(11426), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Ice Barrier
		},
	},
--[[	["PALADIN"] = {
 		{
			Name = "Self",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = SpellName()"Avenging Wrath", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Blessing of Kings", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Blessing of Might", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Blessing of Sanctuary", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Blessing of Wisdom", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Divine Favor", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Divine Illumination", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Divine Plea", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Greater Blessing of Kings", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Greater Blessing of Might", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Greater Blessing of Sanctuary", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Greater Blessing of Wisdom", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Hand of Protection", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Holy Shield", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Righteous Fury", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Reckoning", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Sacred Shield", size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Seal of Command", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Seal of Corruption", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Seal of Righteousness", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Seal of Vengeance", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Sheath of Light", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"The Art of War", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Vengeance", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
 		},
 		{
			Name = "Target",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = SpellName()"Avenger's Shield", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Blood Corruption", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Hammer of Justice", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Heart of the Crusader", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Holy Shock", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Holy Wrath", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Holy Vengeance", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Judgement of Light", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Judgement of Justice", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Judgement of Wisdom", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Judgements of the Just", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Light's Beacon", size = 26, scale = 1, unitId = "target", caster = "player", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Repentance", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Righteous Vengeance", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Sacred Shield", size = 26, scale = 1, unitId = "target", caster = "player", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Silenced - Shield of the Templar", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Vindication", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
 		},
		{
			Name = "Cooldowns",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = SpellName()13, size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()14, size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Hand of Salvation", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Hand of Protection", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Hand of Reckoning", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Hand of Freedom", size = 26, scale = 1, filter = "CD", barWidth = 104 },	
			{ spellName = SpellName()"Judgement of Light", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Lay on Hands", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Divine Intervention", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Righteous Defense", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Exorcism", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Hammer of Justice", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Consecration", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Divine Shield", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Hammer of Wrath", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Holy Shock", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Holy Shield", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Avenger's Shield", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Avenging Wrath", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Divine Plea", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Shield of Righteousness", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Holy Wrath", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Aura Mastery", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Crusader Strike", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Divine Favor", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Divine Illumination", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Divine Storm", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Hammer of the Righteous", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Repentance", size = 26, scale = 1, filter = "CD", barWidth = 104 }, 
		},
	},]]
	["PRIEST"] = {
 		{
			Name = "Self",
			Direction = "UP",
			Spacing = 3,
			Mode = "ICON",
			
			{ spellName = SpellName(87151), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Archangel            
			{ spellName = SpellName(27818), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Blessed Recovery
			{ spellName = SpellName(33145), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Blessed Resilience
			{ spellName = SpellName(59889), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Borrowed Time
			{ spellName = SpellName(14751), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Chakra
			{ spellName = SpellName(81206), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Chakra: Sanctuary
			{ spellName = SpellName(81208), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Chakra: Serenity
			{ spellName = SpellName(81209), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Chakra: Chastise
			{ spellName = SpellName(93757), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Dark Archangel
			{ spellName = SpellName(47585), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Dispersion
			{ spellName = SpellName(81662), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Evangelism        
			{ spellName = SpellName(45243), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Focused Will
			{ spellName = SpellName(47517), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Grace
			{ spellName = SpellName(47788), size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Guardian Spirit
			{ spellName = SpellName(33206), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Pain Suppression
			{ spellName = SpellName(10060), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Power Infusion
			{ spellName = SpellName(17), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Power Word: Shield
			{ spellName = SpellName(63735), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Serendipity
			{ spellName = SpellName(88688), size = 52, scale = 1, unitId = "player", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Surge of Light
			{ spellName = SpellName(20711), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Spirit of Redemption
			{ spellName = SpellName(6788), size = 52, scale = 1, unitId = "player", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Weakened Soul

			{ spellName = SpellName(90355), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Ancient Hysteria
			{ spellName = SpellName(2825), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Bloodlust
			{ spellName = SpellName(32182), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Heroism
			{ spellName = SpellName(80353), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Time Warp
 		},
 		{
			Name = "Target",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = SpellName(2944), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Devouring Plague
			{ spellName = SpellName(47515), size = 26, scale = 1, unitId = "target", caster = "all", filter = "BUFF", barWidth = 104 }, --Divine Aegis
			{ spellName = SpellName(47517), size = 26, scale = 1, unitId = "target", caster = "all", filter = "BUFF", barWidth = 104 }, --Grace
			{ spellName = SpellName(14914), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Holy Fire
			{ spellName = SpellName(15407), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Mind Flay
			{ spellName = SpellName(453), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Mind Soothe
			{ spellName = SpellName(33206), size = 26, scale = 1, unitId = "target", caster = "all", filter = "BUFF", barWidth = 104 }, --Pain Suppression
			{ spellName = SpellName(10060), size = 26, scale = 1, unitId = "target", caster = "all", filter = "BUFF", barWidth = 104 }, --Power Infusion
			{ spellName = SpellName(64044), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Psychic Horror
			{ spellName = SpellName(8122), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Psychic Scream
			{ spellName = SpellName(139), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Renew
			{ spellName = SpellName(589), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Shadow Word: Pain
			{ spellName = SpellName(15487), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Silence
			{ spellName = SpellName(34914), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Vampiric Touch
 		},
		{
			Name = "Cooldowns",
			Direction = "DOWN",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = 13, size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = 14, size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName(34861), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Circle of Healing
			{ spellName = SpellName(19236), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Desperate Prayer
			{ spellName = SpellName(2944), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Devouring Plague
			{ spellName = SpellName(47585), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Dispersion
			{ spellName = SpellName(64843), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Divine Hymn
			{ spellName = SpellName(6346), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Fear Ward
			{ spellName = SpellName(47788), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Guardian Spirit
			{ spellName = SpellName(14914), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Holy Fire
			{ spellName = SpellName(88686), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Holy Word: Sanctuary
			{ spellName = SpellName(64901), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Hymn of Hope
			{ spellName = SpellName(724), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Lightwell
			{ spellName = SpellName(33206), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Pain Suppression
			{ spellName = SpellName(47540), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Penance
			{ spellName = SpellName(10060), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Power Infusion
			{ spellName = SpellName(17), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Power Word: Shield
			{ spellName = SpellName(33076), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Prayer of Mending
			{ spellName = SpellName(64044), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Psychic Horror
			{ spellName = SpellName(8122), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Psychic Scream
			{ spellName = SpellName(32379), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Shadow Word: Death
			{ spellName = SpellName(34433), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Shadowfiend
			{ spellName = SpellName(15487), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Silence
		},
	},
--[[	["ROGUE"] = {
		{
			Name = "Self",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = SpellName()"Slice and Dice", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Evasion", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Sprint", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Faint", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Tricks of the Trade", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Cloak of Shadows", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Remorseless Attacks", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Hunger for Blood", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Blade Flurry", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Adrenaline Rush", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Killing Spree", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Cheat Death", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Shadowstep", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Shadow Dance", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
		},
		{
			Name = "Target",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = SpellName()"Expose Armor", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Dismantle", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Cheap Shot", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Kidney Shot", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Deadly Throw", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Rupture", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Garrote", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Gouge", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Blind", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Sap", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Hemorrhage", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Crippling Poison", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Wound Poison", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Deadly Poison", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Mind-numbling Poison", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Waylay", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
		},
				{
			Name = "Cooldowns",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = SpellName()13, size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()14, size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Dismantle", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Kidney Shot", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Gouge", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Kick", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Evasion", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Sprint", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Feint", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Distract", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Blind", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Stealth", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Vanish", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Cloak of Shadows", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Tricks of the Trade", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Cold Blood", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Blade Flurry", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Adrenaline Rush", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Killing Spree", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Preparation", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Premeditation", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Shadowstep", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Shadow Dance", size = 26, scale = 1, filter = "CD", barWidth = 104 },
		},
	},
	["SHAMAN"] = {
		{
			Name = "Self",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = SpellName()"Lightning Shield", size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Water Shield", size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Earth Shield", size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Earthliving Weapon", size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Heroism", size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 },		
			{ spellName = SpellName()"Bloodlust", size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Earthliving", size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Riptide", size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Tidal Waves", size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Rapid Currents", size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 },
--			{ spellName = SpellName()"Fire Resistance", size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 },
--			{ spellName = SpellName()"Flametongue Totem", size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 },
--			{ spellName = SpellName()"Frost Resistance", size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 },
--			{ spellName = SpellName()"Nature Resistance", size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Grounding Totem Effect", size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 },
--			{ spellName = SpellName()"Sentry Totem", size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 },
--			{ spellName = SpellName()"Stoneskin", size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 },
--			{ spellName = SpellName()"Strength of Earth", size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 },
--			{ spellName = SpellName()"Windfury Totem", size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Cleansing Totem", size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 },
--			{ spellName = SpellName()"Healing Stream Totem", size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 },
--			{ spellName = SpellName()"Mana Spring", size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Mana Tide Totem", size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Tremor Totem", size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 },
--			{ spellName = SpellName()"Wrath of Air Totem", size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 },
--			{ spellName = SpellName()"Totem of Wrath", size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 },
		},
		{
			Name = "Target",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = SpellName()"Earth Shock", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Frost Shock", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Flame Shock", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Wind Shock", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Earth Shield", size = 26, scale = 1, unitId = "target", caster = "player", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Riptide", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },		
			{ spellName = SpellName()"Hex", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Earthliving", size = 26, scale = 1, unitId = "target", caster = "player", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Riptide", size = 26, scale = 1, unitId = "target", caster = "player", filter = "BUFF", barWidth = 104 },
 		},
		{
			Name = "Earth Shield",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = SpellName()"Earth Shield", size = 26, scale = 1, unitId = "focus", caster = "player", filter = "BUFF", barWidth = 104 },
	 	},
		{
			Name = "Cooldowns",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = SpellName()13, size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()14, size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Earth Shock", size = 26, scale = 1, filter = "CD", barWidth = 104 },			
			{ spellName = SpellName()"Riptide", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Elemental Mastery", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Nature's Swiftness", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Tidal Force", size = 26, scale = 1, filter = "CD", barWidth = 104 },			
			{ spellName = SpellName()"Thunderstorm", size = 26, scale = 1, filter = "CD", barWidth = 104 },		
			{ spellName = SpellName()"Lava Burst", size = 26, scale = 1, filter = "CD", barWidth = 104 },			
			{ spellName = SpellName()"Lava Lash", size = 26, scale = 1, filter = "CD", barWidth = 104 },			
			{ spellName = SpellName()"Chain Lightning", size = 26, scale = 1, filter = "CD", barWidth = 104 },	
			{ spellName = SpellName()"Fire Elemental Totem", size = 26, scale = 1, filter = "CD", barWidth = 104 },	
			{ spellName = SpellName()"Earth Elemental Totem", size = 26, scale = 1, filter = "CD", barWidth = 104 },	
			{ spellName = SpellName()"Heroism", size = 26, scale = 1, filter = "CD", barWidth = 104 },	
			{ spellName = SpellName()"Bloodlust", size = 26, scale = 1, filter = "CD", barWidth = 104 },
		},
	},
	["WARLOCK"] = {
		{
			Name = "Self",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = SpellName()"Unending Breath", size = 18, scale = 1.1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Detect Invisibility", size = 18, scale = 1.1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Shadow Ward", size = 18, scale = 1.1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Demonic Circle: Summon", size = 18, scale = 1.1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Backdraft", size = 18, scale = 1.1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Backslash", size = 18, scale = 1.1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },      
			{ spellName = SpellName()"Demonic Pact", size = 18, scale = 1.1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },            
			{ spellName = SpellName()"Metamorphosis", size = 18, scale = 1.1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },                  
			{ spellName = SpellName()"Empowered Imp", size = 18, scale = 1.1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Eradication", size = 18, scale = 1.1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Molten Core", size = 18, scale = 1.1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Nether Protection", size = 18, scale = 1.1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Nightfall", size = 18, scale = 1.1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Pyroclasm", size = 18, scale = 1.1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
		},
		{
			Name = "Target",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = SpellName()"Immolate", size = 18, scale = 1.1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Corruption", size = 18, scale = 1.1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Curse of Agony", size = 18, scale = 1.1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Curse of the Elements", size = 18, scale = 1.1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Fear", size = 18, scale = 1.1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Curse of Weakness", size = 18, scale = 1.1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Curse of Tongues", size = 18, scale = 1.1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Banish", size = 18, scale = 1.1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
 			{ spellName = SpellName()"Howl of Terror", size = 18, scale = 1.1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
 			{ spellName = SpellName()"Death Coil", size = 18, scale = 1.1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
 			{ spellName = SpellName()"Curse of Doom", size = 18, scale = 1.1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Demon Charge", size = 18, scale = 1.1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Shadowfury", size = 18, scale = 1.1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Unstable Affliction", size = 18, scale = 1.1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Haunt", size = 18, scale = 1.1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
 			{ spellName = SpellName()"Seed of Corruption", size = 18, scale = 1.1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Shadowflame", size = 18, scale = 1.1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Aftermath", size = 18, scale = 1.1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Curse of Exhaustion", size = 18, scale = 1.1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Shadow Embrace", size = 18, scale = 1.1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
 		},
		{
			Name = "Cooldowns",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = SpellName()13, size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()14, size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Earth Shock", size = 26, scale = 1, filter = "CD", barWidth = 104 },			
			{ spellName = SpellName()"Riptide", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Elemental Mastery", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Nature's Swiftness", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Tidal Force", size = 26, scale = 1, filter = "CD", barWidth = 104 },			
			{ spellName = SpellName()"Thunderstorm", size = 26, scale = 1, filter = "CD", barWidth = 104 },		
			{ spellName = SpellName()"Lava Burst", size = 26, scale = 1, filter = "CD", barWidth = 104 },			
			{ spellName = SpellName()"Lava Lash", size = 26, scale = 1, filter = "CD", barWidth = 104 },			
			{ spellName = SpellName()"Chain Lightning", size = 26, scale = 1, filter = "CD", barWidth = 104 },	
			{ spellName = SpellName()"Fire Elemental Totem", size = 26, scale = 1, filter = "CD", barWidth = 104 },	
			{ spellName = SpellName()"Earth Elemental Totem", size = 26, scale = 1, filter = "CD", barWidth = 104 },	
			{ spellName = SpellName()"Heroism", size = 26, scale = 1, filter = "CD", barWidth = 104 },	
			{ spellName = SpellName()"Bloodlust", size = 26, scale = 1, filter = "CD", barWidth = 104 },
		},
	},
	["WARRIOR"] = {
		{
			Name = "Self",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = SpellName()"Commanding Shout", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Battle Shout", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Slam!", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"13", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"14", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Berserker Rage", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Enraged Regeneration", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Deathwish", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Sword and Board", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Shield Block", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Shield Wall", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Retaliation", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Recklessness", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Bloodrage", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Victory Rush", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Sudden Death", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Taste for Blood", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Whirlwind", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Last Stand", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = SpellName()"Spell Reflection", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
		},
		{
			Name = "Target",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = SpellName()"Demoralizing Shout", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Sunder Armor", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Concussion Blow", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Shattering Throw", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Thunder Clap", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Intimidating Shout", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Rend", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Deep Wounds", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Hamstring", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Disarm", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Piercing Howl", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Silenced - Gag Order", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Furious Attacks", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = SpellName()"Mortal Strike", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
		},
		{
			Name = "Cooldowns",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = SpellName()13, size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()14, size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Bloodthirst", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Shield Slam", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Whirlwind", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Mortal Strike", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Thunder Clap", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Revenge", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Overpower", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Pummel", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Shield Bash", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Charge", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Intercept", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = SpellName()"Intervene", size = 26, scale = 1, filter = "CD", barWidth = 104 },
		},
	},
]]
};

local class = select(2, UnitClass("player"));
local classcolor = RAID_CLASS_COLORS[class];
local active, bars = {}, {};

local time, Update;
local function OnUpdate(self, elapsed)
	time = self.filter == "CD" and self.expirationTime+self.duration-GetTime() or self.expirationTime-GetTime();
	if ( self:GetParent().Mode == "BAR" ) then
		self.statusbar:SetValue(time);
		self.time:SetFormattedText(SecondsToTimeAbbrev(time));
	end
	if ( time < 0 and self.filter == "CD" ) then
		local id = self:GetParent().Id;
		for index, value in ipairs(active[id]) do
			if ( self.spellName == value.data.spellName ) then
				tremove(active[id], index);
				break;
			end
		end
		self:SetScript("OnUpdate", nil);
		Update(self:GetParent());
	end
end

function Update(self)
	local id = self.Id;
	if ( not bars[id] ) then
		bars[id] = {};
	end
	for index, value in ipairs(bars[id]) do
		value:Hide();
	end
	local bar;
	for index, value in ipairs(active[id]) do
		bar = bars[id][index];
		if ( not bar ) then
			bar = CreateFrame("Frame", "sFilgerAnchor"..id.."Frame"..index, self);
			bar:SetWidth(value.data.size);
			bar:SetHeight(value.data.size);
			bar:SetScale(value.data.scale);
			if ( index == 1 ) then
				if ( configmode ) then
					bar:SetFrameStrata("BACKGROUND");
				end
				if ( self.Direction == "UP" ) then
					bar:SetPoint("BOTTOM", self);
				elseif ( self.Direction == "RIGHT" ) then
					bar:SetPoint("LEFT", self);
				elseif ( self.Direction == "LEFT" ) then
					bar:SetPoint("RIGHT", self);
				else
					bar:SetPoint("TOP", self);
				end
			else
				if ( self.Direction == "UP" ) then
					bar:SetPoint("BOTTOM", bars[id][index-1], "TOP", 0, self.Spacing);
				elseif ( self.Direction == "RIGHT" ) then
					bar:SetPoint("LEFT", bars[id][index-1], "RIGHT", self.Mode == "ICON" and self.Spacing or value.data.barWidth+self.Spacing, 0);
				elseif ( self.Direction == "LEFT" ) then
					bar:SetPoint("RIGHT", bars[id][index-1], "LEFT", self.Mode == "ICON" and -self.Spacing or -(value.data.barWidth+self.Spacing), 0);
				else
					bar:SetPoint("TOP", bars[id][index-1], "BOTTOM", 0, -self.Spacing);
				end
			end
			if ( self.Mode == "ICON" ) then
				bar.icon = bar:CreateTexture("$parentIcon", "ARTWORK");
				bar.icon:SetAllPoints();
				bar.icon:SetTexCoord(0.07, 0.93, 0.07, 0.93);
				
				bar.count = bar:CreateFontString(nil, "ARTWORK", "sfont");
				bar.count:SetPoint("BOTTOMRIGHT", 0, 0);
				bar.count:SetJustifyH("RIGHT");
				
				bar.cooldown = CreateFrame("Cooldown", nil, bar, "CooldownFrameTemplate");
				bar.cooldown:SetAllPoints();
				bar.cooldown:SetReverse();

				bar:SetBackdrop{
				bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
				edgeFile = "",
				insets = {left = -1, right = -1, top = -1, bottom = -1},
				}
				bar:SetBackdropColor(0, 0, 0, 1);
			else
				bar.icon = bar:CreateTexture(nil, "ARTWORK");
				bar.icon:SetAllPoints();
				bar.icon:SetTexCoord(0.07, 0.93, 0.07, 0.93);
				
				bar.count = bar:CreateFontString(nil, "ARTWORK", "sfont");
				bar.count:SetPoint("BOTTOMRIGHT");
				bar.count:SetJustifyH("RIGHT");
				
				bar.statusbar = CreateFrame("StatusBar", nil, bar);
				if ( configmode ) then
					bar.statusbar:SetFrameStrata("BACKGROUND");
				end
				bar.statusbar:SetWidth(value.data.barWidth or 200);
				bar.statusbar:SetHeight(value.data.size);
				bar.statusbar:SetStatusBarTexture("Interface\\AddOns\\sFilger\\media\\flat");
				bar.statusbar:SetBackdrop({ bgFile = "Interface\\ChatFrame\\ChatFrameBackground", edgeFile = "", insets = { left = -1, right = -1, top = -1, bottom = -1 }});
				bar.statusbar:SetStatusBarColor(0.25, 0.25, 0.25, 1);
				bar.statusbar:SetBackdropColor(0, 0, 0, 1);
				bar.statusbar:SetPoint("LEFT", bar, "RIGHT");
				bar.statusbar:SetMinMaxValues(0, 1);
				bar.statusbar:SetValue(0);
				bar.statusbar.background = bar.statusbar:CreateTexture(nil, "BACKGROUND");
				bar.statusbar.background:SetAllPoints();
				bar.statusbar.background:SetTexture("Interface\\AddOns\\sFilger\\media\\flat");
				bar.statusbar.background:SetVertexColor(0, 0, 0, 1);				
				bar.time = bar.statusbar:CreateFontString(nil, "ARTWORK", "sfont");
				bar.time:SetPoint("RIGHT", bar.statusbar, -2, 0);
				bar:SetBackdrop({ bgFile = "Interface\\ChatFrame\\ChatFrameBackground", edgeFile = "", insets = { left = -1, right = -1, top = -1, bottom = -1 }});
				bar:SetBackdropColor(0, 0, 0, 1);
				
				bar.spellname = bar.statusbar:CreateFontString(nil, "ARTWORK", "sfont");
				bar.spellname:SetPoint("LEFT", bar.statusbar, 2, 0);
				bar.spellname:SetPoint("RIGHT", bar.time, "LEFT");
				bar.spellname:SetJustifyH("LEFT");
			end
			
			tinsert(bars[id], bar);
		end
		
		bar.spellName = value.data.spellName;
		
		bar.icon:SetTexture(value.icon);
		bar.count:SetText(value.count > 1 and value.count or "");
		if ( self.Mode == "BAR" ) then
			bar.spellname:SetText(value.data.displayName or value.data.spellName);
		end
		if ( value.duration > 0 ) then
			if ( self.Mode == "ICON" ) then
				CooldownFrame_SetTimer(bar.cooldown, value.data.filter == "CD" and value.expirationTime or value.expirationTime-value.duration, value.duration, 1);
				if ( value.data.filter == "CD" ) then
					bar.expirationTime = value.expirationTime;
					bar.duration = value.duration;
					bar.filter = value.data.filter;
					bar:SetScript("OnUpdate", OnUpdate);
				end
			else
				bar.statusbar:SetMinMaxValues(0, value.duration);
				bar.expirationTime = value.expirationTime;
				bar.duration = value.duration;
				bar.filter = value.data.filter;
				bar:SetScript("OnUpdate", OnUpdate);
			end
		else
			if ( self.Mode == "ICON" ) then
				bar.cooldown:Hide();
			else
				bar.statusbar:SetMinMaxValues(0, 1);
				bar.statusbar:SetValue(1);
				bar.time:SetText("");
				bar:SetScript("OnUpdate", nil);
			end
		end		
		bar:Show();
	end
end

local function OnEvent(self, event, ...)
	local unit = ...;
	if ( ( unit == "target" or unit == "player" ) or event == "PLAYER_TARGET_CHANGED" or event == "PLAYER_ENTERING_WORLD" or event == "SPELL_UPDATE_COOLDOWN" ) then
		local data, name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable, start, enabled, slotLink;
		local id = self.Id;
		for i=1, #spells[class][id], 1 do
			data = spells[class][id][i];
			if ( data.filter == "BUFF" ) then
				name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable = UnitBuff(data.unitId, data.spellName);
			elseif ( data.filter == "DEBUFF" ) then
				name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable = UnitDebuff(data.unitId, data.spellName);
			else
				if ( type(data.spellName) == "string" ) then
					start, duration, enabled = GetSpellCooldown(data.spellName);
					icon = GetSpellTexture(data.spellName);
				else
					slotLink = GetInventoryItemLink("player", data.spellName);
					if ( slotLink ) then
						name, _, _, _, _, _, _, _, _, icon = GetItemInfo(slotLink);
						if ( not data.displayName ) then
							data.displayName = name;
						end
						start, duration, enabled = GetInventoryItemCooldown("player", data.spellName);
					end
				end
				count = 0;
				caster = "all";
			end
			if ( not active[id] ) then
				active[id] = {};
			end
			for index, value in ipairs(active[id]) do
				if ( data.spellName == value.data.spellName ) then
					tremove(active[id], index);
					break;
				end
			end
			if ( ( name and ( caster == data.caster or data.caster == "all" ) ) or ( ( enabled or 0 ) > 0 and ( duration or 0 ) > 1.5 ) ) then
				table.insert(active[id], { data = data, icon = icon, count = count, duration = duration, expirationTime = expirationTime or start });
			end
		end
		Update(self);
	end
end

if ( spells and spells[class] ) then
	for index in pairs(spells) do
		if ( index ~= class ) then
			spells[index] = nil;
		end
	end
	local data, frame;
	for i=1, #spells[class], 1 do
		data = spells[class][i];
		
		frame = CreateFrame("Frame", "sFilgerAnchor"..i, UIParent);
		frame.Id = i;
		frame.Direction = data.Direction or "DOWN";
		frame.Spacing = data.Spacing or 3;
		frame.Mode = data.Mode or "ICON";
		frame:SetWidth(spells[class][i][1] and spells[class][i][1].size or 100);
		frame:SetHeight(spells[class][i][1] and spells[class][i][1].size or 20);
		frame:SetPoint("CENTER");
		frame:SetMovable(1);
		
		if ( configmode ) then
			frame:SetFrameStrata("DIALOG");
			frame:SetBackdrop({ bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", edgeFile = "", insets = { left = 0, right = 0, top = 0, bottom = 0 }});
			frame:EnableMouse(1);
			frame:RegisterForDrag("LeftButton");
			frame:SetScript("OnDragStart", function(self)
				if ( IsShiftKeyDown() and IsAltKeyDown() ) then
					self:StartMoving();
				end
			end);
			frame:SetScript("OnDragStop", function(self)
				self:StopMovingOrSizing();
			end);
			
			frame.text = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightCenter");
			frame.text:SetPoint("CENTER");
			frame.text:SetText(data.Name and data.Name or "sFilgerAnchor"..i);
			
			for j=1, #spells[class][i], 1 do
				data = spells[class][i][j];
				if ( not active[i] ) then
					active[i] = {};
				end
				table.insert(active[i], { data = data, icon = "Interface\\Icons\\temp", count = 9, duration = 0, expirationTime = 0 });
			end
			Update(frame);
		else
			for j=1, #spells[class][i], 1 do
				data = spells[class][i][j];
				if ( data.filter == "CD" ) then
					frame:RegisterEvent("SPELL_UPDATE_COOLDOWN");
					break;
				end
			end
			frame:RegisterEvent("UNIT_AURA");
			frame:RegisterEvent("PLAYER_TARGET_CHANGED");
			frame:RegisterEvent("PLAYER_ENTERING_WORLD");
			frame:SetScript("OnEvent", OnEvent);
		end
	end
end