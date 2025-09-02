local api = vim.api
local g = vim.g

-- lazy.nvim package manager setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- add plugins here, of the form {<name>, <options>}
require("lazy").setup({
	-- {
	-- 	"vhyrro/luarocks.nvim",
	-- 	priority = 1001,
	-- 	opts = {
	-- 		rocks = { "magick" },
	-- 	},
	-- },
	-- {"ms-jpq/coq_nvim", branch='coq'},
	-- {
	-- 	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	-- 	config = function()
	-- 		require("lsp_lines").setup()
	--
	-- 		-- Disable virtual_text since it's redundant due to lsp_lines
	-- 		vim.diagnostic.config({
	-- 			virtual_text = false,
	-- 		})
	--
	-- 		-- use <Leader>l to toggle lsp_lines
	-- 		vim.keymap.set("", "<Leader>l", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
	-- 	end,
	-- 	enabled = false,
	-- },
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup()
			api.nvim_create_autocmd("ColorScheme", { command = "HighlightColors On" })
		end,
	},
	"tpope/vim-fugitive",
	{
		-- TODO start using this after you've gotten used to normal nvim
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		config = function()
			-- vim.o.foldexpr=nvim_treesitter#foldexpr()
			vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")
		end,
	},
	-- "mbbill/undotree",
	-- {
	-- 	'nvim-java/nvim-java',
	-- 	config = function()
	-- 		require('java').setup()
	-- 	end,
	-- },
	-- {
	-- 	'mfussenegger/nvim-jdtls'
	-- },
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/nvim-cmp",
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
	},
	-- "SirVer/ultisnips",
	-- "honza/vim-snippets",
	-- "mason-org/mason.nvim",
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"ast_grep",
				"cssls",
				"html",
				"bashls",
				"lua_ls",
				"pylsp",
				"clangd",
			},
		},
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {
					formatters = {
						clangformat = {
							command = "clang-format",
							args = { "-style=Google" },
							filetype = true,
						},
					},
				},
			},
			"neovim/nvim-lspconfig",
		},
	},
	"mhartington/formatter.nvim",
	"folke/which-key.nvim",
	"folke/zen-mode.nvim",
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		opts = {
			sources = {
				"filesystem",
				"buffers",
				"git_status",
				"document_symbols", -- non-default option
			},
			event_handlers = {
				{
					event = "neo_tree_window_after_open",
					handler = function()
						vim.opt_local.foldcolumn = "0"
					end,
				},
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		config = true,
	},
	"EdenEast/nightfox.nvim",
	"lunarvim/Onedarker.nvim",
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
	"ellisonleao/gruvbox.nvim",
	{
		"vidocqh/data-viewer.nvim",
		opts = {},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"kkharji/sqlite.lua", -- Optional, sqlite support
		},
		cmd = "DataViewer",
	},
	-- "edluffy/hologram.nvim",
	{
		"ellisonleao/glow.nvim",
		config = true,
		cmd = "Glow",
	},
	"shaunsingh/solarized.nvim",
	-- {
	-- 	"maxmx03/solarized.nvim",
	-- 	config = function()
	-- 		vim.o.background = "light"
	-- 	end,
	-- },
	-- "overcache/NeoSolarized",
	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = true,
	},
	-- "mfussenegger/nvim-dap",
	-- "mfussenegger/nvim-dap-python",
	"hiphish/rainbow-delimiters.nvim",
	"jiangmiao/auto-pairs",
	"lukas-reineke/indent-blankline.nvim",
	"tpope/vim-surround",
	{
		"HakonHarnes/img-clip.nvim",
		event = "VeryLazy",
		keys = {
			-- suggested keymap
			{ "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
		},
	},
	-- "jannis-baum/vivify.vim",
	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim", -- required by telescope
			"MunifTanjim/nui.nvim",

			-- optional
			"nvim-treesitter/nvim-treesitter",
			"rcarriga/nvim-notify",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			-- configuration goes here
			lang = "python3",
		},
	},
	{
		"maxmx03/fluoromachine.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local fm = require("fluoromachine")

			fm.setup({
				glow = false,
				theme = "fluoromachine",
				-- transparent = true,
			})
		end,
	},
	{
		"sakhnik/nvim-gdb",
		enabled = false,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		-- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
	-- {
	-- 	"OXY2DEV/markview.nvim",
	-- 	lazy = false, -- Recommended
	-- 	-- ft = "markdown" -- If you decide to lazy-load anyway
	--
	-- 	dependencies = {
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- 	opts = {
	-- 		preview = false,
	-- 	},
	-- 	-- lower prio than treesitter (default prio is 50) to fix load order
	-- 	-- https://github.com/OXY2DEV/markview.nvim/issues/365
	-- 	priority = 49,
	-- },
	{
		"benlubas/molten-nvim",
		version = "^1.0.0",
		build = ":UpdateRemotePlugins",
		dependencies = {
			"3rd/image.nvim",
		},
		init = function()
			g.molten_image_provider = "image.nvim"
			g.molten_output_win_max_height = 20
		end,
	},
	{
		"3rd/image.nvim",
		-- dependencies = {
		-- 	"luarocks.nvim",
		-- },
		opts = {
			processor = "magick_cli",
			max_width = 100,
			max_height = 12,
			max_height_window_percentage = math.huge,
			max_width_window_percentage = math.huge,
			window_overlap_clear_enabled = true,
		},
	},
	"lambdalisue/vim-suda",
	{
		"kosayoda/nvim-lightbulb",
		opts = {
			autocmd = {
				enabled = true,
			},
		},
	},
})
