{ pkgs, ... }:
{
	extraPlugins = with pkgs.vimUtils; [
		(buildVimPlugin {
			pname = "compile.nvim";
			version = "unstable";
			src = pkgs.fetchFromGitHub {
				owner = "pohlrabi404";
				repo = "compile.nvim";
				rev = "main";
				hash = "sha256-DE1aWdIY+DxraVAuA0aU3qL6BtGyUWrobdzTcSoYjK4=";
			};
		})
	];

	extraConfigLua = ''
	require('compile').setup({
		highlight_under_cursor = {
			-- Enable or disable highlighting the error under your cursor. It’s a great visual cue!
			enabled = true,
			-- The timeout in milliseconds for the highlight to appear in the terminal.
			timeout_term = 500,
			-- The timeout in milliseconds for the highlight in a normal buffer.
			timeout_normal = 200,
		},
		cmds = {
			default = "make",
		},
		patterns = {
			-- A table of patterns to match compiler output. This is how the plugin finds
			-- files, lines, and columns for errors. The "123" and "12" refer to the
			-- capture groups in the regex.
			-- 1 stands for filename
			-- 2 stands for row number
			-- 3 stands for col number (can be omitted if the language doesn't support)
			-- For example: col:filename:row will be "312" instead
			rust = { "(%S+):(%d+):(%d+)", "123" },
			-- Match only .c, .h, .cpp, .hpp for filename:line
			Makefile = { "%[(%S+%.c|%S+%.h|%S+%.cpp|%S+%.hpp|%S+%.cxx|%S+%.hxx):(%d+):.+%]", "12" },
			-- I will also add more regex for different error types soon
		},
		colors = {
			-- Customize the highlight colors for different parts of the error message.
			-- These correspond to Neovim highlight groups.
			file = "WarningMsg",
			row = "CursorLineNr",
			col = "CursorLineNr",
		},
		term_win_name = "CompileTerm",
		term_win_opts = { split = "below", height = 0.4 },
		enter = false,
		keys = {
			-- Here's where you define all the handy keybindings!
			global = {
				-- Normal mode keybindings, you can group modes by writing them next to each other
				-- eg: ["nvi"] for normal, select and insert mode keybinding
				["n"] = {
					-- start compile/recompile, will also open the terminal
					["<localleader>cc"] = "require(\'compile\').compile()",
					["<localleader>cn"] = "require(\'compile\').next_error()",
					["<localleader>cp"] = "require(\'compile\').prev_error()",
					["<localleader>cl"] = "require(\'compile\').last_error()",
					["<localleader>cf"] = "require(\'compile\').first_error()",
				},
			},
			term = {
				-- Keybindings specific to the terminal buffer.
				-- Global keybinding for terminal will work everywhere but will be removed
				-- when you close the terminal buffer
				global = {
					["n"] = {
						-- clears the terminal
						["<localleader>cr"] = "require(\'compile\').clear()",
						-- quits the terminal buffer.
						["<localleader>cq"] = "require(\'compile\').destroy()",
					},
				},
				-- This one will only work INSIDE the terminal buffer
				buffer = {
					["n"] = {
						["r"] = "require(\'compile\').clear()",
						["c"] = "require(\'compile\').compile()",
						-- quit the terminal.
						["q"] = "require(\'compile\').destroy()",
						["n"] = "require(\'compile\').next_error()",
						["p"] = "require(\'compile\').prev_error()",
						["0"] = "require(\'compile\').first_error()",
						["$"] = "require(\'compile\').last_error()",
						-- Jump to the nearest error under or before your cursor
						["<Cr>"] = "require(\'compile\').nearest_error()",
					},
					-- Tricks to clear warning/error list
					["t"] = {
						-- Press `<CR>` in terminal mode to send a command and clear highlights.
						["<CR>"] = "require(\'compile\').clear_hl()",
						-- This sends the command to the terminal without clearing the error list!
						["<C-j>"] = "require(\'compile.term\').send_cmd(\'\')",
					},
				},
			},
		},
	})
	'';

	keymaps = [
		{
			mode = "n";
			key = "<leader>cc";
			action = ":lua require('compile').compile()<CR>";
			options = { silent = true; desc = "Compile"; };
		}
		{
			mode = "n";
			key = "<leader>cn";
			action = ":lua require('compile').next_error()<CR>";
			options = { silent = true; desc = "Next compilation error"; };
		}
		{
			mode = "n";
			key = "<leader>cq";
			action = ":lua require('compile').destroy()<CR>";
			options = { silent = true; desc = "Close compileterm"; };
		}
	];
}
