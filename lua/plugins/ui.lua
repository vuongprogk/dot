return {
  -- colorscheme
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "night", -- storm, night, day, deep, cool
      transparent = vim.g.transparent,
      styles = {
        sidebars = vim.g.transparent and "transparent" or "dark",
        floats = vim.g.transparent and "transparent" or "dark",
      },
    },
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      transparent = vim.g.transparent,
      styles = {
        sidebars = vim.g.transparent and "transparent" or "dark",
        floats = vim.g.transparent and "transparent" or "dark",
      },
    },
  },
  -- change dashboard logo
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.dashboard = {
        preset = {
          header = [[
     █████╗  ██████╗███████╗
    ██╔══██╗██╔════╝██╔════╝
    ███████║██║     █████╗  
    ██╔══██║██║     ██╔══╝  
    ██║  ██║╚██████╗███████╗
    ╚═╝  ╚═╝ ╚═════╝╚══════╝]],
        },
      }
    end,
  },
  -- override some noice config
  {
    "folke/noice.nvim",
    opts = {
      routes = {
        {
          filter = {
            event = "notify",
            find = "No information available",
          },
          opts = { skip = true },
        },
      },
      cmdline = {
        format = {
          cmdline = { title = "ACE" },
        },
      },
    },
  },
  -- inline diagnostic more pretty
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    opts = {
      preset = "amongus",
    },
    config = function(_, opts)
      vim.diagnostic.config({ virtual_text = false })
      require("tiny-inline-diagnostic").setup(opts)
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.sections.lualine_c[5] = nil
    end,
  },
}
