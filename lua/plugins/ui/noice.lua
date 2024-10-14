return {
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
        enabled = true,
        view = "mini",
        opts = {},
      },
      signature = {
        enabled = true,
        auto_open = {
          enabled = false,
          trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
          luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
          throttle = 50, -- Debounce lsp signature help request by 50ms
        },
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
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = true,
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
      enabled = true,
      format = {
        cmdline = { title = "ACE" },
      },
    },
    throttle = 50,
  },
}
