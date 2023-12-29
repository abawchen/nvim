-- https://github.com/kyazdani42/nvim-tree.lua
local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
	vim.notify("nvim-tree not found")
	return
end

-- https://github.com/JMarkin/nvim-tree.lua-float-preview
local function on_attach(bufnr)
	local api = require("nvim-tree.api")
	local FloatPreview = require("float-preview")

	FloatPreview.attach_nvimtree(bufnr)
	local float_close_wrap = FloatPreview.close_wrap

	--- There are keymaps must to wrap for correct work
	-- ...
	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	vim.keymap.set("n", "<CR>", float_close_wrap(api.node.open.edit), opts("Open"))
	vim.keymap.set("n", "<Tab>", float_close_wrap(api.node.open.preview), opts("Open"))
	vim.keymap.set("n", "[", api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set("n", "]", api.tree.change_root_to_node, opts("CD"))
	vim.keymap.set("n", "a", float_close_wrap(api.fs.create), opts("Create"))
	vim.keymap.set("n", "c", float_close_wrap(api.fs.copy.node), opts("Copy"))
	vim.keymap.set("n", "d", float_close_wrap(api.fs.remove), opts("Delete"))
	vim.keymap.set("n", "o", float_close_wrap(api.node.open.edit), opts("Open"))
	vim.keymap.set("n", "O", float_close_wrap(api.node.open.no_window_picker), opts("Open: No Window Picker"))
	vim.keymap.set("n", "os", float_close_wrap(api.node.open.horizontal), opts("Open: Horizontal Split"))
	vim.keymap.set("n", "ot", float_close_wrap(api.node.open.tab), opts("Open: New Tab"))
	vim.keymap.set("n", "ov", float_close_wrap(api.node.open.vertical), opts("Open: Vertical Split"))
	vim.keymap.set("n", "p", float_close_wrap(api.fs.paste), opts("Paste"))
	vim.keymap.set("n", "q", float_close_wrap(api.tree.close), opts("Close"))
	vim.keymap.set("n", "r", float_close_wrap(api.fs.rename), opts("Rename"))
	vim.keymap.set("n", "R", float_close_wrap(api.tree.reload), opts("Refresh"))
	vim.keymap.set("n", "s", float_close_wrap(api.node.run.system), opts("Run System"))
	vim.keymap.set("n", "x", float_close_wrap(api.fs.cut), opts("Cut"))
	vim.keymap.set("n", "y", float_close_wrap(api.fs.copy.filename), opts("Copy Name"))
	vim.keymap.set("n", "cr", float_close_wrap(api.fs.copy.relative_path), opts("Copy Relative Path"))
	vim.keymap.set("n", "ca", float_close_wrap(api.fs.copy.absolute_path), opts("Copy Absolute Path"))
end

nvim_tree.setup({
	disable_netrw = true,
	git = {
		enable = true,
	},
	update_cwd = true,
	filters = {
		dotfiles = false,
		custom = { "node_modules" },
	},
	view = {
		width = 34,
		side = "left",
		number = false,
		relativenumber = false,
		signcolumn = "yes",
		-- float = {
		--   enable = true,
		-- }
	},
	renderer = {
		group_empty = true,
		highlight_git = true,
		highlight_opened_files = "all",
	},
	update_focused_file = {
		enable = true,
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
	},
	actions = {
		open_file = {
			resize_window = true,
			quit_on_open = false,
		},
		change_dir = {
			enable = false,
		},
	},
	on_attach = on_attach,
})
