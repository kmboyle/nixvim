{ pkgs, ... }:
{
	plugins.treesitter = {
		enable = true;
		folding = true;
		settings = {
			indent = {
				enable = true;
			};
			highlight = {
				enable = true;
			};
			ensureInstalled = [
				"c"
				"make"
				"bash"
				"diff"
				"kconfig"
				"cpp"
				"cmake"
				"lua"
				"nix"
				"markdown"
				"markdown_inline"
				"doxygen"
			];
		};

		grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
			c
			make
			bash
			diff
			kconfig
			cpp
			cmake
			lua
			nix
			markdown
			markdown_inline
			doxygen
		];
	};

}
