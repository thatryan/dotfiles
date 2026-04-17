local wezterm = require 'wezterm'
local config = wezterm.config_builder()

wezterm.on("format-tab-title", function(tab)
  local pane = tab.active_pane
  local cwd = pane.current_working_dir
  local title

  if cwd and cwd.file_path then
    title = cwd.file_path:gsub(wezterm.home_dir, "~")
    title = title:match("([^/]+)/*$") or title
  end

  return "  " .. (title or pane.title) .. "  "
end)

config.window_decorations = "RESIZE"

config.font = wezterm.font({
  family = "FiraCode Nerd Font",
})

config.font_size = 18.0
config.line_height = 1.0
config.color_scheme = "Snazzy"
config.scrollback_lines = 10000

config.window_padding = {
  left = "2cell",
  right = "1cell",
  top = "1cell",
  bottom = "0.5cell",
}

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true
config.adjust_window_size_when_changing_font_size = false
config.window_close_confirmation = "NeverPrompt"
config.tab_max_width = 32
config.native_macos_fullscreen_mode = true

config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.7,
}

config.leader = {
  key = "a",
  mods = "CTRL",
  timeout_milliseconds = 1000,
}

config.keys = {
  {
    key = "l",
    mods = "SUPER|SHIFT",
    action = wezterm.action.ShowLauncher,
  },
  {
    key = "t",
    mods = "SUPER",
    action = wezterm.action.SpawnCommandInNewTab {
      cwd = wezterm.home_dir,
    },
  },
  {
    key = "p",
    mods = "SUPER|SHIFT",
    action = wezterm.action.ActivateCommandPalette,
  },

  -- splits
  {
    key = "\\",
    mods = "LEADER",
    action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
  },
  {
    key = "-",
    mods = "LEADER",
    action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
  },

  -- pane navigation
  {
    key = "h",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection "Left",
  },
  {
    key = "j",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection "Down",
  },
  {
    key = "k",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection "Up",
  },
  {
    key = "l",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection "Right",
  },

  -- pane resizing
  {
    key = "H",
    mods = "LEADER|SHIFT",
    action = wezterm.action.AdjustPaneSize { "Left", 5 },
  },
  {
    key = "J",
    mods = "LEADER|SHIFT",
    action = wezterm.action.AdjustPaneSize { "Down", 5 },
  },
  {
    key = "K",
    mods = "LEADER|SHIFT",
    action = wezterm.action.AdjustPaneSize { "Up", 5 },
  },
  {
    key = "L",
    mods = "LEADER|SHIFT",
    action = wezterm.action.AdjustPaneSize { "Right", 5 },
  },

  -- pane utilities
  {
    key = "z",
    mods = "LEADER",
    action = wezterm.action.TogglePaneZoomState,
  },
  {
    key = "x",
    mods = "LEADER",
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },
}

config.window_frame = {
  font = wezterm.font("FiraCode Nerd Font"),
  font_size = 16.0,
  active_titlebar_bg = "#1e1e2e",
  inactive_titlebar_bg = "#1e1e2e",
}

config.colors = {
  tab_bar = {
    active_tab = {
      bg_color = "#313244",
      fg_color = "#cdd6f4",
      intensity = "Bold",
    },
    inactive_tab = {
      bg_color = "#1e1e2e",
      fg_color = "#585b70",
    },
    inactive_tab_hover = {
      bg_color = "#232634",
      fg_color = "#cdd6f4",
    },
  },
}

return config