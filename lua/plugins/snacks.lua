return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        explorer = { enabled = true, replace_netrw = true},
        indent = { enabled = true },
        -- input = { enabled = true },
        -- notifier = { enabled = true },
        quickfile = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        terminal = {enabled = true},
    },
    keys = {
        {"<leader>t", function () Snacks.picker.explorer() end},
    }
}
