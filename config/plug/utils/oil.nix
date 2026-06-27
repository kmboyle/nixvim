{
	plugins.oil = {
		enable = true;
		settings = {
			default_file_explorer = true;
			columns = [ "icon" ];
			keymaps = {
				"<C-h>" = false;
				"<C-l>" = false;
			};
			view_options.show_hidden = false;
		};
	};

	keymaps = [
		{
			mode = "n";
			key = "-";
			action = "<CMD>Oil<CR>";
			options = {
				silent = true;
				desc = "Open parent directory";
			};
		}
	];
}
