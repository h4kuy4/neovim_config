local cmp = require('cmp')
local luasnip = require ('luasnip')

cmp.setup {
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-P>'] = cmp.mapping.select_prev_item(),
        ['<C-N>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.complete(),
        ['<A-c>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = function(fallback)
            if vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-N>', true, true, true), 'n')
            elseif luasnip.expand_or_jumpable() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-P>', true, true, true), 'n')
            elseif luasnip.jumpable(-1) then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
            else
                fallback()
            end
        end,
    },
    sources = {
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'omni' },
    },
    formatting = {
        format = require("lspkind").cmp_format({
            with_text = true,
            menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
                latex_symbols = "[Latex]",
            })
        }),
    },
}
local util = require("luasnip.util.util")

require'luasnip'.config.setup({
	parser_nested_assembler = function(_, snippet)
		local select = function(snip, no_move)
			snip.parent:enter_node(snip.indx)
			-- upon deletion, extmarks of inner nodes should shift to end of
			-- placeholder-text.
			for _, node in ipairs(snip.nodes) do
				node:set_mark_rgrav(true, true)
			end

			-- SELECT all text inside the snippet.
			if not no_move then
				vim.api.nvim_feedkeys(
					vim.api.nvim_replace_termcodes("<Esc>", true, false, true),
					"n",
					true
				)
				local pos_begin, pos_end = snip.mark:pos_begin_end()
				util.normal_move_on(pos_begin)
				vim.api.nvim_feedkeys(
					vim.api.nvim_replace_termcodes("v", true, false, true),
					"n",
					true
				)
				util.normal_move_before(pos_end)
				vim.api.nvim_feedkeys(
					vim.api.nvim_replace_termcodes("o<C-G>", true, false, true),
					"n",
					true
				)
			end
		end
		function snippet:jump_into(dir, no_move)
			if self.active then
				-- inside snippet, but not selected.
				if dir == 1 then
					self:input_leave()
					return self.next:jump_into(dir, no_move)
				else
					select(self, no_move)
					return self
				end
			else
				-- jumping in from outside snippet.
				self:input_enter()
				if dir == 1 then
					select(self, no_move)
					return self
				else
					return self.inner_last:jump_into(dir, no_move)
				end
			end
		end
		-- this is called only if the snippet is currently selected.
		function snippet:jump_from(dir, no_move)
			if dir == 1 then
				return self.inner_first:jump_into(dir, no_move)
			else
				self:input_leave()
				return self.prev:jump_into(dir, no_move)
			end
		end
		return snippet
	end
})

vim.api.nvim_set_keymap("i", "<C-n>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-n>", "<Plug>luasnip-next-choice", {})
