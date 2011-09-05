local I, C, L = unpack(select(2, ...)) -- Import: I - functions, constants, variables; C - config; L - locales

I.UIScale = function()
	if C["general"].autoscale == true then
		C["general"].uiscale = min(2, max(.64, 768/string.match(({GetScreenResolutions()})[GetCurrentResolution()], "%d+x(%d+)")))
	end
end
I.UIScale()