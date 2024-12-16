return {
  -- colorscheme
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = function()
      local transparent = false-- set to true if you would like to enable transparency
      return {
        style = "night", -- storm, night, day, deep, cool
        transparent = transparent,
        styles = {
          sidebars = transparent and "transparent" or "dark",
          floats = transparent and "transparent" or "dark",
        },
      }
    end,
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
      messages = {
        view = "mini",
      },
      notify = {
        enabled = true,
        view = "notify",
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        progress = {
          enabled = true,
        },
        message = {
          view = "mini",
          opts = {},
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
        {
          filter = {
            event = "notify",
            find = "No information available",
          },
          opts = { skip = true },
        },
      },
      views = {
        mini = {
          win_options = {
            winblend = 0,
          },
        },
        hover = {
          size = {
            max_width = 80,
            width = "auto",
            height = "auto",
          },
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
      opts.sections.lualine_c[5] = nil
    end,
  },
}
