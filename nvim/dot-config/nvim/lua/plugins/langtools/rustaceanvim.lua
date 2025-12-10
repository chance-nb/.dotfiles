-- remember to install rust-analyzer: rustup component add rust-analyzer
return {
	"mrcjkb/rustaceanvim",
	version = "^6",
	ft = "rust",
	config = function()
		vim.g.rustaceanvim = {
			server = {
				default_settings = {
					["rust-analyzer"] = {
						inlayHints = {
							lifetimeElisionHints = { enable = "skip_trivial" },
						},
						assist = { preferSelf = true },
					},
				},
			},
		}
	end,
}
