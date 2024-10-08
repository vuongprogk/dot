local options = {
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
		items = "lsp",
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
					require("menu").open(options)
				end,
				{ mode = "n" },
			},
			{
				"<RightMouse>",
				function()
					vim.cmd.exec('"normal! \\<RightMouse>"')
					require("menu").open(options, { mouse = true })
				end,
				{ mode = "n" },
			},
		},
	},
}
