local nvim_lsp = require("lspconfig")
return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    setup = {
      eslint = function()
        return
      end,
    },
    servers = {
      vtsls = {
        root_dir = nvim_lsp.util.root_pattern(".git"),
      },
    },
  },
}
