local nvim_lsp = require"lspconfig"
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

nvim_lsp.tsserver.setup { 
    capabilities = capabilities,
    on_attach=on_attach, 
}

nvim_lsp.clangd.setup { on_attach=on_attach }

nvim_lsp.gopls.setup { 
    on_attach=on_attach, 
    capabilities = capabilities,
    cmd = { "gopls" },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}

nvim_lsp['tsserver'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

nvim_lsp['rust_analyzer'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importMergeBehavior = "last",
                importPrefix = "by_self",
            },
            diagnostics = {
                disabled = { "unresolved-import" }
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
            checkOnSave = {
                command = "clippy"
            },
        }
    }
}
