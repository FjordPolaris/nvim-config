vim.api.nvim_create_user_command("RunCF", function()
  local ft = vim.bo.filetype
  local cmd_map = {
    python = "python3",
    lua = "lua",
    cpp = "g++ % -o %:r && ./%:r",
    c = "gcc % -o %:r && ./%:r",
    javascript = "node",
    sh = "bash",
  }

  local cmd = cmd_map[ft]
  if cmd then
    vim.cmd("w")  -- Save current file
    vim.cmd("split | terminal " .. cmd:gsub("%%", vim.fn.expand("%")):gsub("%%:r", vim.fn.expand("%:r")))
  else
    print("No run command configured for filetype: " .. ft)
  end
end, {})
