{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hypridle.url = "github:hyprwm/hypridle";
    hyprlock.url = "github:hyprwm/hyprlock";
  };

  outputs = inputs@{ nixpkgs, home-manager, hypridle, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./system/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.toma = import ./home/home.nix;
            home-manager.extraSpecialArgs = { inherit inputs; };
          }
        ];
      };
    };
  };
}
