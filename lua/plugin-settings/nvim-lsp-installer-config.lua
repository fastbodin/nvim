require("nvim-lsp-installer").setup {
    -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    automatic_installation = true,
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require("lspconfig")

lspconfig.sumneko_lua.setup {capabilities = capabilities}

lspconfig.clangd.setup {capabilities = capabilities}

lspconfig.jdtls.setup {capabilities = capabilities}

lspconfig.pylsp.setup {
    capabilities = capabilities,
    settings = {
        pylsp = {
            configurationSources = { "flake8" },
            plugins = {
                flake8 = { enabled = true },
                black = { enabled = true, preview = true },
                mccabe = { enabled = true },
                pylsp_mypy = {
                    enabled = true,
                    live_mode = false,
                    -- dmypy = true,
                },

                yapf = { enabled = false },
                pycodestyle = { enabled = false },
                pyflakes = { enabled = false },
            }
        }
    }
}

lspconfig.texlab.setup {
    capabilities = capabilities,
}

lspconfig.ltex.setup {
    -- set language
    capabilities = capabilities,
    settings = {
        ltex = {
            language = "en-CA",
            dictionary = { ['en-CA'] = {hypergraph, supermartingale, submartingale, Slobodin, Gurobi}},
        }
    }
}







-- local lsp_installer = require("nvim-lsp-installer")
-- local vim = vim
-- 
-- lsp_installer.on_server_ready(function(server)
--     local opts = {}
--     -- make cmp aware of the language server.
--     opts.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
--     -- ltex lsp custom settings
--     if server.name == "ltex" then
--         opts.settings = {
--             ltex = {
--                 -- set the language
--                 language = "en-CA",
--                 -- add works to the dictionary here
--                 dictionary = { ['en-CA'] = {hypergraph, supermartingale, submartingale} },
--             }
--         }
--         server:setup(opts)
--    end
--   -- This setup() function is exactly the same as lspconfig's setup function.
--   -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
--   server:setup(opts)
-- end)
-- 
