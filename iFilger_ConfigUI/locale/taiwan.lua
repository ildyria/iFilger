local C, F, L = unpack(select(2, ...))
  --Translated by 老虎007(wxnod@vip.qq.com)
local client = GetLocale()

if client == "zhTW" then
	L["iFilger"] = "|cff1784d1iFilger|r |cffffffffConfiguration|r"
	L["Config"] = "If you config your |cff1784d1iFilger|r by Lua and\nstill wish to use the configuration GUI,\ndon't forget to click on |cff1784d1Reset Config|r\neach time you modify the config.lua"

	-- option name
	L["Name"] = "名字"
	L["Enable"] = "開啟"
	L["Size"] = "尺寸"
	L["Direction"] = "方向"
	L["IconSide"] = "圖標方向"
	L["Interval"] = "間隔"
	L["Mode"] = "模式"
	L["Alpha"] = "透明度"
	L["BarWidth"] = "計時條寬度"
	L["Merge"] = "合并"

	L["cleverzone"] = "智能區域"
	L["tooltip"] = "提示框"
	L["TooltipMover"] = "移動提示框"
	L["FlashIcon"] = "閃爍圖標"
	L["FlashBar"] = "閃爍計時條"
	L["FlashThreshold"] = "閃爍臨界"
	L["FlashDuration"] = "閃爍持續時間"

	-- option help
	L["H_Name"] = "分組名稱"
	L["H_Enable"] = "啟用或者禁用分組."
	L["H_Size1"] = "圖標大小"
	L["H_Size2"] = "必須是正數"
	L["H_Direction1"] = "圖標方向:"
	L["H_Direction2"] = "左,右,上,下"
	L["H_IconSide1"] = "圖標在計時條上顯示位置:"
	L["H_IconSide2"] = "左或右"
	L["H_Interval"] = "圖標和計時條之間間距"
	L["H_Mode1"] = "顯示模式:"
	L["H_Mode2"] = "圖標或計時條"
	L["H_Alpha1"] = "透明度:"
	L["H_Alpha2"] = "從0（隱藏）到1（顯示）選擇"
	L["H_BarWidth"] = "計時條寬度（需要計時條模式）"
	L["H_Merge"] = "當名字一樣時應許合併."

	L["H_cleverzone1"] = "智能區域:"
	L["H_cleverzone2"] = "pve區域時只能加載PVP，PVE區域時只加載PVE"
	L["H_cleverzone3"] = "(需要重新加載)"
	L["H_tooltip"] = "圖標提示框"
	L["H_TooltipMover"] = "移動提示框針對Elvui和Tukui用戶."
	L["H_FlashIcon"] = "当剩余时间少于临界时閃爍圖標（需要圖標模式）."
	L["H_FlashBar"] = "當剩餘時間少于臨界時閃爍計時條（需要計時條模式）."
	L["H_FlashThreshold1"] = "Threshold when icons start flashing."
	L["H_FlashThreshold2"] = "必須大於1."
	L["H_FlashDuration1"] = "閃爍持續時間."
	L["H_FlashDuration2"] = "必須是正數, smaller => quicker."

	-- buttons
	L["Apply"] = "應用"
	L["Reset Config"] = "恢復應用"
	L["Move Buffs"] = "移動buffs"
	L["Reset Buff Position"] = "重置buffs位置"
	L["Global"] = "總體配置"
end