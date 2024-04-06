-- https://github.com/simondrake/gomodifytags?tab=readme-ov-file#creating-a-command

vim.api.nvim_create_user_command("GAT", function(opts)
	require("gomodifytags").GoAddTags(opts.fargs[1], opts.args)
end, { nargs = "+" })

vim.api.nvim_create_user_command("GRT", function(opts)
	require("gomodifytags").GoRemoveTags(opts.fargs[1])
end, { nargs = "+" })
