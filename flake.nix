{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixvim, flake-parts, home-manager, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems =
        [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];

      perSystem = { pkgs, system, ... }:
        let
          nixvimLib = nixvim.lib.${system};
          nixvim' = nixvim.legacyPackages.${system};
          nixvimModule = {
            inherit pkgs;
            module = import ./plugins;
            extraSpecialArgs = { };
          };
          nvim = nixvim'.makeNixvimWithModule nixvimModule;
        in {

          checks = {
            # Run `nix flake check .` to verify that your config is not broken
            default =
              nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
          };

          # extraPlugins = with pkgs.vimPlugins; [

          # ];

          packages = {
            # Lets you run `nix run .` to start nixvim
            default = nvim;
          };
        };

      flake = {
        homeManagerModules = {
          default = { config, pkgs }:
            let nixvim' = nixvim.legacyPackages.${config.system};
            in {

              imports = [ home-manager.nixosModules.home-manager ];

              home.stateVersion = "23.11";
              programs.neovim = {
                enable = true;
                package = nixvim'.makeNixvimWithModule {
                  inherit pkgs;
                  module = import ./plugins;
                };
              };
            };
        };
      };
    };
}
