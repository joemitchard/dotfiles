-- linter communication
return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
        -- lua
				null_ls.builtins.formatting.stylua,
				-- js/ts
        null_ls.builtins.formatting.prettier,
        -- python
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
        -- c++
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.diagnostics.cppcheck,
        null_ls.builtins.diagnostics.gccdiag,
        -- rust
       -- null_ls.builtins.formatting.rustfmt
      },
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
