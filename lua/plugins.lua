local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local paccker_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
	vim.notify("Installing pakcer.nvim...")
	paccker_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		-- "https://gitcode.net/mirrors/wbthomason/packer.nvim",
		install_path,
	})

	-- https://github.com/wbthomason/packer.nvim/issues/750
	local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
	if not string.find(vim.o.runtimepath, rtp_addition) then
		vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
	end
	vim.notify("pakcer.nvim installed")
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify("packer.nvim not found")
	return
end

packer.startup({
	function(use)
		-- Packer can upgrade itself
		use("wbthomason/packer.nvim")
		-- nvim-tree
		use({
			"nvim-tree/nvim-tree.lua",
			requires = { "nvim-tree/nvim-web-devicons" },
		})
		-- float-preview
		use("JMarkin/nvim-tree.lua-float-preview")
		-- lualine
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "nvim-tree/nvim-web-devicons" },
		})
		-- trouble
		use({
			"folke/trouble.nvim",
			requires = { "nvim-tree/nvim-web-devicons" },
		})
		-- bufferline
		use({
			"akinsho/bufferline.nvim",
			requires = { "nvim-tree/nvim-web-devicons", "moll/vim-bbye" },
		})
		-- telescope
		use({
			"nvim-telescope/telescope.nvim",
			requires = { "nvim-lua/plenary.nvim" },
		})
		-- telescope extensions
		use("LinArcX/telescope-env.nvim")
		use("nvim-telescope/telescope-ui-select.nvim")
		-- treesitter
		use("nvim-treesitter/nvim-treesitter")
		-- dap
		use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } })
		use({
			-- https://github.com/theHamsta/nvim-dap-virtual-text
			"theHamsta/nvim-dap-virtual-text",
			config = function()
				require("nvim-dap-virtual-text").setup()
			end,
		})
		-- d2
		use("terrastruct/d2-vim")
		-- Comment
		use("numToStr/Comment.nvim")
		-- nvim-autopairs
		use("windwp/nvim-autopairs")
		-- ray-x/go https://github.com/ray-x/go.nvim
		-- use({
		-- 	"ray-x/go.nvim",
		-- 	config = function()
		-- 		require("go").setup({
		-- 			verbose = true,
		-- 			lsp_cfg = true,
		-- 		})
		-- 	end,
		-- })
		-- use("ray-x/guihua.lua")
		use({
			"fatih/vim-go",
			run = ":GoUpdateBinaries",
			ft = "go",
			setup = function()
				-- Read the following section and add what you need
			end,
		})
		-- 'simondrake/gomodifytags',
		use("simondrake/gomodifytags")
		-- multicusor
		use("mg979/vim-visual-multi")
		-- icon-picker
		use("stevearc/dressing.nvim")
		use({
			"ziontee113/icon-picker.nvim",
			config = function()
				require("icon-picker").setup({
					disable_legacy_commands = true,
				})
			end,
		})
		-- markdown-preview: https://github.com/iamcco/markdown-preview.nvim
		use({
			"iamcco/markdown-preview.nvim",
			run = function()
				vim.fn["mkdp#util#install"]()
			end,
		})
		use({
			"iamcco/markdown-preview.nvim",
			run = "cd app && npm install",
			setup = function()
				vim.g.mkdp_filetypes = {
					"markdown",
				}
			end,
			ft = { "markdown" },
		})
		----------------- colorscheme ----------------
		use("folke/tokyonight.nvim")
		use("mhartington/oceanic-next")
		use({
			"ellisonleao/gruvbox.nvim",
			requires = { "rktjmp/lush.nvim" },
		})
		-- use("glepnir/zephyr-nvim")
		-- use("shaunsingh/nord.nvim")
		-- use("ful1e5/onedark.nvim")
		-- use("EdenEast/nightfox.nvim")
		--------------------- LSP --------------------
		use("hrsh7th/cmp-nvim-lsp")
		use("neovim/nvim-lspconfig")
		use("mfussenegger/nvim-jdtls")
		use("ray-x/lsp_signature.nvim")
		use("hrsh7th/nvim-cmp")
		use("hrsh7th/cmp-vsnip")
		use("hrsh7th/vim-vsnip")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-path")
		use("hrsh7th/cmp-cmdline")
		use("vim-scripts/dbext.vim")
		--
		-- use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }
		use("rafamadriz/friendly-snippets")
		-- ui
		use("onsails/lspkind-nvim")
		-- use("kkharji/lspsaga.nvim")
		use("nvimdev/lspsaga.nvim")
		-- formatter
		use("mhartington/formatter.nvim")
		use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
		use("williamboman/mason.nvim")
		use({
			"jay-babu/mason-null-ls.nvim",
			requires = {
				"williamboman/mason.nvim",
				"jose-elias-alvarez/null-ls.nvim",
			},
		})
		-- TypeScript
		use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" })
		-- Lua
		use("folke/lua-dev.nvim")
		-- JSON
		use("b0o/schemastore.nvim")
		-- use("Shougo/deoplete.nvim")
		-- use("roxma/nvim-yarp")
		-- use("roxma/vim-hug-neovim-rpc")
	end,
})
