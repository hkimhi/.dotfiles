api = vim.api

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
	-- {"ms-jpq/coq_nvim", branch='coq'},
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
	-- "tpope/vim-fugitive",
	{
		-- TODO start using this after you've gotten used to normal nvim
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			-- vim.o.foldexpr=nvim_treesitter#foldexpr()
			vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")
		end,
	},
	-- "mbbill/undotree",
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
	},
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/nvim-cmp",
	-- "SirVer/ultisnips",
	-- "honza/vim-snippets",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"mhartington/formatter.nvim",
	"folke/which-key.nvim",
	"folke/zen-mode.nvim",
	-- {
	-- 	"ms-jpq/chadtree",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	branch = "chad",
	-- 	build = function()
	-- 		vim.cmd("CHADdeps")
	-- 	end,
	-- 	config = function()
	-- 		-- open chadtree when entering vim
	-- 		api.nvim_create_autocmd("VimEnter", {
	-- 			command = "CHADopen --nofocus",
	-- 		})
	--
	-- 		-- if CHADTree is the only remanining window, close neovim
	-- 		api.nvim_command(
	-- 			"autocmd BufEnter * if(winnr('$') == 1 && &buftype == 'nofile' && &filetype == 'CHADTree') | q! | endif"
	-- 		)
	--
	-- 		-- set CHADTree width to 32 columns, and disable icon colours
	-- 		api.nvim_set_var("chadtree_settings", {
	-- 			view = {
	-- 				width = 32,
	-- 			},
	-- 			theme = {
	-- 				icon_colour_set = "github",
	-- 			},
	-- 		})
	-- 	end,
	-- },
	-- "preservim/nerdtree",
	-- {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		config = true,
	},
	-- 	lazy = false,
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	priority = 1000,
	-- },
	"EdenEast/nightfox.nvim",
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
	"ellisonleao/gruvbox.nvim",
	-- {
	-- 	"nvim-tree/nvim-tree.lua",
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	config = function()
	-- 		require("nvim-tree").setup()
	-- 	end,
	-- 	enabled = false,
	-- },
	-- {
	-- 	"echasnovski/mini.nvim",
	-- 	version = false,
	-- 	enabled = false,
	-- },
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
	{
		"ErichDonGubler/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()

			-- Disable virtual_text since it's redundant due to lsp_lines
			vim.diagnostic.config({
				virtual_text = false,
			})
		end,
		enabled = false,
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
	-- "HallerPatrick/py_lsp.nvim",
	"jiangmiao/auto-pairs",
	"lukas-reineke/indent-blankline.nvim",
	"tpope/vim-surround",
})
