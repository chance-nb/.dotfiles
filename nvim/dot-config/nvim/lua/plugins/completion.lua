return {
	{ "hrsh7th/cmp-nvim-lsp", version = "*" },
	{ "hrsh7th/cmp-nvim-lsp-signature-help", version = "*" },
	{ "hrsh7th/cmp-buffer", version = "*" },
	{ "hrsh7th/cmp-path", version = "*" },
	{ "hrsh7th/cmp-cmdline", version = "*" },

	{
		"L3MON4D3/LuaSnip",
		version = "*",
		dependencies = {
			{ "saadparwaiz1/cmp_luasnip", version = "*" },
			{ "rafamadriz/friendly-snippets", version = "*" },
		},
	},

	{
		"hrsh7th/nvim-cmp",
		version = "*",
		event = { "InsertEnter", "CmdlineEnter" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load() -- technically part of LuaSnip setup but it's convenient here

			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")
			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},

				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},

				view = {
					entries = { name = "custom", selection_order = "near_cursor" },
				},

				---@diagnostic disable-next-line: missing-fields
				formatting = {
					format = lspkind.cmp_format({
						-- mode = "symbol",
					}),
				},

				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.scroll_docs(-4),
					["<C-j>"] = cmp.mapping.scroll_docs(4),
					["<C-Tab>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							if luasnip.expandable() then
								luasnip.expand()
							else
								cmp.confirm({
									select = true,
								})
							end
						else
							fallback()
						end
					end),

					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.locally_jumpable(1) then
							luasnip.jump(1)
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "luasnip" }, -- For luasnip users.
				}, {
					{ name = "buffer" },
				}),
			})

			-- Use buffer source for `/` and `?`
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Use cmdline & path source for ':'
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
		end,
	},
}
