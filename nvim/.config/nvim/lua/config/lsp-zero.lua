-- configuration for lsp-zero plugin
local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("mason").setup({
	formatters = {
		clangformat = {
			command = "clang-format",
			args = { "-style=Google" },
			filetype = true,
		},
	},
})
require("mason-lspconfig").setup({
	ensure_installed = {},
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,

		pylsp = function()
			require("lspconfig").pylsp.setup({
				settings = {
					pylsp = {
						plugins = {
							pycodestyle = {
								ignore = {
									"W391", -- blank line at end of file
									"E501", -- line too long
									"E302", -- two empty lines before function
									"E305", -- two empty lines after class
								},
							},
						},
					},
				},
			})
		end,
	},
})
