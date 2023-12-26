local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  vim.notify("nvim-treesitter not found.")
  return
end

treesitter.setup({
  -- :TSInstallInfo for language list
  ensure_installed = {
    "c_sharp",
    "css",
    "go",
    "html",
    "json",
    "lua",
    "python",
    "java",
    "javascript",
    "tsx",
    "typescript",
    "vim",
    "yaml",
  },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      node_decremental = "<BS>",
      scope_incremental = "<TAB>",
    },
  },
  indent = {
    enable = true,
  },
  -- p00f/nvim-ts-rainbow
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    colors = {
      "#95ca60",
      "#ee6985",
      "#D6A760",
      "#7794f4",
      "#b38bf5",
      "#7cc7fe",
    }, -- table of hex strings
  },
})
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldlevel = 99
