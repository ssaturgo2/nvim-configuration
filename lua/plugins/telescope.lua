return {
  'nvim-lua/plenary.nvim', -- Dependency
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8', -- Or latest stable tag
    config = function()
      require('telescope').setup({
        -- Minimal setup for default behavior
      })

      -- Keybindings
	vim.keymap.set('n', '<leader>pf', '<cmd>Telescope find_files<cr>', { desc = 'Find Files' })
	vim.keymap.set('n', '<C-p>', '<cmd>Telescope git_files<cr>', { desc = 'Git Files' })
	vim.keymap.set('n', '<leader>ps', function()
		require('telescope.builtin').grep_string({ search = vim.fn.input("Grep: ") });
		end, { desc = 'Grep String' })
    end,
  },
}
