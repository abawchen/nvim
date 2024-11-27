-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
vim.api.nvim_create_autocmd("BufWritePre", {
  -- https://github.com/neovim/neovim/issues/24168#issue-1775351824
  -- pattern = "*.java",
  -- command = "lua vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })",
  callback = function()
    if vim.bo.ft == "java" then
      vim.lsp.buf.code_action({
        context = { only = { "source.organizeImports" } },
        apply = true,
      })
    end
    if vim.bo.ft == "python" then
      vim.lsp.buf.code_action({
        context = { only = { "source.organizeImports" } },
        apply = true,
      })
      vim.lsp.buf.code_action({
        context = { only = { "source.fixAll" } },
        apply = true,
      })
    end
    -- work but need to confirm
    -- if vim.bo.ft == "groovy" then
    --   vim.cmd("! npm-groovy-lint --format %")
    -- end
  end,
})
