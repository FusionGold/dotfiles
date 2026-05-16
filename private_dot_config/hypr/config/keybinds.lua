local mainMod = "SUPER"
local terminal = "ghostty"
local launcher = "fuzzel"
local workspaces = 10

-- Applications
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(launcher))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"))
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.exec_cmd("dialect -d zh_Hans -n"))

-- Window
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.kill())
for i = 1, 4 do
  local vimKeys = { "H", "J", "K", "L" }
  local arrowKeys = { "Left", "Down", "Up", "Right" }
  local dirs = { "l", "d", "u", "r" }
  hl.bind(mainMod .. " + " .. vimKeys[i], hl.dsp.focus({ direction = dirs[i] }))
  hl.bind(mainMod .. " + " .. arrowKeys[i], hl.dsp.focus({ direction = dirs[i] }))
  hl.bind(mainMod .. " + SHIFT + " .. vimKeys[i], hl.dsp.window.move({ direction = dirs[i] }))
  hl.bind(mainMod .. " + SHIFT + " .. arrowKeys[i], hl.dsp.window.move({ direction = dirs[i] }))
end
-- Toggle between tiling and floating mode
hl.bind(mainMod .. " + SHIFT + Space", hl.dsp.window.float({ action = "toggle" }))
-- Swap focus between the tiling area and the floating area
hl.bind(mainMod .. " + Space", function()
  local win = hl.get_active_window()
  if win and win.floating then
    hl.dispatch(hl.dsp.focus({ window = "tiled" }))
  else
    hl.dispatch(hl.dsp.focus({ window = "floating" }))
  end
end)
-- Toggle fullscreen
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
-- Toggle split direction (dwindle)
hl.bind(mainMod .. " + T", hl.dsp.layout("togglesplit"))
-- Swap window with root node (dwindle)
hl.bind(mainMod .. " + Slash", hl.dsp.layout("movetoroot active unstable"))
-- Make a useful floating window
hl.bind(mainMod .. " + U", function ()
  hl.dispatch(hl.dsp.window.float({ action = "on" }))
  hl.dispatch(hl.dsp.window.resize({ x = 600, y = 400, relative = false }))
  hl.dispatch(hl.dsp.window.move({ direction = "r" }))
  hl.dispatch(hl.dsp.window.move({ direction = "u" }))
end)
-- Toggle pin status
hl.bind(mainMod .. " + P", hl.dsp.window.pin())

-- Resize
hl.bind(mainMod .. " + Minus", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + Equal", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + Minus", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + Equal", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Workspace
for i = 1, workspaces do
  local key = i % 10
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = true }))
end
-- Relative workspaces
hl.bind(mainMod .. " + BracketLeft", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + BracketRight", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + BracketLeft", hl.dsp.window.move({ workspace = "e-1", follow = true }))
hl.bind(mainMod .. " + SHIFT + BracketRight", hl.dsp.window.move({ workspace = "e+1", follow = true }))
-- Move to special workspace
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic", follow = true }))
-- Toggle special workspace
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
-- Cycle workspaces with mouse scroll
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e-1" }))

-- Session
hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd("loginctl lock-session"))
hl.bind(mainMod .. " + M", hl.dsp.dpms({ action = "toggle" }))

-- Function keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true, repeating = true })
hl.bind("Print", hl.dsp.exec_cmd("hyprpicker -r -z & sleep 0.2; slurp | grim -g - ~/Pictures/screenshots/$(date '+%F_%H-%M-%S').png; killall hyprpicker"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("grim ~/Pictures/screenshots/$(date '+%F_%H-%M-%S').png"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("hyprpicker -r -z & sleep 0.2; slurp | grim -g - - | wl-copy; killall hyprpicker"))
hl.bind("CTRL + Print", hl.dsp.exec_cmd([[
hyprpicker -r -z & sleep 0.2
slurp | (grim -g - -; killall hyprpicker) | swayimg -e '
  swayimg.text.hide()
  local function resize()
    local i = swayimg.viewer.get_image()
    if i then
      swayimg.set_window_size(i.width, i.height)
    end
  end
  swayimg.viewer.on_image_change(resize)
  swayimg.viewer.set_default_scale("real")
' -
]]))
hl.bind("ALT + Print", hl.dsp.exec_cmd("hyprpicker -r -z & sleep 0.2; slurp | (grim -g - -; killall hyprpicker) | swappy -f -"))
