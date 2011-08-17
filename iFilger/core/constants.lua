local I, C, L = unpack(select(2, ...)) -- Import: I - functions, constants, variables; C - config; L - locales

I.dummy = function() return end
I.myname = select(1, UnitName("player"))
I.myclass = select(2, UnitClass("player"))
I.client = GetLocale() 
I.resolution = GetCurrentResolution()
I.getscreenresolution = select(I.resolution, GetScreenResolutions())
I.getscreenheight = tonumber(string.match(({GetScreenResolutions()})[GetCurrentResolution()], "%d+x(%d+)"))
I.getscreenwidth = tonumber(string.match(({GetScreenResolutions()})[GetCurrentResolution()], "(%d+)x+%d"))
I.version = GetAddOnMetadata("iFilger", "Version")
I.versionnumber = tonumber(I.version)
I.incombat = UnitAffectingCombat("player")
I.patch, I.build, I.releasedate, I.toc = GetBuildInfo()
I.level = UnitLevel("player")
I.myrealm = GetRealmName()
I.InfoLeftRightWidth = 370