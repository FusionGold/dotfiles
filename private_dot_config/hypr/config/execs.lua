hl.on("hyprland.start", function()
  local commands = {
    "hyprctl setcursor Bibata-Modern-Classic 24",
  }

  for _, cmd in ipairs(commands) do
    hl.exec_cmd(cmd)
  end
end)
