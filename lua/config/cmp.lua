require("cmp").setup({
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	formatting = {
		format = function(entry, vim_item)
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				spell = "[Spellings]",
				zsh = "[Zsh]",
				buffer = "[Buffer]",
				ultisnips = "[Snip]",
				treesitter = "[Treesitter]",
				calc = "[Calculator]",
				nvim_lua = "[Lua]",
				path = "[Path]",
				nvim_lsp_signature_help = "[Signature]",
				cmdline = "[Vim Command]",
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		{
			name = "spell",
			option = {
				keep_all_entries = false,
				enable_in_context = function()
					return true
				end,
			},
		},
		{ name = "path" },
		{ name = "buffer" },
	},
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
