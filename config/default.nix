{ config, lib, ... }:
{ imports = [
		# Base settings
		./autocommands.nix
		./keys.nix
		./sets.nix
		./highlight.nix
		# Colorschemes
		./plug/colorscheme/colorscheme.nix
		# Completion and LSP
		./plug/cmp/blink.nix
		./plug/lsp/lsp.nix
		./plug/lsp/lspsaga.nix
		./plug/lsp/clangd-extensions.nix
		./plug/lsp/none-ls.nix
		# Git integration
		./plug/git/gitsigns.nix
		# Statusline
		./plug/statusline/lualine.nix
		# Treesitter
		./plug/treesitter/treesitter-context.nix
		./plug/treesitter/treesitter-textobjects.nix
		./plug/treesitter/treesitter.nix
		# UI Enhancements
		./plug/ui/smear.nix
		./plug/ui/web-devicons.nix
		./plug/ui/bufferline.nix
		./plug/ui/noice.nix
		./plug/ui/illuminate.nix
		./plug/ui/markview.nix
		./plug/ui/ufo.nix
		./plug/ui/dap-ui.nix
		./plug/ui/dap-virtual-text.nix
		# Utility Plugins
		./plug/utils/dap.nix
		./plug/utils/lz-n.nix
		./plug/utils/sleuth.nix
		./plug/utils/smart-splits.nix
		./plug/utils/comment.nix
		./plug/utils/trouble.nix
		./plug/utils/neo-tree.nix
		./plug/utils/nvim-autopairs.nix
		./plug/utils/undotree.nix
		./plug/utils/compile.nix
		./plug/utils/todo-comments.nix
		
		./plug/snacks/default.nix
		./plug/mini/default.nix
	];
	# Theme options
	options = {
		theme = lib.mkOption {
			default = lib.mkDefault "paradise";
			type = lib.types.enum [
				"paradise"
				"poimandres"
				"oxocarbon"
			];
		};
	};
	# Configuration
	config = {
		theme = "paradise";
		extraConfigLua = ''
	  _G.theme = "${config.theme}"
	  '';
	};
}
