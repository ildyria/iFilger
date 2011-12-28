----------------------------------------------------------------------------
-- This Module loads custom settings for edited package
----------------------------------------------------------------------------

--[[
		To add your own custom config into your edited version,
		You need to create the addon Tukui_EditedDefaultConfig and add
		your custom configuration into it.
		
		A guide (example) can be downloaded at:
		http://www.tukui.org/downloads/Tukui_EditedDefaultConfig.zip
		
		Don't forget to add in the .toc, in your edited Tukui version: Tukui_CustomConfig
		If no new option group, Add it to: ## OptionalDeps
		If new option group, Add it to: ## RequiredDeps

		That's it! That's all!
--]]
--[[
local T, C, L = unpack(Tukui)
local class = select(2, UnitClass("player"));

print("begin loading buffs config")

if not iFilgerBuffConfig then 
	print("fail loading buffs")
	return
end

local settings = iFilgerBuffConfig["Filger_Spells"]
local loaded = "";

if (not C["Filger_Spells"][class]) then
	T.Print("class")
	C["Filger_Spells"][class] = {}
	for i = 1, #settings[class], 1 do
		table.insert(C["Filger_Spells"][class], Filger_Spells["ALL"][i])
	end
	loaded = loaded .. class
end

if (Filger_Spells["ALL"]) then
	for i = 1, #Filger_Spells["ALL"], 1 do
		table.insert(C["Filger_Spells"][class], Filger_Spells["ALL"][i])
	end
loaded = loaded .. " ALL"
end

if (Filger_Spells["PVE"] and C["Filger"].PVE and (zone == "pve" or zone == "config")) then
	for i = 1, #Filger_Spells["PVE"], 1 do
		table.insert(C["Filger_Spells"][class], Filger_Spells["PVE"][i])
	end
loaded = loaded .. " PVE"
end

if (Filger_Spells["TANKS"] and C["Filger"].TANKS and (zone == "pve" or zone == "config")) then
	for i = 1, #Filger_Spells["TANKS"], 1 do
		table.insert(C["Filger_Spells"][class], Filger_Spells["TANKS"][i])
	end
loaded = loaded .. " TANKS"
end

if (Filger_Spells["PVP"] and C["Filger"].PVP and (zone == "pvp" or zone == "config")) then
	for i = 1, #Filger_Spells["PVP"], 1 do
		table.insert(C["Filger_Spells"][class], Filger_Spells["PVP"][i])
	end
loaded = loaded .. " PVP"
end

if (Filger_Spells["HUNTER/DRUID/ROGUE"] and (class == "HUNTER" or class == "DRUID" or class == "ROGUE")) then
	for i = 1, #Filger_Spells["HUNTER/DRUID/ROGUE"], 1 do
		table.insert(C["Filger_Spells"][class], Filger_Spells["HUNTER/DRUID/ROGUE"][i])
	end
loaded = loaded .. " HDR"
end
T.Print("config buff : "..loaded)]]