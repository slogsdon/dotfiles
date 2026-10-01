return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local wk = require("which-key")
			local builtin = require("telescope.builtin")

			wk.add({
				{ "<leader>f", group = "file" },
			})
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[f]ile [f]inder" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[f]ile [g]rep" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
