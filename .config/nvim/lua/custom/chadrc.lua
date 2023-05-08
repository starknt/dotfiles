---@type ChadrcConfig
local M = {}
M.ui = {
  theme = 'catppuccin',
  theme_toggle = { 'catppuccin', 'onedark' },
  transparency = true
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
