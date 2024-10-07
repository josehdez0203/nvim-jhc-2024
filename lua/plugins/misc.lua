-- Standalone plugins with less than 10 lines of config go here
return {
	-- {
	-- 	-- Tmux & split window navigation
	-- 	"christoomey/vim-tmux-navigator",
	-- },
	{
		-- Detect tabstop and shiftwidth automatically
		"tpope/vim-sleuth",
	},
	{
		-- Powerful Git integration for Vim
		"tpope/vim-fugitive",
	},
	{
		-- GitHub integration for vim-fugitive
		"tpope/vim-rhubarb",
	},
	-- {
	-- 	-- Hints keybinds
	-- 	"folke/which-key.nvim",
	-- },
	{
		-- Autoclose parentheses, brackets, quotes, etc.
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
	},
	{
		-- Highlight todo, notes, etc in comments
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	-- {
	-- 	-- High-performance color highlighter
	-- 	"norcalli/nvim-colorizer.lua",
	-- 	config = function()
	-- 		require("colorizer").setup()
	-- 	end,
	-- },
	{
		"uga-rosa/ccc.nvim",
		lazy = false,
		opts = {
			highlighter = {
				auto_enable = true,
				lsp = true,
			},
		},
		keys = {
			{ "<space>cc", "<cmd>CccPick<cr>", desc = "Escoger color" },
			{ "<space>ct", "<cmd>CccHighlighterToggle<cr>", desc = "Alternar color" },
			{ "<space>ce", "<cmd>CccConvert<cr>", desc = "Editar color" },
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			-- "rcarriga/nvim-notify",
		},
	},
	{
		"rcarriga/nvim-notify",
		keys = {
			{
				"<leader>un",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Dismiss all Notifications",
			},
		},
		config = function()
			local opts = {
				timeout = 2000,
				-- render = "minimal",
				-- stages = "fade",
				max_height = function()
					return math.floor(vim.o.lines * 0.75)
				end,
				max_width = function()
					return math.floor(vim.o.columns * 0.4)
				end,
				on_open = function(win)
					vim.api.nvim_win_set_config(win, { zindex = 100 })
				end,
			}
			require("notify").setup(opts)
			-- when noice is not enabled, install notify on VeryLazy
			-- if not Util.has("noice.nvim") then
			-- 	Util.on_very_lazy(function()
			-- 		vim.notify = require("notify")
			-- 	end)
			-- end
		end,
	},
	{
		{ "nvim-lua/plenary.nvim" }, -- lua functions that many plugins use

		{
			"mbbill/undotree",
			config = function()
				vim.keymap.set("n", "<F4>", "<cmd>UndotreeToggle<cr>", { desc = "undotree" })
			end,
		},
	},
	{
		"voldikss/vim-floaterm",
		lazy = false,
		config = function()
			vim.keymap.set("n", "<F12>", ":FloatermToggle<CR>", { desc = "FloatermToggle" })
			vim.keymap.set("t", "<F12>", "<C-\\><C-n>:FloatermToggle<CR>", { desc = "FloatermToggle" })
		end,
	},
	{
		"folke/zen-mode.nvim",
		lazy = false,
		dependencies = { "folke/twilight.nvim" },
		config = function()
			vim.keymap.set("n", "<leader>zz", ":ZenMode<CR>", { desc = "ZenMode" }) -- ZenMode
			vim.keymap.set("n", "<leader>zt", ":Twilight<CR>", { desc = "Twilight" }) --Twilight
		end,
	},
	{
		"RRethy/vim-illuminate",
	},
	{
		"echasnovski/mini.nvim",
		version = "*",
		init = function()
			require("mini.animate").setup()
		end,
	},
	{
		"gen740/SmoothCursor.nvim",
		init = function()
			require("smoothcursor").setup({
				type = "exp",
				fancy = { enable = true },
				cursor = "󰁕",
			})
			local autocmd = vim.api.nvim_create_autocmd

			autocmd({ "ModeChanged" }, {
				callback = function()
					local current_mode = vim.fn.mode()
					if current_mode == "n" then
						vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#8aa872" })
						vim.fn.sign_define("smoothcursor", { text = "󰁕" })
					elseif current_mode == "v" then
						vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#bf616a" })
						vim.fn.sign_define("smoothcursor", { text = "" })
					elseif current_mode == "V" then
						vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#bf616a" })
						vim.fn.sign_define("smoothcursor", { text = "" })
					elseif current_mode == "�" then
						vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#bf616a" })
						vim.fn.sign_define("smoothcursor", { text = "" })
					elseif current_mode == "i" then
						vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#668aab" })
						vim.fn.sign_define("smoothcursor", { text = "" })
					end
				end,
			})
		end,
	},
}
