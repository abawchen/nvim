local status, null_ls = pcall(require, "null-ls")
if not status then
	vim.notify("null-ls not found")
	return
end

-- https://www.reddit.com/r/neovim/comments/y9qv1w/autoformatting_on_save_with_vimlspbufformat_and/
-- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.black.with({
			extra_args = { "--line-length=120" },
		}),
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.autoflake.with({
			extra_args = { "-i", "--remove-unused-variables", "--remove-all-unused-imports" },
		}),
		null_ls.builtins.formatting.jq,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.sqlformat,
		null_ls.builtins.formatting.golines.with({
			extra_args = { "-m", 120 },
		}),
		null_ls.builtins.formatting.gofumpt,

		-- null_ls.builtins.completion.spell,
		-- null_ls.builtins.diagnostics.flake8,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format()
				end,
			})
		end
	end,
})
