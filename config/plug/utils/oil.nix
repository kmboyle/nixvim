{
	plugins.oil = {
		enable = true;
		settings = {
			default_file_explorer = true;
			columns = [ "icon" ];
			keymaps = {
				"<C-h>" = false;
				"<C-l>" = false;
				"<C-o>" = {
					callback.__raw = ''
						function()
							local oil = require("oil")
							local entry = oil.get_cursor_entry()
							if not entry then return end
							local dir = oil.get_current_dir()
							if not dir then return end
							local filepath = dir .. entry.name
							local cur_win = vim.api.nvim_get_current_win()
							local target = nil
							for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
								local ft = vim.api.nvim_get_option_value("filetype", { buf = vim.api.nvim_win_get_buf(win) })
								if win ~= cur_win and ft ~= "oil" then
									target = win
									break
								end
							end
							if target then
								vim.api.nvim_set_current_win(target)
								vim.cmd("edit " .. vim.fn.fnameescape(filepath))
							else
								vim.cmd("vsplit " .. vim.fn.fnameescape(filepath))
							end
						end
					'';
					desc = "Open in existing pane or vsplit";
				};
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
