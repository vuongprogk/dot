return {
	"nvim-neo-tree/neo-tree.nvim",
	opts = function(_, opts)
		local function on_move(data)
			LazyVim.lsp.on_rename(data.source, data.destination)
		end
		opts.event_handlers = opts.event_handlers or {}
		vim.list_extend(opts.event_handlers, {
			{ event = "file_moved", handler = on_move },
			{ event = "file_renamed", handler = on_move },
			{
				event = "file_open_requested",
				handler = function()
					require("neo-tree.command").execute({ action = "close" })
				end,
			},
		})
	end,
}
