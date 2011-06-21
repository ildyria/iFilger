-----------------------------------------------------
-- All starts here baby!

-- Credit Nightcracker
-----------------------------------------------------

-- including system
local addon, engine = ...
engine[1] = {} -- E, functions, constants
engine[2] = {} -- C, config
engine[3] = {} -- L, localization
engine[4] = {} -- DB, database, post config load

iFilger = engine --Allow other addons to use Engine

local E, C, L, DB = unpack(select(2, ...))
function E.IsPTRVersion()
	local _, version = GetBuildInfo()
	if tonumber(version) > 14007 then
		return true
	else
		return false
	end
end