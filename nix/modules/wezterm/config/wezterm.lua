local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Gruvbox dark, hard (base16)'
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = 'RESIZE'
config.window_padding = {
  left = '1cell',
  right = '1cell',
  top = 0,
  bottom = '0.5cell',
}
config.font_size = 15.0

config.audible_bell = 'Disabled'

config.keys = {
  {
    key = 'F',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.QuickSelectArgs {
      patterns = { 'https?://\\S+' },
      action = wezterm.action_callback(function(window, pane)
        local url = window:get_selection_text_for_pane(pane)
        wezterm.log_info('opening: ' .. url)
        wezterm.open_with(url)
      end),
    },
  },
}

return config
