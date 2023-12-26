local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("telescope not found.")
  return
end

telescope.setup({
  defaults = {
    initial_mode = "insert", -- insert or normal
    layout_strategy = "horizontal",
    mappings = require("keybindings").telescopeList,
  },
  pickers = {
    find_files = {
      -- theme = "dropdown", -- 可选参数： dropdown, cursor, ivy
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({
        -- even more opts
      }),
    },
  },
})

pcall(telescope.load_extension, "env")
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
pcall(telescope.load_extension, "ui-select")
