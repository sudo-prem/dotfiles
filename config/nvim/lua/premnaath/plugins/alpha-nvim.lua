-- Lua powered greeter
local M = {
	"goolord/alpha-nvim",
	event = "VimEnter",
}

function M.config()
	local alpha = require("alpha")
	local dashboard = require("alpha.themes.dashboard")
	local icons = require("premnaath.core.icons")

	local function button(sc, txt, keybind, keybind_opts)
		local b = dashboard.button(sc, txt, keybind, keybind_opts)
		b.opts.hl_shortcut = "Include"
		return b
	end

	dashboard.section.header.val = {
		[[███████╗██╗   ██╗██████╗  ██████╗       ██╗   ██╗██╗███╗   ███╗]],
		[[██╔════╝██║   ██║██╔══██╗██╔═══██╗      ██║   ██║██║████╗ ████║]],
		[[███████╗██║   ██║██║  ██║██║   ██║█████╗██║   ██║██║██╔████╔██║]],
		[[╚════██║██║   ██║██║  ██║██║   ██║╚════╝╚██╗ ██╔╝██║██║╚██╔╝██║]],
		[[███████║╚██████╔╝██████╔╝╚██████╔╝       ╚████╔╝ ██║██║ ╚═╝ ██║]],
		[[╚══════╝ ╚═════╝ ╚═════╝  ╚═════╝         ╚═══╝  ╚═╝╚═╝     ╚═╝]],
	}

	-- dashboard.section.header.val = {
	--   [[                  __                                              ]],
	--   [[                 /\ \                           __                ]],
	--   [[  ____  __  __   \_\ \    ___            __  __/\_\    ___ ___    ]],
	--   [[ /',__\/\ \/\ \  /'_` \  / __`\  _______/\ \/\ \/\ \ /' __` __`\  ]],
	--   [[/\__, `\ \ \_\ \/\ \_\ \/\ \_\ \/\______\ \ \_/ \ \ \/\ \/\ \/\ \ ]],
	--   [[\/\____/\ \____/\ \___,_\ \____/\/______/\ \___/ \ \_\ \_\ \_\ \_\]],
	--   [[ \/___/  \/___/  \/__,_ /\/___/           \/__/   \/_/\/_/\/_/\/_/]],
	-- }

	dashboard.section.buttons.val = {
		button("f", icons.ui.Files .. " Find file", ":Telescope find_files <CR>"),
		button("n", icons.ui.NewFile .. " New file", ":ene <BAR> startinsert <CR>"),
		button("r", icons.ui.History .. " Recent files", ":Telescope oldfiles <CR>"),
		button("t", icons.ui.Text .. " Find text", ":Telescope live_grep <CR>"),
		button("c", icons.ui.Gear .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
		button("q", icons.ui.SignOut .. " Quit", ":qa<CR>"),
	}

	dashboard.section.footer.val = { icons.git.Octoface .. " github.com/sudo-prem" }
	dashboard.section.footer.opts.hl = "Type"
	dashboard.section.header.opts.hl = "Include"
	dashboard.section.buttons.opts.hl = "Keyword"
	dashboard.opts.opts.noautocmd = true

	alpha.setup(dashboard.opts)
end

return M