local C, F, L = unpack(select(2, ...))
  --Translated by 老虎007(wxnod@vip.qq.com)
local client = GetLocale()

if client == "zhCN" then
	L["iFilger"] = "|cff1784d1iFilger|r |cffffffffConfiguration|r"
	L["Config"] = "If you config your |cff1784d1iFilger|r by Lua and\nstill wish to use the configuration GUI,\ndon't forget to click on |cff1784d1Reset Config|r\neach time you modify the config.lua"

	-- option name
	L["Name"] = "名字"
	L["Enable"] = "启用"
	L["Size"] = "尺寸"
	L["Direction"] = "方向"
	L["IconSide"] = "图标方向"
	L["Interval"] = "间隔"
	L["Mode"] = "模式"
	L["Alpha"] = "透明度"
	L["BarWidth"] = "计时条宽度"
	L["Merge"] = "合并"

	L["cleverzone"] = "智能区域"
	L["tooltip"] = "提示框"
	L["TooltipMover"] = "移动提示框"
	L["FlashIcon"] = "闪烁图标"
	L["FlashBar"] = "闪烁计时条"
	L["FlashThreshold"] = "闪烁临界"
	L["FlashDuration"] = "闪烁持续时间"

	-- option help
	L["H_Name"] = "分组名称"
	L["H_Enable"] = "启用或禁用分组."
	L["H_Size1"] = "图标大小"
	L["H_Size2"] = "必须是正数"
	L["H_Direction1"] = "图标方向:"
	L["H_Direction2"] = "左,右,上,下"
	L["H_IconSide1"] = "图标在计时条上显示的位置:"
	L["H_IconSide2"] = "左或右"
	L["H_Interval"] = "图标和计时条之间间距"
	L["H_Mode1"] = "显示模式:"
	L["H_Mode2"] = "图标或计时条"
	L["H_Alpha1"] = "透明度:"
	L["H_Alpha2"] = "从0（隐藏）到1（显示）选择"
	L["H_BarWidth"] = "计时条宽度（需要计时条模式）"
	L["H_Merge"] = "当名字一样时允许合并."

	L["H_cleverzone1"] = "智能区域:"
	L["H_cleverzone2"] = "PVP区域时只加载PVP,PVE区域时只加载PVE"
	L["H_cleverzone3"] = "(需要重新加载)"
	L["H_tooltip"] = "图标提示框"
	L["H_TooltipMover"] = "移动提示框针对ElvUI和Tukui用户."
	L["H_FlashIcon"] = "当剩余时间少于临界时闪烁图标（需要图标模式）."
	L["H_FlashBar"] = "当剩余时间少于临界时闪烁计时条（需要计时条模式）."
	L["H_FlashThreshold1"] = "Threshold when icons start flashing."
	L["H_FlashThreshold2"] = "必须大于1."
	L["H_FlashDuration1"] = "闪烁持续时间."
	L["H_FlashDuration2"] = "必须是正数, smaller => quicker."

	-- buttons
	L["Apply"] = "应用"
	L["Reset Config"] = "恢复默认"
	L["Move Buffs"] = "移动buffs"
	L["Reset Buff Position"] = "重置Buff位置"
	L["Global Config"] = "总体配置"
end