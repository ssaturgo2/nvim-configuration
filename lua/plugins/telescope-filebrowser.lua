return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function ()
	    local fb_actions = require("telescope").extensions.file_browser.actions
	    require("telescope").setup {
		    extensions = {
			    file_browser = {
				    theme = "ivy",
				    initial_mode = "normal",
				    -- disables netrw and use telescope-file-browser in its place
				    hijack_netrw = true,
			    },
		    },
		    mappings = {
		     ['i'] = {
		      ["<C-h>"] = fb_actions.goto_home_dir, 
		     }
		    }
	    }
	    -- To get telescope-file-browser loaded and working with telescope,
	    -- you need to call load_extension, somewhere after setup function:
	    require("telescope").load_extension "file_browser"
    end,

    vim.keymap.set("n", "<space>pv", ":Telescope file_browser<CR>")
}
