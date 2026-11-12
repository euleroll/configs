return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "latte",
        transparent_background = false,
        show_end_of_buffer = false,
        term_colors = true,
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
        },
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          telescope = {
            enabled = true,
          },
          -- Add any other plugin integrations you use
        },
      })

      -- Set the colorscheme after setup
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}

