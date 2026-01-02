{
  description = "NixOS configuration";

  inputs = {

    # Essentials
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Flake imports
    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # /e39465aece2fd3414cbb82c7fc5fda1809de168e
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ nixpkgs, home-manager, zen-browser, ... }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = system;
        modules = [
          ./hosts/laptop/configuration.nix
          home-manager.nixosModules.home-manager
          {
            nixpkgs.overlays = [ inputs.niri.overlays.niri ];
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # Home Manager user definition
            home-manager.users.luke = {
              imports = [
                inputs.zen-browser.homeModules.twilight
                ./modules/home/apps.nix
              ];
              programs.zen-browser.enable = true;
              home.stateVersion = "24.11";
            };
          }
        ];
      };
      desktop = nixpkgs.lib.nixosSystem {
        system = system;
        modules = [
          ./hosts/desktop/configuration.nix
          home-manager.nixosModules.home-manager
          {
            nixpkgs.overlays = [ inputs.niri.overlays.niri ];
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # Home Manager user definition
            home-manager.users.luke = {
              imports = [
                inputs.zen-browser.homeModules.twilight
                ./modules/home/apps.nix
              ];
              programs.zen-browser.enable = true;
              home.stateVersion = "24.11";
            };
          }
        ];
      };
    };
  };
}
