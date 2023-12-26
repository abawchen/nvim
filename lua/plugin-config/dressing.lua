-- https://github.com/stevearc/dressing.nvim/discussions/81
require("dressing").setup({
  input = {
    get_config = function()
      if vim.api.nvim_win_get_width(0) < 50 then
        return {
          relative = "editor",
        }
      end
    end,
  }
})
