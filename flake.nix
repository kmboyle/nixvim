{
  description = "neovim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, nixvim, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    nixvim' = nixvim.legacyPackages.${system};
    nvim = nixvim'.makeNixvimWithModule {
      inherit pkgs;
      module = ./config;
    };
  in {
    packages.${system}.default = nvim;
  };
}
