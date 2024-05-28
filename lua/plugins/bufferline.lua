return {
  "akinsho/bufferline.nvim",
  config = function()
    require("bufferline").setup({
      options = {
        buffer_close_icon = "",
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
      },
    })
  end,
}
