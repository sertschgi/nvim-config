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


-- spacing
-- show an empty winbar for all normal windows
vim.api.nvim_create_autocmd({ 'WinEnter', 'BufWinEnter', 'VimResized' }, {
  callback = function()
    if vim.bo.buftype == '' then
      vim.o.winbar = ' ' -- a single space renders the line
    end
  end,
})



