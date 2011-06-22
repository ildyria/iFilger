local _, ns = ...

ns.Filger_Settings = {
	configmode = false,
}
-- size = 60 => size = 47
ns.Filger_Spells = {
	["DEATHKNIGHT"] = {
		{
			Name = "Cooldown",
			Direction = "UP",
			Interval = 3,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "CENTER", UIParent, 173, -79 },
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
			{ spellID = 49203, size = 37, filter = "CD" }, --Hungering Cold
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
			setPoint = { "CENTER", UIParent, 173, -120 },
			
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
			setPoint = { "CENTER", "UIParent", 225, -68 },

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
			setPoint = { "CENTER", UIParent, 173, -79 },

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
			setPoint = { "CENTER", UIParent, 173, -120 },
			
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
			setPoint = { "CENTER", "UIParent", 225, -68 },
			
			--Clearcasting
			{ spellID = 12536, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			--Missiles
			{ spellID = 79683, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			--Brain Freeze
			{ spellID = 57761, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Impact
			{ spellID = 64343, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			--Missile Barrage
			{ spellID = 54486, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			--Hot Streak(improved)
			{ spellID = 44448, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			--Hot Streak
			{ spellID = 44445, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Deep Freeze
			{ spellID = 44572, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
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
			setPoint = { "CENTER", UIParent, -42, -3 },
			
			-- Sheep mage
            { spellID = 118, size = 36, unitId = "focus", caster = "player", filter = "DEBUFF" },
			-- Pig mage
            { spellID = 28272, size = 36, unitId = "focus", caster = "player", filter = "DEBUFF" },
			-- Turtle mage
            { spellID = 28271, size = 36, unitId = "focus", caster = "player", filter = "DEBUFF" },	
			-- Remedy - Maloriak 
			{ spellID = 92967, size = 36, unitId = "focus", caster = "all", filter = "BUFF" },	
			-- Converted Power - Arcanotron
            { spellID = 79735, size = 36, unitId = "focus", caster = "all", filter = "BUFF" },
		},
	},
	["PRIEST"] = { -------------------------------------------------------------------------------------------------------- Priest
		{
			Name = "Cooldown",
			Direction = "UP",
			Interval = 3,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "CENTER", UIParent, 173, -79 },

			--Dispersion
			{ spellID = 47585, size = 37, filter = "CD" }, 
			--Guardian Spirit
			{ spellID = 47788, size = 37, filter = "CD" }, 
			--Holy Word: Sanctuary
			{ spellID = 88686, size = 37, filter = "CD" }, 
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
			setPoint = { "CENTER", UIParent, 173, -120 },

			-- Guardian Spirit
			{ spellID = 47788, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Pain Suppression
			{ spellID = 33206, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Renew
			{ spellID = 139, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Power Word: Shield
			{ spellID = 17, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			
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
			setPoint = { "CENTER", "UIParent", 225, -68 },

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
			-- Dispersion
			{ spellID = 47585, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
		},	
		{
			Name = "Buffs and Debuffs",
			Direction = "LEFT",
			Interval = 3,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "CENTER", UIParent, 100, -81 },

			-- Prayer of Mending
			{ spellID = 41635, size = 37, unitId = "target", caster = "player", filter = "BUFF" },
			-- Guardian Spirit
			{ spellID = 47788, size = 37, unitId = "target", caster = "player", filter = "BUFF" },
			-- Pain Suppression
			{ spellID = 33206, size = 37, unitId = "target", caster = "player", filter = "BUFF" },
			-- Power Word: Shield
			{ spellID = 17, size = 37, unitId = "target", caster = "player", filter = "BUFF" },
			-- Renew
			{ spellID = 139, size = 37, unitId = "target", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "LEFT",
			Interval = 3,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "CENTER", UIParent, 100, -120 },

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
	},
	["WARLOCK"] = { -------------------------------------------------------------------------------------------------------- Warlock
		{
			Name = "Warlock Procs",
			Direction = "DOWN",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "CENTER", "UIParent", -0, -85 },

			--Devious Minds
			{ spellID = 70840, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Improved Soul Fire
			{ spellID = 18120, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Molten Core
			{ spellID = 47247, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Decimation
			{ spellID = 63158, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Backdraft
			{ spellID = 47260, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Backlash
			{ spellID = 34939, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Nether Protection
			{ spellID = 30301, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Nightfall
			{ spellID = 18095, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Burning Soul
			{ spellID = 84254, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			--Empowered Imp
			{ spellID = 47283, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "CENTER", UIParent, 56, -90 },

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
			setPoint = { "CENTER", UIParent, -60, -90 },
			
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
			setPoint = { "CENTER", UIParent, -60, -130 },

			-- SoulBurn
			{ spellID = 74434, size = 37, filter = "CD" },
		},
	},
	["DRUID"] = { -------------------------------------------------------------------------------------------------------- Druid
		{
			Name = "Buffs and Debuffs",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "CENTER", UIParent, -180, -250 },

			-- Lifebloom
			{ spellID = 33763, size = 32, unitId = "player", caster = "player", filter = "BUFF" },
			-- Rejuvenation
			{ spellID = 774, size = 32, unitId = "player", caster = "player", filter = "BUFF" },
			-- Regrowth
			{ spellID = 8936, size = 32, unitId = "player", caster = "player", filter = "BUFF" },
			-- Wild Growth
			{ spellID = 48438, size = 32, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "CENTER", UIParent, 180, -250 },

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
			Direction = "DOWN",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "CENTER", "UIParent", -0, -85 },

			-- Nature's Grace
			{ spellID = 16886, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Eclipse (Lunar)
			{ spellID = 48518, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Eclipse (Solar)
			{ spellID = 48517, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shooting Stars
			{ spellID = 93400, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Savage Roar
			{ spellID = 52610, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Survival Instincts
			{ spellID = 61336, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Tree of Life
			{ spellID = 33891, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Clearcasting
			{ spellID = 16870, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Innervate
			{ spellID = 29166, size = 60, unitId = "player", caster = "all", filter = "BUFF" },
			-- Barkskin
			{ spellID = 22812, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "LEFT",
			Interval = 3,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "CENTER", UIParent, 100, -200 },

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
		},
	},
	["HUNTER"] = { -------------------------------------------------------------------------------------------------------- Hunter
		{
			Name = "Hunter Procs",
			Direction = "DOWN",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "CENTER", "UIParent", -0, -85 },

			-- Lock and Load
			{ spellID = 56453, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Quick Shots
			{ spellID = 6150, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Improved Steady Shot
			{ spellID = 53224, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Rapid Fire
			{ spellID = 3045, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Call of the Wild
			{ spellID = 53434, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Mend Pet
			{ spellID = 136, size = 60, unitId = "pet", caster = "player", filter = "BUFF" },
			-- Feed Pet
			{ spellID = 6991, size = 60, unitId = "pet", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "CENTER", UIParent, 56, -90 },

			-- Wyvern Sting
			{ spellID = 19386, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Silencing Shot
			{ spellID = 34490, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Serpent Sting
			{ spellID = 1978, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Black Arrow
			{ spellID = 3674, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Explosive Shot
			{ spellID = 53301, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Hunter's Mark
			{ spellID = 1130, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
		},
	},	
	["ROGUE"] = { -------------------------------------------------------------------------------------------------------- Rogue
		{
			Name = "Buffs and Debuffs",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "CENTER", UIParent, -60, -90 },

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
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "CENTER", UIParent, 56, -90 },

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
		},
    },		
	["SHAMAN"] = { -------------------------------------------------------------------------------------------------------- Shaman
		{
			Name = "Cooldown",
			Direction = "UP",
			Interval = 3,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "CENTER", UIParent, 173, -79 },

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
			setPoint = { "CENTER", "UIParent", 225, -68 },

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
			setPoint = { "CENTER", UIParent, 173, -120 },

			-- Shamanistic Rage
			{ spellID = 30823, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Elemental Mastery
			{ spellID = 16166, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Hex
			{ spellID = 51514, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
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
	},	
	["PALADIN"] = { -------------------------------------------------------------------------------------------------------- Paladin
		{
			Name = "Beacon of Light",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "CENTER", UIParent, -230, -158 },

			-- Beacon of Light -- player
			{ spellID = 53563, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "CENTER", UIParent, 173, -120 },
 
			-- Beacon of Light -- target
			{ spellID = 53563, size = 37, unitId = "target", caster = "player", filter = "BUFF" },
			-- Judgements of the Pure
			{ spellID = 53657, size = 37, unitId = "player", caster = "all", filter = "BUFF" },
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
		},
		{
			Name = "Paladin Procs",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "CENTER", "UIParent", 225, -68 },

			-- Sacred Duty
			{ spellID = 85433, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Daybreak
			{ spellID = 88819, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
			-- Infusion of Light
			{ spellID = 54149, size = 60, unitId = "player", caster = "player", filter = "BUFF" },
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
			Direction = "DOWN",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "CENTER", "UIParent", -0, -85 },

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
		},
        {		
			Name = "Buffs and Debuffs",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "CENTER", UIParent, -60, -90 },
			
			-- Last Stand
			{ spellID = 12975, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shield Wall
			{ spellID = 871, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "T_DEBUFF_ICON",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = { "LEFT", UIParent, "CENTER", 160, -20 },

			-- Hamstring
			{ spellID = 1715, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Rend
			{ spellID = 94009, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Sunder Armor
			{ spellID = 7386, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Thunder Clap
			{ spellID = 6343, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Infected Wounds
			{ spellID = 48484, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Frost Fever
			{ spellID = 55095, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Demoralizing Shout
			{ spellID = 1160, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Demoralizing Roar
			{ spellID = 99, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Curse of Weakness
			{ spellID = 702, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
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
			setPoint = { "CENTER", UIParent, -106, -43 },
			
-- Baradin Hold
			-- Consuming Darkness
            { spellID = 95173, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
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
-- The Bastion of Twilight
		--Valiona & Theralion
			-- Blackout
			{ spellID = 92878, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Devouring Flames
			{ spellID = 86840, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Engulfing Magic
			{ spellID = 86840, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Halfus Wyrmbreaker	
		    -- Malevolent Strikes
			{ spellID = 39171, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Twilight Ascendant Council
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
		    -- Cho's Blast
		    { spellID = 86028, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Gall's Blast
		    { spellID = 86029, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
-- Throne of the Four Winds
	-- Conclave of Wind
		-- Nezir <Lord of the North Wind>
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
    	},	
		{
			Name = "ENHANCEMENTS",
			Direction = "LEFT",
			Interval = 6,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = {  "CENTER", UIParent ,140,220 },
			--Battle Magic (Stump of Time)
			{ spellID = 91047, size = 52, unitId = "player", caster = "all", filter = "BUFF" }, 
			--Dire Magic (Bell of Enraging Resonance)
			{ spellID = 91007, size = 52, unitId = "player", caster = "all", filter = "BUFF" }, 
			--Volcanic Destruction (Darkmoon Card: Volcano)
			{ spellID = 89091, size = 52, unitId = "player", caster = "all", filter = "BUFF" }, 
			
			--Lightweave
			{ spellID = 75170, size = 52, unitId = "player", caster = "all", filter = "BUFF" },
			--Power Torrent
			{ spellID = 74241, size = 52, unitId = "player", caster = "all", filter = "BUFF" },
			--Landside
			{ spellID = 74245, size = 52, unitId = "player", caster = "all", filter = "BUFF" },
			--Volcanic Power
			{ spellID = 79476, size = 52, unitId = "player", caster = "all", filter = "BUFF" }, 
			
			--Ancient Hysteria
			{ spellID = 90355, size = 52, unitId = "player", caster = "all", filter = "BUFF" },
			--Bloodlust
			{ spellID = 2825, size = 52, unitId = "player", caster = "all", filter = "BUFF" }, 
			--Heroism
			{ spellID = 32182, size = 52, unitId = "player", caster = "all", filter = "BUFF" }, 
			--Time Warp
			{ spellID = 80353, size = 52, unitId = "player", caster = "all", filter = "BUFF" }, 
			
			--Innervate
			{ spellID = 29166, size = 52, unitId = "player", caster = "all", filter = "BUFF"},
			--Power Infusion
			{ spellID = 10060, size = 52, unitId = "player", caster = "all", filter = "BUFF" }, 
		},
		{
--[[       Tons of SpellIDs taken from LoseControl so credit to Kouri 
		    Here we track pvp buffs on our target                             ]]
			Name = "ENEMY PVP BUFF",
			Direction = "RIGHT",
			Interval = 6,
			Mode = "ICON",
			BarWidth = 150,
			setPoint = {  "CENTER", UIParent ,140,150 },
			
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
			{ spellID = 31821, size = 70, unitId = "target", caster = "all", filter = "BUFF" },	

            --[[ Hunter ]]--
			--Deterrence
            { spellID = 19263, size = 70, unitId = "target", caster = "all", filter = "BUFF" },
			
			--[[ Death Knight ]]--
			-- Anti-Magic Shell
			{ spellID = 48707, size = 72, unitId = "target", caster = "all", filter = "BUFF" },
			-- Lichborne
			{ spellID = 49039, size = 72, unitId = "target", caster = "all", filter = "BUFF" },
			
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
			setPoint = {  "CENTER", UIParent ,-140,150 },			
			
			--[[ Rouge ]]--
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
			--Hungering Cold
	        { spellID = 51209, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Chilblains
	        { spellID = 50040, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },			
        
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
	        { spellID = 81261, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
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
	        { spellID = 54644, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },		
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
		},
	},
}	