{ pkgs, ... }:
{
	plugins.none-ls = {
		enable = true;
		enableLspFormat = false;
		settings = {
			updateInInsert = false;
		};
		sources = {
			code_actions = {
				gitsigns.enable = false;
			};
			diagnostics = {
				cppcheck = {
					enable = false;
					settings = {
						disabled_filetypes = [
							"h"
							"hpp"
						];
						extra_args = [
							"--enable=all"
							"--check-level=exhaustive"
							"--template=gcc"
							"--inline-suppr"
							"--suppress=missingIncludeSystem,checkersReport"
						];
						rootPatterns = [
							".git"
							"compile_commands.json"
						];
					};
				};
			};
			formatting = {
				clang_format = {
					enable = true;
					settings = {
						extra_args = [
							"--style=file"
							"--fallback-style=llvm"
						];
					};
				};
			};
		};
	};
	keymaps = [
		{
			mode = [ "n" "v" ]; key = "<leader>cf"; action = "<cmd>lua vim.lsp.buf.format()<cr>";
			options = { silent = true; desc = "Format"; };
		}
	];
}
