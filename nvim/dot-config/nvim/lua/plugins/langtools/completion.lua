return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp", version = "*" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help", version = "*" },
			{ "hrsh7th/cmp-buffer", version = "*" },
			{ "hrsh7th/cmp-path", version = "*" },
			{ "hrsh7th/cmp-cmdline", version = "*" },
			{ "onsails/lspkind.nvim", version = "*" },
		},
		event = { "InsertEnter", "CmdlineEnter" },

		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")
			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),

				sorting = {
					priority_weight = 10,
					comparators = {
						cmp.config.compare.recently_used,
						cmp.config.compare.score,
						cmp.config.compare.order,
						cmp.config.compare.kind,
						cmp.config.compare.scopes,
						cmp.config.compare.sort_text,
					},
				},

				preselect = cmp.PreselectMode.None,

				matching = {
					disallow_fuzzy_matching = false,
					disallow_fullfuzzy_matching = false,
					disallow_partial_fuzzy_matching = false,
					disallow_prefix_unmatching = false,
					disallow_symbol_nonprefix_matching = true,
					disallow_partial_matching = true,
					disallow_exact_matching = true,
				},

				view = {
					entries = { name = "custom", selection_order = "near_cursor", follow_cursor = true },
				},

				formatting = {
					format = lspkind.cmp_format({
						-- mode = "symbol",
					}),
				},

				mapping = {
					["<C-k>"] = cmp.mapping.scroll_docs(-4),
					["<C-j>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),

					-- abort if visible
					["<Esc>"] = cmp.mapping(function(fallback)
						if cmp.visible() and cmp.get_active_entry() then
							cmp.abort()
						else
							fallback()
						end
					end, { "i", "s" }),

					-- confirm completion
					["<CR>"] = cmp.mapping(function(fallback)
						if cmp.visible() and cmp.get_active_entry() then
							if luasnip.expandable() then
								luasnip.expand({})
							else
								cmp.confirm({
									select = true,
								})
							end
						else
							fallback()
						end
					end, { "i", "s" }),

					-- jump forward
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.locally_jumpable(1) then
							luasnip.jump(1)
						else
							fallback()
						end
					end, { "i", "s" }),

					-- jump backward
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				},
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

	{
		"L3MON4D3/LuaSnip",
		event = "BufEnter",
		build = "make install_jsregexp",
		version = "*",
		dependencies = {
			{ "saadparwaiz1/cmp_luasnip", version = "*" },
			{ "rafamadriz/friendly-snippets", version = "*" },
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}
