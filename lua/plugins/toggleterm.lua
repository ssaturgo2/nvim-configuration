return {
    'akinsho/toggleterm.nvim', version = "*",
    opts = {
    },
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]]),
      vim.keymap.set('t', '<C-`>', "<cmd>ToggleTerm<Cr>"),
      vim.keymap.set('n', '<C-`>', "<cmd>ToggleTerm<Cr>"),
}
