{
	plugins.markview = {
		enable = true;
		settings = {
		};
		luaConfig.content = ''
			local presets = require("markview.presets");

			require("markview").setup({
				markdown = {
					headings = presets.headings.glow,
					horizontal_rules = presets.horizontal_rules.dashed
				}
			});
		'';
	};
}
