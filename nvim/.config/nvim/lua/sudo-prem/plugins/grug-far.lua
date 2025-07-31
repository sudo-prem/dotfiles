return {
	"MagicDuck/grug-far.nvim",
	config = function()
		require("grug-far").setup({
			keymaps = {
				open = { n = "<localleader>ro", v = "<localleader>ro" },
				close = { n = "<localleader>rc" },
				swapReplacementInterpreter = { n = "<localleader>R" },
			},
		})
	end,
}
