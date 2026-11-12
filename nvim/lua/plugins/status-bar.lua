return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local colors = {
      blue   = "#1e66f5",
      cyan   = "#179299",
      black  = "#4c4f69", -- Latte Text
      white  = "#eff1f5", -- Latte Base / Background
      red    = "#d20f39",
      violet = "#8839ef",
      grey   = "#e6e9ef", -- Latte Surface0
    }

    local bubbles_theme = {
      normal = {
        a = { fg = colors.white, bg = colors.violet, gui = "bold" },
        b = { fg = colors.black, bg = colors.grey }, -- Dark text on grey pill
        c = { fg = colors.black, bg = colors.white }, -- Dark text for center
      },

      insert  = { a = { fg = colors.white, bg = colors.blue, gui = "bold" } },
      visual  = { a = { fg = colors.white, bg = colors.cyan, gui = "bold" } },
      replace = { a = { fg = colors.white, bg = colors.red, gui = "bold" } },

      inactive = {
        a = { fg = colors.black, bg = colors.grey },
        b = { fg = colors.black, bg = colors.grey },
        c = { fg = colors.black, bg = colors.white },
      },
    }

    require("lualine").setup({
      options = {
        theme = bubbles_theme,
        component_separators = "",
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { { "mode", separator = { right = "" }, right_padding = 0 } },
        lualine_b = { "filename", "branch" },
        lualine_c = { "%=" },
        lualine_x = {},
        lualine_y = { "filetype", "progress" },
        lualine_z = {
          { "location", separator = { left = "" }, left_padding = 0 },
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
      tabline = {},
      extensions = {},
    })
  end,
}
