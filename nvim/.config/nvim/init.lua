-- core
require("plugins")
require("settings")
require("keymaps")
require("autocmd")

-- plugin configs
require("config.telescope-file-browser")
require("config.formatter")
require("config.cmp")
require("config.indent-blankline")

-- disabled plugins
-- require('config.harpoon')
-- require('config.mini')
-- require("config.nvim-dap")
-- require("config.hologram")

-- theme stuff
local theme_file = os.getenv("HOME") .. "/.theme_state"
local theme = "dark" -- fallback
local file = io.open(theme_file, "r")
if file then
	theme = file:read("*l")
	file:close()
end

if theme == "dark" then
	vim.cmd.colorscheme("retrobox")
	vim.opt.background = "dark"
else
	vim.cmd.colorscheme("solarized")
	vim.opt.background = "light"
end
