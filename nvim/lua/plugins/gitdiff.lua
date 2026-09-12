return {
	"sindrets/diffview.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		require("diffview").setup({
			diff_binaries = false,

			view = {
				merge_tool = {
					layout = "diff3_mixed",
				},

				default = {
					layout = "diff2_horizontal",
					disable_diagnostics = true,
				},

				file_history = {
					layout = "diff2_horizontal",
					disable_diagnostics = true,
				},
			},

			winbar_info = {
				enabled = true,
			},

			file_panel = {
				listing_style = "tree",
				win_config = {
					position = "right",
					width = 35,
				},
			},
		})

		vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>")
		vim.keymap.set("n", "<leader>gq", "<cmd>DiffviewClose<cr>")
	end,
}
