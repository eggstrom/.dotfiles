local wezterm = require("wezterm")
local config = {}
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- Start tmux when opening WezTerm
-- config.default_prog = { "tmux attach || tmux" }

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

config.keys = {
    { mods = "CTRL|ALT",   key = "s",         action = wezterm.action.SplitVertical },
    { mods = "CTRL|ALT",   key = "v",         action = wezterm.action.SplitHorizontal },
    { mods = "CTRL|ALT", key = "LeftArrow", action = wezterm.action.ActivatePaneDirection("Left") },
    { mods = "CTRL|ALT", key = "DownArrow", action = wezterm.action.ActivatePaneDirection("Down") },
    { mods = "CTRL|ALT", key = "UpArrow",   action = wezterm.action.ActivatePaneDirection("Up") },
    { mods = "CTRL|ALT", key = "DownArrow", action = wezterm.action.ActivatePaneDirection("Right") },
    { mods = "CTRL|ALT", key = "h",         action = wezterm.action.ActivatePaneDirection("Left") },
    { mods = "CTRL|ALT", key = "j",         action = wezterm.action.ActivatePaneDirection("Down") },
    { mods = "CTRL|ALT", key = "k",         action = wezterm.action.ActivatePaneDirection("Up") },
    { mods = "CTRL|ALT", key = "l",         action = wezterm.action.ActivatePaneDirection("Right") },
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
