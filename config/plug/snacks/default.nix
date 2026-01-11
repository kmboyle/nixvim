{ self, ... }:
{
	plugins.snacks = {
		enable = true;
		settings = {
			bufdelete.enabled = true;
			input.enabled = true;
			scroll.enabled = true;
			animate.enabled = true;
		};
	};

	imports = [
		./dashboard.nix
		./indent.nix
		./lazygit.nix
		./picker.nix
	];

	keymaps = [
		{
			mode = "n"; key = "<leader>bs"; action = ":lua Snacks.scratch()<cr>";
			options = { noremap = true; desc = "Scratch buffer"; };
		}
		{
			mode = "n"; key = "<leader>bs"; action = ":lua Snacks.scratch().select()<cr>";
			options = { noremap = true; desc = "Scratch buffer"; };
		}
	];
}
