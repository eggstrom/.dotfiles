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
config.font_size = 20.0
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
    {
        mods = "CTRL|ALT",
        key = "c",
        action = wezterm.action.Multiple({
            wezterm.action.ClearScrollback("ScrollbackAndViewport"),
            wezterm.action.SendKey({ mods = "CTRL", key = "l" }),
        }),
    },
    { mods = "CTRL|ALT",       key = "+",         action = wezterm.action.IncreaseFontSize },
    { mods = "CTRL|ALT",       key = "-",         action = wezterm.action.DecreaseFontSize },
    { mods = "CTRL|ALT|SHIFT", key = "=",         action = wezterm.action.ResetFontSize },
    { mods = "CTRL|ALT",       key = "f",         action = wezterm.action.Search("CurrentSelectionOrEmptyString") },
    { mods = "CTRL|ALT",       key = "p",         action = wezterm.action.TogglePaneZoomState },
    { mods = "CTRL|ALT",       key = "s",         action = wezterm.action.SplitVertical },
    { mods = "CTRL|ALT",       key = "v",         action = wezterm.action.SplitHorizontal },
    { mods = "CTRL|ALT",       key = "LeftArrow", action = wezterm.action.ActivatePaneDirection("Left") },
    { mods = "CTRL|ALT",       key = "DownArrow", action = wezterm.action.ActivatePaneDirection("Down") },
    { mods = "CTRL|ALT",       key = "UpArrow",   action = wezterm.action.ActivatePaneDirection("Up") },
    { mods = "CTRL|ALT",       key = "DownArrow", action = wezterm.action.ActivatePaneDirection("Right") },
    { mods = "CTRL|ALT",       key = "h",         action = wezterm.action.ActivatePaneDirection("Left") },
    { mods = "CTRL|ALT",       key = "j",         action = wezterm.action.ActivatePaneDirection("Down") },
    { mods = "CTRL|ALT",       key = "k",         action = wezterm.action.ActivatePaneDirection("Up") },
    { mods = "CTRL|ALT",       key = "l",         action = wezterm.action.ActivatePaneDirection("Right") },
    { mods = "CTRL|ALT|SHIFT", key = "LeftArrow", action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
    { mods = "CTRL|ALT|SHIFT", key = "DownArrow", action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },
    { mods = "CTRL|ALT|SHIFT", key = "UpArrow",   action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
    { mods = "CTRL|ALT|SHIFT", key = "DownArrow", action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },
    { mods = "CTRL|ALT|SHIFT", key = "h",         action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
    { mods = "CTRL|ALT|SHIFT", key = "j",         action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },
    { mods = "CTRL|ALT|SHIFT", key = "k",         action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
    { mods = "CTRL|ALT|SHIFT", key = "l",         action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },
    { mods = "CTRL|ALT",       key = "t",         action = wezterm.action.SpawnTab("CurrentPaneDomain") },
    { mods = "CTRL|ALT",       key = "Tab",       action = wezterm.action.ActivateTabRelative(1) },
    { mods = "CTRL|ALT|SHIFT", key = "Tab",       action = wezterm.action.ActivateTabRelative(-1) },
    { mods = "CTRL|ALT",       key = "1",         action = wezterm.action.ActivateTab(0) },
    { mods = "CTRL|ALT",       key = "2",         action = wezterm.action.ActivateTab(1) },
    { mods = "CTRL|ALT",       key = "3",         action = wezterm.action.ActivateTab(2) },
    { mods = "CTRL|ALT",       key = "4",         action = wezterm.action.ActivateTab(3) },
    { mods = "CTRL|ALT",       key = "5",         action = wezterm.action.ActivateTab(4) },
    { mods = "CTRL|ALT",       key = "6",         action = wezterm.action.ActivateTab(5) },
    { mods = "CTRL|ALT",       key = "7",         action = wezterm.action.ActivateTab(6) },
    { mods = "CTRL|ALT",       key = "8",         action = wezterm.action.ActivateTab(7) },
    { mods = "CTRL|ALT",       key = "9",         action = wezterm.action.ActivateTab(8) },
    { mods = "CTRL|ALT",       key = "0",         action = wezterm.action.ActivateTab(9) },
    { mods = "CTRL|ALT",       key = "w",         action = wezterm.action.SpawnWindow }
}

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
