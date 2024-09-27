return {
  "lewis6991/gitsigns.nvim",
  keys = {
    {
      ")h",
      function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          require("gitsigns").nav_hunk("next")
          vim.cmd("norm zz")
        end
      end,
      desc = "Next Hunk",
    },
    {
      "(h",
      function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          require("gitsigns").nav_hunk("prev")
          vim.cmd("norm zz")
        end
      end,
      desc = "Prev Hunk",
    },
    {
      ")H",
      function()
        require("gitsigns").nav_hunk("last")
        vim.cmd("norm zz")
      end,
      desc = "Last Hunk",
    },
    {
      "(H",
      function()
        require("gitsigns").nav_hunk("first")
        vim.cmd("norm zz")
      end,
      desc = "First Hunk",
    },
  },
}
