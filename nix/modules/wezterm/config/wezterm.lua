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

config.notification_handling = 'AlwaysShow'

-- Bind Cmd-@key to send C-t @tmux_key to allow passing a key sequence through to tmux.
--
-- If @tmux_key is not specified it defaults to @key.
local function tmux_passthrough(key, tmux_key)
  tmux_key = tmux_key or key
  return {
    key = key,
    mods = 'CMD',
    action = wezterm.action.Multiple {
      wezterm.action.SendKey { key = 't', mods = 'CTRL' },
      wezterm.action.SendKey { key = tmux_key },
    },
  }
end

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
  tmux_passthrough('b', 't'),
  tmux_passthrough('p', 'w'),
  tmux_passthrough 's',
  tmux_passthrough 'v',
  tmux_passthrough 'z',
  tmux_passthrough 'h',
  tmux_passthrough 'j',
  tmux_passthrough 'k',
  tmux_passthrough 'l',
}

return config
