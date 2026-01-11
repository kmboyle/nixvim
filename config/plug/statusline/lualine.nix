{ config, ... }:
let
	colors = import ../../colors/${config.theme}.nix { };
in
	{
	plugins.lualine = {
		enable = true;
		settings = {
			options = {
				theme = {
					normal = {
						a = {
							bg = colors.base00;
						};
						b = {
							bg = colors.base00;
						};
						c = {
							bg = colors.base00;
						};
						z = {
							bg = colors.base00;
						};
						y = {
							bg = colors.base00;
						};
					};
				};
				globalstatus = true;
				disabled_filetypes = {
					statusline = [
						"dashboard"
						"alpha"
						"starter"
					];
				};
			};
			inactive_sections = {
				lualine_x = [
					"filename"
					"filetype"
				];
			};
			sections = {
				lualine_a = [
					{
						__unkeyed = "mode";
						icon = " ";
						fmt = "string.lower";
						color = {
							fg = colors.base04;
							bg = colors.base00;
						};
						separator.left = "";
						separator.right = "";
					}
					{
						__unkeyed = "macro";
						__raw = ''
							{
							function()
								local recording = vim.fn.reg_recording()
								if recording ~= "" then
									return "recording @" .. recording
								end
								local applying_macro = vim.fn.reg_expanding()
								if applying_macro ~= "" then
									return "applying @" .. applying_macro
								end
								return ""
							end,
								color = { fg = '#BBB6B6', bg = none },
								separator = { left = "", right = "" },
							}
						'';
						color = {
							fg = colors.base04;
							bg = colors.base00;
						};
						separator.left = "";
						separator.right = "";
					}
				];
				lualine_b = [
					{
						__unkeyed = "branch";
						icon.__unkeyed = "";
						color = {
							fg = colors.base04;
							bg = colors.base00;
						};
						separator.left = "";
						separator.right = "";
					}
					{
						__unkeyed = "diff";
						separator.left = "";
						separator.right = "";
					}
				];
				lualine_c = [
					{
						__unkeyed = "diagnostic";
						symbols = {
							error = " ";
							warn = " ";
							info = " ";
							hint = "󰝶 ";
						};
						color = {
							fg = colors.base08;
							bg = colors.base00;
						};
						separator.left = "";
						separator.right = "";
					}
					"diagnostics"
					{
						__unkeyed-1 = {
							__raw = ''
								opts = function(_, opts)
									local trouble = require("trouble")
									local symbols = trouble.statusline({
										mode = "lsp_document_symbols",
										groups = {},
										title = false,
										filter = { range = true },
										format = "{kind_icon}{symbol.name:Normal}",
										hl_group = "lualine_c_normal",
									})
									table.insert(opts.sections.lualine_c, {
										symbols.get,
										cond = symbols.has,
									})
								end
							'';
						};
					}
				];
				lualine_x = [
					""
				];
				lualine_y = [
					{
						__unkeyed = "filetype";
						colored = true;
						icon_only = true;
						separator.left = "";
						separator.right = "";
					}
					{
						__unkeyed = "filename";
						symbols = {
							modified = "";
							readonly = "👁️";
							unnamed = "";
						};
						color = {
							fg = colors.base05;
							bg = colors.base00;
						};
						separator.left = "";
						separator.right = "";
					}
				];
				lualine_z = [
					{
						__unkeyed  = "progress";
						color = {
							fg = colors.base0B;
							bg = colors.base00;
						};
						separator.left = "";
						separator.right = "";
					}
					{
						__unkeyed = "location";
						color = {
							fg = colors.base0B;
							bg = colors.base00;
						};
						separator.left = "";
						separator.right = "";
					}
				];
			};
		};
	};
}
