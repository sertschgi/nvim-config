return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  opts = {
    focus = true,
  },
  cmd = "Trouble",
  keys = {
    { "<leader>ldw", "<cmd>Trouble diagnostics toggle<CR>",              desc = "Open trouble workspace diagnostics" },
    { "<leader>ldd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Open trouble document diagnostics" },
    { "<leader>ldq", "<cmd>Trouble quickfix toggle<CR>",                 desc = "Open trouble quickfix list" },
    { "<leader>ldl", "<cmd>Trouble loclist toggle<CR>",                  desc = "Open trouble location list" },
    { "<leader>ldt", "<cmd>Trouble todo toggle<CR>",                     desc = "Open todos in trouble" },
  },
}
