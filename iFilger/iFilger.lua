--[[
	
	Filger
	Copyright (c) 2009, Nils Ruesch
	All rights reserved.
	
]]

local configmode = false;

local function GetSpellName(id)
	local name, _, _, _, _, _, _, _, _ = GetSpellInfo(id)
	return name
end

local spells = {
	["DEATHKNIGHT"] = {
		{
			Name = "Self",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = GetSpellName(59052), size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Freezing Fog
			{ spellName = GetSpellName(57330), size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Horn of Winter
			{ spellName = GetSpellName(49509), size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Scent of Blood
			{ spellName = GetSpellName(53138), size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Abomination's Might
			{ spellName = GetSpellName(55233), size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Vampiric Blood
			{ spellName = GetSpellName(49530), size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Sudden Doom
			{ spellName = GetSpellName(49501), size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Blade Barrier
			{ spellName = GetSpellName(50887), size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Icy Talons
			{ spellName = GetSpellName(49039), size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Lichborne
			{ spellName = GetSpellName(51128), size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Killing Machine
			{ spellName = GetSpellName(3714), size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Path of Frost
			{ spellName = GetSpellName(59052), size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Freezing Fog

			{ spellName = GetSpellName(90355), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Ancient Hysteria
			{ spellName = GetSpellName(2825), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Bloodlust
			{ spellName = GetSpellName(32182), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Heroism
			{ spellName = GetSpellName(80353), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Time Warp
		},
		{
			Name = "Target",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = GetSpellName(47476), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Strangulate
			{ spellName = GetSpellName(45524), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Chains of Ice
			{ spellName = GetSpellName(59921), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Frost Fever
			{ spellName = GetSpellName(43265), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Death and Decay
			{ spellName = GetSpellName(59879), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Blood Plague
			{ spellName = GetSpellName(49194), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Unholy Blight
		},
		{
			Name = "Cooldowns",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = 13, size = 26, scale = 1, filter = "CD", barWidth = 104 }, --
			{ spellName = 14, size = 26, scale = 1, filter = "CD", barWidth = 104 }, --
			{ spellName = GetSpellName(47476), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Strangulate
			{ spellName = GetSpellName(45529), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Blood Tap
			{ spellName = GetSpellName(56222), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Dark Command
			{ spellName = GetSpellName(48743), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Death Pact
			{ spellName = GetSpellName(47528), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Mind Freeze
			{ spellName = GetSpellName(48792), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Icebound Fortitude
			{ spellName = GetSpellName(57330), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Horn of Winter
			{ spellName = GetSpellName(47568), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Empower Rune Weapon
			{ spellName = GetSpellName(49184), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Howling Blast
			{ spellName = GetSpellName(49576), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Death Grip
			{ spellName = GetSpellName(46584), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Raise Dead
			{ spellName = GetSpellName(48707), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Anti-Magic Shell
			{ spellName = GetSpellName(42650), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Army of the Dead
			{ spellName = GetSpellName(43265), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Death and Decay
			{ spellName = GetSpellName(55233), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Vampiric Blood
			{ spellName = GetSpellName(49028), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Dancing Rune Weapon
			{ spellName = GetSpellName(49039), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Lichborne
			{ spellName = GetSpellName(49203), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Hungering Cold
			{ spellName = GetSpellName(51052), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Anti-Magic Zone
			{ spellName = GetSpellName(49222), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Bone Shield
			{ spellName = GetSpellName(49206), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Summon Gargoyle
			{ spellName = GetSpellName(77575), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Outbreak
			{ spellName = GetSpellName(77606), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Dark Simulacrum
		},
	},
	["DRUID"] = {
		{
			Name = "Self",
			Direction = "UP",
			Spacing = 3,
			Mode = "ICON",
			
			{ spellName = GetSpellName(1850), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Dash
			{ spellName = GetSpellName(467), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Thorns
			{ spellName = GetSpellName(29166), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Innervate
			{ spellName = GetSpellName(8936), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Regrowth
			{ spellName = GetSpellName(33763), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Lifebloom
			{ spellName = GetSpellName(774), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Rejuvenation
			{ spellName = GetSpellName(48438), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Wild Growth
			{ spellName = GetSpellName(22812), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Barkskin
			{ spellName = GetSpellName(16689), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Nature's Grasp
			{ spellName = GetSpellName(50334), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Berserk
			{ spellName = GetSpellName(5217), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Tiger's Fury
			{ spellName = GetSpellName(61336), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Survival Instincts
			{ spellName = GetSpellName(5229), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Enrage
			{ spellName = GetSpellName(22842), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Frenzied Regeneration

			{ spellName = GetSpellName(90355), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Ancient Hysteria
			{ spellName = GetSpellName(2825), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Bloodlust
			{ spellName = GetSpellName(32182), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Heroism
			{ spellName = GetSpellName(80353), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Time Warp
		},
		{
			Name = "Target",
			Direction = "LEFT",
			Spacing = 3,
			Mode = "ICON",
			
			{ spellName = GetSpellName(33786), size = 52, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Cyclone
			{ spellName = GetSpellName(339), size = 52, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Entangling Roots
			{ spellName = GetSpellName(8921), size = 52, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Moonfire
			{ spellName = GetSpellName(91565), size = 52, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Fearie Fire
			{ spellName = GetSpellName(2637), size = 52, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Hibernate
			{ spellName = GetSpellName(5570), size = 52, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Insect Swarm
			{ spellName = GetSpellName(5209), size = 52, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Challenging Roar
			{ spellName = GetSpellName(5211), size = 52, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Bash
			{ spellName = GetSpellName(22570), size = 52, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Maim
			{ spellName = GetSpellName(99), size = 52, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Demoralizing Roar
			{ spellName = GetSpellName(9005), size = 52, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Pounce
			{ spellName = GetSpellName(1822), size = 52, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Rake
			{ spellName = GetSpellName(33745), size = 52, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Lacerate
			{ spellName = GetSpellName(33878), size = 52, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Mangle
			{ spellName = GetSpellName(467), size = 52, scale = 1, unitId = "target", caster = "all", filter = "BUFF", barWidth = 104 }, --thorn
			{ spellName = GetSpellName(1079), size = 52, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Rip
			{ spellName = GetSpellName(8936), size = 52, scale = 1, unitId = "target", caster = "player", filter = "BUFF", barWidth = 104 }, --Regrowth
			{ spellName = GetSpellName(33763), size = 52, scale = 1, unitId = "target", caster = "player", filter = "BUFF", barWidth = 104 }, --Lifebloom
			{ spellName = GetSpellName(774), size = 52, scale = 1, unitId = "target", caster = "player", filter = "BUFF", barWidth = 104 }, --Rejuvenation
			{ spellName = GetSpellName(48438), size = 52, scale = 1, unitId = "target", caster = "player", filter = "BUFF", barWidth = 104 }, --Wild Growth
			{ spellName = GetSpellName(29166), size = 52, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Innervate
			{ spellName = GetSpellName(48483), size = 52, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Infected Wounds
		},
		{
			Name = "Cooldowns",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = 13, size = 26, scale = 1, filter = "CD", barWidth = 104 }, --
			{ spellName = 14, size = 26, scale = 1, filter = "CD", barWidth = 104 }, --
			{ spellName = GetSpellName(29166), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Innervate
			{ spellName = GetSpellName(22812), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Barkskin
			{ spellName = GetSpellName(16689), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Nature's Grasp
			{ spellName = GetSpellName(48505), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Starfall
			{ spellName = GetSpellName(467), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --thorn
			{ spellName = GetSpellName(6795), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Growl
			{ spellName = GetSpellName(5229), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Enrage
			{ spellName = GetSpellName(16857), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Faerie Fire (Feral)
			{ spellName = GetSpellName(16979), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Feral Charge
			{ spellName = GetSpellName(5209), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Challenging Roar
			{ spellName = GetSpellName(22842), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Frenzied Regeneration
			{ spellName = GetSpellName(5211), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Bash
			{ spellName = GetSpellName(80965), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Skull Bash
			{ spellName = GetSpellName(5215), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Prowl
			{ spellName = GetSpellName(1850), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Dash
			{ spellName = GetSpellName(22570), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Maim
			{ spellName = GetSpellName(8998), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Cower
			{ spellName = GetSpellName(5217), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Tiger's Fury
			{ spellName = GetSpellName(33878), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Mangle (Bear)
			{ spellName = GetSpellName(20484), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Rebirth
			{ spellName = GetSpellName(740), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Tranquility
			{ spellName = GetSpellName(48438), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --
		},
	},
	["HUNTER"] = {
		{
			Name = "Self",
			Direction = "UP",
			Spacing = 3,
			Mode = "ICON",
			
			{ spellName = GetSpellName(6197), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Eagle Eye
			{ spellName = GetSpellName(34026), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Kill Command
			{ spellName = GetSpellName(53271), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Masters Call
			{ spellName = GetSpellName(136), size = 52, scale = 1, unitId = "pet", caster = "all", filter = "BUFF", barWidth = 104 }, --Mend Pet
			{ spellName = GetSpellName(3045), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Rapid Fire
			{ spellName = GetSpellName(34477), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Misdirection
			{ spellName = GetSpellName(5384), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Feign Death
			{ spellName = GetSpellName(19263), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Deterrence
			{ spellName = GetSpellName(5118), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Aspect of the Cheetah
			{ spellName = GetSpellName(82661), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Aspect of the Fox
			{ spellName = GetSpellName(13165), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Aspect of the Hawk
			{ spellName = GetSpellName(13159), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Aspect of the Pack
			{ spellName = GetSpellName(20043), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Aspect of the Wild
			{ spellName = GetSpellName(75447), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Ferocious Inspiration
			{ spellName = GetSpellName(19574), size = 52, scale = 1, unitId = "pet", caster = "all", filter = "BUFF", barWidth = 104 }, --Bestial Wrath
			{ spellName = GetSpellName(53260), size = 52, scale = 1, unitId = "pet", caster = "all", filter = "BUFF", barWidth = 104 }, --Cobra Strikes
			{ spellName = GetSpellName(34949), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Rapid Killing
			{ spellName = GetSpellName(53224), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Improved Steady Shot
			{ spellName = GetSpellName(56343), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Lock and Load
			{ spellName = GetSpellName(7140), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Expose Weakness
			{ spellName = GetSpellName(53304), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Sniper Training
			{ spellName = GetSpellName(51753), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Camouflage

			{ spellName = GetSpellName(90355), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Ancient Hysteria
			{ spellName = GetSpellName(2825), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Bloodlust
			{ spellName = GetSpellName(32182), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Heroism
			{ spellName = GetSpellName(80353), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Time Warp
		},
		{
			Name = "Target",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = GetSpellName(1513), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Scare Beast
			{ spellName = GetSpellName(5116), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Concussive Shot
			{ spellName = GetSpellName(1130), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Hunters Mark
			{ spellName = GetSpellName(1978), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Serpent Sting
			{ spellName = GetSpellName(82654), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Widow Venom
			{ spellName = GetSpellName(1499), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Freezing Trap
			{ spellName = GetSpellName(13813), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Explosive Trap
			{ spellName = GetSpellName(19306), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Counterattack
			{ spellName = GetSpellName(13795), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Immolation Trap
			{ spellName = GetSpellName(3674), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Black Arrow
			{ spellName = GetSpellName(53301), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Explosive Shot
			{ spellName = GetSpellName(19386), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Wyvern Sting
			{ spellName = GetSpellName(19577), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Intimidation
			{ spellName = GetSpellName(35101), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Concussive Barrage
			{ spellName = GetSpellName(53238), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Piercing Shots
			{ spellName = GetSpellName(34490), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Silencing Shot
			{ spellName = GetSpellName(20736), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Distracting Shot
			{ spellName = GetSpellName(19387), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Entrapment
			{ spellName = GetSpellName(19503), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Scatter Shot
		},
		{
			Name = "Cooldowns",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = 13, size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = 14, size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = GetSpellName(6991), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Feed Pet
			{ spellName = GetSpellName(1513), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Scare Beast
			{ spellName = GetSpellName(34026), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Kill Command
			{ spellName = GetSpellName(53271), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Master's Call
			{ spellName = GetSpellName(5116), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Concussive Shot
			{ spellName = GetSpellName(20736), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Distracting Shot
			{ spellName = GetSpellName(3045), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Rapid Fire
			{ spellName = GetSpellName(1543), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Flare
			{ spellName = GetSpellName(3044), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Arcane Shot
			{ spellName = GetSpellName(19434), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Aimed Shot
			{ spellName = GetSpellName(53351), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Kill Shot
			{ spellName = GetSpellName(2643), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Multi Shot
			{ spellName = GetSpellName(781), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Disengage
			{ spellName = GetSpellName(13809), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Ice Trap
			{ spellName = GetSpellName(5384), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Feign Death
			{ spellName = GetSpellName(19263), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Deterrence
			{ spellName = GetSpellName(34477), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Misdirection
			{ spellName = GetSpellName(2973), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Raptor Strike
			{ spellName = GetSpellName(19306), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Counterattack
			{ spellName = GetSpellName(53301), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Explosive Shot
			{ spellName = GetSpellName(3674), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Black Arrow
			{ spellName = GetSpellName(19386), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Wyvern Sting
			{ spellName = GetSpellName(19577), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Intimidation
			{ spellName = GetSpellName(19574), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Bestial Wrath
			{ spellName = GetSpellName(23989), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Readiness
			{ spellName = GetSpellName(34490), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Silencing Shot
			{ spellName = GetSpellName(53209), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Chimera Shot
			{ spellName = GetSpellName(19503), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Scatter Shot
			{ spellName = GetSpellName(51753), size = 52, scale = 1, filter = "CD", barWidth = 104 }, --Camouflage
		},
	},
	["MAGE"] = {
		{
			Name = "Self",
			Direction = "UP",
			Spacing = 3,
			Mode = "ICON",

			{ spellName = GetSpellName(36032), size = 52, scale = 1, unitId = "player", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Arcane Blast
			{ spellName = GetSpellName(12042), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Arcane Power
			{ spellName = GetSpellName(31642), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Blazing Speed
			{ spellName = GetSpellName(57761), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Brain Freeze
			{ spellName = GetSpellName(12536), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Clearcasting
			{ spellName = GetSpellName(83074), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Fingers of Frost
			{ spellName = GetSpellName(54646), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Focus Magic
			{ spellName = GetSpellName(44445), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Hot Streak
--			{ spellName = GetSpellName(11426), size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Ice Barrier
			{ spellName = GetSpellName(45438), size = 52, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 }, --Ice Block
			{ spellName = GetSpellName(12472), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Icy Veins
			{ spellName = GetSpellName(12357), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Impact
--			{ spellName = GetSpellName(44395), size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Incanter's Absorption
			{ spellName = GetSpellName(66), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Invisibility
--			{ spellName = GetSpellName(54486), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Missile Barrage
			{ spellName = GetSpellName(543), size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 }, --Mage Ward
			{ spellName = GetSpellName(12043), size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 }, --Presence of Mind
			{ spellName = GetSpellName(34295), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Pyromaniac
			
			{ spellName = GetSpellName(91007), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Dire Magic (Bell of Enraging Resonance)
			{ spellName = GetSpellName(74223), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Hurricane
			{ spellName = GetSpellName(75172), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Lightweave
			{ spellName = GetSpellName(74242), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Power Torrent
			{ spellName = GetSpellName(91024), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Revelation (Theralion's Mirror)
			{ spellName = GetSpellName(79476), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Volcanic Power
			{ spellName = GetSpellName(90355), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Ancient Hysteria
			{ spellName = GetSpellName(2825), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Bloodlust
			{ spellName = GetSpellName(32182), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Heroism
			{ spellName = GetSpellName(80353), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Time Warp
		},
		{
			Name = "Target",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = GetSpellName(11113), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Blast Wave
			{ spellName = GetSpellName(11129), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Combustion
--			{ spellName = GetSpellName(120), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Cone of Cold
			{ spellName = GetSpellName(12873), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Critical Mass
			{ spellName = GetSpellName(44572), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Deep Freeze
--			{ spellName = GetSpellName(31661), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Dragon's Breath
			{ spellName = GetSpellName(33395), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Freeze
			{ spellName = GetSpellName(122), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Frost Nova
			{ spellName = GetSpellName(116), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Frostbolt
			{ spellName = GetSpellName(44614), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Frostfire Bolt
			{ spellName = GetSpellName(12846), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Ignite
			{ spellName = GetSpellName(12357), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Impact
--			{ spellName = GetSpellName(12488), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Improved Blizzard
--			{ spellName = GetSpellName(120), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Improved Cone of Cold
			{ spellName = GetSpellName(12598), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Improved Counterspell
			{ spellName = GetSpellName(44457), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Living Bomb
			{ spellName = GetSpellName(118), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Polymorph
			{ spellName = GetSpellName(11366), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Pyroblast
			{ spellName = GetSpellName(92315), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Pyroblast!
--			{ spellName = GetSpellName(54787), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Shattered Barrier
			{ spellName = GetSpellName(31589), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Slow
		},
		{
			Name = "Focus",
			Direction = "RIGHT",
			Spacing = 3,
			Mode = "ICON",
			
			{ spellName = GetSpellName(12873), size = 26, scale = 1, unitId = "focus", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Critical Mass
			{ spellName = GetSpellName(44572), size = 26, scale = 1, unitId = "focus", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Deep Freeze
			{ spellName = GetSpellName(44457), size = 26, scale = 1, unitId = "focus", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Living Bomb
			{ spellName = GetSpellName(118), size = 26, scale = 1, unitId = "focus", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Polymorph
			{ spellName = GetSpellName(11366), size = 26, scale = 1, unitId = "focus", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Pyroblast
			{ spellName = GetSpellName(92315), size = 26, scale = 1, unitId = "focus", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Pyroblast!
		},
		{
			Name = "Cooldowns",
			Direction = "ICON",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = 13, size = 26, scale = 1, filter = "CD", barWidth = 104 }, --
			{ spellName = 14, size = 26, scale = 1, filter = "CD", barWidth = 104 }, --
--			{ spellName = GetSpellName(1953), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Blink
			{ spellName = GetSpellName(12051), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Evocation
			{ spellName = GetSpellName(2139), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Counterspell
			{ spellName = GetSpellName(66), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Invisibility
			{ spellName = GetSpellName(55342), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Mirror Image
			{ spellName = GetSpellName(12043), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Presence of Mind
			{ spellName = GetSpellName(12042), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Arcane Power
			{ spellName = GetSpellName(36799), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Mana Gem
			{ spellName = GetSpellName(543), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Mage Ward
			{ spellName = GetSpellName(1463), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Mana Shield
			{ spellName = GetSpellName(80353), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Time Warp

--			{ spellName = GetSpellName(11113), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Blast Wave
--			{ spellName = GetSpellName(31661), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Dragon's Breath
			{ spellName = GetSpellName(11129), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Combustion
			{ spellName = GetSpellName(82731), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Flame Orb
--			{ spellName = GetSpellName(2136), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Fire Blast

			{ spellName = GetSpellName(45438), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Ice Block
			{ spellName = GetSpellName(12472), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Icy Veins
			{ spellName = GetSpellName(11958), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Cold Snap
			{ spellName = GetSpellName(44572), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Deep Freeze
			{ spellName = GetSpellName(82676), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Ring of Frost
--			{ spellName = GetSpellName(31687), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Summon Water Elemental
--			{ spellName = GetSpellName(122), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Frost Nova
--			{ spellName = GetSpellName(120), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Cone of Cold
			{ spellName = GetSpellName(11426), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Ice Barrier
		},
	},
	["PALADIN"] = {
 		{
			Name = "Self",
			Direction = "UP",
			Spacing = 3,
			Mode = "ICON",
			
			{ spellName = GetSpellName(31884), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Avenging Wrath
			{ spellName = GetSpellName(20217), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Blessing of Kings
			{ spellName = GetSpellName(19740), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Blessing of Might
			{ spellName = GetSpellName(31842), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Divine Favor
			{ spellName = GetSpellName(54428), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Divine Plea
			{ spellName = GetSpellName(25771), size = 52, scale = 1, unitId = "player", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Forbearance
			{ spellName = GetSpellName(53710), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Sacred Duty
			{ spellName = GetSpellName(1022), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Hand of Protection
			{ spellName = GetSpellName(1044), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Hand of Freedom
			{ spellName = GetSpellName(1038), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Hand of Salvation
			{ spellName = GetSpellName(6940), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Hand of Sacrifice
			{ spellName = GetSpellName(20925), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Holy Shield
			{ spellName = GetSpellName(53651), size = 52, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 }, --Light's Beacon
			{ spellName = GetSpellName(25780), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Righteous Fury
			{ spellName = GetSpellName(96263), size = 52, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 }, --Sacred Shield
			{ spellName = GetSpellName(20165), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Seal of Insight
			{ spellName = GetSpellName(20164), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Seal of Justice
			{ spellName = GetSpellName(20154), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Seal of Righteousness
			{ spellName = GetSpellName(31801), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Seal of Truth
			{ spellName = GetSpellName(87138), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --The Art of War
			{ spellName = GetSpellName(31850), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Ardent Defender
			{ spellName = GetSpellName(86150), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Guardian of Ancient Kings
			{ spellName = GetSpellName(82327), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Holy Radiance
			{ spellName = GetSpellName(498), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Divine Protection
			{ spellName = GetSpellName(70940), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Divine Guardian
			{ spellName = GetSpellName(84963), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Inquisition
			{ spellName = GetSpellName(85696), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Zealotry
			{ spellName = GetSpellName(54151), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Judgements of the Pure
			{ spellName = GetSpellName(87172), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Long Arm of the Law
			

			{ spellName = GetSpellName(90355), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Ancient Hysteria
			{ spellName = GetSpellName(2825), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Bloodlust
			{ spellName = GetSpellName(32182), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Heroism
			{ spellName = GetSpellName(80353), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Time Warp
 		},
 		{
			Name = "Target",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = GetSpellName(31935), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Avenger's Shield
			{ spellName = GetSpellName(853), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Hammer of Justice
			{ spellName = GetSpellName(1044), size = 26, scale = 1, unitId = "target", caster = "all", filter = "BUFF", barWidth = 104 }, --Hand of Freedom
			{ spellName = GetSpellName(1038), size = 26, scale = 1, unitId = "target", caster = "all", filter = "BUFF", barWidth = 104 }, --Hand of Salvation
			{ spellName = GetSpellName(2812), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Holy Wrath
			{ spellName = GetSpellName(20271), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Judgement
			{ spellName = GetSpellName(53651), size = 26, scale = 1, unitId = "target", caster = "player", filter = "BUFF", barWidth = 104 }, --Light's Beacon
			{ spellName = GetSpellName(20066), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Repentance
			{ spellName = GetSpellName(26017), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Vindication
			{ spellName = GetSpellName(25771), size = 26, scale = 1, unitId = "player", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Forbearance
			{ spellName = GetSpellName(63529), size = 26, scale = 1, unitId = "player", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Dazed - Avenger's Shield
			{ spellName = GetSpellName(53696), size = 26, scale = 1, unitId = "player", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Judgements of the Just
 		},
		{
			Name = "Beacon",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = GetSpellName(53651), size = 26, scale = 1, unitId = "focus", caster = "player", filter = "BUFF", barWidth = 104 }, --Light's Beacon
	 	},
		{
			Name = "Cooldowns",
			Direction = "RIGHT",
			Spacing = 3,
			Mode = "ICON",
			
			{ spellName = 13, size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = 14, size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = GetSpellName(96231), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Rebuke
			{ spellName = GetSpellName(1038), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Hand of Salvation
			{ spellName = GetSpellName(1022), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Hand of Protection
			{ spellName = GetSpellName(62124), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Hand of Reckoning
			{ spellName = GetSpellName(1044), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Hand of Freedom
			{ spellName = GetSpellName(6940), size = 52, scale = 1, filter = "CD", barWidth = 104 }, --Hand of Sacrifice
			{ spellName = GetSpellName(20271), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Judgement
			{ spellName = GetSpellName(633), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Lay on Hands
			{ spellName = GetSpellName(31789), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Righteous Defense
			{ spellName = GetSpellName(853), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Hammer of Justice
			{ spellName = GetSpellName(26573), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Consecration
			{ spellName = GetSpellName(642), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Divine Shield
			{ spellName = GetSpellName(24275), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Hammer of Wrath
			{ spellName = GetSpellName(20473), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Holy Shock
			{ spellName = GetSpellName(20925), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Holy Shield
			{ spellName = GetSpellName(31935), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Avenger's Shield
			{ spellName = GetSpellName(31884), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Avenging Wrath
			{ spellName = GetSpellName(54428), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Divine Plea
			{ spellName = GetSpellName(2812), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Holy Wrath
			{ spellName = GetSpellName(31821), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Aura Mastery
			{ spellName = GetSpellName(35395), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Crusader Strike
			{ spellName = GetSpellName(31842), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Divine Favor
			{ spellName = GetSpellName(53385), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Divine Storm
			{ spellName = GetSpellName(53595), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Hammer of the Righteous
			{ spellName = GetSpellName(20066), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Repentance
			{ spellName = GetSpellName(31850), size = 52, scale = 1, filter = "CD", barWidth = 104 }, --Ardent Defender
			{ spellName = GetSpellName(86150), size = 52, scale = 1, filter = "CD", barWidth = 104 }, --Guardian of Ancient Kings
			{ spellName = GetSpellName(82327), size = 52, scale = 1, filter = "CD", barWidth = 104 }, --Holy Radiance
			{ spellName = GetSpellName(498), size = 52, scale = 1, filter = "CD", barWidth = 104 }, --Divine Protection
			{ spellName = GetSpellName(70940), size = 52, scale = 1, filter = "CD", barWidth = 104 }, --Divine Guardian
			{ spellName = GetSpellName(85696), size = 52, scale = 1, filter = "CD", barWidth = 104 }, --Zealotry
		},
	},
	["PRIEST"] = {
 		{
			Name = "Self",
			Direction = "UP",
			Spacing = 3,
			Mode = "ICON",
			
			{ spellName = GetSpellName(87151), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Archangel            
			{ spellName = GetSpellName(27818), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Blessed Recovery
			{ spellName = GetSpellName(33145), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Blessed Resilience
			{ spellName = GetSpellName(59889), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Borrowed Time
			{ spellName = GetSpellName(14751), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Chakra
			{ spellName = GetSpellName(81206), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Chakra: Sanctuary
			{ spellName = GetSpellName(81208), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Chakra: Serenity
			{ spellName = GetSpellName(81209), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Chakra: Chastise
			{ spellName = GetSpellName(93757), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Dark Archangel
			{ spellName = GetSpellName(47585), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Dispersion
			{ spellName = GetSpellName(81662), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Evangelism        
			{ spellName = GetSpellName(45243), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Focused Will
			{ spellName = GetSpellName(47517), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Grace
			{ spellName = GetSpellName(47788), size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Guardian Spirit
			{ spellName = GetSpellName(33206), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Pain Suppression
			{ spellName = GetSpellName(10060), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Power Infusion
			{ spellName = GetSpellName(17), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Power Word: Shield
			{ spellName = GetSpellName(63735), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Serendipity
			{ spellName = GetSpellName(88688), size = 52, scale = 1, unitId = "player", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Surge of Light
			{ spellName = GetSpellName(20711), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Spirit of Redemption
			{ spellName = GetSpellName(6788), size = 52, scale = 1, unitId = "player", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Weakened Soul

			{ spellName = GetSpellName(90355), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Ancient Hysteria
			{ spellName = GetSpellName(2825), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Bloodlust
			{ spellName = GetSpellName(32182), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Heroism
			{ spellName = GetSpellName(80353), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Time Warp
 		},
 		{
			Name = "Target",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = GetSpellName(2944), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Devouring Plague
			{ spellName = GetSpellName(47515), size = 26, scale = 1, unitId = "target", caster = "all", filter = "BUFF", barWidth = 104 }, --Divine Aegis
			{ spellName = GetSpellName(47517), size = 26, scale = 1, unitId = "target", caster = "all", filter = "BUFF", barWidth = 104 }, --Grace
			{ spellName = GetSpellName(14914), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Holy Fire
			{ spellName = GetSpellName(15407), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Mind Flay
			{ spellName = GetSpellName(453), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Mind Soothe
			{ spellName = GetSpellName(33206), size = 26, scale = 1, unitId = "target", caster = "all", filter = "BUFF", barWidth = 104 }, --Pain Suppression
			{ spellName = GetSpellName(10060), size = 26, scale = 1, unitId = "target", caster = "all", filter = "BUFF", barWidth = 104 }, --Power Infusion
			{ spellName = GetSpellName(64044), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Psychic Horror
			{ spellName = GetSpellName(8122), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Psychic Scream
			{ spellName = GetSpellName(139), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Renew
			{ spellName = GetSpellName(589), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Shadow Word: Pain
			{ spellName = GetSpellName(15487), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Silence
			{ spellName = GetSpellName(34914), size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Vampiric Touch
 		},
		{
			Name = "Cooldowns",
			Direction = "DOWN",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = 13, size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = 14, size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = GetSpellName(34861), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Circle of Healing
			{ spellName = GetSpellName(19236), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Desperate Prayer
			{ spellName = GetSpellName(2944), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Devouring Plague
			{ spellName = GetSpellName(47585), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Dispersion
			{ spellName = GetSpellName(64843), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Divine Hymn
			{ spellName = GetSpellName(6346), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Fear Ward
			{ spellName = GetSpellName(47788), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Guardian Spirit
			{ spellName = GetSpellName(14914), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Holy Fire
			{ spellName = GetSpellName(88686), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Holy Word: Sanctuary
			{ spellName = GetSpellName(64901), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Hymn of Hope
			{ spellName = GetSpellName(724), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Lightwell
			{ spellName = GetSpellName(33206), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Pain Suppression
			{ spellName = GetSpellName(47540), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Penance
			{ spellName = GetSpellName(10060), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Power Infusion
			{ spellName = GetSpellName(17), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Power Word: Shield
			{ spellName = GetSpellName(33076), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Prayer of Mending
			{ spellName = GetSpellName(64044), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Psychic Horror
			{ spellName = GetSpellName(8122), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Psychic Scream
			{ spellName = GetSpellName(32379), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Shadow Word: Death
			{ spellName = GetSpellName(34433), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Shadowfiend
			{ spellName = GetSpellName(15487), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Silence
		},
	},
--[[	["ROGUE"] = {
		{
			Name = "Self",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = GetSpellName()"Slice and Dice", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = GetSpellName()"Evasion", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = GetSpellName()"Sprint", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = GetSpellName()"Faint", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = GetSpellName()"Tricks of the Trade", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = GetSpellName()"Cloak of Shadows", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = GetSpellName()"Remorseless Attacks", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = GetSpellName()"Hunger for Blood", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = GetSpellName()"Blade Flurry", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = GetSpellName()"Adrenaline Rush", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = GetSpellName()"Killing Spree", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = GetSpellName()"Cheat Death", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = GetSpellName()"Shadowstep", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },
			{ spellName = GetSpellName()"Shadow Dance", size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 },

			{ spellName = GetSpellName(90355), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Ancient Hysteria
			{ spellName = GetSpellName(2825), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Bloodlust
			{ spellName = GetSpellName(32182), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Heroism
			{ spellName = GetSpellName(80353), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Time Warp
		},
		{
			Name = "Target",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = GetSpellName()"Expose Armor", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = GetSpellName()"Dismantle", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = GetSpellName()"Cheap Shot", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = GetSpellName()"Kidney Shot", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = GetSpellName()"Deadly Throw", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = GetSpellName()"Rupture", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = GetSpellName()"Garrote", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = GetSpellName()"Gouge", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = GetSpellName()"Blind", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = GetSpellName()"Sap", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = GetSpellName()"Hemorrhage", size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 },
			{ spellName = GetSpellName()"Crippling Poison", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = GetSpellName()"Wound Poison", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = GetSpellName()"Deadly Poison", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = GetSpellName()"Mind-numbling Poison", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
			{ spellName = GetSpellName()"Waylay", size = 26, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 },
		},
				{
			Name = "Cooldowns",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = 13, size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = 14, size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = GetSpellName()"Dismantle", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = GetSpellName()"Kidney Shot", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = GetSpellName()"Gouge", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = GetSpellName()"Kick", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = GetSpellName()"Evasion", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = GetSpellName()"Sprint", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = GetSpellName()"Feint", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = GetSpellName()"Distract", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = GetSpellName()"Blind", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = GetSpellName()"Stealth", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = GetSpellName()"Vanish", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = GetSpellName()"Cloak of Shadows", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = GetSpellName()"Tricks of the Trade", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = GetSpellName()"Cold Blood", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = GetSpellName()"Blade Flurry", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = GetSpellName()"Adrenaline Rush", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = GetSpellName()"Killing Spree", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = GetSpellName()"Preparation", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = GetSpellName()"Premeditation", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = GetSpellName()"Shadowstep", size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = GetSpellName()"Shadow Dance", size = 26, scale = 1, filter = "CD", barWidth = 104 },
		},
	},]]
	["SHAMAN"] = {
		{
			Name = "Self",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = GetSpellName(53817), size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 }, --Maelstrom Weapon
			{ spellName = GetSpellName(324), size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 }, --Lightning Shield
			{ spellName = GetSpellName(52127), size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 }, --Water Shield
			{ spellName = GetSpellName(974), size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 }, --Earth Shield
			{ spellName = GetSpellName(51730), size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 }, --Earthliving Weapon
			{ spellName = GetSpellName(51945), size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 }, --Earthliving
			{ spellName = GetSpellName(16166), size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 }, --Elemental Mastery
			{ spellName = GetSpellName(79206), size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 }, --Spiritwalker's Grace
			{ spellName = GetSpellName(73680), size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 }, --Unleash Elements
			{ spellName = GetSpellName(61295), size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 }, --Riptide
			{ spellName = GetSpellName(51564), size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 }, --Tidal Waves
--			{ spellName = GetSpellName(8227), size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 }, --Flametongue Totem
			{ spellName = GetSpellName(8178), size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 }, --Grounding Totem Effect
--			{ spellName = GetSpellName(8071), size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 }, --Stoneskin
--			{ spellName = GetSpellName(8076), size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 }, --Strength of Earth
--			{ spellName = GetSpellName(8512), size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 }, --Windfury Totem
--			{ spellName = GetSpellName(5394), size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 }, --Healing Stream Totem
--			{ spellName = GetSpellName(5675), size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 }, --Mana Spring Totem
			{ spellName = GetSpellName(16190), size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 }, --Mana Tide Totem
			{ spellName = GetSpellName(8143), size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 }, --Tremor Totem
--			{ spellName = GetSpellName(3738), size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 }, --Wrath of Air Totem
--			{ spellName = GetSpellName(77746), size = 26, scale = 1, unitId = "player", caster = "player", filter = "BUFF", barWidth = 104 }, --Totem of Wrath

			{ spellName = GetSpellName(90355), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Ancient Hysteria
			{ spellName = GetSpellName(2825), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Bloodlust
			{ spellName = GetSpellName(32182), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Heroism
			{ spellName = GetSpellName(80353), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Time Warp
		},
		{
			Name = "Target",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = GetSpellName(17364), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Stormstrike
			{ spellName = GetSpellName(77657), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Searing Flames
			{ spellName = GetSpellName(8042), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Earth Shock
			{ spellName = GetSpellName(8056), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Frost Shock
			{ spellName = GetSpellName(8050), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Flame Shock
			{ spellName = GetSpellName(974), size = 26, scale = 1, unitId = "target", caster = "player", filter = "BUFF", barWidth = 104 }, --Earth Shield
			{ spellName = GetSpellName(61295), size = 26, scale = 1, unitId = "target", caster = "player", filter = "BUFF", barWidth = 104 }, --Riptide
			{ spellName = GetSpellName(51514), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Hex
			{ spellName = GetSpellName(61295), size = 26, scale = 1, unitId = "target", caster = "player", filter = "BUFF", barWidth = 104 }, --Riptide
			{ spellName = GetSpellName(51945), size = 26, scale = 1, unitId = "target", caster = "player", filter = "BUFF", barWidth = 104 }, --Earthliving
 		},
		{
			Name = "Earth Shield / Hex",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = GetSpellName(974), size = 26, scale = 1, unitId = "focus", caster = "player", filter = "BUFF", barWidth = 104 }, --Earth Shield
			{ spellName = GetSpellName(51514), size = 26, scale = 1, unitId = "focus", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Hex
	 	},
		{
			Name = "Cooldowns",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = 13, size = 26, scale = 1, filter = "CD", barWidth = 104 }, --
			{ spellName = 14, size = 26, scale = 1, filter = "CD", barWidth = 104 }, --
			{ spellName = GetSpellName(17364), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Stormstrike
			{ spellName = GetSpellName(73899), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Primal Strike
			{ spellName = GetSpellName(57994), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Wind Shear
			{ spellName = GetSpellName(8042), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Earth Shock
			{ spellName = GetSpellName(8056), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Frost Shock
			{ spellName = GetSpellName(8050), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Flame Shock
			{ spellName = GetSpellName(61295), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Riptide
			{ spellName = GetSpellName(16166), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Elemental Mastery
			{ spellName = GetSpellName(79206), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Spiritwalker's Grace
			{ spellName = GetSpellName(73680), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Unleash Elements
			{ spellName = GetSpellName(73920), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Healing Rain
			{ spellName = GetSpellName(16188), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Nature's Swiftness
			{ spellName = GetSpellName(51490), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Thunderstorm
			{ spellName = GetSpellName(51505), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Lava Burst
			{ spellName = GetSpellName(60103), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Lava Lash
			{ spellName = GetSpellName(421), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Chain Lightning
			{ spellName = GetSpellName(2894), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Fire Elemental Totem
			{ spellName = GetSpellName(2062), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Earth Elemental Totem
			{ spellName = GetSpellName(32182), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Heroism
			{ spellName = GetSpellName(2825), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Bloodlust
			{ spellName = GetSpellName(51533), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Feral Spirit
		},
	},
	["WARLOCK"] = {
		{
			Name = "Self",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = GetSpellName(5697), size = 18, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Unending Breath
			{ spellName = GetSpellName(6229), size = 18, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Shadow Ward
			{ spellName = GetSpellName(48018), size = 18, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Demonic Circle: Summon
			{ spellName = GetSpellName(47260), size = 18, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Backdraft
			{ spellName = GetSpellName(47236), size = 18, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Demonic Pact
			{ spellName = GetSpellName(59672), size = 18, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Metamorphosis
			{ spellName = GetSpellName(47283), size = 18, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Empowered Imp
			{ spellName = GetSpellName(64371), size = 18, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Eradication
			{ spellName = GetSpellName(71165), size = 18, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Molten Core
			{ spellName = GetSpellName(30301), size = 18, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Nether Protection
			{ spellName = GetSpellName(17941), size = 18, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Shadow Trance
			{ spellName = GetSpellName(18120), size = 18, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Improved Soul Fire
			{ spellName = GetSpellName(63167), size = 18, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Decimation
			{ spellName = GetSpellName(89751), size = 18, scale = 1, unitId = "pet", caster = "all", filter = "BUFF", barWidth = 104 }, --Felstorm
			{ spellName = GetSpellName(74434), size = 18, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Soulburn
			

			{ spellName = GetSpellName(90355), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Ancient Hysteria
			{ spellName = GetSpellName(2825), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Bloodlust
			{ spellName = GetSpellName(32182), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Heroism
			{ spellName = GetSpellName(80353), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Time Warp
		},
		{
			Name = "Target",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = GetSpellName(348), size = 18, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Immolate
			{ spellName = GetSpellName(172), size = 18, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Corruption
			{ spellName = GetSpellName(1490), size = 18, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Curse of the Elements
			{ spellName = GetSpellName(5782), size = 18, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Fear
			{ spellName = GetSpellName(702), size = 18, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Curse of Weakness
			{ spellName = GetSpellName(1714), size = 18, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Curse of Tongues
			{ spellName = GetSpellName(710), size = 18, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Banish
 			{ spellName = GetSpellName(5484), size = 18, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Howl of Terror
 			{ spellName = GetSpellName(6789), size = 18, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Death Coil
			{ spellName = GetSpellName(60995), size = 18, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Demon Charge
			{ spellName = GetSpellName(30283), size = 18, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Shadowfury
			{ spellName = GetSpellName(30108), size = 18, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Unstable Affliction
			{ spellName = GetSpellName(48181), size = 18, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Haunt
 			{ spellName = GetSpellName(27243), size = 18, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Seed of Corruption
			{ spellName = GetSpellName(47897), size = 18, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Shadowflame
			{ spellName = GetSpellName(18118), size = 18, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Aftermath
			{ spellName = GetSpellName(18223), size = 18, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Curse of Exhaustion
			{ spellName = GetSpellName(32389), size = 18, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Shadow Embrace
			{ spellName = GetSpellName(1120), size = 18, scale = 1, unitId = "target", caster = "all", filter = "DEBUFF", barWidth = 104 }, --Drain Soul
 		},
		{
			Name = "Cooldowns",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = 13, size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = 14, size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = GetSpellName(89751), size = 18, scale = 1, filter = "CD", barWidth = 104 }, --Felstorm
			{ spellName = GetSpellName(74434), size = 18, scale = 1, filter = "CD", barWidth = 104 }, --Soulburn
			{ spellName = GetSpellName(59672), size = 18, scale = 1, filter = "CD", barWidth = 104 }, --Metamorphosis
			{ spellName = GetSpellName(77801), size = 18, scale = 1, filter = "CD", barWidth = 104 }, --Demon Soul
			{ spellName = GetSpellName(71521), size = 18, scale = 1, filter = "CD", barWidth = 104 }, --Hand of Gul'dan
			{ spellName = GetSpellName(17962), size = 18, scale = 1, filter = "CD", barWidth = 104 }, --Conflagrate
			{ spellName = GetSpellName(50796), size = 18, scale = 1, filter = "CD", barWidth = 104 }, --Chaos Bolt
			{ spellName = GetSpellName(30283), size = 18, scale = 1, filter = "CD", barWidth = 104 }, --Shadowfury
			{ spellName = GetSpellName(47897), size = 18, scale = 1, filter = "CD", barWidth = 104 }, --Shadowflame
			{ spellName = GetSpellName(29893), size = 18, scale = 1, filter = "CD", barWidth = 104 }, --Ritual of Souls
			{ spellName = GetSpellName(79268), size = 18, scale = 1, filter = "CD", barWidth = 104 }, --Soul Harvest
			{ spellName = GetSpellName(29858), size = 18, scale = 1, filter = "CD", barWidth = 104 }, --Soulshatter
		},
	},
	["WARRIOR"] = {
		{
			Name = "Self",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = GetSpellName(469), size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Commanding Shout
			{ spellName = GetSpellName(6673), size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Battle Shout
			{ spellName = GetSpellName(46916), size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Bloodsurge
			{ spellName = GetSpellName(18499), size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Berserker Rage
			{ spellName = GetSpellName(55694), size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Enraged Regeneration
			{ spellName = GetSpellName(12292), size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Death Wish
			{ spellName = GetSpellName(2565), size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Shield Block
			{ spellName = GetSpellName(871), size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Shield Wall	
			{ spellName = GetSpellName(20230), size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Retaliation
			{ spellName = GetSpellName(1719), size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Recklessness
			{ spellName = GetSpellName(32216), size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Victory Rush
			{ spellName = GetSpellName(1680), size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Whirlwind
			{ spellName = GetSpellName(23920), size = 26, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Spell Reflection

			{ spellName = GetSpellName(90355), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Ancient Hysteria
			{ spellName = GetSpellName(2825), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Bloodlust
			{ spellName = GetSpellName(32182), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Heroism
			{ spellName = GetSpellName(80353), size = 52, scale = 1, unitId = "player", caster = "all", filter = "BUFF", barWidth = 104 }, --Time Warp
		},
		{
			Name = "Target",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = GetSpellName(1160), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Demoralizing Shout
			{ spellName = GetSpellName(7386), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Sunder Armor
			{ spellName = GetSpellName(12809), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Concussion Blow
			{ spellName = GetSpellName(64382), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Shattering Throw
			{ spellName = GetSpellName(6343), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Thunder Clap
			{ spellName = GetSpellName(5246), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Intimidating Shout
			{ spellName = GetSpellName(772), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Rend
			{ spellName = GetSpellName(12867), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Deep Wounds
			{ spellName = GetSpellName(1715), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Hamstring
			{ spellName = GetSpellName(676), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Disarm
			{ spellName = GetSpellName(12323), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Piercing Howl
			{ spellName = GetSpellName(46910), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Furious Attacks
			{ spellName = GetSpellName(12294), size = 26, scale = 1, unitId = "target", caster = "player", filter = "DEBUFF", barWidth = 104 }, --Mortal Strike
		},
		{
			Name = "Cooldowns",
			Direction = "UP",
			Spacing = 3,
			Mode = "BAR",
			
			{ spellName = 13, size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = 14, size = 26, scale = 1, filter = "CD", barWidth = 104 },
			{ spellName = GetSpellName(23881), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Bloodthirst
			{ spellName = GetSpellName(12292), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Death Wish
			{ spellName = GetSpellName(871), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Shield Wall	
			{ spellName = GetSpellName(23920), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Spell Reflection
			{ spellName = GetSpellName(1719), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Recklessness
			{ spellName = GetSpellName(18499), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Berserker Rage
			{ spellName = GetSpellName(23922), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Shield Slam
			{ spellName = GetSpellName(1380), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Whirlwind
			{ spellName = GetSpellName(12294), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Mortal Strike
			{ spellName = GetSpellName(6343), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Thunder Clap
			{ spellName = GetSpellName(6572), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Revenge
			{ spellName = GetSpellName(7384), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Overpower
			{ spellName = GetSpellName(6552), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Pummel
			{ spellName = GetSpellName(72), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Shield Bash
			{ spellName = GetSpellName(100), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Charge
			{ spellName = GetSpellName(20252), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Intercept
			{ spellName = GetSpellName(3411), size = 26, scale = 1, filter = "CD", barWidth = 104 }, --Intervene
		},
	},
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
			bar = CreateFrame("Frame", "iFilgerAnchor"..id.."Frame"..index, self);
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
				bar.statusbar:SetStatusBarTexture("Interface\\AddOns\\iFilger\\media\\flat");
				bar.statusbar:SetBackdrop({ bgFile = "Interface\\ChatFrame\\ChatFrameBackground", edgeFile = "", insets = { left = -1, right = -1, top = -1, bottom = -1 }});
				bar.statusbar:SetStatusBarColor(0.25, 0.25, 0.25, 1);
				bar.statusbar:SetBackdropColor(0, 0, 0, 1);
				bar.statusbar:SetPoint("LEFT", bar, "RIGHT");
				bar.statusbar:SetMinMaxValues(0, 1);
				bar.statusbar:SetValue(0);
				bar.statusbar.background = bar.statusbar:CreateTexture(nil, "BACKGROUND");
				bar.statusbar.background:SetAllPoints();
				bar.statusbar.background:SetTexture("Interface\\AddOns\\iFilger\\media\\flat");
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
		
		frame = CreateFrame("Frame", "iFilgerAnchor"..i, UIParent);
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
			frame.text:SetText(data.Name and data.Name or "iFilgerAnchor"..i);
			
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