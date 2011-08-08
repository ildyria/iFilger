local I, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

I.MoverFrames = {}

---------------------------------
-- GENERAL FRAMES
---------------------------------
local Enhancements = CreateFrame("Frame","iFilgerEnhancements",UIParent) -- Ice Block / smoke / ShS...
Enhancements:CreatePanel("Default",200, 20,"BOTTOMRIGHT", UIParent , "CENTER", 165,248)
Enhancements:SetMovable(true)
Enhancements:SetBackdropBorderColor(1,0,0)
Enhancements:SetFrameLevel(2)
Enhancements:SetFrameStrata("HIGH")
Enhancements.text = I.SetFontString(Enhancements, C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
Enhancements.text:SetPoint("CENTER")
Enhancements.text:SetText("Move Enhancements")
Enhancements:Hide()

local PvpPlayerDebuffs = CreateFrame("Frame","iFilgerPvpPlayerDebuffs",UIParent) -- Kidney shoot & cie...
PvpPlayerDebuffs:CreatePanel("Default",200, 20,"BOTTOMRIGHT", UIParent , "CENTER", -104, 93)
PvpPlayerDebuffs:SetMovable(true)
PvpPlayerDebuffs:SetBackdropBorderColor(1,0,0)
PvpPlayerDebuffs:SetFrameLevel(2)
PvpPlayerDebuffs:SetFrameStrata("HIGH")
PvpPlayerDebuffs.text = I.SetFontString(PvpPlayerDebuffs, C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
PvpPlayerDebuffs.text:SetPoint("CENTER")
PvpPlayerDebuffs.text:SetText("Move Pvp Player Debuffs")
PvpPlayerDebuffs:Hide()

local PvpTargetDebuffs = CreateFrame("Frame","iFilgerPvpTargetDebuffs",UIParent) -- Ice Block / smoke / ShS...
PvpTargetDebuffs:CreatePanel("Default",200, 20,"BOTTOMLEFT", UIParent , "CENTER", 104,93)
PvpTargetDebuffs:SetMovable(true)
PvpTargetDebuffs:SetBackdropBorderColor(1,0,0)
PvpTargetDebuffs:SetFrameLevel(2)
PvpTargetDebuffs:SetFrameStrata("HIGH")
PvpTargetDebuffs.text = I.SetFontString(PvpTargetDebuffs, C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
PvpTargetDebuffs.text:SetPoint("CENTER")
PvpTargetDebuffs.text:SetText("Move Pvp Target Debuffs")
PvpTargetDebuffs:Hide()

local PveDeBuffs = CreateFrame("Frame","iFilgerPveDeBuffs",UIParent) -- Malo etc...
PveDeBuffs:CreatePanel("Default",200, 20,"TOPRIGHT", UIParent , "CENTER", -82,-68)
PveDeBuffs:SetMovable(true)
PveDeBuffs:SetBackdropBorderColor(1,0,0)
PveDeBuffs:SetFrameLevel(2)
PveDeBuffs:SetFrameStrata("HIGH")
PveDeBuffs.text = I.SetFontString(PveDeBuffs, C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
PveDeBuffs.text:SetPoint("CENTER")
PveDeBuffs.text:SetText("Move Pve Debuffs")
PveDeBuffs:Hide()

table.insert(I.MoverFrames,iFilgerEnhancements)
table.insert(I.MoverFrames,iFilgerPvpPlayerDebuffs)
table.insert(I.MoverFrames,iFilgerPvpTargetDebuffs)
table.insert(I.MoverFrames,iFilgerPveDeBuffs)




---------------------------------
-- CLASS FRAMES GENERAL
---------------------------------
if(I.myclass ~= "WARLOCK" and I.myclass ~= "ROGUE" ) then
	local Procs = CreateFrame("Frame","iFilgerProcs",UIParent) -- HS, Arcane Missiles...
	Procs:CreatePanel("Default",200, 21,"BOTTOMLEFT", UIParent , "CENTER", 195,-35)
	Procs:SetMovable(true)
	Procs:SetBackdropBorderColor(RAID_CLASS_COLORS[I.myclass].r,RAID_CLASS_COLORS[I.myclass].g,RAID_CLASS_COLORS[I.myclass].b)
	Procs:SetFrameLevel(2)
	Procs:SetFrameStrata("HIGH")
	Procs.text = I.SetFontString(Procs, C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
	Procs.text:SetPoint("CENTER")
	Procs.text:SetText("Move Procs")
	Procs:Hide()
	table.insert(I.MoverFrames,iFilgerProcs)
end

if(I.myclass ~= "DRUID"  and I.myclass ~= "WARLOCK" and I.myclass ~= "ROGUE" ) then
	local BuffDebuff = CreateFrame("Frame","iFilgerBuffDebuff",UIParent) -- Icy Veins, Living Bomb...
	BuffDebuff:CreatePanel("Default",200, 21,"TOPLEFT", UIParent , "CENTER", 156,-141)
	BuffDebuff:SetMovable(true)
	BuffDebuff:SetBackdropBorderColor(RAID_CLASS_COLORS[I.myclass].r,RAID_CLASS_COLORS[I.myclass].g,RAID_CLASS_COLORS[I.myclass].b)
	BuffDebuff:SetFrameLevel(2)
	BuffDebuff:SetFrameStrata("HIGH")
	BuffDebuff.text = I.SetFontString(BuffDebuff, C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
	BuffDebuff.text:SetPoint("CENTER")
	BuffDebuff.text:SetText("Move Buffs / Debuffs")
	BuffDebuff:Hide()
	table.insert(I.MoverFrames,iFilgerBuffDebuff)
end

if(I.myclass ~= "DRUID" and I.myclass ~= "PALADIN" and I.myclass ~= "WARLOCK" and I.myclass ~= "ROGUE" and I.myclass ~= "WARRIOR" ) then
	local Cooldowns = CreateFrame("Frame","iFilgerCooldowns",UIParent) -- Cooldowns
	Cooldowns:CreatePanel("Default",160, 20, "BOTTOMRIGHT", UIParent, "CENTER", 153, -97)
	Cooldowns:SetMovable(true)
	Cooldowns:SetBackdropBorderColor(RAID_CLASS_COLORS[I.myclass].r,RAID_CLASS_COLORS[I.myclass].g,RAID_CLASS_COLORS[I.myclass].b)
	Cooldowns.text = I.SetFontString(Cooldowns, C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
	Cooldowns.text:SetPoint("CENTER")
	Cooldowns.text:SetText("Move Cooldowns")
	Cooldowns:Hide()
	table.insert(I.MoverFrames,iFilgerCooldowns)
end



---------------------------------
-- PRIEST
---------------------------------
if(I.myclass == "PRIEST" ) then
	local BuffDebuffDps = CreateFrame("Frame","iFilgerBuffDebuffDps",UIParent) -- BuffDebuffDps
	BuffDebuffDps:CreatePanel("Default",160, 20, "TOPRIGHT", UIParent, "CENTER", 98, -140)
	BuffDebuffDps:SetMovable(true)
	BuffDebuffDps:SetBackdropBorderColor(RAID_CLASS_COLORS[I.myclass].r,RAID_CLASS_COLORS[I.myclass].g,RAID_CLASS_COLORS[I.myclass].b)
	BuffDebuffDps.text = I.SetFontString(BuffDebuffDps, C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
	BuffDebuffDps.text:SetPoint("CENTER")
	BuffDebuffDps.text:SetText("Move Buff / Debuff Dps")
	BuffDebuffDps:Hide()
	table.insert(I.MoverFrames,iFilgerBuffDebuffDps)

	local BuffDebuffHeal = CreateFrame("Frame","iFilgerBuffDebuffHeal",UIParent) -- BuffDebuffHeal
	BuffDebuffHeal:CreatePanel("Default",160, 20, "BOTTOMRIGHT", UIParent, "CENTER", 98, -61)
	BuffDebuffHeal:SetMovable(true)
	BuffDebuffHeal:SetBackdropBorderColor(RAID_CLASS_COLORS[I.myclass].r,RAID_CLASS_COLORS[I.myclass].g,RAID_CLASS_COLORS[I.myclass].b)
	BuffDebuffHeal.text = I.SetFontString(BuffDebuffHeal, C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
	BuffDebuffHeal.text:SetPoint("CENTER")
	BuffDebuffHeal.text:SetText("Move Buff / Debuff Heal")
	BuffDebuffHeal:Hide()
	table.insert(I.MoverFrames,iFilgerBuffDebuffHeal)
end



---------------------------------
-- DRUID
---------------------------------
if(I.myclass == "DRUID" ) then
	local TargetDebuff = CreateFrame("Frame","iFilgerTargetDebuff",UIParent) -- TargetDebuff
	TargetDebuff:CreatePanel("Default",160, 20, "TOPRIGHT", UIParent, "CENTER", 118, -160)
	TargetDebuff:SetMovable(true)
	TargetDebuff:SetBackdropBorderColor(RAID_CLASS_COLORS[I.myclass].r,RAID_CLASS_COLORS[I.myclass].g,RAID_CLASS_COLORS[I.myclass].b)
	TargetDebuff.text = I.SetFontString(TargetDebuff, C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
	TargetDebuff.text:SetPoint("CENTER")
	TargetDebuff.text:SetText("Move Target Debuff")
	TargetDebuff:Hide()
	table.insert(I.MoverFrames,iFilgerTargetDebuff)

	local BuffTargetHeal = CreateFrame("Frame","iFilgerBuffTargetHeal",UIParent) -- BuffTargetHeal
	BuffTargetHeal:CreatePanel("Default",160, 20, "TOPLEFT", UIParent, "CENTER", 164, -268)
	BuffTargetHeal:SetMovable(true)
	BuffTargetHeal:SetBackdropBorderColor(RAID_CLASS_COLORS[I.myclass].r,RAID_CLASS_COLORS[I.myclass].g,RAID_CLASS_COLORS[I.myclass].b)
	BuffTargetHeal.text = I.SetFontString(BuffTargetHeal, C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
	BuffTargetHeal.text:SetPoint("CENTER")
	BuffTargetHeal.text:SetText("Move Heal Buff Target")
	BuffTargetHeal:Hide()
	table.insert(I.MoverFrames,iFilgerBuffTargetHeal)

	local BuffPlayerHeal = CreateFrame("Frame","iFilgerBuffPlayerHeal",UIParent) -- BuffPlayerHeal
	BuffPlayerHeal:CreatePanel("Default",160, 20, "TOPRIGHT", UIParent, "CENTER", -164, -268)
	BuffPlayerHeal:SetMovable(true)
	BuffPlayerHeal:SetBackdropBorderColor(RAID_CLASS_COLORS[I.myclass].r,RAID_CLASS_COLORS[I.myclass].g,RAID_CLASS_COLORS[I.myclass].b)
	BuffPlayerHeal.text = I.SetFontString(BuffPlayerHeal, C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
	BuffPlayerHeal.text:SetPoint("CENTER")
	BuffPlayerHeal.text:SetText("Move Heal Buff Player")
	BuffPlayerHeal:Hide()
	table.insert(I.MoverFrames,iFilgerBuffPlayerHeal)
end



---------------------------------
-- ROGUE
---------------------------------
if(I.myclass == "ROGUE" ) then
	local TargetDebuff = CreateFrame("Frame","iFilgerTargetDebuff",UIParent) -- Target Debuff
	TargetDebuff:CreatePanel("Default",160, 20, "TOPLEFT", UIParent, "CENTER", 37, -110)
	TargetDebuff:SetMovable(true)
	TargetDebuff:SetBackdropBorderColor(RAID_CLASS_COLORS[I.myclass].r,RAID_CLASS_COLORS[I.myclass].g,RAID_CLASS_COLORS[I.myclass].b)
	TargetDebuff.text = I.SetFontString(TargetDebuff, C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
	TargetDebuff.text:SetPoint("CENTER")
	TargetDebuff.text:SetText("Move Target Debuff")
	TargetDebuff:Hide()
	table.insert(I.MoverFrames,iFilgerTargetDebuff)

	local PlayerBuff = CreateFrame("Frame","iFilgerPlayerBuff",UIParent) -- Player Buff
	PlayerBuff:CreatePanel("Default",160, 20, "TOPRIGHT", UIParent, "CENTER", -42, -110)
	PlayerBuff:SetMovable(true)
	PlayerBuff:SetBackdropBorderColor(RAID_CLASS_COLORS[I.myclass].r,RAID_CLASS_COLORS[I.myclass].g,RAID_CLASS_COLORS[I.myclass].b)
	PlayerBuff.text = I.SetFontString(PlayerBuff, C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
	PlayerBuff.text:SetPoint("CENTER")
	PlayerBuff.text:SetText("Move Player Buff")
	PlayerBuff:Hide()
	table.insert(I.MoverFrames,iFilgerPlayerBuff)

	local Cooldowns = CreateFrame("Frame","iFilgerCooldowns",UIParent) -- Cooldowns
	Cooldowns:CreatePanel("Default",160, 20, "TOPLEFT", UIParent, "CENTER", 204, 63)
	Cooldowns:SetMovable(true)
	Cooldowns:SetBackdropBorderColor(RAID_CLASS_COLORS[I.myclass].r,RAID_CLASS_COLORS[I.myclass].g,RAID_CLASS_COLORS[I.myclass].b)
	Cooldowns.text = I.SetFontString(Cooldowns, C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
	Cooldowns.text:SetPoint("CENTER")
	Cooldowns.text:SetText("Move Cooldowns")
	Cooldowns:Hide()
	table.insert(I.MoverFrames,iFilgerCooldowns)
end



---------------------------------
-- WARRIOR
---------------------------------
if(I.myclass == "WARRIOR" ) then
	local PlayerCDDef = CreateFrame("Frame","iFilgerPlayerCDDef",UIParent) -- Player CD Def
	PlayerCDDef:CreatePanel("Default",160, 20, "TOPRIGHT", UIParent, "CENTER", -42, -130)
	PlayerCDDef:SetMovable(true)
	PlayerCDDef:SetBackdropBorderColor(RAID_CLASS_COLORS[I.myclass].r,RAID_CLASS_COLORS[I.myclass].g,RAID_CLASS_COLORS[I.myclass].b)
	PlayerCDDef.text = I.SetFontString(PlayerCDDef, C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
	PlayerCDDef.text:SetPoint("CENTER")
	PlayerCDDef.text:SetText("Move Player CD Def")
	PlayerCDDef:Hide()
	table.insert(I.MoverFrames,iFilgerPlayerCDDef)
end



---------------------------------
-- WARLOCK
---------------------------------
if(I.myclass == "WARLOCK" ) then
	local TargetCCDebuff = CreateFrame("Frame","iFilgerTargetCCDebuff",UIParent) -- TargetCCDebuff
	TargetCCDebuff:CreatePanel("Default",160, 20, "TOPLEFT", UIParent, "CENTER", 37, -110)
	TargetCCDebuff:SetMovable(true)
	TargetCCDebuff:SetBackdropBorderColor(RAID_CLASS_COLORS[I.myclass].r,RAID_CLASS_COLORS[I.myclass].g,RAID_CLASS_COLORS[I.myclass].b)
	TargetCCDebuff.text = I.SetFontString(TargetCCDebuff, C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
	TargetCCDebuff.text:SetPoint("CENTER")
	TargetCCDebuff.text:SetText("Move Target CC Debuff")
	TargetCCDebuff:Hide()
	table.insert(I.MoverFrames,iFilgerTargetCCDebuff)

	local TargetDoTDebuff = CreateFrame("Frame","iFilgerTargetDoTDebuff",UIParent) -- TargetDoTDebuff
	TargetDoTDebuff:CreatePanel("Default",160, 20, "TOPRIGHT", UIParent, "CENTER",  -100, -110)
	TargetDoTDebuff:SetMovable(true)
	TargetDoTDebuff:SetBackdropBorderColor(RAID_CLASS_COLORS[I.myclass].r,RAID_CLASS_COLORS[I.myclass].g,RAID_CLASS_COLORS[I.myclass].b)
	TargetDoTDebuff.text = I.SetFontString(TargetDoTDebuff, C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
	TargetDoTDebuff.text:SetPoint("CENTER")
	TargetDoTDebuff.text:SetText("Move Target DoT Debuff")
	TargetDoTDebuff:Hide()
	table.insert(I.MoverFrames,iFilgerTargetDoTDebuff)

	local Procs = CreateFrame("Frame","iFilgerProcs",UIParent) -- Procs
	Procs:CreatePanel("Default",90, 20, "CENTER", UIParent, "CENTER", -0, -55)
	Procs:SetMovable(true)
	Procs:SetBackdropBorderColor(RAID_CLASS_COLORS[I.myclass].r,RAID_CLASS_COLORS[I.myclass].g,RAID_CLASS_COLORS[I.myclass].b)
	Procs.text = I.SetFontString(Procs, C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
	Procs.text:SetPoint("CENTER")
	Procs.text:SetText("Move Procs")
	Procs:Hide()
	table.insert(I.MoverFrames,iFilgerProcs)

	local Cooldown = CreateFrame("Frame","iFilgerCooldown",UIParent) -- Cooldown
	Cooldown:CreatePanel("Default",160, 20, "TOPRIGHT", UIParent, "CENTER", -42, -150)
	Cooldown:SetMovable(true)
	Cooldown:SetBackdropBorderColor(RAID_CLASS_COLORS[I.myclass].r,RAID_CLASS_COLORS[I.myclass].g,RAID_CLASS_COLORS[I.myclass].b)
	Cooldown.text = I.SetFontString(Cooldown, C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
	Cooldown.text:SetPoint("CENTER")
	Cooldown.text:SetText("Move Cooldown")
	Cooldown:Hide()
	table.insert(I.MoverFrames,iFilgerCooldown)
end



---------------------------------
-- FOCUS FRAME
---------------------------------
if(I.myclass == "MAGE" or I.myclass == "SHAMAN" or I.myclass == "PALADIN" ) then
	local FocusBuffs = CreateFrame("Frame","iFilgerFocusBuffs",UIParent) -- CC / sheep & cie
	FocusBuffs:CreatePanel("Default",165, 20, "TOPRIGHT", UIParent, "CENTER", -53, 53)
	FocusBuffs:SetMovable(true)
	FocusBuffs:SetBackdropBorderColor(RAID_CLASS_COLORS[I.myclass].r,RAID_CLASS_COLORS[I.myclass].g,RAID_CLASS_COLORS[I.myclass].b)
	FocusBuffs.text = I.SetFontString(FocusBuffs, C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
	FocusBuffs.text:SetPoint("CENTER")
	FocusBuffs.text:SetText("Move Focus Buffs")
	FocusBuffs:Hide()
	table.insert(I.MoverFrames,iFilgerFocusBuffs)
end