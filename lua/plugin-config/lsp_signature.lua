-- https://github.com/ray-x/lsp_signature.nvim?tab=readme-ov-file#full-configuration-with-default-values
require("lspconfig").gopls.setup({})
require("lsp_signature").setup({
	bind = true, -- This is mandatory, otherwise border config won't get registered.
	handler_opts = {
		border = "rounded",
	},
})
