{
  description = ''
    This flake is a big combination of various tutorial flakes. See the
    readme!
  '';

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nur.url = "github:nix-community/NUR";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # quickshell = {
    # url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
    # inputs.nixpkgs.follows = "nixpkgs";
    # };

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
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
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
          inputs.home-manager.nixosModules.home-manager
          inputs.niri.nixosModules.niri
          {
            home-manager = {
              users.orca.imports = [./home/orca/Finn.nix];
              extraSpecialArgs = {inherit inputs outputs;};
            };
          }
        ];
      };
    };
    # homeConfigurations = {
    #  "orca@Finn" = home-manager.lib.homeManagerConfiguration {
    #   pkgs = nixpkgs.legacyPackages."x86_64-linux";
    #  extraSpecialArgs = {inherit inputs outputs;};
    # modules = [./home/orca/Finn.nix];
    #};
    # };
  };
}
