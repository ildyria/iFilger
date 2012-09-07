local C = {}

C["Filger_Config"] = {
	["cleverzone"] = false,								-- load only PVP in PVP zones and PVE in PVE zones (require to reload the 1st time you enter the pve zone)
	["tooltip"] = true,									-- tooltip on mouseover buffs, some people wanted it. I don't.
	["TooltipMover"] = true,							-- tooltip on TooltipMover for ElvUI and Tukui users.
	["FlashIcon"] = true,								-- Flash when time left is below a threshold in ICON mode.
	["FlashBar"] = false,								-- Flash when time left is below a threshold in BAR mode.
	["FlashThreshold"] = 5,								-- Threshold from which icons start flashing.
	["FlashDuration"] = 0.5,							-- Duration of each flash smaller => quicker.
}

C["Filger_Cooldown"] = { -- will be disabled if Tukui / ElvUI / OmniCC / ncCooldown is enabled
	["enable"] = true,									-- do i really need to explain this?
	["treshold"] = 8,									-- show decimal under X seconds and text turn red
	["fontsize"] = 20,									--the base font size to use at a scale of 1
}

C["Filger_Panels"] = {
	["MAGE"] = {
		{ name = "iFilgerProcs", w = 200, h = 21, anchor = "BOTTOMLEFT", x = 195, y = -35, text = "Procs" },
		{ name = "iFilgerBuffDebuff", w = 200, h = 21, anchor = "TOPLEFT", x = 156, y = -141, text = "Buffs / Debuffs" },
		{ name = "iFilgerCooldowns", w = 160, h = 20, anchor = "BOTTOMRIGHT", x = 153, y = -97, text = "Cooldowns" },
		{ name = "iFilgerFocusBuffs", w = 165, h = 20, anchor = "TOPRIGHT", x = -53, y = 53, text = "Focus Buffs" },
		{ name = "iFilgerMageInvertAura", w = 200, h = 20, anchor = "BOTTOM", x = 0, y = 30, text = "Invert Auras/CD" },
		{ name = "iFilgerInterrupt", w = 75, h = 20, anchor = "BOTTOM", x = 0, y = 10, text = "Interrupt" },
	},
	["DEATHKNIGHT"] = {
		{ name = "iFilgerProcs", w = 200, h = 21, anchor = "BOTTOMLEFT", x = 195, y = -35, text = "Procs" },
		{ name = "iFilgerBuffDebuff", w = 200, h = 21, anchor = "TOPLEFT", x = 156, y = -141, text = "Buffs / Debuffs" },
		{ name = "iFilgerCooldowns", w = 160, h = 20, anchor = "BOTTOMRIGHT", x = 153, y = -97, text = "Cooldowns" },
	},
	["PRIEST"] = {
		{ name = "iFilgerProcs", w = 200, h = 21, anchor = "BOTTOMLEFT", x = 195, y = -35, text = "Procs" },
		{ name = "iFilgerBuffDebuff", w = 200, h = 21, anchor = "TOPLEFT", x = 156, y = -141, text = "Buffs / Debuffs" },
		{ name = "iFilgerCooldowns", w = 160, h = 20, anchor = "BOTTOMRIGHT", x = 153, y = -97, text = "Cooldowns" },
		{ name = "iFilgerDebuffDps", w = 200, h = 20, anchor = "TOPLEFT", x = 30, y = -210, text = "Debuff Dps" },
		{ name = "iFilgerBuffDps", w = 200, h = 20, anchor = "TOPRIGHT", x = -30, y = -210, text = "Buff/Procs Dps" },
		{ name = "iFilgerProcDps", w = 200, h = 20, anchor = "CENTER", x = 0, y = -250, text = "CD Dps" },
		{ name = "iFilgerBuffDebuffHeal", w = 200, h = 20, anchor = "BOTTOMRIGHT", x = 98, y = -61, text = "Buff / Debuff Heal" },
		{ name = "iFilgerBuffPlayerHeal", w = 200, h = 20, anchor = "TOPRIGHT", x = -164, y = -268, text = "Heal Buff Player" },
		{ name = "iFilgerFocusBuffs", w = 165, h = 20, anchor = "TOPRIGHT", x = -53, y = 53, text = "Focus Buffs" },
	},
	["WARLOCK"] = {
		{ name = "iFilgerBuffDebuff", w = 200, h = 21, anchor = "TOPLEFT", x = 200, y = -55, text = "Buffs / Debuffs" },
		{ name = "iFilgerFocusBuffs", w = 165, h = 20, anchor = "TOPRIGHT", x = -53, y = 53, text = "Focus Buffs" },
		{ name = "iFilgerTargetCCDebuff", w = 160, h = 20, anchor = "TOPLEFT", x = 37, y = -110, text = "Target CC Debuff" },
		{ name = "iFilgerTargetDoTDebuff", w = 160, h = 20, anchor = "TOPRIGHT", x = -100, y = -110, text = "Target DoT Debuff" },
		{ name = "iFilgerProcs", w = 90, h = 20, anchor = "CENTER", x = 0, y = -55, text = "Procs" },
		{ name = "iFilgerCooldowns", w = 160, h = 20, anchor = "TOPRIGHT", x = -42, y = -150, text = "Cooldowns" },
		{ name = "iFilgerPetCooldowns", w = 160, h = 20, anchor = "TOPLEFT", x = 42, y = -150, text = "Pet Cooldowns" },
	},
	["DRUID"] = {
		{ name = "iFilgerProcs", w = 200, h = 21, anchor = "BOTTOMLEFT", x = 195, y = -35, text = "Procs" },
		{ name = "iFilgerCooldowns", w = 160, h = 20, anchor = "BOTTOMRIGHT", x = 153, y = -97, text = "Cooldowns" },
		{ name = "iFilgerTargetDebuff", w = 200, h = 20, anchor = "TOPRIGHT", x = 118, y = -160, text = "Target Debuff" },
		{ name = "iFilgerBuffTargetHeal", w = 200, h = 20, anchor = "TOPLEFT", x = 164, y = -268, text = "Heal Buff Target" },
		{ name = "iFilgerBuffPlayerHeal", w = 200, h = 20, anchor = "TOPRIGHT", x = -164, y = -268, text = "Heal Buff Player" },
		{ name = "iFilgerFocusBuffs", w = 165, h = 20, anchor = "TOPRIGHT", x = -53, y = 53, text = "Focus Buffs" },
		{ name = "iFilgerRage", w = 165, h = 20, anchor = "CENTER", x = 0, y = -20, text = "Rage Buffs" },
		{ name = "iFilgerBuffDebuff", w = 200, h = 21, anchor = "TOPLEFT", x = 156, y = -141, text = "Buffs / Debuffs" },
	},
	["HUNTER"] = {
		{ name = "iFilgerProcs", w = 200, h = 21, anchor = "BOTTOMLEFT", x = 195, y = -35, text = "Procs" },
--		{ name = "", w = 100, h = 21, anchor = "BOTTOMLEFT", x = -85, y = -250, text = "Player Buffs" },
		{ name = "iFilgerPlayerBuff", w = 200, h = 21, anchor = "TOPLEFT", x = 156, y = -141, text = "Player Buffs" },
		{ name = "iFilgerTargetDebuff", w = 200, h = 20, anchor = "TOP", x = 0, y = -160, text = "Target Debuff" },
		{ name = "iFilgerCooldowns", w = 160, h = 20, anchor = "BOTTOMRIGHT", x = 153, y = -97, text = "Cooldowns" },
		{ name = "iFilgerFocusBuffs", w = 165, h = 20, anchor = "TOPRIGHT", x = -53, y = 53, text = "Focus Buffs" },
		{ name = "iFilgerRage", w = 165, h = 20, anchor = "CENTER", x = 0, y = -20, text = "Rage Buffs" },
	},
	["ROGUE"] = {
		{ name = "iFilgerTargetDebuff", w = 160, h = 20, anchor = "TOPLEFT", x = 37, y = -110, text = "Target Debuff" },
		{ name = "iFilgerPlayerBuff", w = 160, h = 20, anchor = "TOPRIGHT", x = -42, y = -110, text = "Player Buff" },
		{ name = "iFilgerProcs", w = 90, h = 20, anchor = "CENTER", x = 0, y = -55, text = "Procs" }, -- Procs LEGENDARY
		{ name = "iFilgerCooldowns", w = 160, h = 20, anchor = "TOPLEFT", x = 204, y = 63, text = "Target Cooldowns" },
		{ name = "iFilgerFocusBuffs", w = 165, h = 20, anchor = "TOPRIGHT", x = -53, y = 53, text = "Focus Buffs" },
		{ name = "iFilgerRage", w = 165, h = 20, anchor = "CENTER", x = 0, y = -20, text = "Rage Buffs" },
	},
	["PALADIN"] = {
		{ name = "iFilgerProcs", w = 200, h = 21, anchor = "BOTTOMLEFT", x = 195, y = -35, text = "Procs" },
		{ name = "iFilgerBuffDebuff", w = 200, h = 21, anchor = "TOPLEFT", x = 156, y = -141, text = "Buffs / Debuffs" },
		{ name = "iFilgerCooldowns", w = 160, h = 20, anchor = "BOTTOMRIGHT", x = 153, y = -97, text = "Cooldowns" },
		{ name = "iFilgerBuffTargetHeal", w = 200, h = 20, anchor = "TOPLEFT", x = 164, y = -268, text = "Heal Buff Target" },
		{ name = "iFilgerBuffPlayerHeal", w = 200, h = 20, anchor = "TOPRIGHT", x = -164, y = -268, text = "Heal Buff Player" },
		{ name = "iFilgerFocusBuffs", w = 165, h = 20, anchor = "TOPRIGHT", x = -53, y = 53, text = "Focus Buffs" },
		{ name = "iFilgerPalyInvertAura", w = 200, h = 20, anchor = "BOTTOM", x = 0, y = 30, text = "Invert Auras/CD" },
	},
	["SHAMAN"] = {
		{ name = "iFilgerProcs", w = 200, h = 21, anchor = "BOTTOMLEFT", x = 195, y = -35, text = "Procs" },
		{ name = "iFilgerBuffDebuff", w = 200, h = 21, anchor = "TOPLEFT", x = 156, y = -141, text = "Buffs / Debuffs" },
		{ name = "iFilgerCooldowns", w = 160, h = 20, anchor = "BOTTOMRIGHT", x = 153, y = -97, text = "Cooldowns" },
		{ name = "iFilgerBuffTargetHeal", w = 200, h = 20, anchor = "TOPLEFT", x = 164, y = -268, text = "Heal Buff Target" },
		{ name = "iFilgerBuffPlayerHeal", w = 200, h = 20, anchor = "TOPRIGHT", x = -164, y = -268, text = "Heal Buff Player" },
		{ name = "iFilgerFocusBuffs", w = 165, h = 20, anchor = "TOPRIGHT", x = -53, y = 53, text = "Focus Buffs" },
		{ name = "iFilgerTargetDebuff", w = 160, h = 20, anchor = "TOPLEFT", x = 37, y = -110, text = "Target Debuff" },
		{ name = "iFilgerPlayerBuff", w = 160, h = 20, anchor = "TOPRIGHT", x = -42, y = -110, text = "Player Buff" },
		{ name = "iFilgerLavaBurst", w = 90, h = 20, anchor = "CENTER", x = 0, y = -55, text = "Lava Burst" },
	},
	["WARRIOR"] = {
		{ name = "iFilgerProcs", w = 200, h = 21, anchor = "BOTTOMLEFT", x = 195, y = -35, text = "Procs" },
		{ name = "iFilgerBuffDebuff", w = 200, h = 21, anchor = "TOPLEFT", x = 156, y = -141, text = "Buffs / Debuffs" },
		{ name = "iFilgerCooldowns", w = 160, h = 20, anchor = "BOTTOMRIGHT", x = 153, y = -97, text = "Cooldowns" },
	},
	["MONK"] = {
		{ name = "iFilgerPlayerBuff", w = 160, h = 20, anchor = "TOPLEFT", x = -42, y = -110, text = "Player Buffs" },
		{ name = "iFilgerTargetDebuff", w = 160, h = 20, anchor = "TOPLEFT", x = 37, y = -110, text = "Target Debuff" },
		{ name = "iFilgerCooldowns", w = 160, h = 20, anchor = "BOTTOMRIGHT", x = 153, y = -97, text = "Cooldowns" },
	},
	["ALL"] = {
		{ name = "iFilgerEnhancements", w = 200, h = 20, anchor = "BOTTOMRIGHT", x = 165, y = 248, text = "Enhancements" },
		{ name = "iFilgerPveDeBuffs", w = 200, h = 20, anchor = "TOPRIGHT", x = -82, y = -68, text = "PvE Debuffs" },
		{ name = "iFilgerPvpPlayerDebuffs", w = 250, h = 20, anchor = "BOTTOMRIGHT", x = -104, y = 93, text = "PvP Player Debuffs" },
		{ name = "iFilgerPvpTargetBuffs", w = 250, h = 20, anchor = "BOTTOMLEFT", x = 104, y = 93, text = "PvP Target Buffs" },
		{ name = "iFilgerTanksCDs", w = 200, h = 20, anchor = "BOTTOM", x = 0, y = 100, text = "Tanks CDs" },
		{ name = "iFilgerTanksCDsFocus", w = 200, h = 20, anchor = "TOPRIGHT", x = -220, y = 53, text = "Tanks focus CDs" },
	},
}

