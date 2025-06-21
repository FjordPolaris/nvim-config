-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "nord",
}

M.base46 = {
	theme = "nord",

  --[[
	hl_override = {
	  Comment = { fg = "#5c6370", italic = true },
    String = { fg = "#98c379" },
    Function = { fg = "#61afef", bold = true },
    Identifier = { fg = "#e06c75" },

    -- Treesitter groups
    ["@keyword"] = { fg = "#c678dd", italic = true },
    ["@function"] = { fg = "#61afef" },
    ["@variable"] = { fg = "#e5c07b" },
    ["@comment"] = { italic = true },
    ["@string"] = { fg = "#98c379" },
	},
  ]]
}

M.plugins = "plugins"

M.lsp = {
  setup_lspconf = "configs.lspconfig",
}

vim.api.nvim_create_user_command("RunCF", function()
  local ft = vim.bo.filetype
  local filename = vim.fn.expand("%")
  local file_root = vim.fn.expand("%:r") -- filename without extension
  local cmd_map = {
    python = "python3 " .. filename,
    lua = "lua " .. filename,
    c = "gcc " .. filename .. " -o " .. file_root .. " && ./" .. file_root,
    cpp = "g++ " .. filename .. " -o " .. file_root .. " && ./" .. file_root,
  }

  local cmd = cmd_map[ft]
  if cmd then
    vim.cmd("w")  -- save file
    vim.cmd("split | terminal " .. cmd)
  else
    print("No run command configured for filetype: " .. ft)
  end
end, {})

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

return M
