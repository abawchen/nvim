-- https://amikai.github.io/2021/08/16/go_neovim_env_0.5/?utm_source=pocket_saves
diagnostic_config = {
	-- Enable underline, use default values
	underline = true,
	-- Enable virtual text, override spacing to 2
	virtual_text = {
		spacing = 2,
		prefix = "<",
	},
	-- Use a function to dynamically turn signs off
	-- and on, using buffer local variables
	signs = function(bufnr, client_id)
		local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, "show_signs")
		-- No buffer local variable set, so just enable by default
		if not ok then
			return true
		end

		return result
	end,
	-- Disable a feature
	update_in_insert = false,
}

vim.lsp.handlers["textDocument/publishDiagnostics"] =
	vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, diagnostic_config)
vim.api.nvim_set_keymap("n", "dp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "dn", "<cmd>lua vim.diagnostic.goto_next()<CR>", { silent = true, noremap = true })

-- local lspconfig = require("lspconfig")
-- local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
--
-- lspconfig.gopls.setup({
-- 	capabilities = lsp_capabilities,
-- 	-- https://stackoverflow.com/a/73289654
-- 	-- on_attach = require("cmp").on_attach,
-- 	settings = {
-- 		gopls = {
-- 			buildFlags = { "-tags=ems bsc cht rakuten taipower wireinject" },
-- 		},
-- 	},
-- })
-- lspconfig.pyright.setup({
-- 	capabilities = lsp_capabilities,
-- })
-- lspconfig.jdtls.setup({
-- 	capabilities = lsp_capabilities,
-- })
