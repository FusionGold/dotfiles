hl.config({
  input = {
    kb_layout = "us",
    kb_options = "ctrl:nocaps,ctrl:menu_rctrl",
    repeat_delay = 500,

    touchpad = {
      natural_scroll = true,
      disable_while_typing = true,
      clickfinger_behavior = true,
      scroll_factor = 0.8,
    },
    special_fallthrough = true,
    follow_mouse = 1,
  },

  binds = {
    scroll_event_delay = 100,
    movefocus_cycles_fullscreen = true,
    hide_special_on_workspace_change = true,
  },

  general = {
    -- gaps and borders
    gaps_in = 4,
    gaps_out = 6,
    border_size = 4,

    -- colors
    col = {
      active_border = { colors = { "rgba(87ceebff)", "rgba(4a90e2ff)" }, angle = 45 },
      inactive_border = "rgba(50626aff)",
    },

    -- don't wrap focus
    no_focus_fallback = true,
    -- layout style: [dwindle/master/scrolling]
    layout = "dwindle",
    -- allow tearing with the immediate window rule
    allow_tearing = true,
  },

  dwindle = {
    preserve_split = true,
    smart_split = false,
    smart_resizing = false,
    force_split = 2,
  },

  decoration = {
    rounding = 12,

    blur = {
      enabled = true,
      size = 14,
      passes = 4,
      brightness = 1,
      noise = 0.01,
      contrast = 0.8916,
      popups = true,
      popups_ignorealpha = 0.6,
      xray = true,
      new_optimizations = true,
    },

    shadow = {
      enabled = true,
      range = 20,
      offset = {0, 2},
      render_power = 4,
      color = "rgba(0000002A)",
    },

    -- Dim
    dim_inactive = false,
    dim_strength = 0.1,
    dim_special = 0,
  },

  cursor = {
    -- if don't want mouse warp behaviour
    -- no_warps = true,
    -- move the cursor to the last focused window after changing the workspace
    warp_on_change_workspace = 1,
    warp_on_toggle_special = 1,
    no_hardware_cursors = 0,
  },

  misc = {
    vrr = 2,
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    focus_on_activate = true,
    on_focus_under_fullscreen = 1,
    enable_swallow = true,
    swallow_regex = "(foot|kitty|alacritty|Alacritty)",
  },
})
