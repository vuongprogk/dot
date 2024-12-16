return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.event_handlers = opts.event_handlers and opts.event_handlers or {}
      vim.list_extend(opts.event_handlers, {
        {
          event = "file_open_requested",
          handler = function()
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
      })
    end,
  },
  {
    enabled = false,
    "folke/flash.nvim",
  },
}
