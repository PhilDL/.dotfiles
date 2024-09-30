-- These keymaps are there because I use azerty keyboard
-- making the use of [] chars more difficult than it should be
-- remapping them to () at least lets me use the keys without necessity
-- for a modifier

-- Remaps of the [ and ] keys used to prev/next different commands
vim.keymap.set("n", "))", "])", { silent = true, noremap = true })
vim.keymap.set("n", "((", "[(", { silent = true, noremap = true })
vim.keymap.set("n", ")}", "]}", { silent = true, noremap = true })
vim.keymap.set("n", "({", "[{", { silent = true, noremap = true })

-- Todo comment
vim.keymap.set("n", ")t", function()
  require("todo-comments").jump_next()
end, { desc = "Next Todo Comment" })
vim.keymap.set("n", "(t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous Todo Comment" })

-- buffers
vim.keymap.set("n", "(b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", ")b", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- quickfixes
vim.keymap.set("n", "(q", vim.cmd.cprev, { desc = "Previous Quickfix" })
vim.keymap.set("n", ")q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- Diagnostic remaps
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
vim.keymap.set("n", ")d", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set("n", "(d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
vim.keymap.set("n", ")e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
vim.keymap.set("n", "(e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
vim.keymap.set("n", ")w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
vim.keymap.set("n", "(w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- gitsigns
vim.keymap.set("n", ")h", function()
  if vim.wo.diff then
    vim.cmd.normal({ "]c", bang = true })
  else
    require("gitsigns").nav_hunk("next")
    vim.cmd("norm zz")
  end
end, { desc = "Next Hunk" })

vim.keymap.set("n", "(h", function()
  if vim.wo.diff then
    vim.cmd.normal({ "[c", bang = true })
  else
    require("gitsigns").nav_hunk("prev")
    vim.cmd("norm zz")
  end
end, { desc = "Prev Hunk" })

vim.keymap.set("n", ")H", function()
  require("gitsigns").nav_hunk("last")
  vim.cmd("norm zz")
end, { desc = "Last Hunk" })

vim.keymap.set("n", "(H", function()
  require("gitsigns").nav_hunk("first")
  vim.cmd("norm zz")
end, { desc = "First Hunk" })

-- move to functions
vim.keymap.set("n", ")m", "]m", { silent = true, noremap = true })
vim.keymap.set("n", "(m", "[m", { silent = true, noremap = true })
vim.keymap.set("n", ")M", "]M", { silent = true, noremap = true })
vim.keymap.set("n", "(M", "[M", { silent = true, noremap = true })

-- treesitter text objects
-- @functions.outer
vim.keymap.set("n", ")f", "]f", { silent = true, noremap = true })
vim.keymap.set("n", "(f", "[f", { silent = true, noremap = true })
vim.keymap.set("n", ")F", "]F", { silent = true, noremap = true })
vim.keymap.set("n", "(F", "[F", { silent = true, noremap = true })
-- @class.outer
vim.keymap.set("n", ")c", "]c", { silent = true, noremap = true })
vim.keymap.set("n", "(c", "[c", { silent = true, noremap = true })
vim.keymap.set("n", ")C", "]C", { silent = true, noremap = true })
vim.keymap.set("n", "(C", "[C", { silent = true, noremap = true })
-- @parameter.inner
vim.keymap.set("n", ")a", "]a", { silent = true, noremap = true })
vim.keymap.set("n", "(a", "[a", { silent = true, noremap = true })
vim.keymap.set("n", ")A", "]A", { silent = true, noremap = true })
vim.keymap.set("n", "(A", "[A", { silent = true, noremap = true })
