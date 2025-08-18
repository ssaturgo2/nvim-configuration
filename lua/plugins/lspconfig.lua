return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
                library = {
                    -- See the configuration section for more details
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
        config = function()
            require("lspconfig").lua_ls.setup{}
            require("lspconfig").ts_ls.setup{}
            require("lspconfig").html.setup{}

            -- Control LSP support by filetype
            vim.lsp.enable({
              'javascript',
              'html',
              'lua',
            })

            -- LSP-based completion support
            vim.api.nvim_create_autocmd('LspAttach', {
              callback = function(ev)
                local client = vim.lsp.get_client_by_id(ev.data.client_id)
                if client:supports_method('textDocument/completion') then
                  vim.lsp.completion.enable(
                      true,
                      client.id,
                      ev.buf, { autotrigger = false })
                end
              end
            })

            vim.lsp.set_log_level("WARN")
            vim.diagnostic.config({
              virtual_text = {
                prefix = "",
                enabled = true,
                severity = { min = vim.diagnostic.severity.HINT },
              },
              virtual_lines = {
                current_line = true,
              },
              signs = {
                text = {
                  [vim.diagnostic.severity.ERROR] = '',
                  [vim.diagnostic.severity.WARN] = '',
                  [vim.diagnostic.severity.INFO] = '',
                  [vim.diagnostic.severity.HINT] = '',
                },
                linehl = {
                  [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
                },
                numhl = {
                  [vim.diagnostic.severity.WARN] = 'WarningMsg',
                },
              },
            })
        end,
    },
}
