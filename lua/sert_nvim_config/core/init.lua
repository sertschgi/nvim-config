require("sert_nvim_config.core.options")
require("sert_nvim_config.core.lsp")
require("sert_nvim_config.core.keymaps")


-- for this to work there has to be added the following to kitty.conf:
-- --------------------------
-- > allow_remote_control yes
-- > listen_on unix:/tmp/kitty

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  callback = function()
    vim.fn.jobstart(
      { "kitty", "@", "--to", "unix:/tmp/kitty-" .. vim.env.KITTY_PID, "set-spacing", "padding=0", "margin=0" },
      { detach = true })
  end,
})

vim.api.nvim_create_autocmd({ "ExitPre" }, {
  callback = function()
    vim.fn.jobstart({ "kitty", "@", "--to", "unix:/tmp/kitty-" .. vim.env.KITTY_PID, "set-spacing", "padding=default",
      "margin=default" }, { detach = true })
  end,
})
