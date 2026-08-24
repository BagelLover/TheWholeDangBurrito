{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-xr.url = "github:nix-community/nixpkgs-xr";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    bluebuild = {
      url = "https://flakehub.com/f/blue-build/cli/*";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ nixpkgs, home-manager, nixpkgs-xr, spicetify-nix, bluebuild, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations = {

      laptop = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit spicetify-nix; };

        modules = [
          {
            nixpkgs.config.allowUnfree = true;
            nixpkgs.overlays = [
                          nixpkgs-xr.overlays.default
                          (final: prev: {
                            xorg = prev.xorg // { lndir = prev.lndir; };
                          })
                        ];
                      }

                      ./hosts/laptop/configuration.nix

          home-manager.nixosModules.home-manager

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = { inherit spicetify-nix; };

            home-manager.users.luke = {
              imports = [
                ./home/dms
                ./home/apps.nix
                spicetify-nix.homeManagerModules.default
              ];
              home.stateVersion = "26.05";
            };
          }
        ];
      };

      desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit spicetify-nix; };

        modules = [
          {
            nixpkgs.config.allowUnfree = true;
            nixpkgs.overlays = [
                          nixpkgs-xr.overlays.default
                          (final: prev: {
                            xorg = prev.xorg // { lndir = prev.lndir; };
                          })
                        ];
                      }

                      ./hosts/desktop/configuration.nix

          home-manager.nixosModules.home-manager

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = { inherit spicetify-nix; };

            home-manager.users.luke = {
              imports = [
                ./home/dms
                ./home/apps.nix
                spicetify-nix.homeManagerModules.default
              ];
              home.stateVersion = "26.05";
            };
          }
        ];
      };
    };
  };
}
