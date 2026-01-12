return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        automatic_enable = true,
        ensure_installed = { "lua_ls" },
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    config = function(_, opts)
        require("mason-lspconfig").setup(opts)

        local keymap = require("core.keymaps")

        keymap.normalNR("<leader>pm", ":Mason<CR>", "Mason")

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                -- Code action
                keymap.normalNR("<leader>la", vim.lsp.buf.code_action, "Code action (LSP)")

                -- Source action
                keymap.normalNR("<leader>lA", function()
                    vim.lsp.buf.code_action({
                        context = { only = { "source" } },
                        apply = false,
                    })
                end, "Source action (LSP)")

                -- Diagnostics
                keymap.normalNR("<leader>[d", function()
                    vim.diagnostic.jump({ count = -1, float = true })
                end, "Diagnostic (Prev)")

                keymap.normalNR("<leader>]d", function()
                    vim.diagnostic.jump({ count = 1, float = true })
                end, "Diagnostic (Next)")

                -- Format
                keymap.normalNR("<leader>lf", function()
                    vim.lsp.buf.format()
                end, "Format buffer (LSP)")

                -- Rename
                keymap.normalNR("<leader>lr", function()
                    vim.lsp.buf.rename()
                end, "Rename symbol (LSP)")

                -- Hover (renamed to avoid conflict with Rename)
                keymap.normalNR("<leader>lh", function()
                    vim.lsp.buf.hover()
                end, "Hover (LSP)")

                -- Signatures
                keymap.normalNR("<leader>ls", function()
                    vim.lsp.buf.signature_help()
                end, "Signatures (LSP)")

                -- Go to Definitions
                keymap.normalNR("<leader>lgd", function()
                    vim.lsp.buf.definition()
                end, "Go to Definitions (LSP)")

                -- Go to References
                keymap.normalNR("<leader>lgr", function()
                    vim.lsp.buf.references()
                end, "Go to References (LSP)")

                -- Go to Declarations
                keymap.normalNR("<leader>lgD", function()
                    vim.lsp.buf.declaration()
                end, "Go to Declaration (LSP)")

                -- Go to Implementation
                keymap.normalNR("<leader>lgi", function()
                    vim.lsp.buf.implementation()
                end, "Go to Implementation (LSP)")

                -- Types
                keymap.normalNR("<leader>lt", function()
                    vim.lsp.buf.type_definition()
                end, "Type Definition (LSP)")

                local wk = require("which-key")

                wk.add({ { "<leader>l", group = "Language Tools", icon = " " } })
            end,
        })
    end,
}
