--And so it begins..
local E, C, L, DB = unpack(select(2, ...)) -- Import Functions/Constants, Config, Locales

--Constants
E.dummy = function() return end
_, E.myclass = UnitClass("player")
E.resolution = GetCurrentResolution()
E.getscreenresolution = select(E.resolution, GetScreenResolutions())
E.getscreenheight = tonumber(string.match(({GetScreenResolutions()})[GetCurrentResolution()], "%d+x(%d+)"))
E.getscreenwidth = tonumber(string.match(({GetScreenResolutions()})[GetCurrentResolution()], "(%d+)x+%d"))