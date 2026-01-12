{
  description = "neovim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, nixvim, ... }:
  let
    systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
    forEachSystem = f: nixpkgs.lib.genAttrs systems (system: f system);
    pkgsFor = system: import nixpkgs { inherit system; };
    nixvimFor = system: nixvim.legacyPackages.${system}; 
    nvimFor = system:
      let
        pkgs = pkgsFor system;
        nixvim' = nixvimFor system;
      in
        nixvim'.makeNixvimWithModule {
          inherit pkgs;
          module = ./config;
        };
  in
  {
    packages = forEachSystem (system: {
      default = nvimFor system;
    });
  };
}
