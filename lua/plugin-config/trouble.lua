local status, trouble = pcall(require, "trouble")
if not status then 
  vim.notify("trouble not found")
  return 
end

trouble.setup({
    signs = {
      -- icons / text used for a diagnostic
      error = "",
      warning = "",
      hint = "",
      information = "",
      other = "",
    },
    use_diagnostic_signs = false
})

