return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "LspAttach",
  opts = {
    preset = "amongus",
  },
  config = function(_, opts)
    vim.diagnostic.config({ virtual_text = false })
    require("tiny-inline-diagnostic").setup(opts)
  end,
}
