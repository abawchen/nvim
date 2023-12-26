local status, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status then
  vim.notify("nvim-lsp-installer not found.")
  return
end

lsp_installer.setup({})

