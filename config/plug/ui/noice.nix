{
	plugins.noice = {
		enable = true;
		settings = {
			notify = { enabled = true; };
			messages = { enabled = true; };
			lsp = {
				signature = { enabled = false; };
				hover = { enabled = true; opts = { border = { style = "rounded"; }; }; };
				message = { enabled = true; };
				progress = { enabled = false; view = "mini"; };
				override = {
					"cmp.entry.get_documentation" = true;
					"vim.lsp.util.convert_input_to_markdown_lines" = true;
					"vim.lsp.util.stylize_markdown" = true;
				};
			};
			popupmenu = { enabled = true; backend = "nui"; };
			presets = {bottom_search = true; long_message_to_split = true; lsp_doc_border = true;};
			format = {
				filter = {
					pattern = [
						":%s*%%s*s:%s*"
						":%s*%%s*s!%s*"
						":%s*%%s*s/%s*"
						"%s*s:%s*"
						":%s*s!%s*"
						":%s*s/%s*"
					];
					icon = "";
					lang = "regex";
				};
				replace = {
					pattern = [
						":%s*%%s*s:%w*:%s*"
						":%s*%%s*s!%w*!%s*"
						":%s*%%s*s/%w*/%s*"
						"%s*s:%w*:%s*"
						":%s*s!%w*!%s*"
						":%s*s/%w*/%s*"
					];
					icon = "󱞪";
					lang = "regex";
				};
			};
		};
	};
}
