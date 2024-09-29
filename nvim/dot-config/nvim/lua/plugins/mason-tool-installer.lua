return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      "lua_ls",
      "stylua",
      "pyright",
      "black",
      "bashls",
      "beautysh",
      "ts_ls",
      "prettier",
    } -- don't forget to add linters, formatters, etc to lsp/none-ls.lua as well
  }
}