return {
  "niuiic/divider.nvim",
  config = function()
    vim.api.nvim_set_hl(0, "Divider1", { fg = "#ff00ff" })
    vim.api.nvim_set_hl(0, "Divider2", { fg = "#00a0ff" })
    vim.api.nvim_set_hl(0, "Divider3", { fg = "#00ff7c" })

    require("divider").setup({
      is_enabled = function(bufnr)
        local ok, value = pcall(vim.api.nvim_buf_get_var, bufnr, "divider")
        return not ok or value ~= "disabled"
      end,
      dividers = {
        {
          pattern = [[ %% (.+) %%]],
          level = 1,
          hl_group = "LineNr",
          mark_char = "-",
          mark_pos = "bottom",
          is_visible_in_outline = true,
          is_enabled = function()
            return true
          end,
        },
        {
          pattern = [[ %%%% (.+) %%%%]],
          level = 2,
          hl_group = "CursorLineNr",
          mark_char = "-",
          mark_pos = "bottom",
          is_visible_in_outline = true,
          is_enabled = function()
            return true
          end,
        },
        {
          pattern = [[ %%%%%% (.+) %%%%%%]],
          level = 3,
          hl_group = "ModeMsg",
          mark_char = "-",
          mark_pos = "bottom",
          is_visible_in_outline = true,
          is_enabled = function()
            return true
          end,
        },
      },
      outline = {
        win_pos = "left",
        win_size = 30,
        enter_window = false,
        hl_group = "CursorLine",
        close_after_navigate = false,
        preview_win_width = preview_win_width,
        preview_win_height = preview_win_height,
        preview_on_hover = true,
        keymap_navigate = "<cr>",
        keymap_preview = "p",
        keymap_close = "q",
      },
    })
  end,
  keys = {
    {
      "<C-/>",
      function()
        require("divider").toggle_outline()
      end,
      desc = "toggle divider outline",
    },
  },
  lazy = false,
}
