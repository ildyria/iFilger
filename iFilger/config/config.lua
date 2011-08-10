﻿local I, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

C["general"] = {
	["autoscale"] = false,                               -- mainly enabled for users that don't want to mess with the config file
	["uiscale"] = 1,                                 -- set your value (between 0.64 and 1) of your uiscale if autoscale is off
	["multisampleprotect"] = true,                      -- i don't recommend this because of shitty border but, voila!
	["backdropcolor"] = { .1,.1,.1 },                   -- default backdrop color of panels
	["bordercolor"] = { .6,.6,.6 },                     -- default border color of panels
	["configmode"] = false, 								-- enter in iFilger config mode : display buffs
}

C["cooldown"] = {
	["enable"] = true,                                  -- do i really need to explain this?
	["treshold"] = 8,                                   -- show decimal under X seconds and text turn red
}

C["Filger_Spells"] = {
	["DEATHKNIGHT"] = {
		{
			Name = "Cooldown",
			Direction = "UP",
			Interval = 3,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "BOTTOMRIGHT", "iFilgerCooldowns", 40, 0 },

			{ spellID = 45529, size = 37, filter = "CD" }, --Blood Tap
			{ spellID = 56222, size = 37, filter = "CD" }, --Dark Command
			{ spellID = 48743, size = 37, filter = "CD" }, --Death Pact
			{ spellID = 47528, size = 37, filter = "CD" }, --Mind Freeze
			{ spellID = 48792, size = 37, filter = "CD" }, --Icebound Fortitude
			{ spellID = 47568, size = 37, filter = "CD" }, --Empower Rune Weapon
			{ spellID = 49184, size = 37, filter = "CD" }, --Howling Blast
			{ spellID = 49576, size = 37, filter = "CD" }, --Death Grip
			{ spellID = 46584, size = 37, filter = "CD" }, --Raise Dead
			{ spellID = 48707, size = 37, filter = "CD" }, --Anti-Magic Shell
			{ spellID = 43265, size = 37, filter = "CD" }, --Death and Decay
			{ spellID = 55233, size = 37, filter = "CD" }, --Vampiric Blood
			{ spellID = 49028, size = 37, filter = "CD" }, --Dancing Rune Weapon
			{ spellID = 49039, size = 37, filter = "CD" }, --Lichborne
			{ spellID = 51052, size = 37, filter = "CD" }, --Anti-Magic Zone
			{ spellID = 49206, size = 37, filter = "CD" }, --Summon Gargoyle
			{ spellID = 77575, size = 37, filter = "CD" }, --Outbreak
			{ spellID = 77606, size = 37, filter = "CD" }, --Dark Simulacrum
		},	
		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "BOTTOMLEFT", "iFilgerBuffDebuff", 0, 24 },
			
			{ spellID = 59052, size = 37, unitId = "player", caster = "all", filter = "BUFF" }, --Freezing Fog
			{ spellID = 49509, size = 37, unitId = "player", caster = "all", filter = "BUFF" }, --Scent of Blood
			{ spellID = 55233, size = 37, unitId = "player", caster = "all", filter = "BUFF" }, --Vampiric Blood
			{ spellID = 49501, size = 37, unitId = "player", caster = "all", filter = "BUFF" }, --Blade Barrier
			{ spellID = 50887, size = 37, unitId = "player", caster = "all", filter = "BUFF" }, --Icy Talons
			{ spellID = 49039, size = 37, unitId = "player", caster = "all", filter = "BUFF" }, --Lichborne
			{ spellID = 3714, size = 37, unitId = "player", caster = "all", filter = "BUFF" }, --Path of Frost
			{ spellID = 59052, size = 37, unitId = "player", caster = "all", filter = "BUFF" }, --Freezing Fog
			{ spellID = 47476, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" }, --Strangulate
			{ spellID = 45524, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" }, --Chains of Ice
			{ spellID = 59921, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" }, --Frost Fever
			{ spellID = 43265, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" }, --Death and Decay
			{ spellID = 59879, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" }, --Blood Plague
			{ spellID = 49194, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" }, --Unholy Blight

		},
		{
			Name = "DK Procs",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "BOTTOMLEFT", "iFilgerProcs", 0, -63 },

			--Sudden Doom
			{ spellID = 49530, size = 60, unitId = "player", caster = "all", filter = "BUFF" },
			--Crimson Scourge
			{ spellID = 81135, size = 60, unitId = "player", caster = "all", filter = "BUFF" },
			--Killing Machine
			{ spellID = 51128, size = 60, unitId = "player", caster = "all", filter = "BUFF" }, 

		},
		},
	["MAGE"] = { -------------------------------------------------------------------------------------------------------- Mage
		{
			Name = "Cooldown",
			Direction = "UP",
			Interval = 3,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "BOTTOMRIGHT", "iFilgerCooldowns", 40, 0 },

			-- Water Elemental Freeze
			{ spellID = 33395, size = 37, filter = "CD" },
			-- Blast Wave
			{ spellID = 11113, size = 37, filter = "CD" },
			--Counterspell
			{ spellID = 2139, size = 37, filter = "CD" }, 
			--Flame Orb
			{ spellID = 82731, size = 37, filter = "CD" }, 
			--Mage Ward
			{ spellID = 543, size = 37, filter = "CD" }, 
		},	
		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "BOTTOMLEFT", "iFilgerBuffDebuff", 0, 24 },
			
			-- Frostfire Bolt aka Glyph of Frostfire
--			{ spellID = 44614, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			--Slow
			{ spellID = 31589, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			--Icy Veins
			{ spellID = 12472, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			--Arcane Power
			{ spellID = 12042, size = 37, unitId = "player", caster = "all", filter = "BUFF" },
			--Ice Block
			{ spellID = 45438, size = 37, unitId = "player", caster = "player", filter = "BUFF" }, 
			--Invisibility
			{ spellID = 66, size = 37, unitId = "player", caster = "all", filter = "BUFF" }, 
			--Pyromaniac
			{ spellID = 34295, size = 37, unitId = "player", caster = "all", filter = "BUFF" }, 
			--Pyroblast
			{ spellID = 11366, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" }, 
			--Pyroblast!
			{ spellID = 92315, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" }, 
			--Living Bomb
			{ spellID = 44457, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" }, 
			--Ignite
			{ spellID = 12846, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" }, 
			--Impact
			{ spellID = 12357, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" }, 
			--Combustion
			{ spellID = 11129, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" }, 
			--Scorch aka Critical Mass
			{ spellID = 12873, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			--Freeze
			{ spellID = 33395, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" }, 
		},
		{
			Name = "Mage Procs",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "BOTTOMLEFT", "iFilgerProcs", 0, -63 },
			
			--Clearcasting
			{ spellID = 12536, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			--Missiles
			{ spellID = 79683, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			--Brain Freeze
			{ spellID = 57761, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Impact
			{ spellID = 64343, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			--Hot Streak(improved)
			{ spellID = 44448, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			--Hot Streak
			{ spellID = 44445, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			--Arcane Blast
			{ spellID = 30451, size = 60, unitId = "player", caster = "player", filter = "DEBUFF" },
			--Fingers Of Frost
            { spellID = 83074, size = 60, unitId = "player", caster = "player", filter = "BUFF"},
			--Blazing Speed
			{ spellID = 31642, size = 60, unitId = "player", caster = "all", filter = "BUFF" },
		},
		{
			Name = "Focus",  
			Direction = "LEFT",
			Interval = 2,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "TOPRIGHT", "iFilgerFocusBuffs", 0, -22 },
			
			-- Sheep mage
            { spellID = 118, size = 36, unitId = "focus", caster = "player", filter = "DEBUFF" },
			-- Remedy - Maloriak 
			{ spellID = 92967, size = 36, unitId = "focus", caster = "all", filter = "BUFF" },	
			-- Converted Power - Arcanotron
            { spellID = 79735, size = 36, unitId = "focus", caster = "all", filter = "BUFF" },
		},
	},
	["PRIEST"] = { -------------------------------------------------------------------------------------------------------- Priest
		{
			Name = "P_BUFF_ICON",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "BOTTOMRIGHT", "iFilgerBuffPlayerHeal", 0, 24 },

			-- Inner Fire / Inneres Feuer
			 { spellID = 588, size = 32, unitId = "player", caster = "player", filter = "BUFF" },
			-- Inner Will / Innerer Wille
			{ spellID = 73413, size = 32, unitId = "player", caster = "player", filter = "BUFF" },
			-- Fear Ward / Furchtzauberschutz
			{ spellID = 6346, size = 32, unitId = "player", caster = "player", filter = "BUFF" },

		},
		{
			Name = "Cooldown",
			Direction = "UP",
			Interval = 3,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "BOTTOMRIGHT", "iFilgerCooldowns", 40, 0 },

			--Dispersion
			{ spellID = 47585, size = 37, filter = "CD" }, 
			--Guardian Spirit
			{ spellID = 47788, size = 37, filter = "CD" }, 
			--Holy Word: Sanctuary
			{ spellID = 88686, size = 37, filter = "CD" }, 
			--Inner Focus
			{ spellID = 89485, size = 37, filter = "CD" }, 
			--Penance
			{ spellID = 47540, size = 37, filter = "CD" }, 
			--Circle of Healing
			{ spellID = 34861, size = 37, filter = "CD" },
			--Prayer of Mending
			{ spellID = 33076, size = 37, filter = "CD" },
			--Psychic Scream
			{ spellID = 8122, size = 37, filter = "CD" }, 

		},	
		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "BOTTOMLEFT", "iFilgerBuffDebuff", 0, 24 },

			-- Guardian Spirit
			{ spellID = 47788, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Pain Suppression
			{ spellID = 33206, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Renew
			{ spellID = 139, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Power Word: Shield
			{ spellID = 17, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Inner Focus
			{ spellID = 89485, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Strength of Soul
			{ spellID = 96267, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Empowered Shadow / Machterfüllte Schatten
			{ spellID = 95799, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Fade / Verblassen
			{ spellID = 586, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			
			-- Chakra: Serenity
			{ spellID = 81208, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Chakra: Sanctuary
			{ spellID = 81206, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Chakra: Chastise
			{ spellID = 81209, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
		},
	    {
			Name = "Priest Procs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "BOTTOMLEFT", "iFilgerProcs", 0, -63 },

			-- Surge of Light
			{ spellID = 88688, size = 60, unitId = "player", caster = "all", filter = "BUFF" },
			-- Serendipity
			{ spellID = 63735, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shadow Orb
			{ spellID = 77487, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Archangel
			{ spellID = 81700, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Evangelism
			{ spellID = 81662, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Dark Archangel
			{ spellID = 87153, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Dark Evangelism
			{ spellID = 87118, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Dispersion
			{ spellID = 47585, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
		},	
		{
			Name = "Buffs and Debuffs HEAL",
			Direction = "LEFT",
			Interval = 3,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "TOPRIGHT", "iFilgerBuffDebuffHeal", 20, -22 },

			-- Prayer of Mending / Gebet der Besserung
			{ spellID = 41635, size = 37, unitId = "target", caster = "player", filter = "BUFF" },
			-- Guardian Spirit / Schutzgeist
			{ spellID = 47788, size = 37, unitId = "target", caster = "player", filter = "BUFF" },
			-- Pain Suppression / Schmerzunterdrückung
			{ spellID = 33206, size = 37, unitId = "target", caster = "player", filter = "BUFF" },
			-- Power Word: Shield / Machtwort: Schild
			{ spellID = 17, size = 37, unitId = "target", caster = "player", filter = "BUFF" },
			-- Renew / Erneuerung
			{ spellID = 139, size = 37, unitId = "target", caster = "player", filter = "BUFF" },
			-- Fear Ward / Furchtzauberschutz
			{ spellID = 6346, size = 37, unitId = "target", caster = "player", filter = "BUFF" },
			-- Echo of Light / Echo des Lichts
			{ spellID = 77489, size = 37, unitId = "target", caster = "player", filter = "BUFF" },
			-- Inspiration / Inspiration
			{ spellID = 15357, size = 37, unitId = "target", caster = "player", filter = "BUFF" },
			-- Grace / Barmherzigkeit
			{ spellID = 77613, size = 37, unitId = "target", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs DPS",
			Direction = "LEFT",
			Interval = 3,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "BOTTOMRIGHT", "iFilgerBuffDebuffDps", 20, 22 },

			-- Shackle undead
			{ spellID = 9484, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Psychic Scream
			{ spellID = 8122, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Shadow Word: Pain
			{ spellID = 589, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Devouring Plague
			{ spellID = 2944, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Vampiric Touch
			{ spellID = 34914, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
		{
			Name = "F/DEBUFF_BAR",
			Direction = "LEFT",
			IconSide = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "TOPRIGHT", "iFilgerFocusBuffs", 0, -22 },

			-- Shackle Undead / Untote fesseln
			{ spellID = 9484, size = 32, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Psychic Scream / Psychischer Schrei
			{ spellID = 8122, size = 32, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
		},
	},
	["WARLOCK"] = { -------------------------------------------------------------------------------------------------------- Warlock
		{
			Name = "Warlock Procs",
			Direction = "DOWN",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "TOP", "iFilgerProcs", -0, -23 },

			-- Demon Soul: Imp
			{ spellID = 79459, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Demon Soul: Felguard
			{ spellID = 79462, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Demon Soul: Felhunter
			{ spellID = 79460, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Eradication
			{ spellID = 64371, size = 37, unitId = "player", caster = "player", filter = "BUFF" },	
			--Devious Minds
			{ spellID = 70840, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Improved Soul Fire
			{ spellID = 85383, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Molten Core
			{ spellID = 47247, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Decimation
			{ spellID = 63158, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Backdraft
			{ spellID = 47258, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Backlash
			{ spellID = 34936, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Nether Protection
			{ spellID = 30301, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Nightfall
			{ spellID = 18095, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Burning Soul
			{ spellID = 84254, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			--Empowered Imp
			{ spellID = 47283, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			--Shadow Trance
			{ spellID = 17941, size = 37, unitId = "player", caster = "player", filter = "BUFF" },			
			-- Soulburn / Seelenbrand
			{ spellID = 74434, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "BOTTOMLEFT", "iFilgerTargetCCDebuff", 0, 22},

			-- Fear
			{ spellID = 5782, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Banish
			{ spellID = 710, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Curse of the Elements
			{ spellID = 1490, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Curse of Tongues
			{ spellID = 1714, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Curse of Exhaustion
			{ spellID = 18223, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Bane of Agony
			{ spellID = 980, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Bane of Doom
			{ spellID = 603, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Unstable Affliction
			{ spellID = 30108, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Shadow Embrace
			{ spellID = 32395, size = 37, unitId = "target", caster = "player", filter = "BUFF" },
			-- Corruption
			{ spellID = 172, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Immolate
			{ spellID = 348, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "BOTTOMRIGHT", "iFilgerTargetDoTDebuff", 58, 22},
			
			-- Curse of Weakness
			{ spellID = 702, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Haunt
			{ spellID = 48181, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Seed of Corruption
			{ spellID = 27243, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Howl of Terror
			{ spellID = 5484, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Death Coil
			{ spellID = 6789, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Enslave Demon
			{ spellID = 1098, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Demon Charge
			{ spellID = 54785, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Curse of Gul'dan
			{ spellID = 86000, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
        {
			Name = "Cooldown",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "BOTTOMRIGHT", "iFilgerCooldown", 0, 22 },

			-- Soul Shatter
			{ spellID = 29858, size = 33, "player", caster = "player", filter = "CD" },
			-- Death Coil
			{ spellID = 6789, size = 33, "player", caster = "player", filter = "CD" },
			-- Demonic Circle: Teleport
			{ spellID = 48020, size = 33, "player", caster = "player", filter = "CD" },
			-- SoulBurn
			{ spellID = 74434, size = 33, "player", caster = "player", filter = "CD" },
			-- Demon Soul
			{ spellID = 77801, size = 33, "player", caster = "player", filter = "CD" },
			-- Infernal
			{ spellID = 1122, size = 33, "player", caster = "player", filter = "CD" },
			-- Soul Harvest
			{ spellID = 79268, size = 33, "player", caster = "player", filter = "CD" },
		},
		{
			Name = "F/DEBUFF_BAR",
			Direction = "LEFT",
--			IconSide = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "TOPRIGHT", "iFilgerFocusBuffs", 0, -22 },

			-- Fear / Furcht
			{ spellID = 5782, size = 32, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Banish / Verbannen
			{ spellID = 710, size = 32, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
		},
	},
	["DRUID"] = { -------------------------------------------------------------------------------------------------------- Druid
		{
			Name = "COOLDOWN",
			Direction = "UP",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "BOTTOMRIGHT", "iFilgerCooldowns", 40, 0 },

			-- Starsurge / Sternensog
			{ spellID = 78674, size = 32, filter = "CD" },
			-- Starfall / Sternenregen
			{ spellID = 48505, size = 32, filter = "CD" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "BOTTOMRIGHT", "iFilgerBuffPlayerHeal", 0, 24 },

			-- Lifebloom
			{ spellID = 33763, size = 32, unitId = "player", caster = "player", filter = "BUFF" },
			-- Rejuvenation
			{ spellID = 774, size = 32, unitId = "player", caster = "player", filter = "BUFF" },
			-- Regrowth
			{ spellID = 8936, size = 32, unitId = "player", caster = "player", filter = "BUFF" },
			-- Wild Growth
			{ spellID = 48438, size = 32, unitId = "player", caster = "player", filter = "BUFF" },
			-- Starfall / Sternenregen
			{ spellID = 48505, size = 32, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "BOTTOMLEFT", "iFilgerBuffTargetHeal", 0, 24 },

			-- Lifebloom
			{ spellID = 33763, size = 32, unitId = "target", caster = "player", filter = "BUFF" },
			-- Rejuvenation
			{ spellID = 774, size = 32, unitId = "target", caster = "player", filter = "BUFF" },
			-- Regrowth
			{ spellID = 8936, size = 32, unitId = "target", caster = "player", filter = "BUFF" },
			-- Wild Growth
			{ spellID = 48438, size = 32, unitId = "target", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Druid Procs",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "BOTTOMLEFT", "iFilgerProcs", 0, -63 },

			-- Nature's Grace
			{ spellID = 16886, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Harmony / Harmonie (Healer Mastery Buff / Heiler Meisterschaftsbuff)
			{ spellID = 100977, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Eclipse (Lunar) / Mondfinsternis
			{ spellID = 48518, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Eclipse (Solar) / Sonnenfinsternis
			{ spellID = 48517, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shooting Stars / Sternschnuppen
			{ spellID = 93400, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Savage Roar / Wildes Brüllen
			{ spellID = 52610, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Puverize / Puverisieren
			{ spellID = 80951, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Survival Instincts / Überlebensinstinkte
			{ spellID = 61336, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Tree of Life / Baum des Lebens
			{ spellID = 33891, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Clearcasting / Freizaubern
			{ spellID = 16870, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Innervate / Anregen
			{ spellID = 29166, size = 36, unitId = "player", caster = "all", filter = "BUFF" },
			-- Barkskin / Baumrinde
			{ spellID = 22812, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Owlkin Frenzy / Eulkin Raserei
			{ spellID = 48391, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Lunar Shower / Mondregen
			{ spellID = 81192, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Predetor's Swiftness
			{ spellID = 69369, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Stampede
			{ spellID = 81022, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Berserk
			{ spellID = 50334, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Tiger's Fury
			{ spellID = 5217, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Glyph of Barkskin
			{ spellID = 63058, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "LEFT",
			Interval = 3,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "TOPRIGHT", "iFilgerTargetDebuff", 0, -24 },

			-- Maim
			{ spellID = 22570, size = 36, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Hibernate
			{ spellID = 2637, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Entangling Roots
			{ spellID = 339, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Cyclone
			{ spellID = 33786, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Moonfire
			{ spellID = 8921, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Sunfire
			{ spellID = 93402, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Insect Swarm
			{ spellID = 5570, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Rake
			{ spellID = 1822, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Rip
			{ spellID = 1079, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Lacerate
			{ spellID = 33745, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Pounce Bleed
			{ spellID = 9007, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Mangle
			{ spellID = 33876, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Earth and Moon
			{ spellID = 48506, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Faerie Fire
			{ spellID = 770, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Infected Wounds
			{ spellID = 58180, size = 36, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Pounce 
			{ spellID = 9005, size = 36, unitId = "target", caster = "all", filter = "DEBUFF" },
		},
		{
			Name = "F/DEBUFF_BAR",
			Direction = "LEFT",
--			IconSide = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "TOPRIGHT", "iFilgerFocusBuffs", 0, -22 },

			-- Hibernate / Winterschlaf
			{ spellID = 2637, size = 32, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Entangling Roots / Wucherwurzeln
			{ spellID = 339, size = 32, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Cyclone / Wirbelsturm
			{ spellID = 33786, size = 32, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
		},
	},
	["HUNTER"] = { -------------------------------------------------------------------------------------------------------- Hunter
		{
			Name = "Cooldown",
			Direction = "UP",
			Interval = 3,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "BOTTOMRIGHT", "iFilgerCooldowns", 40, 0 },

			-- Rapid Fire
			{ spellID = 3045, size = 37, filter = "CD" },
			-- Feign Death
			{ spellID = 5384, size = 37, filter = "CD" },
		},	
		{
			Name = "Hunter Procs",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "BOTTOMLEFT", "iFilgerProcs", 0, -63 },

			-- Lock and Load
			{ spellID = 56453, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Quick Shots
			{ spellID = 6150, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Improved Steady Shot
			{ spellID = 53224, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Rapid Fire
			{ spellID = 3045, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Sic'Em
			{ spellID = 89388, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Ready, Set, Aim / Auf die Plätze, Fertig, Zielen
			{ spellID = 82925, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Fire! / Feuer!
			{ spellID = 82926, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Master Tactician / Meister der Taktik
			{ spellID = 34837, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Call of the Wild / Ruf der Wildnis
			{ spellID = 53434, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			},
		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "BOTTOMLEFT", "iFilgerBuffDebuff", 0, 24 },

			-- Wyvern Sting
			{ spellID = 19386, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Silencing Shot
			{ spellID = 34490, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Serpent Sting
			{ spellID = 1978, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Widow Venom / Witwentoxin
			{ spellID = 82654, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Black Arrow
			{ spellID = 3674, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Explosive Shot
			{ spellID = 53301, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Hunter's Mark
			{ spellID = 1130, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Piercing Shots 
			{ spellID = 63468, size = 36, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Sniper Training / Scharfschützenübung
			{ spellID = 64420, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "F/DEBUFF_BAR",
			Direction = "LEFT",
			IconSide = "LEFT",
			Interval = 4,
			Mode = "BAR",
			setPoint = { "TOPRIGHT", "iFilgerFocusBuffs", 0, -22 },

			-- Wyvern Sting / Wyverngift
			{ spellID = 19386, size = 32, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Silencing Shot / Unterdrückender Schuss
			{ spellID = 34490, size = 32, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
		},
	},	
	["ROGUE"] = { -------------------------------------------------------------------------------------------------------- Rogue
		{
			Name = "Cooldowns",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "TOPLEFT", "iFilgerCooldowns", 0, -22 },

			-- Sprint
			{ spellID = 2983, size = 37, filter = "CD" },
			-- Cloak of Shadows
			{ spellID = 31224, size = 37, filter = "CD" },
			-- Tricks of the Trade
			{ spellID = 57934, size = 37, filter = "CD" },
			-- Kidney Shot
			{ spellID = 408, size = 37, filter = "CD" },
			-- ShadowStep
			{ spellID = 36554, size = 37, filter = "CD" },
			-- Shadow Dance
			{ spellID = 51713, size = 37, filter = "CD" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "BOTTOMRIGHT", "iFilgerPlayerBuff", 0, 22 },

			-- Sprint
			{ spellID = 2983, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Cloak of Shadows
			{ spellID = 31224, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Adrenaline Rush
			{ spellID = 13750, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Evasion
			{ spellID = 5277, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Envenom
			{ spellID = 32645, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Overkill
			{ spellID = 58426, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Slice and Dice
			{ spellID = 5171, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Tricks of the Trade
			{ spellID = 57934, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Turn the Tables
			{ spellID = 51627, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shadow Dance
			{ spellID = 51713, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Killing Spree
			{ spellID = 51690, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "BOTTOMLEFT", "iFilgerTargetDebuff", 0, 22 },

			-- Cheap shot
			{ spellID = 1833, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Kidney shot
			{ spellID = 408, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Blind
			{ spellID = 2094, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Sap
			{ spellID = 6770, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Rupture
			{ spellID = 1943, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Garrote
			{ spellID = 703, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Gouge
			{ spellID = 1776, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Expose Armor
			{ spellID = 8647, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Dismantle
			{ spellID = 51722, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Deadly Poison / Tödliches Gift
			{ spellID = 2818, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Mind-numbing Poison / Gedankenbenebelndes Gift
			{ spellID = 5760, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Crippling Poison / Verkrüppelndes Gift
			{ spellID = 3409, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Wound Poison / Wundgift
			{ spellID = 13218, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Find Weakness
			{ spellID = 91023, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Hemorrhage
			{ spellID = 16511, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Glyph of Hemorrhage 
			{ spellID = 56807, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Vendetta
			{ spellID = 79140, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
		{
			Name = "F/DEBUFF_BAR",
			Direction = "LEFT",
--			IconSide = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "LEFT", "iFilgerFocusBuffs", "LEFT", 0, 0 },

			-- Blind / Blenden
			{ spellID = 2094, size = 32, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Sap / Kopfnuss
			{ spellID = 6770, size = 32, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Gouge / Solarplexus
			{ spellID = 1776, size = 32, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
		},
    },		
	["SHAMAN"] = { -------------------------------------------------------------------------------------------------------- Shaman
		{
			Name = "P_BUFF_ICON",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "BOTTOMRIGHT", "iFilgerBuffPlayerHeal", 0, 24 },

			-- Earth Shield / Erdschild
			{ spellID = 974, size = 32, unitId = "player", caster = "player", filter = "BUFF" },
			-- Riptide / Springflut
			{ spellID = 61295, size = 32, unitId = "player", caster = "player", filter = "BUFF" },
			-- Lightning Shield / Blitzschlagschild
			{ spellID = 324, size = 32, unitId = "player", caster = "player", filter = "BUFF" },
			-- Water Shield / Wasserschild
			{ spellID = 52127, size = 32, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "T_BUFF_ICON",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "BOTTOMLEFT", "iFilgerBuffTargetHeal", 0, 24 },

			-- Earth Shield / Erdschild
			{ spellID = 974, size = 32, unitId = "target", caster = "player", filter = "BUFF" },
			-- Riptide / Springflut
			{ spellID = 61295, size = 32, unitId = "target", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Cooldown",
			Direction = "UP",
			Interval = 3,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "BOTTOMRIGHT", "iFilgerCooldowns", 40, 0 },

			--Stoneclaw Totem
			{ spellID = 5730, size = 37, filter = "CD" },
			-- Grounding Totem
			{ spellID = 8177, size = 37, filter = "CD" },
			-- Unleash Elements
			{ spellID = 73680, size = 37, filter = "CD" },
			-- Shamanistic Rage
			{ spellID = 30823, size = 37, filter = "CD" },
		},	
		{
			Name = "Shaman Procs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "BOTTOMLEFT", "iFilgerProcs", 0, -63 },

			-- Maelstorm Weapon
			{ spellID = 53817, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Clearcasting
			{ spellID = 16246, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Tidal Waves
			{ spellID = 51562, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Focused Insight
			{ spellID = 77796, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Unleash Life
			{ spellID = 73685, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "BOTTOMLEFT", "iFilgerBuffDebuff", 0, 24 },

			-- Shamanistic Rage
			{ spellID = 30823, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Elemental Mastery
			{ spellID = 16166, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Totem
			{ spellID = 77661, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Hex
			{ spellID = 51514, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Bind Elemental / Elementar binden
			{ spellID = 76780, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Storm Strike
			{ spellID = 17364, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Earth Shock
			{ spellID = 8042, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Frost Shock
			{ spellID = 8056, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Flame Shock
			{ spellID = 8050, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Spiritwalker's Grace
			{ spellID = 79206, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "F/DEBUFF_BAR",
			Direction = "LEFT",
--			IconSide = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "TOPRIGHT", "iFilgerFocusBuffs", 0, -22 },

			-- Earth Shield / Erdschild
			{ spellID = 974, size = 32, unitId = "focus", caster = "player", filter = "BUFF" },
			-- Hex / Verhexen
			{ spellID = 51514, size = 32, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Bind Elemental / Elementar binden
			{ spellID = 76780, size = 32, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
		},
	},	
	["PALADIN"] = { -------------------------------------------------------------------------------------------------------- Paladin
			{
			Name = "Buffs and Debuffs",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "BOTTOMRIGHT", "iFilgerBuffPlayerHeal", 0, 24 },

			-- Beacon of Light -- player
			{ spellID = 53563, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			},
			{
			Name = "Beacon of Light",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "TOPRIGHT", "iFilgerFocusBuffs", 0, -22 },

			-- Beacon of Light -- player
			{ spellID = 53563, size = 37, unitId = "focus", caster = "player", filter = "BUFF" },
			-- Hammer of Justice / Hammer der Gerechtigkeit
			{ spellID = 853, size = 37, unitId = "focus", caster = "all", filter = "DEBUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "BOTTOMLEFT", "iFilgerBuffDebuff", 0, 24 },
 
			-- Long Arm of the Law
			{ spellID = 87173, size = 37, unitId = "player", caster = "all", filter = "BUFF" },
			-- Beacon of Light -- target
			{ spellID = 53563, size = 37, unitId = "target", caster = "player", filter = "BUFF" },
			-- Judgements of the Pure
			{ spellID = 53657, size = 37, unitId = "player", caster = "all", filter = "BUFF" },
			-- Judgements of the Just
			{ spellID = 68055, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Hammer of Justice
			{ spellID = 853, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Seal of Truth Aka Censure
			{ spellID = 31803, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Divine Illumination
			{ spellID = 31842, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Divine Plea
			{ spellID = 54428, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Holy Shield
			{ spellID = 20925, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Inquisition
			{ spellID = 84963, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Zealotry
			{ spellID = 85696, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Avenging Wrath
			{ spellID = 31884, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Paladin Procs",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "BOTTOMLEFT", "iFilgerProcs", 0, -63 },

			-- Grand Crusader
			{ spellID = 85416, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Sacred Duty
			{ spellID = 85433, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Daybreak
			{ spellID = 88819, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Infusion of Light
			{ spellID = 53672, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Crusader
			{ spellID = 94686, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Art of War
			{ spellID = 87138, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Hand of Light 
			{ spellID = 90174, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
		},
	},
	["WARRIOR"] = {  -------------------------------------------------------------------------------------------------------- Warrior
		{
			Name = "Warrior Procs",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "BOTTOMLEFT", "iFilgerProcs", 0, -63 },

			-- Sudden Death
			{ spellID = 52437, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Slam!
			{ spellID = 46916, size = 60, unitId = "player", caster = "all", filter = "BUFF" },
			-- Sword and Board
			{ spellID = 50227, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Blood Reserve
			{ spellID = 64568, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Victorious
			{ spellID = 32216, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Spell Reflection / Zauberreflexion
			{ spellID = 23920, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Victory Rush / Siegesrausch
			{ spellID = 34428, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shield Block / Schildblock
			{ spellID = 2565, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Last Stand / Letztes Gefecht
			{ spellID = 12975, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shield Wall / Schildwall
			{ spellID = 871, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Deadly Calm
			{ spellID = 85730, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Inner Rage
			{ spellID = 1134, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "T_DEBUFF_ICON",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "BOTTOMLEFT", "iFilgerBuffDebuff", 0, 24 },

			-- Hamstring
			{ spellID = 1715, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Rend
			{ spellID = 94009, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Sunder Armor
			{ spellID = 7386, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Thunder Clap
			{ spellID = 6343, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Demoralizing Shout
			{ spellID = 1160, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Demoralizing Roar
			{ spellID = 99, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Curse of Weakness
			{ spellID = 702, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Expose Armor
			{ spellID = 8647, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Infected Wounds
			{ spellID = 48484, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Charge Stun / Sturmangriffsbetäubung
			{ spellID = 7922, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Throwdown Stun
			{ spellID = 85388, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Shockwave / Schockwelle
			{ spellID = 46968, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Improved Hamstring / Verbesserte Kniesehne
			{ spellID = 23694, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Colossus Smash
			{ spellID = 86346, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
    },		
-----------------------------------------------------------------------------------------------------------------------
-- dont touch anything below or else ill ass rape you aight!
-----------------------------------------------------------------------------------------------------------------------	
	["ALL"] = {
		{
			Name = "Cataclysm debuff list by jasje", -- taken from aurawatch.lua
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,			
			setPoint = { "BOTTOMRIGHT", "iFilgerPveDeBuffs", 0, 22 },
			
-- Baradin Hold
			-- Consuming Darkness
            { spellID = 95173, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Meteor Slash / Meteorschlag (Argaloth)
			{ spellID = 88942, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
-- Blackwing Descent
		-- Magmaw
			-- Constricting Chains
            { spellID = 91911, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Parasitic Infection
            { spellID = 94679, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Mangle
            { spellID = 94617, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Omintron Defense System	
			-- Poison Soaked Shell	
	        { spellID = 79835, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Lightning Conductor
			{ spellID = 91433, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Incineration Security Measure
			{ spellID = 91521, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Power Conversion - Arcanotron
            { spellID = 79729, size = 47, unitId = "focus", caster = "all", filter = "BUFF" },
		-- Maloriak	
			-- Flash Freeze
			{ spellID = 77699, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Biting Chill
			{ spellID = 77760, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Dark Sludge
			{ spellID = 92988, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- remedy -- for spellsteal 
			{ spellID = 77912, size = 47, unitId = "target", caster = "all", filter = "BUFF" },
			-- remedy -- for spellsteal  - focus
			{ spellID = 77912, size = 47, unitId = "focus", caster = "all", filter = "BUFF" },
		-- Atramedes
			-- Searing Flame
			{ spellID = 92423, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Roaring Flame
			{ spellID = 92485, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Sonic Breath
			{ spellID = 92407, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Chimaeron	
			-- Break
			{ spellID = 82881, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Low Health
			{ spellID = 89084, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Nefarian	
			-- Shadow Conductor / Schattenleiter (Nefarian)
			{ spellID = 92053, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
-- The Bastion of Twilight
		--Valiona & Theralion
			-- Blackout
			{ spellID = 92878, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Devouring Flames
			{ spellID = 86840, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Engulfing Magic
			{ spellID = 86840, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Twilight Meteorite
			{ spellID = 86013, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Halfus Wyrmbreaker	
		    -- Malevolent Strikes
			{ spellID = 39171, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Twilight Ascendant Council
			-- Burning Blood
			{ spellID = 82662, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Hydro Lance
			{ spellID = 92511, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Waterlogged
			{ spellID = 82762, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Frozen
			{ spellID = 92505, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Flame Torrent
			{ spellID = 92518, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Lightning Rod
			{ spellID = 83099, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Gravity Core
			{ spellID = 92075, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Gravity Crush
			{ spellID = 92488, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Cho'gall	
			-- Corruption: Accelerated
			{ spellID = 81836, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Corruption: Malformation
			{ spellID = 82125, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Corruption: Absolute
			{ spellID = 82170, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Corruption: Sickness
			{ spellID = 93200, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
		    -- Cho's Blast
		    { spellID = 86028, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Gall's Blast
		    { spellID = 86029, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
-- Throne of the Four Winds
	-- Conclave of Wind
		-- Nezir <Lord of the North Wind>
			-- Wind Chill
			{ spellID = 93123, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Ice Patch
			{ spellID = 93131, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Anshal <Lord of the West Wind>
			-- Soothing Breeze
			{ spellID = 86206, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Toxic Spores
			{ spellID = 93122, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Rohash <Lord of the East Wind>
			-- Slicing Gale
			{ spellID = 93058, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Al'Akir
			-- Ice Storm
			{ spellID = 93260, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Lightning Rod
			{ spellID = 93295, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Static Shock / Statischer Schock (Al'Akir)
			{ spellID = 87873, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Acid Rain / Säureregen (Al'Akir)
			{ spellID = 93279, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
--      [[ INCOMPLETE ]] --
-- Firelands
        --Trash
			-- Melt Armor
			{ spellID = 99532, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },		
        --Shannox
            -- Magma Rupture
            { spellID = 99840, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
            -- Crystal Prison Trap 
            { spellID = 99837, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
            -- Jagged Tear
            { spellID = 99936, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Lord Rhyolith	
            -- Eruption
            { spellID = 98492, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Alysrazor	
            -- Molten Feather
            { spellID = 97128, size = 47, unitId = "player", caster = "all", filter = "BUFF" },
            -- Wings of Flame
            { spellID = 98619, size = 47, unitId = "player", caster = "all", filter = "BUFF" },
            -- Blazing Power
            { spellID = 99461, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
            -- Alysra's Razor
            { spellID = 100029, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Beth'tilac	
            -- The Widow's Kiss
            { spellID = 99476, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Fixate (Heroic)
			{ spellID = 99526, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Volatile Poison (Heroic)
			{ spellID = 99278, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Baleroc	
            -- Torment
            { spellID = 99256, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
            -- Tormented
            { spellID = 99257, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
            -- Blaze of Glory
            { spellID = 99252, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
            -- Vital Flame
            { spellID = 99262, size = 47, unitId = "player", caster = "all", filter = "BUFF" },
            -- Vital Spark
            { spellID = 99263, size = 47, unitId = "player", caster = "all", filter = "BUFF" },
		-- Majordomo Staghelm	
            -- Searing Seeds
            { spellID = 98450, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
            -- Burning Orbs
            { spellID = 98451, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Ragnaros	
            -- Blazing Heat
            { spellID = 100460, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
            -- Burning Wound 
            { spellID = 101239, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
    	},	
		{
			Name = "ENHANCEMENTS",
			Direction = "LEFT",
			Interval = 6,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = {  "TOPRIGHT", "iFilgerEnhancements",0,-22 },

		--Racial
			-- Berserking
			{ spellID = 26297, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Blood Fury
			{ spellID = 33697, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Darkflight
			{ spellID = 68992, size = 52, unitId = "player", caster = "player", filter = "BUFF" },

		-- Trinket Procs
			-- Cleansing Tears / Läuternde Tränen (Tear of Blood)
			{ spellID = 91139, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Fury of the Five Flights / Furor der fünf Schwärme
			{ spellID = 60314, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Witching Hour / Geisterstunde
			{ spellID = 90887, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Heart's Revelation / Erkenntnis des Herzens
			{ spellID = 91027, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Heart's Judgement / Richturteil des Herzens
			{ spellID = 91041, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Volcanic Destruction
			{ spellID = 89091, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Soul Fragment / Seelenfragment (Necromatic Focus/Necrotischer Fokus)
			{ spellID = 96962, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Veil of Splashing / Moonwell Phial
			{ spellID = 101156, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Blessing of the Moonwell / Moonwell Chalice
			{ spellID = 100403, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Charged Blows / Ricket's Magnetic Fireball
			{ spellID = 101515, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Matrix Restabilizer Heroic / Matrix Restabilizer Heroic
			{ spellID = 97138, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Matrix Restabilizer  / Matrix Restabilizer
			{ spellID = 96976, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Accelerated Heroic  / Vessel of Acceleration Heroic
			{ spellID = 97142, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Blessing of Khaz'goroth Heroic  / Apparatus of Khaz'goroth Heroic
			{ spellID = 97127, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Victorious Heroic  / Jaws of Defeat Heroic
			{ spellID = 97120, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Soul Fragment Heroic  / Necromantic Focus Heroic
			{ spellID = 97131, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Devour Heroic  / The Hungerer Heroic
			{ spellID = 97125, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Accelerated  / Vessel of Acceleration
			{ spellID = 96980, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Ancient Petrified Seed  / Ancient Petrified Seed
			{ spellID = 97009, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Blessing of Khaz'goroth   / Apparatus of Khaz'goroth
			{ spellID = 96934, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Essence of the Eternal Flame  / Essence of the Eternal Flame
			{ spellID = 97010, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Fiery Quintessence  / Fiery Quintessence
			{ spellID = 97008, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Victorious  / Jaws of Defeat
			{ spellID = 96907, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Mark of the Firelord  / Rune of Zeth
			{ spellID = 97007, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Devour  / The Hungerer
			{ spellID = 96911, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Celerity / Shard of Woe Heroic
			{ spellID = 91173, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			--Battle Magic (Stump of Time)
			{ spellID = 91047, size = 52, unitId = "player", caster = "all", filter = "BUFF" }, 
			--Dire Magic (Bell of Enraging Resonance)
			{ spellID = 91007, size = 52, unitId = "player", caster = "all", filter = "BUFF" }, 

		-- PvP Trinkets
			-- Call of Conquest / Badge of Conquest
			{ spellID = 99711, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Call of Dominance / Badge of Dominance
			{ spellID = 99712, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Call of Victory / Badge of Victory
			{ spellID = 99713, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Tremendous Fortitude / Battlemaster Trinket S10-371
			{ spellID = 99714, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Surge of Conquest / Insignia of Conquest
			{ spellID = 99717, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Surge of Dominance / Insignia of Dominance
			{ spellID = 99719, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Surge of Victory / Insignia of Victory
			{ spellID = 99721, size = 52, unitId = "player", caster = "player", filter = "BUFF" },

		-- Item Enchants - Engineering
			-- Hyperspeed Accelerators / Hypergeschwindigkeitsbeschleuniger
			{ spellID = 54758, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Synapse Springs / Synapsenfedern
			{ spellID = 82175, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Nitro Boots ( or should I say Belt? )
			{ spellID = 54861, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Grounded Plasma Shield 
			{ spellID = 82626, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Flintlocke's Woodchucker
			{ spellID = 99621, size = 52, unitId = "player", caster = "player", filter = "BUFF" },

		-- Item Enchants - Tailoring
			-- Darkglow
			{ spellID = 55767, size = 52, unitId = "player", caster = "all", filter = "BUFF" },
			-- Lightweave
			{ spellID = 75170, size = 52, unitId = "player", caster = "all", filter = "BUFF" },
			-- Swordguard
			{ spellID = 55775, size = 52, unitId = "player", caster = "all", filter = "BUFF" },

		-- Item Enchants - Enchanting
			-- Heartsong / Gesang des Herzens
			{ spellID = 74224, size = 52, unitId = "player", caster = "all", filter = "BUFF" },
			-- Avalanche / Lawine
			{ spellID = 74196, size = 52, unitId = "player", caster = "all", filter = "BUFF" },
			-- Hurricane / Hurrikan
			{ spellID = 74221, size = 52, unitId = "player", caster = "all", filter = "BUFF" },
			--Power Torrent
			{ spellID = 74241, size = 52, unitId = "player", caster = "all", filter = "BUFF" },
			--Landside
			{ spellID = 74245, size = 52, unitId = "player", caster = "all", filter = "BUFF" },

		-- Potions
			-- Speed / Geschwindigkeit - Potion of Speed
			{ spellID = 53908, size = 52, unitId = "player", caster = "all", filter = "BUFF" },
			-- Wild Magic / Wilde Magie - Potion of Wild Magic
			{ spellID = 53909, size = 52, unitId = "player", caster = "all", filter = "BUFF" },
			-- Earthen Armor / Irdene Rüstung - Earthen Potion
			{ spellID = 79475, size = 52, unitId = "player", caster = "all", filter = "BUFF" },
			--Volcanic Power
			{ spellID = 79476, size = 52, unitId = "player", caster = "all", filter = "BUFF" }, 

		-- External Buffs
			-- Tricks of the Trade
			{ spellID = 57934, size = 52, unitId = "player", caster = "all", filter = "BUFF" },
			-- Power Infusion
			{ spellID = 10060, size = 52, unitId = "player", caster = "all", filter = "BUFF" },
			-- Bloodlust
			{ spellID = 2825, size = 52, unitId = "player", caster = "all", filter = "BUFF" },
			-- Heroism
			{ spellID = 52182, size = 52, unitId = "player", caster = "all", filter = "BUFF" },
			-- Time Warp
			{ spellID = 80353, size = 52, unitId = "player", caster = "all", filter = "BUFF" },
			-- Ancient Hysteria
			{ spellID = 90355, size = 52, unitId = "player", caster = "all", filter = "BUFF" },
			--Innervate
			{ spellID = 29166, size = 52, unitId = "player", caster = "all", filter = "BUFF"},
			--Lightwell
			{ spellID = 7001, size = 52, unitId = "player", caster = "all", filter = "BUFF"},
			-- Hand of Salvation
			{ spellID = 1038, size = 52, unitId = "player", caster = "all", filter = "BUFF" },			
		},
		{
--[[       Tons of SpellIDs taken from LoseControl so credit to Kouri 
		    Here we track pvp buffs on our target                             ]]
			Name = "ENEMY PVP BUFF",
			Direction = "RIGHT",
			Interval = 6,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = {  "BOTTOMLEFT", "iFilgerPvpTargetDebuffs" ,0,22 },
			
			--[[ Druid ]]--
			--Innervate
			{ spellID = 29166, size = 72, unitId = "target", caster = "all", filter = "BUFF"},
			
			--[[ Warrior ]]--
			--Spell Reflection
			{ spellID = 23920, size = 72, unitId = "target", caster = "all", filter = "BUFF" },
			
			--[[ Paladin ]]--
			--Divine Shield
			{ spellID = 642, size = 72, unitId = "target", caster = "all", filter = "BUFF" },
			-- Hand of Freedom
			{ spellID = 1044, size = 72, unitId = "target", caster = "all", filter = "BUFF" },
			-- Hand of Sacrifice
			{ spellID = 6940, size = 72, unitId = "target", caster = "all", filter = "BUFF" },
			--Aura Mastery
			{ spellID = 31821, size = 72, unitId = "target", caster = "all", filter = "BUFF" },	

            --[[ Hunter ]]--
			--Deterrence
            { spellID = 19263, size = 72, unitId = "target", caster = "all", filter = "BUFF" },
			
			--[[ Death Knight ]]--
			-- Anti-Magic Shell
			{ spellID = 48707, size = 72, unitId = "target", caster = "all", filter = "BUFF" },
			-- Lichborne
			{ spellID = 49039, size = 72, unitId = "target", caster = "all", filter = "BUFF" },
			-- Icebound Fortitude
			{ spellID = 48792, size = 72, unitId = "target", caster = "all", filter = "BUFF" },
			
			--[[ Shaman ]]--
			-- Grounding Totem Effect
			{ spellID = 8178, size = 72, unitId = "target", caster = "all", filter = "BUFF" },

			--[[ Mage ]]--
			--Ice Block
			{ spellID = 45438, size = 72, unitId = "target", caster = "all", filter = "BUFF" },
			
			--[[ Rouge ]]--
			--Cloak of Shadows
			{ spellID = 31224, size = 72, unitId = "target", caster = "all", filter = "BUFF" },
			
			--[[ Priest ]]--
			-- Dispersion
			{ spellID = 47585, size = 72, unitId = "target", caster = "all", filter = "BUFF" },
		},
		{
		    -- Here we track pvp debuffs on ourself
			Name = "ENEMY PVP DEBUFF",
			Direction = "LEFT",
			Interval = 6,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = {  "BOTTOMRIGHT", "iFilgerPvpPlayerDebuffs" ,0,22 },			
			
			--[[ Rogue ]]--
			--Kidney Shot
            { spellID = 408, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Blind
            { spellID = 2094, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Sap
            { spellID = 6770, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },			
			--Smoke Bomb
            { spellID = 76577, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Garrote - Silence
            { spellID = 1330, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Silenced - Improved Kick
            { spellID = 18425, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Dismantle
            { spellID = 51722, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Blade Twisting
            { spellID = 31125, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },			
			--Crippling Poison
            { spellID = 3409, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Deadly Throw
            { spellID = 26679, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },	
			
			--[[ Paladin ]]--
			--Hammer of Justice
		    { spellID = 853, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Seal of Justice
            { spellID = 20170, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Repentance
	        { spellID = 20066, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },			
			--Holy Wrath
		    { spellID = 2812, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Turn Evil
            { spellID = 10326, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Avenger's Shield
	        { spellID = 31935, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },			
			--Dazed - Avenger's Shield
            { spellID = 63529, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },	

			--[[ Mage ]]--
			--Silenced - Improved Counterspell
            { spellID = 18469, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Polymorph
	        { spellID = 118, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Improved Polymorph
	        { spellID = 83047, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Deep Freeze
	        { spellID = 44572, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Impact
            { spellID = 12355, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Ring of Frost
	        { spellID = 82691, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Fiery Payback
	        { spellID = 64346, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Freeze (Water Elemental)
	        { spellID = 33395, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Frost Nova
            { spellID = 122, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Improved Cone of Cold
	        { spellID = 83302, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Shattered Barrier
	        { spellID = 55080, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Blast Wave
	        { spellID = 11113, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Cone of Cold
	        { spellID = 120, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Frostbolt
	        { spellID = 116, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Frostfire Bolt
	        { spellID = 44614, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Slow
            { spellID = 31589, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			--[[ Death Kinght ]]--
			--Monstrous Blow (Super ghoul)
            { spellID = 91797, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Desecration
            { spellID = 55666, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Chains of Ice
	        { spellID = 45524, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Strangulate
	        { spellID = 47476, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Gnaw (Ghoul)
            { spellID = 47481, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Hungering Cold
			{ spellID = 49203, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Chilblains
	        { spellID = 50040, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },	
 			--Dark Simulacrum
	        { spellID = 77606, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },	
       
		    --[[ Druid ]]--
			--Bash (also Shaman Spirit Wolf ability)
	        { spellID = 5211, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Cyclone
	        { spellID = 33786, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Maim
	        { spellID = 22570, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Pounce
	        { spellID = 9005, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Solar Beam
	        { spellID = 97547, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Entangling Roots
	        { spellID = 339, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Feral Charge Effect
	        { spellID = 45334, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Infected Wounds
	        { spellID = 58179, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Typhoon
	        { spellID = 61391, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			--[[ Hunter ]]--
			--Freezing Trap Effect
	        { spellID = 3355, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Intimidation
	        { spellID = 24394, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Wyvern Sting
	        { spellID = 19386, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Silencing Shot
	        { spellID = 34490, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },			
			--Scatter Shot
	        { spellID = 19503, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Counterattack
            { spellID = 19306, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Entrapment
	        { spellID = 19185, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Concussive Barrage
	        { spellID = 35101, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Concussive Shot
	        { spellID = 5116, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Frost Trap Aura
	        { spellID = 13810, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Glyph of Freezing Trap
            { spellID = 61394, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Wing Clip
	        { spellID = 2974, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Sonic Blast (Bat)
	        { spellID = 50519, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Snatch (Bird of Prey)
	        { spellID = 50541, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Froststorm Breath (Chimera)
	        { spellID = 92380, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Pin (Crab)
            { spellID = 50245, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Tendon Rip (Hyena)
	        { spellID = 50271, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Bad Manner (Monkey)
	        { spellID = 90337, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Venom Web Spray (Silithid)
	        { spellID = 54706, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Web (Spider)
	        { spellID = 4167, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			--[[ Priest ]]--
			--Mind Control
	        { spellID = 605, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Psychic Horror
            { spellID = 64044, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Psychic Scream
	        { spellID = 8122, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Shackle Undead
	        { spellID = 9484, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Sin and Punishment
	        { spellID = 87204, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Paralysis
	        { spellID = 87194, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Mind Flay
            { spellID = 15407, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			--[[ Shaman ]]--
			--Bind Elemental
	        { spellID = 76780, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Earthquake
	        { spellID = 61882, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Hex
	        { spellID = 51514, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Stoneclaw Stun
	        { spellID = 39796, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Earthgrab (Earth's Grasp)
            { spellID = 64695, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Freeze (Frozen Power)
	        { spellID = 63685, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Earthbind (5 second duration per pulse, but will keep re-applying the debuff as long as you stand within the pulse radius)
	        { spellID = 3600, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Frost Shock
	        { spellID = 8056, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Frostbrand Attack
	        { spellID = 8034, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			--[[ Warlock ]]--
			--Aura of Foreboding
	        { spellID = 93986, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Axe Toss (Felguard)
	        { spellID = 89766, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Banish
	        { spellID = 710, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Death Coil
            { spellID = 6789, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Demon Leap
	        { spellID = 54786, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Fear
	        { spellID = 5782, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Howl of Terror
	        { spellID = 5484, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Seduction (Succubus)
            { spellID = 6358, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Shadowfury
	        { spellID = 30283, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Spell Lock (Felhunter)
	        { spellID = 24259, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Unstable Affliction
	        { spellID = 31117, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Aftermath
            { spellID = 18118, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Curse of Exhaustion
	        { spellID = 18223, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Shadowsnare (Glyph of Shadowflame)
	        { spellID = 63311, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			--[[ Warrior ]]--
			--Hamstring
	        { spellID = 1715, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Improved Hamstring
	        { spellID = 23694, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },			
			--Charge Stun
	        { spellID = 7922, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Concussion Blow
            { spellID = 12809, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Heroic Leap
	        { spellID = 6544, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Intercept
	        { spellID = 20253, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Intimidating Shout
	        { spellID = 5246, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Shockwave
            { spellID = 46968, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Throwdown
	        { spellID = 85388, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Silenced - Gag Order
	        { spellID = 18498, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Disarm
	        { spellID = 676, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Piercing Howl
	        { spellID = 12323, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },

			--[[ Racials ]]--
			-- War Stomp
			{ spellID = 20549, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
		},
	},
}