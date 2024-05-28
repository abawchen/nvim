-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

-- https://vi.stackexchange.com/a/39338/27441
keymap.set("n", "<c-/>", "gcc", { remap = true })
keymap.set("n", "<c-_>", "gcc", { remap = true })
keymap.set("v", "<c-/>", "gc", { remap = true })
keymap.set("v", "<c-_>", "gc", { remap = true })

-- delete w/o copying: https://vi.stackexchange.com/a/26420/27441
keymap.set("v", "d", '"_d')
