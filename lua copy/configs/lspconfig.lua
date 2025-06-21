require("nvchad.configs.lspconfig").defaults()

local default_config = require("nvchad.configs.lspconfig")

local on_attach = default_config.on_attach
local capabilities = default_config.capabilities

-- list of manually enabled servers (html, cssls, pyright, etc.)
local lspconfig = require("lspconfig")

-- Setup pyright with custom settings
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "standard",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
})

local servers = { "html", "cssls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
