local fb_actions = require("telescope").extensions.file_browser.actions

require("telescope").setup({
	extensions = {
		file_browser = {
			auto_depth = 2,
			mappings = {
				i = {
					["<Tab>"] = "move_selection_worse",
					["<S-Tab>"] = "move_selection_better",
				},
				n = {
					["<Tab>"] = "move_selection_worse",
					["<S-Tab>"] = "move_selection_better",
				},
			},
		},
	},
})
