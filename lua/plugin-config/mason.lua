-- https://www.reddit.com/r/neovim/comments/13sdxep/how_to_setup_formatter_for_python/
-- https://github.com/jay-babu/mason-null-ls.nvim#default-configuration
-- https://vi.stackexchange.com/questions/37397/how-to-configure-neovim-to-properly-format-python-code
local status, mason = pcall(require, "mason")
if not status then
	vim.notify("mason not found")
	return
end

mason.setup({
	ensure_installed = {
		"pyright",
		"gopls",
		"jdtls",
		"lua-language-server",
	},
})

local status, mason_null_ls = pcall(require, "mason-null-ls")
if not status then
	vim.notify("mason-null-ls not found")
	return
end

mason_null_ls.setup({
	ensure_installed = {
		"jq",
		"stylua",
		-- "goimports",
		-- "gomodifytags",
		-- python
		-- "autoflake",
		-- "black",
		-- "isort",
	},
})
