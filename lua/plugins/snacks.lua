return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        picker = { enabled = true },
        explorer = { enabled = true, replace_netrw = true},
        indent = { enabled = true },
        -- input = { enabled = true },
        -- notifier = { enabled = true },
        quickfile = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
    },

    -- file explorer
    vim.keymap.set('n', "<leader>pv", function()Snacks.picker.explorer() end),
    -- file / grep search
    vim.keymap.set('n','<leader>ps',function()Snacks.picker.pick('grep')end),
    vim.keymap.set('n','<leader>pf',function()Snacks.picker.pick('files')end),
    -- line search
    vim.keymap.set('n','<leader>l',function()Snacks.picker.pick('lines')end),
    -- help and man pages
    vim.keymap.set('n','<C-h>',function()Snacks.picker.pick('help')end),
    vim.keymap.set('n','<leader><Cr>',function()Snacks.picker.pick('man')end),
}
