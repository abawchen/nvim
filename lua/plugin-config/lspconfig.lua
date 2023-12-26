local lspconfig = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.gopls.setup({
	capabilities = lsp_capabilities,
	-- https://stackoverflow.com/a/73289654
	-- on_attach = require("cmp").on_attach,
	settings = {
		gopls = {
			buildFlags = { "-tags=ems bsc cht rakuten taipower wireinject" },
		},
	},
})
lspconfig.pyright.setup({
	capabilities = lsp_capabilities,
})
lspconfig.jdtls.setup({
	capabilities = lsp_capabilities,
})
