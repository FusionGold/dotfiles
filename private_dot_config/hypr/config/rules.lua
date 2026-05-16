hl.window_rule({
  name = "Disable blur for all windows",
  match = { class = ".*" },
  no_blur = true,
})

hl.window_rule({
  name = "Disable shadow for floating windows",
  match = { float = true },
  no_shadow = true,
})

hl.window_rule({
  name = "Set distinct border color for maximized windows",
  match = { fullscreen = true },
  border_color = "rgba(6495edff)",
})

-- Application rules
hl.window_rule({
  match = { class = "^(fcitx\\0fcit)$" },
  rounding = 0,
})

hl.window_rule({
  match = { class = "^(swayimg)$" },
  float = true,
})

hl.window_rule({
  match = { class = "^(app.drey.Dialect)$" },
  float = true,
  center = true,
  size = {"(monitor_w*.50)", "(monitor_h*.75)"},
})

hl.window_rule({
  match = { class = "^(xdg-desktop-portal-gtk)$" },
  float = true,
})

hl.window_rule({
  name = "Telegram media viewer",
  match = { title = "^(媒体查看器)$" },
  float = true,
  maximize = true,
})

hl.window_rule({
  match = { class = "^(wechat)$" },
  float = true,
})

hl.window_rule({
  match = { class = "^(wechat)$", title = "^(微信)$" },
  tile = true,
})

hl.window_rule({
  match = { class = "^(firefox)$" },
  float = true,
})

hl.window_rule({
  match = { class = "^(firefox)$", title = "^(.*( - )?Mozilla Firefox( 隐私浏览)?)$" },
  tile = true,
})

hl.window_rule({
  match = { class = "^(virt-manager)$", title = "^(.* - QEMU/KVM)$" },
  maximize = true,
})

hl.window_rule({
  match = { title = "^(([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)|画中画)(.*)$" },
  keep_aspect_ratio = true,
  no_initial_focus = true,
  size = {"(monitor_w*.25)", "(monitor_h*.25)"},
  move = {"(monitor_w*.73)", "(monitor_h*.72)"},
  float = true,
  pin = true,
})

hl.window_rule({
  match = { class = "^([Gg]ame)$" },
  immediate = true,
})

hl.window_rule({
  match = { class = "^(steam_app.*)$" },
  immediate = true,
})

-- Layer rules
hl.layer_rule({
  match = { namespace = "^(.*)$" },
  xray = true
})

hl.layer_rule({
  match = { namespace = "^(selection)$" },
  no_anim = true,
})

hl.layer_rule({
  match = { namespace = "^(hyprpicker)$" },
  no_anim = true,
})
