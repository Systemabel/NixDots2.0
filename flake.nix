{
  description = ''
    This flake is a big combination of various tutorial flakes. Namely:
    https://saylesss88.github.io/installation/index.html
    https://code.m3ta.dev/m3tam3re/nixcfg

    dots:
    https://github.com/Ly-sec/nixos

    The aim is to make a desktop environment that's universally compatible,
    expandable, and sharable to friends and family so that everyone can enjoy my creation! The more people on linux, the better, and nixos is a great way to make it so that the setup is as stable as a rock.

    Some features that I'd like to add:
    encryption and secure secrets (!!!)
    modular packages for the most common tools
  '';

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    chaotic.url = "gitdub:chaotic-cx/nyx/nyxpkgs-unstable";
    nur.url = "github:nix-community/NUR";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    impermanence.url = "github:nix-community/impermanence";
  };

  outputs = {
    nixpkgs,
    self,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86-64-darwin"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    packages =
      forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    overlays = import ./overlays {inherit inputs;};
    nixosConfigurations = {
      Finn = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./hosts/Finn
          inputs.disko.nixosModules.disko
          inputs.impermanence.nixosModules.impermanence
        ];
      };
    };
    homeConfigurations = {
      "orca@Finn" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [./home/orca/Finn.nix];
      };
    };
  };
}
