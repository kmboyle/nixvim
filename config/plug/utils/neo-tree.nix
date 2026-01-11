{
	plugins.neo-tree = {
		enable = true;
		settings = {
			enable_git_status = false;
			follow_current_file = {
				enabled = true;
				leave_dirs_open = true;
			};
			window.position = "left";
			window.width = 30;
			buffers.window.mappings = {
				"<space>" = "open";
				"h" = "close_node";
			};
		};
	};

	keymaps = [
		{
			mode = [
				"n"
				"v"
			];
			key = "<leader>e";
			action = ":Neotree<CR>"; # :set autochdir<CR>
			options = {
				silent = true;
				desc = "Tree";
			};
		}
	];

}
