local manager = require("neo-tree.sources.manager")
local M = {}
M.defaults = {
  {
    name = "Format Buffer",
    cmd = function()
      local ok, conform = pcall(require, "conform")

      if ok then
        conform.format({ lsp_fallback = true })
      else
        vim.lsp.buf.format()
      end
    end,
    rtxt = "<leader>cf",
  },

  {
    name = "Code Actions",
    cmd = vim.lsp.buf.code_action,
    rtxt = "<leader>ca",
  },

  { name = "separator" },

  {
    name = "  Lsp Actions",
    hl = "Exblue",
    items = {
      {
        name = "Goto Definition",
        cmd = vim.lsp.buf.definition,
      },

      {
        name = "Goto Declaration",
        cmd = vim.lsp.buf.declaration,
      },

      {
        name = "Goto Implementation",
        cmd = vim.lsp.buf.implementation,
      },

      { name = "separator" },

      {
        name = "Add workspace folder",
        cmd = vim.lsp.buf.add_workspace_folder,
      },

      {
        name = "Remove workspace folder",
        cmd = vim.lsp.buf.remove_workspace_folder,
      },

      {
        name = "Show References",
        cmd = vim.lsp.buf.references,
      },

      { name = "separator" },

      {
        name = "Format Buffer",
        cmd = function()
          LazyVim.format({ force = true })
        end,
      },

      {
        name = "Code Actions",
        cmd = vim.lsp.buf.code_action,
      },
    },
  },

  { name = "separator" },

  {
    name = "Edit Config",
    cmd = function()
      vim.cmd("tabnew")
      local conf = vim.fn.stdpath("config")
      vim.cmd("tcd " .. conf .. " | e init.lua")
    end,
  },

  { name = "separator" },

  {
    name = "  Open in terminal",
    hl = "ExRed",
    cmd = function()
      LazyVim.terminal(nil, { cwd = LazyVim.root() })
    end,
  },

  { name = "separator" },

  {
    name = "  Open lazygit",
    hl = "ExRed",
    cmd = function()
      LazyVim.lazygit({ cwd = LazyVim.root.git() })
    end,
  },
  { name = "separator" },

  {
    name = "  Color Picker",
    cmd = function()
      require("minty.huefy").open({ border = true })
    end,
  },

  { name = "separator" },

  {
    name = "Obsidian personal",
    cmd = function()
      vim.cmd("tabnew")
      local conf = "~/vaults/personal/"
      vim.cmd("tcd " .. conf)
    end,
  },

  {
    name = "Obsidian work",
    cmd = function()
      vim.cmd("tabnew")
      local conf = "~/vaults/work/"
      vim.cmd("tcd " .. conf)
    end,
  },
}

return {
  { "nvchad/volt", lazy = true },
  { "nvchad/minty", lazy = true },
  {
    "nvchad/menu",
    lazy = true,
    keys = {
      {
        "<C-t>",
        function()
          require("menu").open(M.defaults)
        end,
        { mode = "n" },
      },
      {
        "<RightMouse>",
        function()
          vim.cmd.exec('"normal! \\<RightMouse>"')
          require("menu").open(M.defaults, { mouse = true })
        end,
        { mode = "n" },
      },
    },
  },
}
