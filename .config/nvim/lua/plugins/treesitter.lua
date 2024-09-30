return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "astro",
        "bash",
        "css",
        "diff",
        "dockerfile",
        "gitignore",
        "html",
        "http",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "prisma",
        "python",
        "query",
        "regex",
        "sql",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
      config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)

        -- MDX
        vim.filetype.add({
          extension = {
            mdx = "mdx",
          },
        })
        vim.treesitter.language.register("markdown", "mdx")
      end,
      textobjects = {
        move = {
          enable = true,
          -- AZERTY bindings
          goto_next_start = { [")f"] = "@function.outer", [")c"] = "@class.outer", [")a"] = "@parameter.inner" },
          goto_next_end = { [")F"] = "@function.outer", [")C"] = "@class.outer", [")A"] = "@parameter.inner" },
          goto_previous_start = { ["(f"] = "@function.outer", ["(c"] = "@class.outer", ["(a"] = "@parameter.inner" },
          goto_previous_end = { ["(F"] = "@function.outer", ["(C"] = "@class.outer", ["(A"] = "@parameter.inner" },
        },
      },
    },
  },
}
