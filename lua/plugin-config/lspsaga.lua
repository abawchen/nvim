local status, lspsaga = pcall(require, "lspsaga")
if not status then
	vim.notify("lspsaga not found.")
	return
end

-- https://github.com/nvimdev/lspsaga.nvim/blob/e71cddc9d4c1dd97c026814777b810df988daed2/lua/lspsaga/init.lua
-- https://github.com/nvimdev/lspsaga.nvim/issues/458
lspsaga.setup({
	ui = {
		border = "rounded",
		devicon = true,
		foldericon = true,
		title = true,
		expand = "⊞",
		collapse = "⊟",
		code_action = "💡",
		actionfix = " ",
		lines = { "┗", "┣", "┃", "━", "┏" },
		kind = nil,
		imp_sign = "󰳛 ",
	},
	symbol_in_winbar = {
		folder_level = 10,
	},
	finder = {
		layout = "normal",
		keys = {
			toggle_or_open = "<CR>",
			quit = "<ESC>",
		},
	},
	-- need to close or finder will not work
	outline = {
		close_after_jump = true,
		keys = {
			toggle_or_jump = "<CR>",
			quit = "<ESC>",
			jump = "e",
		},
	},
})
