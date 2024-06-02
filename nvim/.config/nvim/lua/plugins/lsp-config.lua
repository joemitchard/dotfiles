-- LSP config
return {
  -- runs lsps
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	-- loads lsps
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"tsserver",
          "clangd",
          "rust_analyzer",
				},
			})
		end,
	},
	-- allows nvim to talk to lsp
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
		
      lspconfig.lua_ls.setup({capabilities = capabilities})

      lspconfig.clangd.setup({capabilities = capabilities})

      lspconfig.rust_analyzer.setup({capabilities = capabilities})

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "cD", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
