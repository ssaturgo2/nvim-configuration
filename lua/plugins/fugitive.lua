return {
	"tpope/vim-fugitive",

	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
		vim.keymap.set("n", "<leader>gc", "<cmd>Git commit<cr>");
		vim.keymap.set("n", "<leader>gP", "<cmd>Git push<cr>");
	end
}
