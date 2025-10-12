return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "rust_analyzer",
        "html",
        "cssls",
        "lua_ls",
        "sqlls",
        "kotlin_language_server",
        "ltex_plus",
        "arduino_language_server",
        "clangd",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "rustfmt",
        "luacheck",
        "ktlint",
        "eslint_d",
        "stylelint",
        "pylint",
        "tree-sitter-cli",
        "bibtex-tidy",
        "clang-format",
      },
    })
  end,
}
