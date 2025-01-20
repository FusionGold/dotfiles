local M = {}

---@param fn fun()
function M.on_very_lazy(fn)
  vim.api.nvim_create_autocmd("User", {
    group = vim.api.nvim_create_augroup("Lazy", { clear = true }),
    pattern = "VeryLazy",
    callback = function()
      fn()
    end,
  })
end

---@param modules string[]
--modules like "autocmds" | "options" | "keymaps"
M.lazy_load = function(modules)
  -- when no file is opened at startup
  if vim.fn.argc(-1) == 0 then
    -- autocmds and keymaps can wait to load
    -- always load lazyvim, then user file
    M.on_very_lazy(function()
      for i = 1, #modules do
        require(modules[i])
      end
    end)
  else
    -- load them now so they affect the opened buffers
    for i = 1, #modules do
      require(modules[i])
    end
  end
end

M.lookup = function()
  local path = vim.api.nvim_buf_get_name(0)
  local cwd = vim.loop.cwd()

  -- try to jump upwards while staying under cwd
  for _ = 1, 3 do
    -- get parent dir or '/' itself
    local parent = vim.fs.dirname(path)
    if parent:find(cwd, 1, true) == 1 then
      path = parent
    end
  end

  return path
end

return M
