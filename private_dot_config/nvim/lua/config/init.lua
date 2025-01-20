-- Load editor options
require("config.options")

local utils = require("config.utils")
-- Load autocmds and keymaps
utils.lazy_load({ "config.autocmds", "config.keymaps" })
