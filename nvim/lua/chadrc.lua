-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "nord",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },

	vim.api.nvim_create_user_command("RunCF", function()
  local ft = vim.bo.filetype
  local filename = vim.fn.expand("%")

  local cmd = {
    python = "python3 " .. filename,
    lua = "lua " .. filename,
    c = "gcc " .. filename .. " -o " .. vim.fn.expand("%:r") .. " && ./" .. vim.fn.expand("%:r"),
    cpp = "g++ " .. filename .. " -o " .. vim.fn.expand("%:r") .. " && ./" .. vim.fn.expand("%:r"),
  }

  if cmd[ft] then
    vim.cmd("split | terminal " .. cmd[ft])
  else
    print("Unsupported filetype: " .. ft)
  end
end, {})

}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

return M
