----------------------------------------------------------------
-- initiation of tukui
----------------------------------------------------------------

-- including system
local addon, engine = ...
engine[1] = {} -- I, functions, constants, variables
engine[2] = {} -- C, config
engine[3] = {} -- L, localization

iFilger = engine -- Allow other addons to use Engine

---------------------------------------------------------------------------------
--	This should be at the top of every file inside of the iFilger AddOn:	
--	local I, C, L = unpack(select(2, ...))

--	This is how another addon imports the iFilger engine:	
--	local I, C, L = unpack(iFilger)
---------------------------------------------------------------------------------