{
  plugins = {
    clangd-extensions = {
      enable = true;
      enableOffsetEncodingWorkaround = true;
      settings = {
        inlayHints.showParameterHints = true;
        ast = {
          roleIcons = {
            type = "";
            declaration = "";
            expression = "";
            specifier = "";
            statement = "";
            templateArgument = "";
          };
          kindIcons = {
            compound = "";
            recovery = "";
            translationUnit = "";
            packExpansion = "";
            templateTypeParm = "";
            templateTemplateParm = "";
            templateParamObject = "";
          };
          highlights = {
            detail = "NeoTreeFadeText1";
        };
        };
      };
    };
  };
}
