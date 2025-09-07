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
    opts = {
      dashboard = {
        preset = {
          header = [[
     █████╗  ██████╗███████╗
    ██╔══██╗██╔════╝██╔════╝
    ███████║██║     █████╗  
    ██╔══██║██║     ██╔══╝  
    ██║  ██║╚██████╗███████╗
    ╚═╝  ╚═╝ ╚═════╝╚══════╝]],
        },
      },
    },
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
      local LazyVim = require("lazyvim.util")
      opts.sections.lualine_c[4] = {
        LazyVim.lualine.pretty_path({
          length = 0,
          relative = "cwd",
          modified_hl = "MatchParen",
          directory_hl = "",
          filename_hl = "Bold",
          modified_sign = "",
          readonly_icon = " 󰌾 ",
        }),
      }
    end,
  },
}
