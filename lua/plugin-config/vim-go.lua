-- https://amikai.github.io/2021/08/16/go_neovim_env_0.5/?utm_source=pocket_saves
local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
	local col = vim.fn.col(".") - 1
	if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
		return true
	else
		return false
	end
end

_G.tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t("<C-n>")
	elseif check_back_space() then
		return t("<Tab>")
	else
		return t("<C-x><C-o>")
	end
end

_G.s_tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t("<C-p>")
	else
		return t("<C-h>")
	end
end

_G.enter_key = function()
	if vim.fn.pumvisible() == 1 then
		return t("<C-y>")
	else
		return t("<CR>")
	end
end

vim.g.go_fmt_autosave = 1
vim.g.go_fmt_command = "gopls"
vim.g.go_gopls_gofumpt = 1
-- vim.g.go_fmt_command = "golines"
-- vim.g.go_fmt_options = {
-- 	golines = "-m 120",
-- }

local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }
map("i", "<tab>", "<C-R>=v:lua.tab_complete()<CR>", opt)
map("i", "<s-tab>", "<C-R>=v:lua.s_tab_complete()<CR>", opt)
map("i", "<enter>", "<C-R>=v:lua.enter_key()<CR>", opt)
map("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
-- map("n", "gr", "vim.lsp.buf.references", opt)
-- map('n', 'gr', '<Plug>(go-referrers)', opt)
