-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Diagnostic keymaps
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
vim.keymap.set("n", "$d", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set("n", "^d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
vim.keymap.set("n", "$e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
vim.keymap.set("n", "^e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
vim.keymap.set("n", "$w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
vim.keymap.set("n", "^w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Escape insert mode
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- delete a single character without copy to registry
vim.keymap.set("n", "x", '"_x', { silent = true })

-- scroll with vertical scroll
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })

-- find and center the screen on it
vim.keymap.set("n", "n", "nzzzv", { silent = true })
vim.keymap.set("n", "N", "Nzzzv", { silent = true })

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", { silent = true })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { silent = true })
vim.keymap.set("v", ">", ">gv", { silent = true })

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', { silent = true })

-- Buffers (tabs)
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { silent = true })
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { silent = true }) -- close buffer

-- Neotest
vim.api.nvim_set_keymap(
  "n",
  "<leader>twf",
  "<cmd>lua require('neotest').run.run({ vim.fn.expand('%'), vitestCommand = 'vitest --watch' })<cr>",
  { desc = "Run Watch File" }
)
