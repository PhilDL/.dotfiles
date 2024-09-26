local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.automatically_reload_config = true
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "DemiBold" })
config.font_size = 17

config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.default_cursor_style = "BlinkingBlock"
config.color_scheme = "Catppuccin Mocha"

-- config.window_background_opacity = 0.9
-- config.macos_window_background_blur = 10
-- config.window_padding = {
-- 	top = 0,
-- 	bottom = 0,
-- 	left = 3,
-- 	right = 3,
-- }

return config
