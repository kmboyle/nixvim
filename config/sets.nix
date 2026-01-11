{ pkgs, ... }:

{
	config = {
		performance = {
			byteCompileLua = {
				enable = true;
				nvimRuntime = true;
				configs = true;
				plugins = true;
			};
		};
		diagnostic.settings = {
			update_in_insert = true;
			severity_sort = true;
			float = {
				border = "rounded";
			};
			jump = {
				severity.__raw = "vim.diagnostic.severity.ERROR";
			};
		};
		opts = {
			# Enable relative line numbers
			number = true;
			relativenumber = true;

			# Set tabs to 8 chars
			tabstop = 8;
			shiftwidth = 8;
			softtabstop = 0;
			expandtab = false;

			showtabline = 2;
			# Enable auto indenting
			smartindent = true;

			# Enable smart indenting (see https://stackoverflow.com/questions/1204149/smart-wrap-in-vim)
			breakindent = true;

			# Enable incremental searching
			hlsearch = true;
			incsearch = true;

			# Disable text wrap
			wrap = false;

			# Better splitting
			splitbelow = true;
			splitright = true;

			# Enable mouse mode
			mouse = "a"; # Mouse

			# Enable ignorecase + smartcase for better searching
			ignorecase = true;
			smartcase = true; # Don't ignore case with capitals
			grepprg = "rg --vimgrep";
			grepformat = "%f:%l:%c:%m";

			# Decrease updatetime
			updatetime = 50; # faster completion (4000ms default)

			# Set completeopt to have a better completion experience
			completeopt = [
				"menuone"
				"noselect"
				"noinsert"
			];

			# Enable persistent undo history
			swapfile = false;
			autoread = true;
			backup = false;
			undofile = true;
			#autochdir = true;
			shell = "/usr/bin/env zsh";

			# Enable 24-bit colors
			termguicolors = true;

			# Enable the sign column to prevent the screen from jumping
			signcolumn = "yes";

			# Enable cursor line highlight
			cursorline = true; # Highlight the line where the cursor is located

			# Set fold settings
			# These options were reccommended by nvim-ufo
			# See: https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
			foldcolumn = "0";
			foldlevel = 99;
			foldlevelstart = 99;
			foldenable = true;
			foldmethod = "indent";

			# Always keep 10 lines above/below cursor unless at start/end of file
			scrolloff = 10;

			# Place a column line
			colorcolumn = "120";

			# Reduce which-key timeout to 10ms
			timeoutlen = 10;

			# Set encoding type
			encoding = "utf-8";
			fileencoding = "utf-8";

			# More space in the neovim command line for displaying messages
			cmdheight = 0;

			# We don't need to see things like INSERT anymore
			showmode = false;

			# Spell
			spelllang = "en_us";
			spell = false;
			# Clipboard provider
			#clipboard.providers.wl-copy.enable = true;
			list = true;
			listchars = {
				tab = " ";
				trail = "~";
				extends = "»";
				precedes = "«";
				nbsp = "·";
			};
		};
	};
}
