vim.o.background = "dark"
vim.g.tokyonight_style = "storm" -- day / night
-- 半透明
-- vim.g.tokyonight_transparent = true
-- vim.g.tokyonight_transparent_sidebar = true
local colorscheme = "tokyonight"
-- local colorscheme = "OceanicNext"
-- local colorscheme = "gruvbox"
-- zephyr
-- nord
-- onedark
-- nightfox
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme: " .. colorscheme .. " not found.")
	return
end

-- https://www.reddit.com/r/neovim/comments/zodhp1/help_highlights_behave_weird/j0m9clz/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "#112233" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