C["Filger_Spells"] = {
	["DEATHKNIGHT"] = {  ---------------------------------------------------- Death Knight -- A REVOIR
		{
			Name = "Cooldown",
			Enable = true,
			Direction = "UP",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37,
			setPoint = { "BOTTOMRIGHT", "iFilgerCooldowns", 40, 0 },
 
			-- Dark Command
			{ spellID = 56222, filter = "CD" }, 
			-- Death Pact
			{ spellID = 48743, filter = "CD" },
			-- Mind Freeze			
			{ spellID = 47528, filter = "CD" },
			-- Icebound Fortitude
			{ spellID = 48792, filter = "CD" }, 
			-- Empower Rune Weapon
			{ spellID = 47568, filter = "CD" }, 
			-- Howling Blast
			{ spellID = 49184, filter = "CD" }, 
			-- Death Grip
			{ spellID = 49576, filter = "CD" }, 
			-- Raise Dead
			{ spellID = 46584, filter = "CD" }, 
			-- Anti-Magic Shell
			{ spellID = 48707, filter = "CD" }, 
			-- Death and Decay
			{ spellID = 43265, filter = "CD" }, 
			-- Vampiric Blood
			{ spellID = 55233, filter = "CD" }, 
			-- Dancing Rune Weapon
			{ spellID = 49028, filter = "CD" }, 
			-- Lichborne
			{ spellID = 49039, filter = "CD" }, 
			-- Anti-Magic Zone
			{ spellID = 51052, filter = "CD" }, 
			-- Summon Gargoyle
			{ spellID = 49206, filter = "CD" }, 
			-- Outbreak
			{ spellID = 77575, filter = "CD" }, 
			-- Dark Simulacrum
			{ spellID = 77606, filter = "CD" }, 
		},	
		{
			Name = "Buffs and Debuffs",
			Enable = true,
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37,
			setPoint = { "BOTTOMLEFT", "iFilgerBuffDebuff", 0, 24 },

			--Shadow Infusion
			{ spellID = 91342, unitId = "pet", caster = "all", filter = "BUFF" },
			--Dark Transformation
			{ spellID = 63560, unitId = "pet", caster = "all", filter = "BUFF" }, 
			-- Necrotic Strike
			{ spellID = 73975, unitId = "target", caster = "player", filter = "DEBUFF" },
			--Freezing Fog
			{ spellID = 59052, unitId = "player", caster = "all", filter = "BUFF" },
			--Scent of Blood
			{ spellID = 49509, unitId = "player", caster = "all", filter = "BUFF" },
			--Vampiric Blood
			{ spellID = 55233, unitId = "player", caster = "all", filter = "BUFF" },
			--Lichborne
			{ spellID = 49039, unitId = "player", caster = "all", filter = "BUFF" },
			--Path of Frost
			{ spellID = 3714, unitId = "player", caster = "all", filter = "BUFF" },
			--Strangulate
			{ spellID = 47476, unitId = "target", caster = "all", filter = "DEBUFF" },
			--Chains of Ice
			{ spellID = 45524, unitId = "target", caster = "all", filter = "DEBUFF" },
			--Frost Fever
			{ spellID = 59921, unitId = "target", caster = "player", filter = "DEBUFF" },
			--Death and Decay
			{ spellID = 43265, unitId = "target", caster = "all", filter = "DEBUFF" },
			--Blood Plague
			{ spellID = 59879, unitId = "target", caster = "player", filter = "DEBUFF" },
			--Unholy Blight
			{ spellID = 115989, unitId = "player", caster = "player", filter = "BUFF" },
			--Blood Shield
			{ spellID = 77535, unitId = "player", caster = "player", filter = "BUFF" },
			-- Conversion
			{ spellID = 119975, unitId = "player", caster = "player", filter = "BUFF" },
			-- Death's Advance
			{ spellID = 96268, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "DK Procs",
			Enable = true,
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 60,
			setPoint = { "BOTTOMLEFT", "iFilgerProcs", 0, -63 },

			-- Sudden Doom
			{ spellID = 49530, unitId = "player", caster = "all", filter = "BUFF" },
			-- Crimson Scourge
			{ spellID = 81141, unitId = "player", caster = "all", filter = "BUFF" },
			-- Killing Machine
			{ spellID = 51128, unitId = "player", caster = "all", filter = "BUFF" }, 
			-- Dark Succor
			{ spellID = 101568, unitId = "player", caster = "player", filter = "BUFF" },
			-- Freezing Fog
			{ spellID = 59052, unitId = "player", caster = "all", filter = "BUFF" },

		},
	},
	["MAGE"] = { ---------------------------------------------------- Mage
		{
			Name = "Cooldown",
			Enable = true,
			Direction = "UP",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37, 
			setPoint = { "BOTTOMRIGHT", "iFilgerCooldowns", 40, 0 },

			-- Water Elemental Freeze
			{ spellID = 33395, filter = "CD" },
			-- Blast Wave
			{ spellID = 11113, filter = "CD" },
			-- Fire Blast
			{ spellID = 2136, filter = "CD" },
			-- Counterspell
			{ spellID = 2139, filter = "CD" },
			-- Deep Freeze
			{ spellID = 44572, filter = "CD" }, 
			-- Arcane Power
			{ spellID = 12042, filter = "CD" }, 
			-- Icy Veins
			{ spellID = 12472, filter = "CD" }, 
			-- Combustion
			{ spellID = 11129, filter = "CD" }, 
			-- Cauterize
			{ spellID = 87023, unitId = "player", caster = "all", filter = "DEBUFF" },
		},	
		{
			Name = "Buffs and Debuffs",
			Enable = true,
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37, 
			setPoint = { "BOTTOMLEFT", "iFilgerBuffDebuff", 0, 24 },
			
			-- Frostbolt
			{ spellID = 116, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Slow
			{ spellID = 31589, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Icy Veins
			{ spellID = 12472, unitId = "player", caster = "player", filter = "BUFF" },
			-- Arcane Power
			{ spellID = 12042, unitId = "player", caster = "all", filter = "BUFF" },
			-- Ice Block
			{ spellID = 45438, unitId = "player", caster = "player", filter = "BUFF" }, 
			-- Invisibility
			{ spellID = 66, unitId = "player", caster = "all", filter = "BUFF" }, 
			-- Pyromaniac (fire damage increased by 10%, applyied by bomb)
			{ spellID = 132210, unitId = "player", caster = "all", filter = "BUFF" }, 
			-- Pyroblast
			{ spellID = 11366, unitId = "target", caster = "player", filter = "DEBUFF" }, 
			-- Living Bomb
			{ spellID = 44457, unitId = "target", caster = "player", filter = "DEBUFF" }, 
			-- Frost Bomb
			{ spellID = 112948, unitId = "target", caster = "player", filter = "DEBUFF" }, 
			-- Nether Tempest
			{ spellID = 114923, unitId = "target", caster = "player", filter = "DEBUFF" }, 
			-- Ignite
			{ spellID = 12846, unitId = "target", caster = "player", filter = "DEBUFF" }, 
			-- Combustion
			{ spellID = 11129, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Deep Freeze
			{ spellID = 44572, unitId = "target", caster = "all", filter = "DEBUFF" }, 
			-- Freeze
			{ spellID = 33395, unitId = "target", caster = "all", filter = "DEBUFF" }, 
			-- Frost Nova
			{ spellID = 122, unitId = "target", caster = "all", filter = "DEBUFF" }, 
			-- Ring of Frost
			{ spellID = 82691, unitId = "target", caster = "all", filter = "DEBUFF" }, 
			-- Frostjaw
			{ spellID = 102051, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Rapid teleportation
			{ spellID = 46989, unitId = "player", caster = "player", filter = "BUFF" },
			-- Greater Invisibility
			{ spellID = 110960, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Mage Procs",
			Enable = true,
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 60, 
			setPoint = { "BOTTOMLEFT", "iFilgerProcs", 0, -63 },
			
			-- Missiles
			{ spellID = 79683, unitId = "player", caster = "player", filter = "BUFF" },
			-- Brain Freeze
			{ spellID = 57761, unitId = "player", caster = "player", filter = "BUFF" },
			-- Heating Up 
			{ spellID = 48107, unitId = "player", caster = "player", filter = "BUFF", icon =  [[Interface\Icons\spell_mage_infernoblast]] },
			-- Hot Streak
			{ spellID = 48108, unitId = "player", caster = "player", filter = "BUFF" },
			-- Arcane Blast
			{ spellID = 30451, unitId = "player", caster = "player", filter = "DEBUFF" },
			-- Fingers Of Frost
			{ spellID = 112965, unitId = "player", caster = "player", filter = "BUFF"},
			-- Blazing Speed
			{ spellID = 108843, unitId = "player", caster = "all", filter = "BUFF" },
			-- Cauterize	
			{ spellID = 87024, unitId = "player", caster = "player", filter = "DEBUFF" },
			-- Alter Time
			{ spellID = 110909, unitId = "player", caster = "player", filter = "BUFF" },
			-- Temporal Shield	
			{ spellID = 115610, unitId = "player", caster = "player", filter = "DEBUFF" },
			-- Ice Floes
			{ spellID = 108839, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Mage InvertAura",
			Enable = true, -- i don't want to spam, nor to use it. :)
			Direction = "HORIZONTAL",
			Interval = 4,
			Mode = "ICON",
			Alpha = 0.75,
--			BarWidth = 150,
			Size = 47, 
			setPoint = { "BOTTOM", "iFilgerMageInvertAura", 0, 22 },
			
			-- Pyromaniac (fire damage increased by 10%, applyied by bomb)
			{ spellID = 132210, unitId = "target", caster = "player", filter = "IDEBUFF", incombat = true, spec = 2 },
		},
		{
			Name = "Focus",  
			Enable = true,
			Direction = "LEFT",
			Interval = 2,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 36, 
			setPoint = { "TOPRIGHT", "iFilgerFocusBuffs", 0, -22 },
			
			-- Sheep mage
			{ spellID = 118, unitId = "focus", caster = "player", filter = "DEBUFF" },
		},
		{
			Name = "Interrupt",  
			Enable = true,
			Direction = "HORIZONTAL",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = FS, 
			setPoint = { "TOP", "iFilgerInterrupt", 0, -22 },
			
			-- Frostbolt
			{ spellID = 116, filter = "CD" },
			-- Fireball
			{ spellID = 133, filter = "CD" },	
			-- Polymorph
			{ spellID = 118, filter = "CD" },
		},
	},
	["PRIEST"] = { ---------------------------------------------------- Priest
		{
			Name = "Self Buffs",
			Enable = true,
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 32,
			setPoint = { "BOTTOMRIGHT", "iFilgerBuffPlayerHeal", 0, 24 },

			-- Inner Fire
			 { spellID = 588, unitId = "player", caster = "player", filter = "BUFF" },
			-- Inner Will
			{ spellID = 73413, unitId = "player", caster = "player", filter = "BUFF" },
			-- Fear Ward
			{ spellID = 6346, unitId = "player", caster = "player", filter = "BUFF" },

		},
		{
			Name = "Cooldown",
			Enable = true,
			Direction = "UP",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37,
			setPoint = { "BOTTOMRIGHT", "iFilgerCooldowns", 40, 0 },

			-- Angelic Bulwark
			{ spellID = 114214, filter = "ICD", trigger = "BUFF", duration = 90 },
			-- Archangel
			{ spellID = 81700, filter = "CD" },
			-- Cascade
			{ spellID = 121135, filter = "CD" },
			-- Circle of Healing
			{ spellID = 34861, filter = "CD" },
			-- Desperate Prayer
			{ spellID = 19236, filter = "CD" },
			-- Dispersion
			{ spellID = 47585, filter = "CD" }, 
			-- Divine Hymn
			{ spellID = 64843, filter = "CD" },
			-- Divine Star
			{ spellID = 110744, filter = "CD" },
			-- Dominate Mind
			{ spellID = 605, filter = "CD" },
			-- Fade
			{ spellID = 586, filter = "CD" },
			-- Fear Ward
			{ spellID = 6346, filter = "CD" },
			-- Guardian Spirit
			{ spellID = 47788, filter = "CD" }, 
			-- Halo
			{ spellID = 120517, filter = "CD" },
			-- Holy Word: Chastise
			{ spellID = 88625, filter = "CD" },
			-- Hymn of Hope
			{ spellID = 64901, filter = "CD" },
			-- Inner Focus
			{ spellID = 89485, filter = "CD" }, 
			-- Leap of Faith
			{ spellID = 73325, filter = "CD" },
			-- Lightwell
			{ spellID = 724, filter = "CD" },
			-- Mass Dispel
			{ spellID = 32375, filter = "CD" },
			-- Penance
			{ spellID = 47540, filter = "CD" }, 
			-- Power Infusion
			{ spellID = 10060, filter = "CD" },
			-- Power Word: Barrier
			{ spellID = 62618, filter = "CD" },
			-- Prayer of Mending
			{ spellID = 33076, filter = "CD" },
			-- Psychic Horror
			{ spellID = 64044, filter = "CD" },
			-- Psychic Scream
			{ spellID = 8122, filter = "CD" }, 
			-- Purify
			{ spellID = 527, filter = "CD" },
			-- Shadowfiend
			{ spellID = 34433, filter = "CD" },
			-- Silence
			{ spellID = 15487, filter = "CD" },
			-- Spectral Guise
			{ spellID = 112833, filter = "CD" },
			-- Spirit Shell
			{ spellID = 109964, filter = "CD" },
			-- Vampiric Embrace
			{ spellID = 15286, filter = "CD" },
			-- Void Tendrils
			{ spellID = 108920, filter = "CD" },
			-- Void Shift
			{ spellID = 108968, filter = "CD" },
		},
		{
			Name = "Buffs and Debuffs",
			Enable = true,
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37,
			setPoint = { "BOTTOMLEFT", "iFilgerBuffDebuff", 0, 24 },


			-- Chakra: Serenity
			{ spellID = 81208, unitId = "player", caster = "player", filter = "BUFF" },
			-- Chakra: Sanctuary
			{ spellID = 81206, unitId = "player", caster = "player", filter = "BUFF" },
			-- Chakra: Chastise
			{ spellID = 81209, unitId = "player", caster = "player", filter = "BUFF" },

			-- Phantasm
			{ spellID = 114239, unitId = "player", caster = "player", filter = "BUFF" },
			-- Spectral Guise
			{ spellID = 119032, unitId = "player", caster = "player", filter = "BUFF" },

			-- Guardian Spirit
			{ spellID = 47788, unitId = "player", caster = "player", filter = "BUFF" },
			-- Pain Suppression
			{ spellID = 33206, unitId = "player", caster = "player", filter = "BUFF" },
			-- Renew
			{ spellID = 139, unitId = "player", caster = "player", filter = "BUFF" },
			-- Power Word: Shield
			{ spellID = 17, unitId = "player", caster = "player", filter = "BUFF" },
			-- Inner Focus
			{ spellID = 89485, unitId = "player", caster = "player", filter = "BUFF" },
			-- Fade
			{ spellID = 586, unitId = "player", caster = "player", filter = "BUFF" },
			-- Borrowed Time
			{ spellID = 59889, unitId = "player", caster = "player", filter = "BUFF" },
			-- Spirit Shell
			{ spellID = 109964, unitId = "player", caster = "player", filter = "BUFF", absID = true },
			
			-- Temporal Boon - 2T13 Heal
			{ spellID = 105826, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Priest Procs",
			Enable = true,
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 60,
			setPoint = { "BOTTOMLEFT", "iFilgerProcs", 0, -63 },

			-- Weakened Soul
			{ spellID = 6788, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Glyph of Inner Focus
			{ spellID = 96267, unitId = "player", caster = "player", filter = "BUFF" },
			-- Spirit of Redemption
			{ spellID = 27827, unitId = "player", caster = "all", filter = "BUFF" },
			-- Serendipity
			{ spellID = 63735, unitId = "player", caster = "player", filter = "BUFF" },
			-- Archangel
			{ spellID = 81700, unitId = "player", caster = "player", filter = "BUFF" },
			-- Evangelism
			{ spellID = 81662, unitId = "player", caster = "player", filter = "BUFF" },
			-- Surge of Light
			{ spellID = 114255, unitId = "player", caster = "all", filter = "BUFF" },
			-- Divine Insight : Shield
			{ spellID = 123266, unitId = "player", caster = "all", filter = "BUFF", absID = true },
			-- Divine Insight : PoM
			{ spellID = 123267, unitId = "player", caster = "all", filter = "BUFF", absID = true },
			-- Twist of Fate
			{ spellID = 123254, unitId = "player", caster = "player", filter = "BUFF", spec = 1 },
			-- Twist of Fate
			{ spellID = 123254, unitId = "player", caster = "player", filter = "BUFF", spec = 2 },
			-- Angelic Bulwark
			{ spellID = 114214, unitId = "player", caster = "player", filter = "BUFF" },
		},	
		{
			Name = "Buffs and Debuffs HEAL",
			Enable = true,
			Direction = "LEFT",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37,
			setPoint = { "TOPRIGHT", "iFilgerBuffDebuffHeal", 20, -22 },

			-- Prayer of Mending
			{ spellID = 41635, unitId = "target", caster = "player", filter = "BUFF" },
			-- Guardian Spirit
			{ spellID = 47788, unitId = "target", caster = "player", filter = "BUFF" },
			-- Pain Suppression
			{ spellID = 33206, unitId = "target", caster = "player", filter = "BUFF" },
			-- Power Word: Shield
			{ spellID = 17, unitId = "target", caster = "player", filter = "BUFF" },
			-- Renew
			{ spellID = 139, unitId = "target", caster = "player", filter = "BUFF" },
			-- Fear Ward
			{ spellID = 6346, unitId = "target", caster = "player", filter = "BUFF" },
			-- Echo of Light
			{ spellID = 77489, unitId = "target", caster = "player", filter = "BUFF" },
			-- Grace
			{ spellID = 77613, unitId = "target", caster = "player", filter = "BUFF" },
			-- Weakened Soul
			{ spellID = 6788, unitId = "target", caster = "all", filter = "BUFF" }, -- requested but a bit useless
		},
		{
			Name = "Focus",
			Enable = true,
			Direction = "LEFT",
			IconSide = "LEFT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 32,
			setPoint = { "TOPRIGHT", "iFilgerFocusBuffs", 0, -22 },

			-- Shackle Undead
			{ spellID = 9484, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Psychic Scream
			{ spellID = 8122, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Shadow Word: Pain
			{ spellID = 589, unitId = "focus", caster = "player", filter = "DEBUFF" },
			-- Devouring Plague
			{ spellID = 2944, unitId = "focus", caster = "player", filter = "DEBUFF" },
			-- Vampiric Touch
			{ spellID = 34914, unitId = "focus", caster = "player", filter = "DEBUFF" },
		},
		{	
			Name = "Cooldown DPS",
			Enable = true,
			Direction = "UP",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 36,
			setPoint = { "BOTTOM", "iFilgerProcDps", 0, 52 },

			-- Mind Blast
			{ spellID = 8092, filter = "CD" },
			-- Holy Fire
			{ spellID = 14914, filter = "CD" },
		},
		{
			Name = "Buffs DPS",
			Enable = true,
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 36,
			setPoint = { "BOTTOMRIGHT", "iFilgerBuffDps", 0, 22 },

			-- Dispersion
			{ spellID = 47585, unitId = "player", caster = "player", filter = "BUFF" },
			-- Surge of Darkness
			{ spellID = 87160, unitId = "player", caster = "all", filter = "BUFF" },
			-- Divine Insight - Shadow
			{ spellID = 124430, unitId = "player", caster = "all", filter = "BUFF", absID = true },
			-- Glyph of Mind Spike
			{ spellID = 81292, unitId = "player", caster = "all", filter = "BUFF" },
			-- Twist of Fate
			{ spellID = 123254, unitId = "player", caster = "player", filter = "BUFF", spec = 3},
		},
		{
			Name = "Debuffs DPS",
			Enable = true,
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 36,
			setPoint = { "BOTTOMLEFT", "iFilgerDebuffDps", 0, 22},

			-- Shackle undead
			{ spellID = 9484, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Psychic Scream
			{ spellID = 8122, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Shadow Word: Pain
			{ spellID = 589, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Devouring Plague
			{ spellID = 2944, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Vampiric Touch
			{ spellID = 34914, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
	},
	["WARLOCK"] = { ---------------------------------------------------- Warlock
		{
			Name = "Warlock Procs",
			Enable = true,
			Direction = "DOWN",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37,
			setPoint = { "TOP", "iFilgerProcs", -0, -23 },

			-- Kil'jaeden's Cunning
			{ spellID = 119049, unitId = "player", caster = "player", filter = "BUFF" },
			-- Backlash
			{ spellID = 34936, unitId = "player", caster = "player", filter = "BUFF" },
			-- Apocalypse T12 4P
			{ spellID = 99232, unitId = "player", caster = "player", filter = "BUFF" },
			-- Molten Core
			{ spellID = 122351, unitId = "player", caster = "player", filter = "BUFF" },
			-- Decimation
			{ spellID = 108869, unitId = "player", caster = "player", filter = "BUFF" },
			-- Backdraft
			{ spellID = 117896, unitId = "player", caster = "player", filter = "BUFF" },
			-- Demonic Rebirth
			{ spellID = 88448, unitId = "player", caster = "player", filter = "BUFF" },
			-- Nightfall
			{ spellID = 108558, unitId = "player", caster = "player", filter = "BUFF" },
			-- Soulburn
			{ spellID = 74434, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs DPS",
			Enable = true,
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37,
			setPoint = { "BOTTOMLEFT", "iFilgerTargetCCDebuff", 0, 22},

			-- Havoc
			{ spellID = 80240, unitId = "target", caster = "player", filter = "DEBUFF" },	
			-- Agony
			{ spellID = 980, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Doom(Demo only while in Demon form, replaces Corruption)
			{ spellID = 603, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Unstable Affliction
			{ spellID = 30108, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Corruption
			{ spellID = 172, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Immolate
			{ spellID = 348, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Haunt
			{ spellID = 48181, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Seed of Corruption
			{ spellID = 27243, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
		{
			Name = "Buffs and Debuffs CC",
			Enable = true,
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37,
			setPoint = { "BOTTOMRIGHT", "iFilgerTargetDoTDebuff", 58, 22},
			
			-- Shadowflame
			{ spellID = 47960, unitId = "target", caster = "player", filter = "DEBUFF" },
            -- Felstorm
			{ spellID = 89751, unitId = "pet", caster = "all", filter = "BUFF" },
			-- Curse of the Elements
			{ spellID = 1490, unitId = "target", caster = "all", filter = "DEBUFF" },			
			-- Curse of Emfeeblement
			{ spellID = 109466, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Curse of Exhaustion
			{ spellID = 18223, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Fear
			{ spellID = 5782, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Blood Fear
			{ spellID = 111397, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Banish
			{ spellID = 710, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Howl of Terror
			{ spellID = 5484, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Mortal Coil
			{ spellID = 6789, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Enslave Demon
			{ spellID = 1098, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Demon Charge
			{ spellID = 54785, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Dark Intent
			{ spellID = 109773, unitId = "target", caster = "player", filter = "BUFF" },
			-- Soulstone Resurrection
			{ spellID = 20707, unitId = "target", caster = "player", filter = "BUFF" },	
			-- Hand of Gul'dan
			{ spellID = 105174, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
		{
			Name = "Player Buffs",
			Enable = true,
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37, 
			setPoint = { "BOTTOMLEFT", "iFilgerBuffDebuff", 0, 24 },
			
			
			-- Dark Soul: Misery
			{ spellID = 113860, unitId = "player", caster = "player", filter = "BUFF" },
			-- Dark Soul: Instability
			{ spellID = 113858, unitId = "player", caster = "player", filter = "BUFF" },
			-- Dark Soul: Knowledge
			{ spellID = 113861, unitId = "player", caster = "player", filter = "BUFF" },
			-- Soul Swap
			{ spellID = 86121, unitId = "player", caster = "player", filter = "BUFF" },		
			-- Twilight Ward
			{ spellID = 6229, unitId = "player", caster = "player", filter = "BUFF" },
			-- Unending Resolve
			{ spellID = 104773, unitId = "player", caster = "player", filter = "BUFF" },
			-- Burning Rush
			{ spellID = 111400, unitId = "player", caster = "player", filter = "BUFF" },
			-- Dark Regeneration
			{ spellID = 108359, unitId = "player", caster = "player", filter = "BUFF" },
			-- Dark Bargain
			{ spellID = 110913, unitId = "player", caster = "player", filter = "BUFF" },
			-- Sacrificial Pact
			{ spellID = 108416, unitId = "player", caster = "player", filter = "BUFF" },
			-- Soul Link
			{ spellID = 108415, unitId = "player", caster = "player", filter = "BUFF" },
			
		},
		{
			Name = "Cooldown",
			Enable = true,
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 33,
			setPoint = { "BOTTOMRIGHT", "iFilgerCooldowns", 0, 22 },

			-- Kil'jaeden's Cunning
			{ spellID = 119049, filter = "CD" },
			-- Archimonde's Vengeance
			{ spellID = 108505, filter = "CD" },
			-- Grimoire of Service
			{ spellID = 108501, filter = "CD" },
			-- Unbound Will
			{ spellID = 108482, filter = "CD" },
 			-- Blood Fear
			{ spellID = 111397, filter = "CD" },
			-- Sacrificial Pact
			{ spellID = 108416, filter = "CD" },
			-- Dark Bargain
			{ spellID = 110913, filter = "CD" },
			-- Dark Regeneration
			{ spellID = 108359, filter = "CD" },
			-- Demon Soul
			{ spellID = 77801, filter = "CD" },
			-- Infernal
			{ spellID = 1122, filter = "CD" },
			-- Conflagrate
			{ spellID = 17962, filter = "CD" },
			-- Shadow Ward
			{ spellID = 6229, filter = "CD" },
			-- Demon Leap
			{ spellID = 54785, filter = "CD" },
			-- Soulshatter
			{ spellID = 29858, filter = "CD" },
			-- Demonic Circle: Teleport
			{ spellID = 48020, filter = "CD" },
			-- Howl of Terror
			{ spellID = 5484, filter = "CD" },
			-- Mortal Coil
			{ spellID = 6789, filter = "CD" },
			-- Haunt
			{ spellID = 48181, filter = "CD" },
			-- Shadowburn
			{ spellID = 17877, filter = "CD" },
			-- Shadowfury
			{ spellID = 30283, filter = "CD" },
			-- Chaos Bolt
			{ spellID = 116858, filter = "CD" },
			-- Soul Harvest
			{ spellID = 101976, filter = "CD" },
			-- Felstorm
			{ spellID = 89751, filter = "CD" },
			-- Soulburn
			{ spellID = 74434, filter = "CD" },
			-- Hand of Gul'dan
			{ spellID = 105174, filter = "CD" },
		},
		{
			Name = "Pet Cooldown",
			Enable = true,
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 33,
			setPoint = { "BOTTOMLEFT", "iFilgerPetCooldowns", 0, 22 },

			--SPECIAL PETS
			-- Wrathstorm
--			{ spellID = 119915, filter = "CD" },
			-- Wrathstorm 
			{ spellID = 115831, filter = "CD" },
			-- Axe Toss
			{ spellID = 89766, filter = "CD" },
			-- Sear Magic
			{ spellID = 115276, filter = "CD" },
			-- Cauterize Master
			{ spellID = 119899, filter = "CD" },
			-- Cauterize Master
--			{ spellID = 119905, filter = "CD" },
			-- Optical Blast
			{ spellID = 119911, filter = "CD" },
			-- Optical Blast
--			{ spellID = 115781, filter = "CD" },
			-- Clone Magic
			{ spellID = 115284, filter = "CD" },
			-- Mesmerize
			{ spellID = 115268, filter = "CD" },
			-- Fellash
--			{ spellID = 115770, filter = "CD" },
			-- Fellash
			{ spellID = 119913, filter = "CD" },
			
			-- NORMAL PETS
			-- Devour Magic (Felhunter)
			{ spellID = 19505, filter = "CD" },
			-- Spell Lock (Felhunter)
			{ spellID = 19647 , filter = "CD" },
			-- Spell Lock (Felhunter)
--			{ spellID = 119910  , filter = "CD" },
			-- Spell Lock (Felhunter)
--			{ spellID = 132409  , filter = "CD" },
			-- Whiplash
			{ spellID = 6360  , filter = "CD" },
			-- Whiplash
--			{ spellID = 119909 , filter = "CD" },
			-- Seduction
			{ spellID = 6358 , filter = "CD" },
			-- Seduction
--			{ spellID = 132412 , filter = "CD" },
			-- Singe Magic
			{ spellID = 89808 , filter = "CD" },
			-- Singe Magic
--			{ spellID = 132411 , filter = "CD" },
			-- Cauterize Master
--			{ spellID = 119899 , filter = "CD" },
			-- Cauterize Master
--			{ spellID = 119905 , filter = "CD" },
			-- Suffering (Voidwalker)
			{ spellID = 17735, filter = "CD" },
			-- Shadow Bulwark (Voidwalker)
			{ spellID = 132413 , filter = "CD" },
		},
		{
			Name = "Focus",
			Enable = true,
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37,
			setPoint = { "TOPRIGHT", "iFilgerFocusBuffs", 0, -22 },

			-- Havoc
			{ spellID = 80240, unitId = "focus", caster = "player", filter = "DEBUFF" },	
			-- Fear
			{ spellID = 5782, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Banish
			{ spellID = 710, unitId = "focus", caster = "all", filter = "DEBUFF" },
		},
	},
	["DRUID"] = { ---------------------------------------------------- Druid
		{
			Name = "Cooldown",
			Enable = true,
			Direction = "UP",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 32,
			setPoint = { "BOTTOMRIGHT", "iFilgerCooldowns", 40, 0 },

			-- Displacer Beast
			{ spellID = 102280, filter = "CD", absID = true },
			-- Wild Charge
			{ spellID = 102401, filter = "CD", absID = true },
			-- Starsurge
			{ spellID = 78674, filter = "CD" },
			-- Starfall
			{ spellID = 48505, filter = "CD" },
			-- Frenzied Regeneration
			{ spellID = 22842, filter = "CD" },
		},
		{
			Name = "Buffs Player Heal",
			Enable = true,
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 32,
			setPoint = { "BOTTOMRIGHT", "iFilgerBuffPlayerHeal", 0, 24 },

			-- Lifebloom
			{ spellID = 33763, unitId = "player", caster = "player", filter = "BUFF" },
			-- Rejuvenation
			{ spellID = 774, unitId = "player", caster = "player", filter = "BUFF" },
			-- Regrowth
			{ spellID = 8936, unitId = "player", caster = "player", filter = "BUFF" },
			-- Wild Growth
			{ spellID = 48438, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs Target Heal",
			Enable = true,
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 32,
			setPoint = { "BOTTOMLEFT", "iFilgerBuffTargetHeal", 0, 24 },

			-- Lifebloom
			{ spellID = 33763, unitId = "target", caster = "player", filter = "BUFF" },
			-- Rejuvenation
			{ spellID = 774, unitId = "target", caster = "player", filter = "BUFF" },
			-- Regrowth
			{ spellID = 8936, unitId = "target", caster = "player", filter = "BUFF" },
			-- Wild Growth
			{ spellID = 48438, unitId = "target", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs player",
			Enable = true,
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37, 
			setPoint = { "BOTTOMLEFT", "iFilgerBuffDebuff", 0, 24 },
			
			-- Incarnation: Tree of Life
			{ spellID = 117679, unitId = "player", caster = "player", filter = "BUFF" },
			-- Incarnation: King of the Jungle
			{ spellID = 102543, unitId = "player", caster = "player", filter = "BUFF" },
			-- Incarnation: Son of Ursoc
			{ spellID = 102558, unitId = "player", caster = "player", filter = "BUFF" },
			-- Incarnation: Chosen of Elune
			{ spellID = 102560, unitId = "player", caster = "player", filter = "BUFF" },
			
			-- Celestial Alignment
			{ spellID = 112071, unitId = "player", caster = "player", filter = "BUFF" },

			-- Savage Roar
			{ spellID = 52610, unitId = "player", caster = "player", filter = "BUFF" },
			-- Nature's Vigil
			{ spellID = 124974, unitId = "player", caster = "player", filter = "BUFF" },
			-- Nature's Grasp
			{ spellID = 16689, unitId = "player", caster = "player", filter = "BUFF" },
			-- Dash
			{ spellID = 1850, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Druid Procs",
			Enable = true,
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 60,
			setPoint = { "BOTTOMLEFT", "iFilgerProcs", 0, -63 },


			-- Nature's Grace
			{ spellID = 16886, unitId = "player", caster = "player", filter = "BUFF" },
			-- Harmony (Healer Mastery Buff)
			{ spellID = 100977, unitId = "player", caster = "player", filter = "BUFF" },

			-- Eclipse (Lunar)
			{ spellID = 48518, unitId = "player", caster = "player", filter = "BUFF" },
			-- Eclipse (Solar)
			{ spellID = 48517, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shooting Stars
			{ spellID = 93400, unitId = "player", caster = "player", filter = "BUFF" },
			-- Owlkin Frenzy
			{ spellID = 48391, unitId = "player", caster = "player", filter = "BUFF" },
			-- Lunar Shower
			{ spellID = 81192, unitId = "player", caster = "player", filter = "BUFF" },
			-- Starfall
			{ spellID = 48505, unitId = "player", caster = "player", filter = "BUFF" },

			-- Survival Instincts
			{ spellID = 61336, unitId = "player", caster = "player", filter = "BUFF" },
			-- Ironbark
			{ spellID = 102342, unitId = "player", caster = "player", filter = "BUFF" },
			-- Might of Ursoc
			{ spellID = 106922, unitId = "player", caster = "player", filter = "BUFF" },
			-- Enrage
			{ spellID = 5229, unitId = "player", caster = "player", filter = "BUFF" },
			-- Stampeding Roar
			{ spellID = 106898, unitId = "player", caster = "player", filter = "BUFF" },
			-- Berserk - Cat
			{ spellID = 106951, unitId = "player", caster = "player", filter = "BUFF", absID = true },
			-- Berserk - Bear
			{ spellID = 50334, unitId = "player", caster = "player", filter = "BUFF", absID = true },
			-- Tiger's Fury
			{ spellID = 5217, unitId = "player", caster = "player", filter = "BUFF" },
			
			-- Clearcasting
			{ spellID = 16870, unitId = "player", caster = "player", filter = "BUFF" },
			-- Innervate
			{ spellID = 29166, unitId = "player", caster = "all", filter = "BUFF" },
			-- Barkskin
			{ spellID = 22812, unitId = "player", caster = "player", filter = "BUFF" },
			
			-- Glyph of Barkskin
			{ spellID = 63058, unitId = "player", caster = "player", filter = "BUFF" },
			-- Tranquility
			{ spellID = 740, unitId = "player", caster = "player", filter = "BUFF" },
			-- Natural Harmony - 2T13 Heal
			{ spellID = 105713, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Debuffs Target",
			Enable = true,
			Direction = "LEFT",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37,
			setPoint = { "TOPRIGHT", "iFilgerTargetDebuff", 0, -24 },

			-- Maim
			{ spellID = 22570, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Hibernate
			{ spellID = 2637, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Entangling Roots
			{ spellID = 339, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Cyclone
			{ spellID = 33786, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Moonfire
			{ spellID = 8921, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Sunfire
			{ spellID = 93402, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Insect Swarm
			{ spellID = 5570, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Rake
			{ spellID = 1822, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Rip
			{ spellID = 1079, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Lacerate
			{ spellID = 33745, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Pounce Bleed
			{ spellID = 9007, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Mangle
			{ spellID = 33876, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Faerie Fire
			{ spellID = 770, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Pounce 
			{ spellID = 9005, unitId = "target", caster = "all", filter = "DEBUFF" },
		},
		{
			Name = "Focus",
			Enable = true,
			Direction = "LEFT",
			Interval = 4,
			Alpha = 1,
			Mode = "ICON",
			Size = 32,
			setPoint = { "TOPRIGHT", "iFilgerFocusBuffs", 0, -22 },

			-- Hibernate
			{ spellID = 2637, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Entangling Roots
			{ spellID = 339, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Cyclone
			{ spellID = 33786, unitId = "focus", caster = "all", filter = "DEBUFF" },
		},
	},
	["HUNTER"] = { ---------------------------------------------------- Hunter
		{
			Name = "Cooldown",
			Enable = true,
			Direction = "UP",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37,
			setPoint = { "BOTTOMRIGHT", "iFilgerCooldowns", 40, 0 },

			-- Rapid Fire
			{ spellID = 3045, filter = "CD" },
			-- Feign Death
			{ spellID = 5384, filter = "CD" },
			-- Bestial Wrath
			{ spellID = 19574, filter = "CD" },
		},
		{
			Name = "Hunter Procs",
			Enable = true,
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 60,
			setPoint = { "BOTTOMLEFT", "iFilgerProcs", 0, -63 },

			-- Lock and Load
			{ spellID = 56453, unitId = "player", caster = "player", filter = "BUFF" },
			-- Improved Steady Shot
			{ spellID = 53224, unitId = "player", caster = "player", filter = "BUFF" },
			-- Ready, Set, Aim
			{ spellID = 82925, unitId = "player", caster = "player", filter = "BUFF" },
			-- Fire!
			{ spellID = 82926, unitId = "player", caster = "player", filter = "BUFF" },
			-- Cobra Strikes
			{ spellID = 53257, unitId = "player", caster = "player", filter = "BUFF" },
			-- Focus Fire
			{ spellID = 82692, unitId = "player", caster = "player", filter = "BUFF" },
			-- Thrill of the Hunt
			{ spellID = 34720, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Player Buffs",
			Enable = true,
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37,
			setPoint = { "BOTTOMLEFT", "iFilgerPlayerBuff", 0, 24 },

			-- Rapid Fire
			{ spellID = 3045, unitId = "player", caster = "player", filter = "BUFF" },
			-- Mend Pet
			{ spellID = 136, unitId = "pet", caster = "player", filter = "BUFF" },
			-- Spirit Mend
			{ spellID = 90361, unitId = "player", caster = "player", filter = "BUFF" },
			-- Deterrence
			{ spellID = 19263, unitId = "player", caster = "player", filter = "BUFF" },
			-- Sniper Training
			{ spellID = 64420, unitId = "player", caster = "player", filter = "BUFF" },
			-- The Beast Within
			{ spellID = 34471, unitId = "player", caster = "player", filter = "BUFF" },
			-- Camouflage
			{ spellID = 51755, unitId = "player", caster = "player", filter = "BUFF" },
			-- Posthaste
			{ spellID = 118922, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Target Debuffs",
			Enable = true,
			Direction = "HORIZONTAL",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37,
			setPoint = { "TOP", "iFilgerTargetDebuff", 0, -24 },

			-- Wyvern Sting
			{ spellID = 19386, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Silencing Shot
			{ spellID = 34490, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Serpent Sting
			{ spellID = 1978, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Widow Venom
			{ spellID = 82654, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Black Arrow
			{ spellID = 3674, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Explosive Shot
			{ spellID = 53301, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Hunter's Mark
			{ spellID = 1130, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Piercing Shots 
			{ spellID = 63468, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- A Murder of Crows
			{ spellID = 131894, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
		{
			Name = "Focus",
			Enable = true,
			Direction = "LEFT",
			IconSide = "LEFT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
			Size = 32,
			setPoint = { "TOPRIGHT", "iFilgerFocusBuffs", 0, -22 },

			-- Wyvern Sting
			{ spellID = 19386, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Silencing Shot
			{ spellID = 34490, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Freezing Trap
			{ spellID = 3355, unitId = "focus", caster = "all", filter = "DEBUFF" },
		},
	},	
	["ROGUE"] = { ---------------------------------------------------- Rogue
		{
			Name = "Cooldown",
			Enable = true,
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37,
			setPoint = { "TOPLEFT", "iFilgerCooldowns", 0, -22 },

			-- Sprint
			{ spellID = 2983, filter = "CD" },
			-- Cloak of Shadows
			{ spellID = 31224, filter = "CD" },
			-- Tricks of the Trade
			{ spellID = 57934, filter = "CD" },
			-- Kidney Shot
			{ spellID = 408, filter = "CD" },
			-- ShadowStep
			{ spellID = 36554, filter = "CD" },
			-- Shadow Dance
			{ spellID = 51713, filter = "CD" },
			-- Vendetta
			{ spellID = 79140, filter = "CD" },
			-- Vanish
			{ spellID = 1856, filter = "CD" },
			-- Cheating Death ICD
			{ spellID = 45182, filter = "ICD", trigger = "BUFF", duration = 90 },
		},
		{
			Name = "Player Buffs",
			Enable = true,
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37,
			setPoint = { "BOTTOMRIGHT", "iFilgerPlayerBuff", 0, 22 },

			-- Blade Flurry
			{ spellID = 13877, unitId = "player", caster = "player", filter = "BUFF" },
			-- Sprint
			{ spellID = 2983, unitId = "player", caster = "player", filter = "BUFF" },
			-- Cloak of Shadows
			{ spellID = 31224, unitId = "player", caster = "player", filter = "BUFF" },
			-- Adrenaline Rush
			{ spellID = 13750, unitId = "player", caster = "player", filter = "BUFF" },
			-- Evasion
			{ spellID = 5277, unitId = "player", caster = "player", filter = "BUFF" },
			-- Envenom
			{ spellID = 32645, unitId = "player", caster = "player", filter = "BUFF" },
			-- Slice and Dice
			{ spellID = 5171, unitId = "player", caster = "player", filter = "BUFF" },
			-- Recuperate
			{ spellID = 73651, unitId = "player", caster = "player", filter = "BUFF" },
			-- Tricks of the Trade
			{ spellID = 57934, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shadow Dance
			{ spellID = 51713, unitId = "player", caster = "player", filter = "BUFF" },
			-- Killing Spree
			{ spellID = 51690, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shallow Insight
			{ spellID = 84745, unitId = "player", caster = "player", filter = "BUFF" },
			-- Moderate Insight
			{ spellID = 84746, unitId = "player", caster = "player", filter = "BUFF" },
			-- Deep Insight
			{ spellID = 84747, unitId = "player", caster = "player", filter = "BUFF" },
			-- Master of subtlety
			{ spellID = 31665, unitId = "player", caster = "player", filter = "BUFF" },
			-- Combat Readiness
			{ spellID = 74001, unitId = "player", caster = "player", filter = "BUFF" },
			-- Feint
			{ spellID = 1966, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shroud of Concealment
			{ spellID = 114018, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shadow Blades
			{ spellID = 121471, unitId = "player", caster = "player", filter = "BUFF" },
			-- Burst of Speed
			{ spellID = 108212, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shadow Walk
			{ spellID = 114842, unitId = "player", caster = "player", filter = "BUFF" },
			-- Suffering -- Legendary buff
			{ spellID = 109959, unitId = "player", caster = "player", filter = "BUFF" },
			-- Nightmare -- Legendary buff
			{ spellID = 109955, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shadows of the Destroyer -- Legendary buff
			{ spellID = 109941, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Target Debuffs",
			Enable = true,
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37,
			setPoint = { "BOTTOMLEFT", "iFilgerTargetDebuff", 0, 22 },

			-- Cheap shot
			{ spellID = 1833, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Kidney shot
			{ spellID = 408, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Blind
			{ spellID = 2094, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Sap
			{ spellID = 6770, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Revealing Strike
			{ spellID = 84617, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Rupture
			{ spellID = 1943, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Garrote
			{ spellID = 703, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Gouge
			{ spellID = 1776, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Crimson Tempest
			{ spellID = 122233, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Weakened Armor
			{ spellID = 113746, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Dismantle
			{ spellID = 51722, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Deadly Poison
			{ spellID = 2818, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Mind Paralysis
			{ spellID = 115194, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Debilitating Poison
			{ spellID = 115196, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Wound Poison
			{ spellID = 8680, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Find Weakness
			{ spellID = 91023, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Hemorrhage
			{ spellID = 89775, unitId = "target", caster = "player", filter = "DEBUFF", absID = true  },
			-- Vendetta
			{ spellID = 79140, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Nerve Strike
			{ spellID = 112947, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
		{
			Name = "Focus",
			Enable = true,
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
			Size = 32,
			setPoint = { "TOPRIGHT", "iFilgerFocusBuffs", "TOPRIGHT", 0, -22 },

			-- Blind
			{ spellID = 2094, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Sap
			{ spellID = 6770, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Gouge
			{ spellID = 1776, unitId = "focus", caster = "all", filter = "DEBUFF" },
		},
		{
			Name = "Rogue Procs",
			Enable = true,
			Direction = "DOWN",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37,
			setPoint = { "TOP", "iFilgerProcs", -0, -23 },

			
			-- Tricks of the Trade
			{ spellID = 57934, caster = "all", filter = "ACD", incombat = true },
			-- Fury of the Destroyer -- Legendary buff
			{ spellID = 109949, unitId = "player", caster = "player", filter = "BUFF" },
			-- Vanish
			{ spellID = 1856, unitId = "player", caster = "player", filter = "BUFF" },
			-- Cheating death
			{ spellID = 45182, unitId = "player", caster = "player", filter = "BUFF" },
			-- Combat Insight
			{ spellID = 74002, unitId = "player", caster = "player", filter = "BUFF" },
			-- Blindside
			{ spellID = 121153, unitId = "player", caster = "player", filter = "BUFF" },
			-- Subterfuge
			{ spellID = 115192, unitId = "player", caster = "player", filter = "BUFF" },
		},
	},		
	["SHAMAN"] = { ---------------------------------------------------- Shaman
		{
			Name = "Self Buffs",
			Enable = true,
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
			Size = 32,
			setPoint = { "BOTTOMRIGHT", "iFilgerBuffPlayerHeal", 0, 24 },

			-- Earth Shield
			{ spellID = 974, unitId = "player", caster = "player", filter = "BUFF" },
			-- Riptide
			{ spellID = 61295, unitId = "player", caster = "player", filter = "BUFF" },
			-- Water Shield
			{ spellID = 52127, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Target Buffs",
			Enable = true,
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
			Size = 32,
			setPoint = { "BOTTOMLEFT", "iFilgerBuffTargetHeal", 0, 24 },

			-- Earth Shield
			{ spellID = 974, unitId = "target", caster = "player", filter = "BUFF" },
			-- Riptide
			{ spellID = 61295, unitId = "target", caster = "player", filter = "BUFF" },
			-- Hearthliving
			{ spellID = 51945, unitId = "target", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Cooldown",
			Enable = true,
			Direction = "UP",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37,
			setPoint = { "BOTTOMRIGHT", "iFilgerCooldowns", 40, 0 },

			-- Stone Bulwark Totem
			{ spellID = 108270, filter = "CD" },
			-- Grounding Totem
			{ spellID = 8177, filter = "CD" },
			-- Tremor Totem
			{ spellID = 8143, filter = "CD" },
			-- Spirit Link Totem
			{ spellID = 98008, filter = "CD" },
			-- Spiritwalker Grace
			{ spellID = 79206, filter = "CD" },
			-- Unleash Elements
			{ spellID = 73680, filter = "CD" },
			-- Shamanistic Rage
			{ spellID = 30823, filter = "CD" },
			-- Mana Tide Totem
			{ spellID = 16190, filter = "CD" },
			-- Ancestral Swiftness
			{ spellID = 16188, filter = "CD" },
			-- Fire Elemental Totem
			{ spellID = 2894, filter = "CD" },
			-- Earth Elemental Totem
			{ spellID = 2062, filter = "CD" },
			-- Bloodlust
			{ spellID = 2825, filter = "CD" },
			-- Hex
			{ spellID = 51514, filter = "CD" },
			-- Healing Rain
			{ spellID = 73920, filter = "CD" },
		},
		{
			Name = "Shaman Procs",
			Enable = true,
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 60,
			setPoint = { "BOTTOMLEFT", "iFilgerProcs", 0, -63 },

			-- Ancestral Swiftness
			{ spellID = 16188, unitId = "player", caster = "player", filter = "BUFF" },
			-- Maelstorm Weapon
			{ spellID = 53817, unitId = "player", caster = "player", filter = "BUFF" },
			-- Tidal Waves
			{ spellID = 51564, unitId = "player", caster = "player", filter = "BUFF" },
			-- Unleash Life
			{ spellID = 73685, unitId = "player", caster = "player", filter = "BUFF" },
			-- Nature's Guardian
			{ spellID = 31616, unitId = "player", caster = "player", filter = "BUFF" },
			-- Riptide
			{ spellID = 61295, caster = "all", filter = "ACD", incombat = false },
			-- Grounding Totem
			{ spellID = 8178, unitId = "player", caster = "all", filter = "BUFF" },
			-- Stone Bulwark Totem
			{ spellID = 114893, unitId = "player", caster = "player", filter = "BUFF" },
			-- Spirit Link Totem
			{ spellID = 98007, unitId = "player", caster = "player", filter = "BUFF" },			
			-- Spiritual Stimulus (2T13)
			{ spellID = 105763, unitId = "player", caster = "player", filter = "BUFF" },
			-- Timewalker (4T13 heal)
 			{ spellID = 105877, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Enable = true,
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37,
			setPoint = { "BOTTOMLEFT", "iFilgerBuffDebuff", 0, 24 },

			-- Earth Shield
			{ spellID = 974, unitId = "player", caster = "player", filter = "BUFF" },		
			-- Astral Shift
			{ spellID = 108271, unitId = "player", caster = "player", filter = "BUFF" },
			-- Spirit Walk
			{ spellID = 58875, unitId = "player", caster = "player", filter = "BUFF" },
			-- Ancestral Guidance
			{ spellID = 108281, unitId = "player", caster = "player", filter = "BUFF" },
			-- Ghost Wolf
			{ spellID = 2645, unitId = "player", caster = "player", filter = "BUFF" },

			-- Shamanistic Rage
			{ spellID = 30823, unitId = "player", caster = "player", filter = "BUFF" },
			-- Totem
			{ spellID = 77661, unitId = "target", caster = "all", filter = "DEBUFF", spec = 2 },
			-- Hex
			{ spellID = 51514, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Bind Elemental
			{ spellID = 76780, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Storm Strike
			{ spellID = 17364, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Earth Shock
			{ spellID = 8042, unitId = "target", caster = "player", filter = "DEBUFF", spec = 2 },
			-- Frost Shock
			{ spellID = 8056, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Flame Shock
			{ spellID = 8050, unitId = "target", caster = "player", filter = "DEBUFF", spec = 2 },
			-- Earthgrab
			{ spellID = 64695, unitId = "target", caster = "player", filter = "DEBUFF" },		
			-- Spiritwalker's Grace
			{ spellID = 79206, unitId = "player", caster = "player", filter = "BUFF", spec = 3 },
		},
		{
			Name = "Focus",
			Enable = true,
			Direction = "LEFT",
--			IconSide = "LEFT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
			Size = 32,
			setPoint = { "TOPRIGHT", "iFilgerFocusBuffs", 0, -22 },

			-- Earth Shield
			{ spellID = 974, unitId = "focus", caster = "player", filter = "BUFF" },
			-- Hex
			{ spellID = 51514, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Bind Elemental
			{ spellID = 76780, unitId = "focus", caster = "all", filter = "DEBUFF" },
		},
		{
			Name = "Debuffs Elem",
			Enable = true,
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37,
			setPoint = { "BOTTOMLEFT", "iFilgerTargetDebuff", 0, 22 },

			-- Flame Shock
			{ spellID = 8050, unitId = "target", caster = "player", filter = "DEBUFF", spec = 1 },
			-- Searing Totem
			{ spellID = 77661, unitId = "target", caster = "player", filter = "DEBUFF", spec = 1 },
			-- Thunderstrom
			{ spellID = 51490, filter = "CD" },
			-- Earth  Shock
			{ spellID = 8042, filter = "CD", spec = 1},
		},
		{
			Name = "Buffs Elem",
			Enable = true,
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37,
			setPoint = { "BOTTOMRIGHT", "iFilgerPlayerBuff", 0, 22 },

			-- Clearcasting
			{ spellID = 16246, unitId = "player", caster = "player", filter = "BUFF" },
			-- Spiritwalker's Grace
			{ spellID = 79206, unitId = "player", caster = "player", filter = "BUFF", spec = 1 },
			-- Elemental Mastery
			{ spellID = 16166, unitId = "player", caster = "player", filter = "BUFF" },

		},
		{
			Name = "Lava Burst",
			Enable = true,
			Direction = "DOWN",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37,
			setPoint = { "TOP", "iFilgerLavaBurst", -0, -23 },


			-- Lava Surge
			{ spellID = 77762, unitId = "player", caster = "player", filter = "BUFF" },
			-- Lava Burst
			{ spellID = 51505, filter = "CD", spec = 1 },
		},
	},	
	["PALADIN"] = { ---------------------------------------------------- Paladin
		{
			Name = "Cooldown",
			Enable = true,
			Direction = "UP",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37,
			setPoint = { "BOTTOMRIGHT", "iFilgerCooldowns", 40, 0 },

			-- Divine Plea
			{ spellID = 54428, filter = "CD" },
			-- Lay on Hands
			{ spellID = 633, filter = "CD" },
			-- Divine Shield
			{ spellID = 642, filter = "CD" },
			-- Divine Protection
			{ spellID = 498, filter = "CD" },
			-- Avenging Wrath
			{ spellID = 31884, filter = "CD" },
			-- Guardian of Ancient Kings
			{ spellID = 86669, filter = "CD" },
			-- Divine Favor
			{ spellID = 31842, filter = "CD" },
			-- Aura Mastery
			{ spellID = 31821, filter = "CD" },
			-- Hand of Freedom
			{ spellID = 1044, filter = "CD" },
		},	
		{
			Name = "Buffs and Debuffs",
			Enable = true,
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37,
			setPoint = { "BOTTOMRIGHT", "iFilgerBuffPlayerHeal", 0, 24 },

			-- Beacon of Light -- player
			{ spellID = 53563, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Beacon of Light focus",
			Enable = true,
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37,
			setPoint = { "TOPRIGHT", "iFilgerFocusBuffs", 0, -22 },

			-- Beacon of Light -- player
			{ spellID = 53563, unitId = "focus", caster = "player", filter = "BUFF" },
			-- Hammer of Justice
			{ spellID = 853, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Judgement
			{ spellID = 20271, unitId = "focus", caster = "player", filter = "DEBUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Enable = true,
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37,
			setPoint = { "BOTTOMLEFT", "iFilgerBuffTargetHeal", 0, 24 },

			-- Beacon of Light
			{ spellID = 53563, unitId = "target", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Enable = true,
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37,
			setPoint = { "BOTTOMLEFT", "iFilgerBuffDebuff", 0, 24 },
 
			-- Long Arm of the Law
			{ spellID = 87173, unitId = "player", caster = "all", filter = "BUFF" },
			-- Beacon of Light -- target
			{ spellID = 53563, unitId = "target", caster = "player", filter = "BUFF" },
			-- Judgements of the Pure
			{ spellID = 53657, unitId = "player", caster = "all", filter = "BUFF" },
			-- Hammer of Justice
			{ spellID = 853, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Seal of Truth Aka Censure
			{ spellID = 31803, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Divine Illumination
			{ spellID = 31842, unitId = "player", caster = "player", filter = "BUFF" },
			-- Divine Plea
			{ spellID = 54428, unitId = "player", caster = "player", filter = "BUFF" },
			-- Divine Protection
			{ spellID = 498, unitId = "player", caster = "player", filter = "BUFF" },
			-- Inquisition
			{ spellID = 84963, unitId = "player", caster = "player", filter = "BUFF" },
			-- Ardent Defender
			{ spellID = 31850, unitId = "player", caster = "player", filter = "BUFF" },
			-- Avenging Wrath
			{ spellID = 31884, unitId = "player", caster = "player", filter = "BUFF" },
			-- Guardian of Ancient Kings (prot)
			{ spellID = 86659, unitId = "player", caster = "player", filter = "BUFF" },
			-- Aura Mastery
			{ spellID = 31821, unitId = "player", caster = "all", filter = "BUFF" },
			-- Divine Shield
			{ spellID = 642, unitId = "player", caster = "player", filter = "BUFF" },
			-- Holy Radiance
			{ spellID = 82327, unitId = "player", caster = "player", filter = "BUFF" },
			-- Delayed Judgement - 2T13 Tank
			{ spellID = 105801, unitId = "player", caster = "player", filter = "BUFF" },
			-- Holy Avenger
			{ spellID = 105809, unitId = "player", caster = "player", filter = "BUFF" },
			-- Bastion of Glory
			{ spellID = 114637, unitId = "player", caster = "player", filter = "BUFF" },
			-- Bastion of Glory
			{ spellID = 114637, unitId = "player", caster = "player", filter = "BUFF" },
			-- Sacred Shield
			{ spellID = 20925, unitId = "player", caster = "player", filter = "BUFF", absID = true },
			-- Eternal Flame
			{ spellID = 114163, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Paladin Procs",
			Enable = true,
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 60,
			setPoint = { "BOTTOMLEFT", "iFilgerProcs", 0, -63 },

			-- Grand Crusader
			{ spellID = 85416, unitId = "player", caster = "player", filter = "BUFF" },
			-- Daybreak
			{ spellID = 88819, unitId = "player", caster = "player", filter = "BUFF" },
			-- Infusion of Light
			{ spellID = 53576, unitId = "player", caster = "player", filter = "BUFF" },
			-- Crusader
			{ spellID = 94686, unitId = "player", caster = "player", filter = "BUFF" },
			-- Art of War
			{ spellID = 87138, unitId = "player", caster = "player", filter = "BUFF" },
			-- Hand of Light 
			{ spellID = 90174, unitId = "player", caster = "player", filter = "BUFF" },
			-- Saint's Vigor - 2T13 Heal
			{ spellID = 105742, unitId = "player", caster = "player", filter = "BUFF" },
			-- Selfless Healer
			{ spellID = 114250, unitId = "player", caster = "player", filter = "BUFF" },
			-- Speed of Light
			{ spellID = 85499, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Paly InvertAura",
			Enable = true, -- i don't want to spam, nor to use it. :)
			Direction = "HORIZONTAL",
			Interval = 4,
			Mode = "ICON",
			Alpha = 0.75,
--			BarWidth = 150,
			Size = 47, 
			setPoint = { "BOTTOM", "iFilgerPalyInvertAura", 0, 22 },
			
			-- Inquisition
			{ spellID = 84963, unitId = "player", caster = "player", filter = "IBUFF", incombat = true, spec = 3 },
		},
	},
	["WARRIOR"] = {  ---------------------------------------------------- Warrior
		{
			Name = "Warrior Procs",
			Enable = true,
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 60,
			setPoint = { "BOTTOMLEFT", "iFilgerProcs", 0, -63 },

			-- Sudden Death
			{ spellID = 52437, unitId = "player", caster = "player", filter = "BUFF" },
			-- Slam!
			{ spellID = 46916, unitId = "player", caster = "all", filter = "BUFF" },
			-- Sword and Board
			{ spellID = 50227, unitId = "player", caster = "player", filter = "BUFF" },
			-- Blood Reserve
			{ spellID = 64568, unitId = "player", caster = "player", filter = "BUFF" },
			-- Victorious
			{ spellID = 32216, unitId = "player", caster = "player", filter = "BUFF", absID = true },
			-- Spell Reflection
			{ spellID = 23920, unitId = "player", caster = "player", filter = "BUFF" },
			-- Victory Rush
			{ spellID = 34428, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shield Block
			{ spellID = 2565, unitId = "player", caster = "player", filter = "BUFF" },
			-- Last Stand
			{ spellID = 12975, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shield Wall
			{ spellID = 871, unitId = "player", caster = "player", filter = "BUFF" },
			-- Deadly Calm
			{ spellID = 85730, unitId = "player", caster = "player", filter = "BUFF" },
			-- Incite
			{ spellID = 122013, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shield Barrier
			{ spellID = 112048, unitId = "player", caster = "player", filter = "BUFF" },
			-- Taste for Blood
			{ spellID = 56638, unitId = "player", caster = "player", filter = "BUFF"},
			-- Mass Spell Reflection
			{ spellID = 114028, unitId = "player", caster = "player", filter = "BUFF" },
			-- Rallying Cry
			{ spellID = 97462, unitId = "player", caster = "all", filter = "BUFF" }, 
		},
		{
			Name = "Debuffs",
			Enable = true,
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37,
			setPoint = { "BOTTOMLEFT", "iFilgerBuffDebuff", 0, 24 },

			-- Hamstring
			{ spellID = 1715, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Sunder Armor
			{ spellID = 7386, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Thunder Clap
			{ spellID = 6343, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Demoralizing Shout
			{ spellID = 1160, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Charge Stun
			{ spellID = 7922, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Shockwave
			{ spellID = 46968, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Expose Armor (Rogue)
			{ spellID = 8647, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Colossus Smash
			{ spellID = 86346, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Deep Wounds
			{ spellID = 115768, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Weakened Armor
			{ spellID = 113746, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Thunderclap (Warrior's Weakened Blows)
			{ spellID = 115798, unitId = "target", caster = "all", filter = "DEBUFF" },
		},
		{
			Name = "Cooldown",
			Enable = true,
			Direction = "UP",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37,
			setPoint = { "BOTTOMRIGHT", "iFilgerCooldowns", 40, 0 },
			
			-- Recklesness
			{ spellID = 1719, filter = "CD" },
			-- Berserker rage
			{ spellID = 18499, filter = "CD" },  
			-- Last Stand
			{ spellID = 12975, filter = "CD" },	
			-- Taunt
			{ spellID = 355, filter = "CD" },	
			-- Commanding Shout
			{ spellID = 469, filter = "CD" },	
			-- Heroic Leap	  
			{ spellID = 6544, filter = "CD" },			
			-- Dragon Roar
			{ spellID = 118000, filter = "CD" }
		},
	},
	["MONK"] = {  ---------------------------------------------------- Monk
		{
			Name = "Buffs",
			Enable = true,
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37,
			setPoint = { "BOTTOMLEFT", "iFilgerPlayerBuff", 0, 22 },
			
			-- Death Note
			{ spellID = 121125, unitId = "player", caster = "player", filter = "BUFF" },
			-- Fortifying Brew
			{ spellID = 120954, unitId = "player", caster = "player", filter = "BUFF" },
			-- Tiger Power
			{ spellID = 125359, unitId = "player", caster = "player", filter = "BUFF" },
			-- Path of Blossoms
			{ spellID = 124336, unitId = "player", caster = "player", filter = "BUFF" },
			-- Spinning Crane Kick
			{ spellID = 101546, unitId = "player", caster = "player", filter = "BUFF" },
			-- Zen Meditation
			{ spellID = 131523, unitId = "player", caster = "player", filter = "BUFF" },
			-- Energizing Brew
			{ spellID = 115288, unitId = "player", caster = "player", filter = "BUFF" },
			-- Tigereye Brew
			{ spellID = 125195, unitId = "player", caster = "player", filter = "BUFF" },
			-- Tiger Strikes
			{ spellID = 120273, unitId = "player", caster = "player", filter = "BUFF" },
			
			Name = "Debuffs",
			Enable = true,
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37,
			setPoint = { "BOTTOMLEFT", "iFilgerTargetDebuff", 0, 22 },
			
			-- Leg Sweep
			{ spellID = 119381, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Paralysis
			{ spellID = 115078, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Disable
			{ spellID = 116095, unitId = "target", caster = "player", filter = "DEBUFF" },
			
		},
		{
			Name = "Cooldown",
			Enable = true,
			Direction = "UP",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 37,
			setPoint = { "BOTTOMRIGHT", "iFilgerCooldowns", 40, 0 },
			
			-- Expel Harm
			{ spellID = 115072, filter = "CD" },
			-- Forifying Brew
			{ spellID = 115203, filter = "CD" },
			-- Grapple Weapon
			{ spellID = 117368, filter = "CD" },
			-- Paralysis
			{ spellID = 115078, filter = "CD" },
			-- Spear Hand Strike
			{ spellID = 116705, filter = "CD" },
			-- Touch of Death
			{ spellID = 115080, filter = "CD" },
			-- Zen Meditation
			{ spellID = 115176, filter = "CD" },
			-- Energizing Brew
			{ spellID = 115288, filter = "CD" },
			-- Fists of Fury
			{ spellID = 113656, filter = "CD" },
			-- Flying Serpent Kick
			{ spellID = 101545, filter = "CD" },
			-- Touch of Karma
			{ spellID = 122470, filter = "CD" },
			-- Summon Black Ox
			{ spellID = 115315, filter = "CD" },
			-- Avert Harm
			{ spellID = 115213, filter = "CD" },
			-- Guard
			{ spellID = 115295, filter = "CD" },
			-- Clash
			{ spellID = 122057, filter = "CD" },
			-- Revival
			{ spellID = 115310, filter = "CD" },
			-- Summon Jade Serpent Statue
			{ spellID = 115313, filter = "CD" },
			-- Thunder Focus Tea
			{ spellID = 116680, filter = "CD" },
			-- Life Cocoon
			{ spellID = 116849, filter = "CD" },
			-- Diffuse Magic
			{ spellID = 122783, filter = "CD" },
			-- Dampen Harm
			{ spellID = 122278, filter = "CD" },
			-- Leg Sweep
			{ spellID = 119381, filter = "CD" },
		},
	},			
-------------------------------------------------------------	
-- Credits to Sapz
-------------------------------------------------------------	
	["HUNTER/DRUID/ROGUE"] = {  ---------------------------------------------------- Hunt & Drood
		{
			Name = "Shivable Rage effects",
			Enable = true,
			Direction = "UP",
			IconSide = "LEFT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
			Size = 40,
			setPoint = { "BOTTOM", "iFilgerRage", "BOTTOM", 0, 22 },

			-------------------
			-- Filger Enrage Shiveable stuff  -
			-------------------

			-- Unholy Frenzy
			{ spellID = 49016, unitId = "target", caster = "all", filter = "BUFF" },
			-- Vengeance
			{ spellID = 76691, unitId = "target", caster = "all", filter = "BUFF" },
			-- Enrage
			{ spellID = 5229, unitId = "target", caster = "all", filter = "BUFF" },
			-- Savage Roar
			{ spellID = 52610, unitId = "target", caster = "all", filter = "BUFF" },
			-- Owlkin Frenzy
			{ spellID = 48391, unitId = "target", caster = "all", filter = "BUFF" },
			-- Berserker Rage
			{ spellID = 18499, unitId = "target", caster = "all", filter = "BUFF" },
			-- Death Wish
			{ spellID = 12292, unitId = "target", caster = "all", filter = "BUFF" },
			-- Bastion of Defense
			{ spellID = 84608, unitId = "target", caster = "all", filter = "BUFF" },
		},
	},
-------------------------------------------------------------	
-- dont touch anything below or else ill ass rape you aight!
-------------------------------------------------------------	
	["ALL"] = {
		{
			Name = "ENHANCEMENTS",
			Enable = true,
			Direction = "LEFT",
			Interval = 6,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 52,
			setPoint = {  "TOPRIGHT", "iFilgerEnhancements",0,-22 },

		--Racial
			-- Berserking -- RACIAL
			{ spellID = 26297, unitId = "player", caster = "player", filter = "BUFF", absID = true },
			-- Blood Fury
			{ spellID = 33697, unitId = "player", caster = "player", filter = "BUFF" },
			-- Darkflight
			{ spellID = 68992, unitId = "player", caster = "player", filter = "BUFF" },

		-- Trinket Procs

			-- 333/346
			-- Cleansing Tears (Tear of Blood)
			{ spellID = 91139, unitId = "player", caster = "player", filter = "BUFF" },
			-- Witching Hour
			{ spellID = 90887, unitId = "player", caster = "player", filter = "BUFF" },
		
			-- 359/372/379 4.0
			-- Pattern of Light (Mandala of Stirring Patterns)
			{ spellID = 91192, unitId = "player", caster = "all", filter = "BUFF" }, 
			-- Image of Immortality (Mirror of Broken Images)
			{ spellID = 92222, unitId = "player", caster = "all", filter = "BUFF" }, 
			-- Dire Magic (Bell of Enraging Resonance)
			{ spellID = 91007, unitId = "player", caster = "all", filter = "BUFF" }, 
			-- Battle Magic (Stump of Time)
			{ spellID = 91047, unitId = "player", caster = "all", filter = "BUFF" }, 
			-- Volcanic Destruction (darkmoon)
			{ spellID = 89091, unitId = "player", caster = "player", filter = "BUFF" },
			-- Heart of Rage
			{ spellID = 92345, unitId = "player", caster = "player", filter = "BUFF" },
			-- Heart's Revelation
			{ spellID = 91027, unitId = "player", caster = "player", filter = "BUFF" },
			-- Heart's Judgement
			{ spellID = 91041, unitId = "player", caster = "player", filter = "BUFF" },
			-- Soul Power (Soul Casket)
			{ spellID = 91019, unitId = "player", caster = "player", filter = "BUFF" },
			-- Revelation (Theralion Mirror)
			{ spellID = 91024, unitId = "player", caster = "player", filter = "BUFF" },
			-- Celerity (Shard of Woe Heroic)
			{ spellID = 91173, unitId = "player", caster = "player", filter = "BUFF" },

			-- 365/378/384/391/397 4.2
			-- Soul Fragment (Necromatic Focus)
			{ spellID = 96962, unitId = "player", caster = "player", filter = "BUFF" },
			-- Moonwell Phial
			{ spellID = 101156, unitId = "player", caster = "player", filter = "BUFF" },
			-- Blessing of the Moonwell (Moonwell Chalice)
			{ spellID = 100403, unitId = "player", caster = "player", filter = "BUFF" },
			-- Charged Blows (Ricket's Magnetic Fireball)
			{ spellID = 101515, unitId = "player", caster = "player", filter = "BUFF" },
			-- Matrix Restabilizer
			{ spellID = 96976, unitId = "player", caster = "player", filter = "BUFF" },
			-- Accelerated
			{ spellID = 96980, unitId = "player", caster = "player", filter = "BUFF" },
			-- Ancient Petrified Seed
			{ spellID = 97009, unitId = "player", caster = "player", filter = "BUFF" },
			-- Blessing of Khaz'goroth (Apparatus of Khaz'goroth)
			{ spellID = 96934, unitId = "player", caster = "player", filter = "BUFF" },
			-- Essence of the Eternal Flame
			{ spellID = 97010, unitId = "player", caster = "player", filter = "BUFF" },
			-- Fiery Quintessence
			{ spellID = 97008, unitId = "player", caster = "player", filter = "BUFF" },
			-- Victorious  (Jaws of Defeat)
			{ spellID = 96907, unitId = "player", caster = "player", filter = "BUFF", absID = true  },
			-- Mark of the Firelord  (Rune of Zeth)
			{ spellID = 97007, unitId = "player", caster = "player", filter = "BUFF" },
			-- Devour  (The Hungerer)
			{ spellID = 96911, unitId = "player", caster = "player", filter = "BUFF" },
			-- Weight of a Feather (Scales of Life)
			{ spellID = 96879, unitId = "player", caster = "player", filter = "BUFF" },
			-- Titanic Power (Apparatus of Khaz'goroth)
			{ spellID = 96923, unitId = "player", caster = "player", filter = "BUFF" },

			-- Brewfeast
			-- Now is the time! (Mithril Stopwatch)
			{ spellID = 101291, unitId = "player", caster = "player", filter = "BUFF" },
			-- Drunken Evasiveness (Brawler's Trophy)
			{ spellID = 101293, unitId = "player", caster = "player", filter = "BUFF" },
			-- Essence of Life (Petrified Pickled Egg)
			{ spellID = 101289, unitId = "player", caster = "player", filter = "BUFF" },
			-- Loom of Fate (Spidersilk Spindle)
			{ spellID = 96945, unitId = "player", caster = "player", filter = "BUFF" },
			-- Stay of Execution (Stay of Execution)
			{ spellID = 96988, unitId = "player", caster = "player", filter = "BUFF" },

			-- 378/384/397/401 4.3
			-- Foul Gift (Foul Gift of the Demon Lord)
			{ spellID = 102662, unitId = "player", caster = "player", filter = "BUFF", absID = true },
			-- Foul Gift (Foul Gift of the Demon Lord)
			{ spellID = 109908, unitId = "player", caster = "player", filter = "DEBUFF", absID = true },
			-- Titanic Strength (Eye of Unmaking/Rotting Skull)
			{ spellID = 109750, unitId = "player", caster = "player", filter = "BUFF" },
			-- Expansive Mind (Heart of Unliving)
			{ spellID = 109813, unitId = "player", caster = "player", filter = "BUFF" },
			-- Preternatural Evasion (Resolve of Undying)
			{ spellID = 109782, unitId = "player", caster = "player", filter = "BUFF" },
			-- Combat Mind (Will of Unbinding)
			{ spellID = 109795, unitId = "player", caster = "player", filter = "BUFF" },
			-- Combat Trance (Wrath of Unchaining)
			{ spellID = 109719, unitId = "player", caster = "player", filter = "BUFF" },
			-- Find Weakness (Creche of the Final Dragon)
			{ spellID = 109744, unitId = "player", caster = "player", filter = "BUFF" },
			-- Ultimate Power (Bottled Wishes/Reflection of the Light)
			{ spellID = 109792, unitId = "player", caster = "player", filter = "BUFF" },
			-- Elusive (Fire of the Deep)
			{ spellID = 109779, unitId = "player", caster = "player", filter = "BUFF" },
			-- Velocity (Insignia of the Corrupted Mind/Seal of the Seven Signs)
			{ spellID = 109789, unitId = "player", caster = "player", filter = "BUFF" },
			-- Agile (Kiroptyric Sigil)
			{ spellID = 109715, unitId = "player", caster = "player", filter = "BUFF" },
			-- Master Tactician (Soulshifter Vortex)
			{ spellID = 109776, unitId = "player", caster = "player", filter = "BUFF" },
			-- Slowing the Sands - weapon caster DW
			{ spellID = 107804, unitId = "player", caster = "all", filter = "BUFF" },
			-- Beast Fury - weapon agi DW
			{ spellID = 109863, unitId = "player", caster = "player", filter = "BUFF" },
			
		-- PvP Trinkets
			-- Call of Conquest / Badge of Conquest
			{ spellID = 99711, unitId = "player", caster = "player", filter = "BUFF" },
			-- Call of Dominance / Badge of Dominance
			{ spellID = 99712, unitId = "player", caster = "player", filter = "BUFF" },
			-- Call of Victory / Badge of Victory
			{ spellID = 99713, unitId = "player", caster = "player", filter = "BUFF" },
			-- Tremendous Fortitude / Battlemaster Trinket S10-371
			{ spellID = 99714, unitId = "player", caster = "player", filter = "BUFF" },
			-- Surge of Conquest / Insignia of Conquest
			{ spellID = 99717, unitId = "player", caster = "player", filter = "BUFF" },
			-- Surge of Dominance / Insignia of Dominance
			{ spellID = 99719, unitId = "player", caster = "player", filter = "BUFF" },
			-- Surge of Victory / Insignia of Victory
			{ spellID = 99721, unitId = "player", caster = "player", filter = "BUFF" },

		-- Item Enchants - Engineering
			-- Hyperspeed Accelerators / Hypergeschwindigkeitsbeschleuniger
			{ spellID = 54758, unitId = "player", caster = "player", filter = "BUFF" },
			-- Synapse Springs / Synapsenfedern
			{ spellID = 96230, unitId = "player", caster = "player", filter = "BUFF" },
			-- Nitro Boots ( or should I say Belt? )
			{ spellID = 54861, unitId = "player", caster = "player", filter = "BUFF" },
			-- Grounded Plasma Shield 
			{ spellID = 82626, unitId = "player", caster = "player", filter = "BUFF" },
			-- Flintlocke's Woodchucker
			{ spellID = 99621, unitId = "player", caster = "player", filter = "BUFF" },

		-- Herbalism
			-- Lifeblood
			{ spellID = 55503, unitId = "player", caster = "player", filter = "BUFF" },

		-- Item Enchants - Enchanting
			-- Heartsong / Gesang des Herzens
			{ spellID = 74224, unitId = "player", caster = "all", filter = "BUFF" },
			-- Avalanche / Lawine
			{ spellID = 74196, unitId = "player", caster = "all", filter = "BUFF" },
			-- Hurricane / Hurrikan
			{ spellID = 74221, unitId = "player", caster = "all", filter = "BUFF" },
			-- Power Torrent
			{ spellID = 74241, unitId = "player", caster = "all", filter = "BUFF" },
			-- Landside
			{ spellID = 74245, unitId = "player", caster = "all", filter = "BUFF" },

		-- Potions
			-- Speed / Geschwindigkeit - Potion of Speed
			{ spellID = 53908, unitId = "player", caster = "all", filter = "BUFF" },
			-- Wild Magic / Wilde Magie - Potion of Wild Magic
			{ spellID = 53909, unitId = "player", caster = "all", filter = "BUFF" },
			-- Earthen Armor / Irdene Rüstung - Earthen Potion
			{ spellID = 79475, unitId = "player", caster = "all", filter = "BUFF" },
			-- Volcanic Power
			{ spellID = 79476, unitId = "player", caster = "all", filter = "BUFF" }, 
			-- Golemblood Potion
			{ spellID = 79634, unitId = "player", caster = "player", filter = "BUFF" },

		-- External Buffs
			-- Tricks of the Trade
			{ spellID = 57934, unitId = "player", caster = "all", filter = "BUFF" },
			-- Power Infusion
			{ spellID = 10060, unitId = "player", caster = "all", filter = "BUFF" },
			-- Body and Soul
			{ spellID = 65081, unitId = "player", caster = "all", filter = "BUFF" },
			-- Angelic Feather
			{ spellID = 121557, unitId = "player", caster = "all", filter = "BUFF" },
			-- Bloodlust
			{ spellID = 2825, unitId = "player", caster = "all", filter = "BUFF" },
			-- Heroism
			{ spellID = 32182, unitId = "player", caster = "all", filter = "BUFF" },
			-- Time Warp
			{ spellID = 80353, unitId = "player", caster = "all", filter = "BUFF" },
			-- Ancient Hysteria
			{ spellID = 90355, unitId = "player", caster = "all", filter = "BUFF" },
			-- Innervate
			{ spellID = 29166, unitId = "player", caster = "all", filter = "BUFF"},
			-- Lightwell
			{ spellID = 7001, unitId = "player", caster = "all", filter = "BUFF"},
			-- Hand of Salvation
			{ spellID = 1038, unitId = "player", caster = "all", filter = "BUFF" },
			-- Hand of Protection
			{ spellID = 1022, unitId = "player", caster = "all", filter = "BUFF" },
			-- Hand of Freedom
			{ spellID = 1044, unitId = "player", caster = "all", filter = "BUFF" },
			-- Guardian Spirit
			{ spellID = 47788, unitId = "player", caster = "all", filter = "BUFF" },
			-- Aspect of the Pack
			{ spellID = 13159, unitId = "player", caster = "all", filter = "BUFF" },
			-- Stampeding Roar
			{ spellID = 77764, unitId = "player", caster = "all", filter = "BUFF" },
			-- Master's Call
			{ spellID = 54216, unitId = "player", caster = "all", filter = "BUFF" },
			-- Berserking -- BUFF BG
			{ spellID = 24378, unitId = "player", caster = "all", filter = "BUFF", absID = true },
		},
		{
			Name = "Racials", -- (racial)
			Enable = true,
			Direction = "UP",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
			Merge = true,
			Mergewith = "Cooldown",
--			BarWidth = 150,
			Size = 52,
			setPoint = { "BOTTOMRIGHT", "iFilgerCooldowns", 40, 0 },

			-- Trinket 1
			{ slotID = 13, filter = "CD" }, 
			-- Trinket 2
			{ slotID = 14, filter = "CD" }, 
			-- Arcane Torrent
			{ spellID = 28730, filter = "CD" }, 
			-- Gift of the Naaru
			{ spellID = 59547, filter = "CD" }, 
			-- Stoneform
			{ spellID = 20594, filter = "CD" }, 
			-- Shadowmeld
			{ spellID = 58984, filter = "CD" }, 
			-- Blood Fury
			{ spellID = 20572, filter = "CD" }, 
			-- Darkflight
			{ spellID = 68992, filter = "CD" }, 
			-- Cannibalize
			{ spellID = 20577, filter = "CD" }, 
			-- Will of the Forsaken
			{ spellID = 7744, filter = "CD" }, 
			-- Berserking
			{ spellID = 26297, filter = "CD" }, 
			-- Every Man for Himself
			{ spellID = 59752, filter = "CD" }, 
			-- Rocket Jump
			{ spellID = 69070, filter = "CD" }, 
			-- Escape Artist
			{ spellID = 20589, filter = "CD" }, 
		},
		{
			Name = "ICD", -- (ICD)
			Enable = true,
			Direction = "UP",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
			Merge = true,
			Mergewith = "Cooldown",
--			BarWidth = 150,
			Size = 37,
			setPoint = { "BOTTOMRIGHT", "iFilgerCooldowns", 40, 0 },

			-- Foul Gift (Foul Gift of the Demon Lord)
			{ spellID = 102662, filter = "ICD", trigger = "BUFF", duration = 45, absID = true }, -- 60 ?
			-- Indomitable (Indomitable Pride)
			{ spellID = 108008, filter = "ICD", trigger = "BUFF", duration = 60 }, -- not sure of the spellID
			-- Find Weakness (Creche of the Final Dragon)
			{ spellID = 109744, filter = "ICD", trigger = "BUFF", duration = 115 }, -- guess
			-- Master Tactician (Soulshifter Vortex) / May create problem for hunter... (i hate 'em btw)
			{ spellID = 109776, filter = "ICD", trigger = "BUFF", duration = 115 }, -- guess
			-- Velocity (Starcatcher Compass, Insignia of the Corrupted Mind, Seal of the Seven Signs)
			{ spellID = 109789, filter = "ICD", trigger = "BUFF", duration = 115 }, -- exact (check in game with Proculas, couldn't go below)
			-- Power Torrent
			{ spellID = 74241, filter = "ICD", trigger = "BUFF", duration = 45 }, -- exact (check in game with Proculas)
			-- Tricks of the Trade (Thx Rogue)
			{ spellID = 57934, filter = "ICD", trigger = "BUFF", duration = 30 },

--			{ spellID = 74241, filter = "ICD", trigger = "BUFF", duration = 45, slotID = 16 }, -- if slotID not specified, spellID is used as icon
		},
	},
	["PVP"] = {
		{
--			Tons of SpellIDs taken from LoseControl so credit to Kouri 
--			Here we track pvp buffs on our target							 
			Name = "ENEMY PVP BUFF",
			Enable = true,
			Direction = "RIGHT",
			Interval = 6,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 72,
			setPoint = {  "BOTTOMLEFT", "iFilgerPvpTargetBuffs" ,0,22 },
			
			-- Druid --
			-- Innervate
			{ spellID = 29166, unitId = "target", caster = "all", filter = "BUFF"},
			-- Barkskin
			{ spellID = 22812, unitId = "target", caster = "all", filter = "BUFF" },
			-- Berserk
			{ spellID = 50334, unitId = "target", caster = "all", filter = "BUFF", absID = true },
			-- Starfall
			{ spellID = 48505, unitId = "target", caster = "all", filter = "BUFF" },
			-- Predator's Swiftness
			{ spellID = 69369, unitId = "target", caster = "all", filter = "BUFF" },
			
			-- Warrior --
			-- Spell Reflection
			{ spellID = 23920, unitId = "target", caster = "all", filter = "BUFF" },
			-- Recklessness
			{ spellID = 1719, unitId = "target", caster = "all", filter = "BUFF" },
			
			-- Paladin --
			-- Divine Shield
			{ spellID = 642, unitId = "target", caster = "all", filter = "BUFF" },
			-- Hand of Freedom
			{ spellID = 1044, unitId = "target", caster = "all", filter = "BUFF" },
			-- Hand of Sacrifice
			{ spellID = 6940, unitId = "target", caster = "all", filter = "BUFF" },
			-- Aura Mastery
			{ spellID = 31821, unitId = "target", caster = "all", filter = "BUFF" },	
			-- Hand of Protection
			{ spellID = 1022, unitId = "target", caster = "all", filter = "BUFF" },
			-- Divine Protection
--			{ spellID = 498, unitId = "target", caster = "all", filter = "BUFF" },
			-- Avenging Wrath
			{ spellID = 31884, unitId = "target", caster = "all", filter = "BUFF" },
			-- Divine Favor
			{ spellID = 31842, unitId = "target", caster = "all", filter = "BUFF" },
			-- Sacred Shield
			{ spellID = 20925, unitId = "target", caster = "all", filter = "BUFF" },

			-- Hunter --
			-- Deterrence
			{ spellID = 19263, unitId = "target", caster = "all", filter = "BUFF" },
			-- Master's Call
			{ spellID = 54216, unitId = "target", caster = "all", filter = "BUFF" },
			
			-- Death Knight --
			-- Anti-Magic Shell
			{ spellID = 48707, unitId = "target", caster = "all", filter = "BUFF" },
			-- Lichborne
			{ spellID = 49039, unitId = "target", caster = "all", filter = "BUFF" },
			-- Icebound Fortitude
			{ spellID = 48792, unitId = "target", caster = "all", filter = "BUFF" },
			
			-- Shaman --
			-- Grounding Totem Effect
			{ spellID = 8178, unitId = "target", caster = "all", filter = "BUFF" },

			-- Mage --
			--Ice Block
			{ spellID = 45438, unitId = "target", caster = "all", filter = "BUFF" },
			-- Arcane Power
			{ spellID = 12042, unitId = "target", caster = "all", filter = "BUFF" },
			-- Icy Veins
			{ spellID = 12472, unitId = "target", caster = "all", filter = "BUFF" },			
			-- Impact
--			{ spellID = 64343, unitId = "target", caster = "all", filter = "BUFF" },
			-- Fingers Of Frost
--			{ spellID = 83074, unitId = "target", caster = "all", filter = "BUFF"},

			-- Rogue --
			--Cloak of Shadows
			{ spellID = 31224, unitId = "target", caster = "all", filter = "BUFF" },
			--Evasion
			{ spellID = 5277, unitId = "target", caster = "all", filter = "BUFF" },
			-- Shadow Dance
			{ spellID = 51713, unitId = "target", caster = "all", filter = "BUFF" },
		
			-- Priest --
			-- Dispersion
			{ spellID = 47585, unitId = "target", caster = "all", filter = "BUFF" },
			-- Pain Suppression
			{ spellID = 33206, unitId = "target", caster = "all", filter = "BUFF" },
			-- Power Infusion
			{ spellID = 10060, unitId = "target", caster = "all", filter = "BUFF" },

		},
		{
			-- Here we track pvp debuffs on ourself
			Name = "ENEMY PVP DEBUFF",
			Enable = true,
			Direction = "LEFT",
			Interval = 6,
			Mode = "ICON",
			Alpha = 1,
--			BarWidth = 150,
			Size = 70,
			setPoint = {  "BOTTOMRIGHT", "iFilgerPvpPlayerDebuffs" ,0,22 },			
			
			-- Rogue --
			--Kidney Shot
			{ spellID = 408, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Blind
			{ spellID = 2094, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Sap
			{ spellID = 6770, unitId = "player", caster = "all", filter = "DEBUFF" },			
			--Smoke Bomb
			{ spellID = 76577, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Garrote - Silence
			{ spellID = 1330, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Dismantle
			{ spellID = 51722, unitId = "player", caster = "all", filter = "DEBUFF" },			
			--Crippling Poison
			{ spellID = 3409, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Deadly Throw
			{ spellID = 26679, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Gouge
			{ spellID = 1776, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Cheap Shot
			{ spellID = 1833, unitId = "player", caster = "all", filter = "DEBUFF" },		
			
			-- Paladin --
			--Hammer of Justice
			{ spellID = 853, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Seal of Justice
			{ spellID = 20170, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Repentance
			{ spellID = 20066, unitId = "player", caster = "all", filter = "DEBUFF" },			
			--Holy Wrath
			{ spellID = 2812, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Turn Evil
			{ spellID = 10326, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Avenger's Shield
			{ spellID = 31935, unitId = "player", caster = "all", filter = "DEBUFF" },			
			--Dazed - Avenger's Shield
			{ spellID = 63529, unitId = "player", caster = "all", filter = "DEBUFF" },	

			-- Mage --
			--Polymorph
			{ spellID = 118, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Deep Freeze
			{ spellID = 44572, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Ring of Frost
			{ spellID = 82691, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Freeze (Water Elemental)
			{ spellID = 33395, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Frost Nova
			{ spellID = 122, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Blast Wave
			{ spellID = 11113, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Cone of Cold
			{ spellID = 120, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Frostbolt
			{ spellID = 116, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Frostfire Bolt
			{ spellID = 44614, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Slow
			{ spellID = 31589, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			-- Death Kinght --
			--Monstrous Blow (Super ghoul)
			{ spellID = 91797, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Chains of Ice
			{ spellID = 45524, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Strangulate
			{ spellID = 47476, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Gnaw (Ghoul)
			{ spellID = 47481, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Chilblains
			{ spellID = 50041, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Dark Simulacrum
			{ spellID = 77606, unitId = "player", caster = "all", filter = "DEBUFF" },	
		
			-- Druid --
			--Bash (also Shaman Spirit Wolf ability)
			{ spellID = 5211, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Cyclone
			{ spellID = 33786, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Maim
			{ spellID = 22570, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Pounce
			{ spellID = 9005, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Solar Beam
			{ spellID = 97547, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Entangling Roots
			{ spellID = 339, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Feral Charge Effect
			{ spellID = 45334, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Infected Wounds
			{ spellID = 48484, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Typhoon
			{ spellID = 61391, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			-- Hunter --
			--Freezing Trap Effect
			{ spellID = 3355, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Intimidation
			{ spellID = 24394, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Wyvern Sting
			{ spellID = 19386, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Silencing Shot
			{ spellID = 34490, unitId = "player", caster = "all", filter = "DEBUFF" },			
			--Scatter Shot
			{ spellID = 19503, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Entrapment
			{ spellID = 19185, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Concussive Barrage
			{ spellID = 35101, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Concussive Shot
			{ spellID = 5116, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Frost Trap Aura
			{ spellID = 13810, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Glyph of Freezing Trap
			{ spellID = 61394, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Sonic Blast (Bat)
			{ spellID = 50519, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Snatch (Bird of Prey)
			{ spellID = 50541, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Froststorm Breath (Chimera)
			{ spellID = 92380, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Pin (Crab)
			{ spellID = 50245, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Bad Manner (Monkey)
			{ spellID = 90337, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Venom Web Spray (Silithid)
			{ spellID = 54706, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Web (Spider)
			{ spellID = 4167, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			-- Priest --
			--Mind Control
			{ spellID = 605, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Psychic Horror
			{ spellID = 64044, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Psychic Scream
			{ spellID = 8122, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Shackle Undead
			{ spellID = 9484, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Sin and Punishment
			{ spellID = 87204, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Paralysis
			{ spellID = 87194, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Mind Flay
			{ spellID = 15407, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			-- Shaman --
			--Bind Elemental
			{ spellID = 76780, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Earthquake
			{ spellID = 61882, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Hex
			{ spellID = 51514, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Earthgrab Totem
			{ spellID = 51485, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Freeze (Frozen Power)
			{ spellID = 63685, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Earthbind (5 second duration per pulse, but will keep re-applying the debuff as long as you stand within the pulse radius)
			{ spellID = 3600, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Frost Shock
			{ spellID = 8056, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Frostbrand Attack
			{ spellID = 8034, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			-- Warlock --
			--Axe Toss (Felguard)
			{ spellID = 89766, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Banish
			{ spellID = 710, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Death Coil
			{ spellID = 6789, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Demon Leap
			{ spellID = 54786, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Fear
			{ spellID = 5782, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Blood Fear
			{ spellID = 111397, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Howl of Terror
			{ spellID = 5484, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Seduction (Succubus)
			{ spellID = 6358, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Mesmerize (Succubus)
			{ spellID = 115268, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Shadowfury
			{ spellID = 30283, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Spell Lock (Felhunter)
			{ spellID = 24259, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Unstable Affliction
			{ spellID = 31117, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Aftermath
			{ spellID = 109784, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Curse of Exhaustion
			{ spellID = 18223, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Shadowsnare (Glyph of Shadowflame)
			{ spellID = 63311, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Havoc
			{ spellID = 80240, unitId = "player", caster = "all", filter = "DEBUFF" },	
			-- Archimonde's Vengeance
			{ spellID = 108505, unitId = "player", caster = "all", filter = "DEBUFF" },	
			
			-- Warrior --
			--Hamstring
			{ spellID = 1715, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Charge Stun
			{ spellID = 7922, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Heroic Leap
			{ spellID = 6544, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Intimidating Shout
			{ spellID = 5246, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Shockwave
			{ spellID = 46968, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Silenced - Gag Order
			{ spellID = 18498, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Disarm
			{ spellID = 676, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Piercing Howl
			{ spellID = 12323, unitId = "player", caster = "all", filter = "DEBUFF" },

			-- Racials --
			-- War Stomp
			{ spellID = 20549, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Arcane Torrent
			{ spellID = 28730, unitId = "player", caster = "all", filter = "DEBUFF" },
		},
	},
	["PVE"] = {
		{
			Name = "Mists of Pandaria Debuffs", -- list compiled by Ryn
			Enable = false,
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,			
			Alpha = 1,
			Size = 47,
			setPoint = { "BOTTOMRIGHT", "iFilgerPveDeBuffs", 0, 22 },
			
			-- [[ OUTDOOR BOSSES ]] --
			-- Sha of Anger
			--Seethe
			{ spellID = 119487, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Aggressive Behavior
			{ spellID = 119626, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Unleashed Wrath
			{ spellID = 119488, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			--Salys's Warband
			-- Stomp
			{ spellID = 121787, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			
			-- [[ HEART OF FEAR ]] --
			-- Imperial Vizier Zor'lok
			-- Exhale
			{ spellID = 122761, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Convert
			{ spellID = 122740, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			-- Blade Lord Ta'yak
			-- Overwhelming Assault
			{ spellID = 123474, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Windstep
			{ spellID = 123175, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			-- Garalon
			-- Pheromones
			{ spellID = 123092, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			-- Wind Lord Mel'Jarak
			-- Wind Bomb
			{ spellID = 131813, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Amber Prison
			{ spellID = 121876, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Corrosive Resin
			{ spellID = 122064, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			-- Amber-Shaper Un'sok
			-- Burning Amber
			{ spellID = 122504, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Parasitic Growth
			{ spellID = 121949, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Mutated Construct -- Need to get an ID when MoP is live
			-- Amber Strike
			{ spellID = 122389, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Fling
			{ spellID = 122413, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Amber Globule
			{ spellID = 125498, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			-- Grand Empress Shek'zeer
			-- Eyes of the Empress
			{ spellID = 123707, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Fixate -- Need to get an ID when MoP is live
			-- Sticky Resin
			{ spellID = 124097, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Poison-Drenched Armor
			{ spellID = 124821, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Consuming Terror
			{ spellID = 124849, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Visions of Demise
			{ spellID = 124862, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Heart of Fear
			{ spellID = 123845, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			-- [[ MOGU'SHAN VAULTS ]] --
			-- The Stone Guard
			-- Amethyst Pool
			{ spellID = 116235, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Jasper Chains
			{ spellID = 130395, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			-- Feng the Accursed
			-- Lightning Last
			{ spellID = 131788, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Arcane Shock
			{ spellID = 131790, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Shadowburn
			{ spellID = 131792, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Wildfire Spark
			{ spellID = 116583, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Arcane Resonance
			{ spellID = 116417, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Chains of Shadow
			{ spellID = 118783, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Nullification Barrier
			{ spellID = 115856, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Shroud of Reversal
			{ spellID = 115911, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			-- Garajal the Spiritbinder
			-- Cross Over
			{ spellID = 116166, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Voodoo Dolls
			{ spellID = 116000, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			-- Elegon
			-- Overcharged
			{ spellID = 117878, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Closed Circuit
			{ spellID = 117949, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Energy Cascade
			{ spellID = 119722, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			-- Will of the Emperor
			-- Focused Assault
			{ spellID = 116525, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Focused Defense
			{ spellID = 116778, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Focused Energy
			{ spellID = 116829, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			-- [[ TERRACE OF ENDLESS SPRING ]] --
			-- Protector of the Endless
			-- Defiled Ground
			{ spellID = 117986, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Lightning Prison
			{ spellID = 117398, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Corrupted Essence
			{ spellID = 117905, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			-- Tsulong
			-- Dread Shadows
			{ spellID = 122768, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Shadow Breath
			{ spellID = 122752, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Terrorize
			{ spellID = 123011, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			-- Lei Shi
			-- Spray
			{ spellID = 123121, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Scary Fog
			{ spellID = 123705, unitId = "player", caster = "all", filter = "DEBUFF" },
		},
		{
			Name = "Cataclysm debuff", -- list by jasje, taken from aurawatch.lua
			Enable = false,
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,			
			Alpha = 1,
			Size = 47,
			setPoint = { "BOTTOMRIGHT", "iFilgerPveDeBuffs", 0, 22 },
			
-- Baradin Hold
			-- Consuming Darkness
			{ spellID = 95173, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Meteor Slash / Meteorschlag (Argaloth)
			{ spellID = 88942, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Gaze of Occu'thar
			{ spellID = 97028, unitId = "player", caster = "all", filter = "DEBUFF" },
-- Blackwing Descent
		-- Magmaw
			-- Constricting Chains
			{ spellID = 91911, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Parasitic Infection
			{ spellID = 94679, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Mangle
--			{ spellID = 94617, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Omintron Defense System	
			-- Poison Soaked Shell	
			{ spellID = 79835, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Lightning Conductor
			{ spellID = 91433, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Incineration Security Measure
			{ spellID = 91521, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Power Conversion - Arcanotron
			{ spellID = 79729, unitId = "focus", caster = "all", filter = "BUFF" },
			-- Power Conversion - Arcanotron
			{ spellID = 91547, unitId = "player", caster = "all", filter = "BUFF" },
		-- Maloriak	
			-- Flash Freeze
			{ spellID = 77699, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Biting Chill
			{ spellID = 77760, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Dark Sludge
			{ spellID = 92988, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- remedy -- for spellsteal 
			{ spellID = 77912, unitId = "target", caster = "all", filter = "BUFF" },
			-- remedy -- for spellsteal  - focus
			{ spellID = 77912, unitId = "focus", caster = "all", filter = "BUFF" },
		-- Atramedes
			-- Searing Flame
			{ spellID = 92423, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Roaring Flame
			{ spellID = 92485, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Sonic Breath
			{ spellID = 92407, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Chimaeron	
			-- Break
			{ spellID = 82881, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Low Health
			{ spellID = 89084, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Nefarian	
			-- Shadow Conductor
			{ spellID = 92053, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Stolen Power
			{ spellID = 80627, unitId = "player", caster = "all", filter = "BUFF" },
-- The Bastion of Twilight
		--Valiona & Theralion
			-- Blackout
			{ spellID = 92878, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Devouring Flames
			{ spellID = 86840, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Engulfing Magic
			{ spellID = 86840, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Twilight Meteorite
			{ spellID = 86013, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Halfus Wyrmbreaker	
			-- Malevolent Strikes
			{ spellID = 39171, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Twilight Ascendant Council
			-- Burning Blood
			{ spellID = 82662, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Hydro Lance
			{ spellID = 92511, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Waterlogged
			{ spellID = 82762, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Frozen
			{ spellID = 92505, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Flame Torrent
			{ spellID = 92518, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Lightning Rod
			{ spellID = 83099, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Gravity Core
			{ spellID = 92075, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Gravity Crush
			{ spellID = 92488, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Static Overload
			{ spellID = 92067, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Frost Beacon
			{ spellID = 92307, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Cho'gall	
			-- Corruption: Accelerated
			{ spellID = 81836, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Corruption: Malformation
			{ spellID = 82125, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Corruption: Absolute
			{ spellID = 82170, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Corruption: Sickness
			{ spellID = 93200, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Cho's Blast
			{ spellID = 86028, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Gall's Blast
			{ spellID = 86029, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Sinestra
			-- Wrack
			{ spellID = 89435, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Essence of the Red
			{ spellID = 87946, unitId = "player", caster = "all", filter = "BUFF" },
			
-- Throne of the Four Winds
	-- Conclave of Wind
		-- Nezir <Lord of the North Wind>
			-- Wind Chill
			{ spellID = 93123, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Ice Patch
			{ spellID = 93131, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Anshal <Lord of the West Wind>
			-- Soothing Breeze
			{ spellID = 86206, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Toxic Spores
			{ spellID = 93122, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Rohash <Lord of the East Wind>
			-- Slicing Gale
			{ spellID = 93058, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Al'Akir
			-- Ice Storm
			{ spellID = 93260, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Ice Storm
			{ spellID = 93271, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Lightning Rod
			{ spellID = 93295, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Static Shock / Statischer Schock (Al'Akir)
			{ spellID = 87873, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Acid Rain / Säureregen (Al'Akir)
			{ spellID = 93279, unitId = "player", caster = "all", filter = "DEBUFF" },
-- Firelands
		--Trash
			-- Melt Armor
			{ spellID = 99532, unitId = "player", caster = "all", filter = "DEBUFF" },		
		--Shannox
			-- Magma Rupture
			{ spellID = 99840, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Crystal Prison Trap 
			{ spellID = 99837, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Jagged Tear
			{ spellID = 99936, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Lord Rhyolith	
			-- Eruption
			{ spellID = 98492, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Alysrazor	
			-- Molten Feather
			{ spellID = 97128, unitId = "player", caster = "all", filter = "BUFF" },
			-- Wings of Flame
			{ spellID = 98619, unitId = "player", caster = "all", filter = "BUFF" },
			-- Blazing Power
			{ spellID = 99461, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Alysra's Razor
			{ spellID = 100029, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Beth'tilac	
			-- The Widow's Kiss
			{ spellID = 99476, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Fixate (Heroic)
			{ spellID = 99526, unitId = "player", caster = "all", filter = "DEBUFF", absID = true },
			-- Volatile Poison (Heroic)
			{ spellID = 99278, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Baleroc	
			-- Torment
			{ spellID = 99256, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Tormented
			{ spellID = 99257, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Blaze of Glory
			{ spellID = 99252, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Vital Flame
			{ spellID = 99262, unitId = "player", caster = "all", filter = "BUFF" },
			-- Vital Spark
			{ spellID = 99263, unitId = "player", caster = "all", filter = "BUFF" },
			-- Countdown
			{ spellID = 99516, unitId = "player", caster = "all", filter = "BUFF" },
		-- Majordomo Staghelm	
			-- Searing Seeds
			{ spellID = 98450, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Burning Orbs
			{ spellID = 98451, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Ragnaros	
			-- Blazing Heat
			{ spellID = 100460, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Burning Wound 
			{ spellID = 101239, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Fixate
			{ spellID = 99849, unitId = "player", caster = "all", filter = "DEBUFF", absID = true },
			-- Magma Trap Vulnerability
			{ spellID = 100238, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Superheated
			{ spellID = 100594, unitId = "player", caster = "all", filter = "DEBUFF" },

-- Dragon Soul
		--Morchok
			-- Safe
			{ spellID = 103541, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Warning
			{ spellID = 103536, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Danger
			{ spellID = 103534, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Black Blood of the Earth
			{ spellID = 108570, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Crush Armor
			{ spellID = 33661, unitId = "player", caster = "all", filter = "DEBUFF" },
		--Warlord Zon'ozz
			-- Disrupting Shadows
			{ spellID = 103434, unitId = "player", caster = "all", filter = "DEBUFF" },
		--Yor'sahj the Unsleeping
			-- Deep Corruption
			{ spellID = 103628, unitId = "player", caster = "all", filter = "DEBUFF" },
		--Hagara the Stormbinder
			-- Frostflake
			{ spellID = 109325, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Target
			{ spellID = 105285, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Shattered Ice
			{ spellID = 105289, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Ice Tomb
			{ spellID = 104451, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Ice Lance
			{ spellID = 107061, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Lightning Storm
			{ spellID = 105465, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Watery Entrenchment
			{ spellID = 105259, unitId = "player", caster = "all", filter = "DEBUFF" },
		--Ultraxion
			-- Looming Darkness
			{ spellID = 106498, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Twilight Burst
			{ spellID = 106415, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Fading Light
			{ spellID = 109075, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Gift of Life
			{ spellID = 105896, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Essence of Dreams
			{ spellID = 105900, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Source of Magic
			{ spellID = 105903, unitId = "player", caster = "all", filter = "DEBUFF" },
		--Warmaster Blackhorn
			-- Twilight Barrage
			{ spellID = 109204, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Sunder Armor
			{ spellID = 108043, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Shockwave
			{ spellID = 108046, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Brutal Strike
			{ spellID = 107567, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Degeneration
			{ spellID = 107558, unitId = "player", caster = "all", filter = "DEBUFF" },
		--Spine of Deathwing
			-- Searing Plasma
			{ spellID = 105479, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Fiery Grip
			{ spellID = 105490, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Grasping Tendrils
			{ spellID = 105563, unitId = "player", caster = "all", filter = "DEBUFF" },
		--Madness of Deathwing
			-- Shrapnel
			{ spellID = 109597, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Degenerative Bite
			{ spellID = 105841, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Blistering heat
			{ spellID = 105445, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Tetanus
			{ spellID = 109603, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Corrupting Parasite -- HM
			{ spellID = 108649, unitId = "player", caster = "all", filter = "DEBUFF" },
		},
		{
			Name = "WotLK debuff",
			Enable = false,
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,			
			Alpha = 1,
			Size = 47,
			setPoint = { "BOTTOMRIGHT", "iFilgerPveDeBuffs", 0, 22 },
			

	-- ICC
		-- Deathbringer Saurfang
			-- Mark of the Fallen Champion
			{ spellID = 72293, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Festergut
			-- Inoculated
			{ spellID = 72103, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Rotface
			-- Mutated Infection
			{ spellID = 71224, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Professor Putricide
			-- Unbound Plague
			{ spellID = 72856, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Plague Sickness
			{ spellID = 73117, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Gas Variable
			{ spellID = 70353, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Ooze Variable
			{ spellID = 70352, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Bloodqueen Lana'thel
			-- Pact of the Darkfallen
			{ spellID = 71340, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Swarming Shadows
			{ spellID = 71861, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Essence of the Blood Queen
			{ spellID = 71473, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Sindragosa
			-- Frost Bomb
			{ spellID = 71053, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Instability
			{ spellID = 69766, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Unchained Magic
			{ spellID = 69762, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Mystic Buffet
			{ spellID = 70128, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Arthas - The Lich King
			-- Necrotic Plague
			{ spellID = 73912, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Halion
			--Fiery Combustion/Feurige Einäscherung (Halion)
			{ spellID = 74562, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Soul Consumption/Seelenverzehrung (Halion)
			{ spellID = 74792, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
	-- Blackwing Descent
		-- Magmaw
			-- Constricting Chains
			{ spellID = 91911, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Parasitic Infection
			{ spellID = 94679, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Omintron Defense System	
			-- Poison Soaked Shell	
			{ spellID = 79835, unitId = "player", caster = "all", filter = "DEBUFF" },
		},
	},
	["TANKS"] = {
		{
			Name = "Tanks CDs", -- requested by Nâmi@EU-Culte de la Rive noire 
			Enable = true,
			Direction = "HORIZONTAL",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,			
			Alpha = 1,
			Size = 47,
			setPoint = { "BOTTOM", "iFilgerTanksCDs", 0, 22 },
			
		-- Priest CDs !!! 
			-- Guardian Spirit
			{ spellID = 47788, unitId = "target", caster = "all", filter = "BUFF" },
			-- Pain Suppression
			{ spellID = 33206, unitId = "target", caster = "all", filter = "BUFF" },
			
		-- Paladin
			-- Forbearance -- it may be good to know that you can't Lay of Hands your target...
			{ spellID = 25771, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Divine Shield -- immune to all
			{ spellID = 642, unitId = "target", caster = "all", filter = "BUFF" },
			-- Hand of Protection -- immune to cac
			{ spellID = 1022, unitId = "target", caster = "all", filter = "BUFF" },
			-- Divine Protection -20% physical OR magical dmg
			{ spellID = 498, unitId = "target", caster = "all", filter = "BUFF" },
			-- Ardent Defender
			{ spellID = 31850, unitId = "target", caster = "all", filter = "BUFF" },
			-- Guardian of Ancient Kings (prot) -50% dmg
			{ spellID = 86659, unitId = "target", caster = "all", filter = "BUFF" },
			
		-- Druid
			-- Survival Instincts -50% dmg
			{ spellID = 61336, unitId = "target", caster = "all", filter = "BUFF" },
			-- Barkskin -20% dmg
			{ spellID = 22812, unitId = "target", caster = "all", filter = "BUFF" },
			-- Frenzied Regeneration
			{ spellID = 22842, unitId = "target", caster = "all", filter = "BUFF" },
			
		-- Warrior
			-- Enraged Regeneration
			{ spellID = 55694, unitId = "target", caster = "all", filter = "BUFF" },
			-- Rallying Cry +20% health
			{ spellID = 97462, unitId = "target", caster = "all", filter = "BUFF" },
			-- Shield Wall -40% dmg
			{ spellID = 871, unitId = "target", caster = "all", filter = "BUFF" },
			-- Spell Reflection
			{ spellID = 23920, unitId = "target", caster = "all", filter = "BUFF" },
			-- Shield Block +25% block
			{ spellID = 2565, unitId = "target", caster = "all", filter = "BUFF" },
			-- Last Stand
			{ spellID = 12975, unitId = "target", caster = "all", filter = "BUFF" },

		-- Death Knight
			-- Anti-Magic Shell : -75% spell dmg + Immune to magic debuffs.
			{ spellID = 48707, unitId = "target", caster = "all", filter = "BUFF" }, 
			-- Bone Shield -20% dmg
			{ spellID = 49222, unitId = "target", caster = "all", filter = "BUFF" }, 
			-- Icebound Fortitude -50% dmg
			{ spellID = 48792, unitId = "target", caster = "all", filter = "BUFF" }, 
			-- Vampiric Blood +25% heal
			{ spellID = 55233, unitId = "target", caster = "all", filter = "BUFF" }, 
			--Lichborne
			{ spellID = 49039, unitId = "target", caster = "all", filter = "BUFF" }, 
		},
		{
			Name = "Tanks CDs focus",
			Enable = true,
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,			
			Alpha = 1,
			Size = 47,
			setPoint = { "BOTTOMRIGHT", "iFilgerTanksCDsFocus", 0, 22 },
			
		-- Priest CDs !!! 
			-- Guardian Spirit
			{ spellID = 47788, unitId = "focus", caster = "all", filter = "BUFF" },
			-- Pain Suppression
			{ spellID = 33206, unitId = "focus", caster = "all", filter = "BUFF" },
			
		-- Paladin
			-- Forbearance -- it may be good to know that you can't Lay of Hands your focus...
			{ spellID = 25771, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Divine Shield -- immune to all
			{ spellID = 642, unitId = "focus", caster = "all", filter = "BUFF" },
			-- Hand of Protection -- immune to cac
			{ spellID = 1022, unitId = "focus", caster = "all", filter = "BUFF" },
			-- Divine Protection -20% physical OR magical dmg
			{ spellID = 498, unitId = "focus", caster = "all", filter = "BUFF" },
			-- Ardent Defender
			{ spellID = 31850, unitId = "focus", caster = "all", filter = "BUFF" },
			-- Guardian of Ancient Kings (prot) -50% dmg
			{ spellID = 86659, unitId = "focus", caster = "all", filter = "BUFF" },
			
		-- Druid
			-- Survival Instincts -50% dmg
			{ spellID = 61336, unitId = "focus", caster = "all", filter = "BUFF" },
			-- Barkskin -20% dmg
			{ spellID = 22812, unitId = "focus", caster = "all", filter = "BUFF" },
			-- Frenzied Regeneration
			{ spellID = 22842, unitId = "focus", caster = "all", filter = "BUFF" },
			
		-- Warrior
			-- Enraged Regeneration
			{ spellID = 55694, unitId = "focus", caster = "all", filter = "BUFF" },
			-- Rallying Cry +20% health
			{ spellID = 97462, unitId = "focus", caster = "all", filter = "BUFF" },
			-- Shield Wall -40% dmg
			{ spellID = 871, unitId = "focus", caster = "all", filter = "BUFF" },
			-- Spell Reflection
			{ spellID = 23920, unitId = "focus", caster = "all", filter = "BUFF" },
			-- Shield Block +25% block
			{ spellID = 2565, unitId = "focus", caster = "all", filter = "BUFF" },
			-- Last Stand
			{ spellID = 12975, unitId = "focus", caster = "all", filter = "BUFF" },

		-- Death Knight
			-- Anti-Magic Shell : -75% spell dmg + Immune to magic debuffs.
			{ spellID = 48707, unitId = "focus", caster = "all", filter = "BUFF" }, 
			-- Bone Shield -20% dmg
			{ spellID = 49222, unitId = "focus", caster = "all", filter = "BUFF" }, 
			-- Icebound Fortitude -50% dmg
			{ spellID = 48792, unitId = "focus", caster = "all", filter = "BUFF" }, 
			-- Vampiric Blood +25% heal
			{ spellID = 55233, unitId = "focus", caster = "all", filter = "BUFF" }, 
			--Lichborne
			{ spellID = 49039, unitId = "focus", caster = "all", filter = "BUFF" }, 
		},
		{
			Name = "Tanks Boss Debuff",
			Enable = true,
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,			
			Alpha = 1,
			Size = 37,
			setPoint = { "BOTTOMRIGHT", "iFilgerTanksCDs", 0, 22 },
			
			-- Demoralizing Shout (war)
			{ spellID = 1160, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Thunderclap (war)
			{ spellID = 6343, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Weakened Armor (Druid)
			{ spellID = 113746, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Infected Wounds (Druid)
			{ spellID = 48484, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Demoralizing Roar (Druid)
			{ spellID = 99, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Frost Fever (Death Knight)
			{ spellID = 55095, unitId = "target", caster = "all", filter = "DEBUFF" },
			 --Blood Plague (Death Knight)
			{ spellID = 59879, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Vindication (Paladin)
			{ spellID = 26017, unitId = "target", caster = "all", filter = "DEBUFF" },
		},
	},
}

iFilgerConfig = C