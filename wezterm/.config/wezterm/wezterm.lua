local wezterm = require("wezterm")
local config = {}
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- Appearance
config.color_scheme = "Catppuccin Mocha"
config.window_background_opacity = 0.95
config.window_padding = {
    left = "0",
    right = "0",
    top = "0",
    bottom = "0",
}
config.inactive_pane_hsb = {
    hue = 1.0,
    saturation = 1.0,
    brightness = 0.5,
}

-- Tab bar
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- Font
config.font = wezterm.font("JetBrains Mono NF")
config.font_size = tonumber(os.getenv("WEZTERM_FONT_SIZE")) or 20
config.harfbuzz_features = {
    "liga=0", -- Ligatures
    "clig=0", -- Common ligatures
    "calt=0", -- Contextual alternates
}

-- Functionality
config.window_close_confirmation = "NeverPrompt"

-- Key bindings
config.disable_default_key_bindings = true
config.keys = {
    { mods = "CTRL|SHIFT", key = "c", action = wezterm.action.CopyTo("Clipboard") },
    { mods = "CTRL|SHIFT", key = "v", action = wezterm.action.PasteFrom("Clipboard") },
    { mods = "CTRL|SHIFT", key = "f", action = wezterm.action.Search("CurrentSelectionOrEmptyString") },
    {
        mods = "ALT",
        key = "c",
        action = wezterm.action.Multiple({
            wezterm.action.ClearScrollback("ScrollbackAndViewport"),
            wezterm.action.SendKey({ mods = "CTRL", key = "l" }),
        }),
    },
    { mods = "ALT",       key = "+",         action = wezterm.action.IncreaseFontSize },
    { mods = "ALT",       key = "-",         action = wezterm.action.DecreaseFontSize },
    { mods = "ALT|SHIFT", key = "=",         action = wezterm.action.ResetFontSize },
    { mods = "ALT",       key = "f",         action = wezterm.action.TogglePaneZoomState },
    { mods = "ALT",       key = "s",         action = wezterm.action.SplitVertical },
    { mods = "ALT",       key = "v",         action = wezterm.action.SplitHorizontal },
    { mods = "ALT",       key = "LeftArrow", action = wezterm.action.ActivatePaneDirection("Left") },
    { mods = "ALT",       key = "DownArrow", action = wezterm.action.ActivatePaneDirection("Down") },
    { mods = "ALT",       key = "UpArrow",   action = wezterm.action.ActivatePaneDirection("Up") },
    { mods = "ALT",       key = "DownArrow", action = wezterm.action.ActivatePaneDirection("Right") },
    { mods = "ALT",       key = "h",         action = wezterm.action.ActivatePaneDirection("Left") },
    { mods = "ALT",       key = "j",         action = wezterm.action.ActivatePaneDirection("Down") },
    { mods = "ALT",       key = "k",         action = wezterm.action.ActivatePaneDirection("Up") },
    { mods = "ALT",       key = "l",         action = wezterm.action.ActivatePaneDirection("Right") },
    { mods = "ALT|SHIFT", key = "LeftArrow", action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
    { mods = "ALT|SHIFT", key = "DownArrow", action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },
    { mods = "ALT|SHIFT", key = "UpArrow",   action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
    { mods = "ALT|SHIFT", key = "DownArrow", action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },
    { mods = "ALT|SHIFT", key = "h",         action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
    { mods = "ALT|SHIFT", key = "j",         action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },
    { mods = "ALT|SHIFT", key = "k",         action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
    { mods = "ALT|SHIFT", key = "l",         action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },
    { mods = "ALT",       key = "t",         action = wezterm.action.SpawnTab("CurrentPaneDomain") },
    { mods = "ALT",       key = "Tab",       action = wezterm.action.ActivateTabRelative(1) },
    { mods = "ALT|SHIFT", key = "Tab",       action = wezterm.action.ActivateTabRelative(-1) },
    { mods = "ALT",       key = "1",         action = wezterm.action.ActivateTab(0) },
    { mods = "ALT",       key = "2",         action = wezterm.action.ActivateTab(1) },
    { mods = "ALT",       key = "3",         action = wezterm.action.ActivateTab(2) },
    { mods = "ALT",       key = "4",         action = wezterm.action.ActivateTab(3) },
    { mods = "ALT",       key = "5",         action = wezterm.action.ActivateTab(4) },
    { mods = "ALT",       key = "6",         action = wezterm.action.ActivateTab(5) },
    { mods = "ALT",       key = "7",         action = wezterm.action.ActivateTab(6) },
    { mods = "ALT",       key = "8",         action = wezterm.action.ActivateTab(7) },
    { mods = "ALT",       key = "9",         action = wezterm.action.ActivateTab(8) },
    { mods = "ALT",       key = "0",         action = wezterm.action.ActivateTab(9) },
    { mods = "ALT",       key = "w",         action = wezterm.action.SpawnWindow }
}

-- TODO: Do something with these, I guess
--
--  	Copy 	CopyTo="Clipboard"
--      Paste 	PasteFrom="Clipboard"
-- CTRL 	Insert 	CopyTo="PrimarySelection" (Since: Version 20210203-095643-70a364eb)
-- SHIFT 	Insert 	PasteFrom="PrimarySelection"
-- ALT 	Enter 	ToggleFullScreen
-- SUPER+SHIFT 	T 	SpawnTab="DefaultDomain"
-- SUPER 	w 	CloseCurrentTab{confirm=true}
-- CTRL+SHIFT 	w 	CloseCurrentTab{confirm=true}
-- CTRL+SHIFT 	PageUp 	MoveTabRelative=-1
-- CTRL+SHIFT 	PageDown 	MoveTabRelative=1
-- SHIFT 	PageUp 	ScrollByPage=-1
-- SHIFT 	PageDown 	ScrollByPage=1
-- CTRL+SHIFT 	L 	ShowDebugOverlay (Since: Version 20210814-124438-54e29167)
-- CTRL+SHIFT 	P 	ActivateCommandPalette (Since: Version 20230320-124340-559cb7b0)
-- CTRL+SHIFT 	U 	CharSelect (Since: Version 20220903-194523-3bb1ed61)
-- CTRL+SHIFT 	X 	ActivateCopyMode
-- CTRL+SHIFT 	Space 	QuickSelect (Since: Version 20210502-130208-bff6815d)

-- Ctrl + scroll to change font size
config.mouse_bindings = {
    {
        event = { Down = { streak = 1, button = { WheelUp = 1 } } },
        mods = "CTRL",
        action = wezterm.action.IncreaseFontSize,
    },
    {
        event = { Down = { streak = 1, button = { WheelDown = 1 } } },
        mods = "CTRL",
        action = wezterm.action.DecreaseFontSize,
    },
}

return config
