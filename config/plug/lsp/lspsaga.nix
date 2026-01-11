{
	plugins.lspsaga = {
		enable = true;
		settings = {
			beacon = {
				enable = true;
			};
			ui = {
				border = "single"; # One of none, single, double, rounded, solid, shadow
				devicon = true;
			};
			hover = { openLink = "gx"; };
			diagnostic = {
				border_follow = true;
				diagnostic_only_current = false;
				show_code_action = true;
				extend_related_information = true;
			};
			symbol_in_winbar = { enable = true; showFile = false; folderLevel = 0; };
			code_action = {
				extendGitSigns = false; showServerName = false;
				onlyInCursor = true; numShortcut = true;
				keys = { exec = "<CR>"; quit = [ "<Esc>" "q" ]; };
			};
			lightbulb = { enable = false; sign = false; virtual_text = false; };
			implement = { enable = true; };
			rename = {
				auto_save = false;
				keys = { exec = "<CR>"; quit = [ "<C-k>" "<Esc>" ]; select = "x"; };
			};
			outline = {
				auto_close = true; auto_preview = true; close_after_jump = true;
				layout = "normal"; # normal or float
				win_position = "right"; # left or right
				keys = { jump = "e"; quit = "q"; toggle_or_jump = "o"; };
			};
			scroll_preview = { scroll_down = "<C-f>"; scroll_up = "<C-b>"; };
		};
	};
	keymaps = [

		{
			mode = "n"; key = "cp"; action = "<cmd>Lspsaga peek_definition<CR>";
			options = { desc = "Peek Definition"; silent = true; };
		}

		{
			mode = "n"; key = "gT"; action = "<cmd>Lspsaga peek_type_definition<CR>";
			options = { desc = "Type Definition"; silent = true; };
		}

		#{
		#	mode = "n"; key = "K"; action = "<cmd>Lspsaga hover_doc<CR>";
		#	options = { desc = "Hover"; silent = true; };
		#}

		{
			mode = "n"; key = "<leader>cw"; action = "<cmd>Lspsaga outline<CR>";
			options = { desc = "Outline"; silent = true; };
		}

		{
			mode = "n"; key = "<leader>cr"; action = "<cmd>Lspsaga rename<CR>";
			options = { desc = "Rename"; silent = true; };
		}

		{
			mode = "n"; key = "<leader>ca"; action = "<cmd>Lspsaga code_action<CR>";
			options = { desc = "Code Action"; silent = true; };
		}

		{
			mode = "n"; key = "<leader>cd"; action = "<cmd>Lspsaga show_line_diagnostics<CR>";
			options = { desc = "Line Diagnostics"; silent = true; };
		}

		#{
		#	mode = "n"; key = "[d"; action = "<cmd>Lspsaga diagnostic_jump_next<CR>";
		#	options = { desc = "Next Diagnostic"; silent = true; };
		#}

		#{
		#	mode = "n"; key = "]d"; action = "<cmd>Lspsaga diagnostic_jump_prev<CR>";
		#	options = { desc = "Previous Diagnostic"; silent = true; };
		#}
	];
}
