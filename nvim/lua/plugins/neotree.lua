return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	opts = {
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				visible = true,
			},
		},
	},
	config = function(_, opts)
		require("neo-tree").setup(opts)
		vim.keymap.set("n", "<leader>ff", function()
			local current_buf = vim.bo.filetype

			-- Currently inside Neo-tree
			if current_buf == "neo-tree" then
				vim.cmd("Neotree close")
				return
			end

			-- Open/reveal Neo-tree and focus it
			vim.cmd("Neotree filesystem reveal right")
		end)
	end,
}
