local wezterm = require "wezterm"
local config = {}
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- Will let WezTerm start if it can't find the shell
config.default_prog = { os.getenv("SHELL") }

-- Appearance
config.color_scheme = "Catppuccin Mocha"
config.window_background_opacity = 0.95
config.window_padding = {
    left = "0",
    right = "0",
    top = "0",
    bottom = "0",
}

-- Font
config.font = wezterm.font("JetBrains Mono NF")
config.font_size = 20.0
config.harfbuzz_features = {
    "liga=0", -- Disable ligatures
    "clig=0", -- Disable common ligatures
    "calt=0", -- Disable contextual alternates
}

-- Tab bar
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- Functionality
config.window_close_confirmation = "NeverPrompt"

return config
