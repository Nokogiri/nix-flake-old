{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    masterpkgs.url = "github:nixos/nixpkgs/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hardware.url = "github:nixos/nixos-hardware";

    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/NUR";

    hyprpicker.url = "github:hyprwm/hyprpicker";

    slight = {
      url = "github:spikespaz/slight";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = { url = "github:the-argus/spicetify-nix"; };

    #nix-minecraft.url = "github:Infinidoge/nix-minecraft";

    #joshuto.url = "github:kamiyaa/joshuto";
    #eww = {
    #  url = "github:elkowar/eww";
    #
    #};
    nix-colors.url = "github:misterio77/nix-colors";

    nix-index-database = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    extest.url = "github:Nokogiri/extest";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (self) outputs;
      forAllSystems = nixpkgs.lib.genAttrs [ "x86_64-linux" ];
    in rec {
      # Your custom packages
      # Acessible through 'nix build', 'nix shell', etc
      packages = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./pkgs { inherit pkgs; });

      # Devshell for bootstrapping
      # Acessible through 'nix develop' or 'nix-shell' (legacy)
      devShells = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./shell.nix { inherit pkgs; });

      # Your custom packages and modifications, exported as overlays
      overlays = import ./overlays { inherit inputs; };
      # Reusable nixos modules you might want to export
      # These are usually stuff you would upstream into nixpkgs
      nixosModules = import ./modules/nixos;
      # Reusable home-manager modules you might want to export
      # These are usually stuff you would upstream into home-manager
      homeManagerModules = import ./modules/home-manager;

      nixosConfigurations = {
        mowteng = nixpkgs.lib.nixosSystem {
          modules = [ ./nixos/mowteng/configuration.nix ]
            ++ (builtins.attrValues nixosModules);
          specialArgs = { inherit inputs outputs; };
        };
      };

      nixosConfigurations = {
        homeassistant = nixpkgs.lib.nixosSystem {
          modules = [ ./nixos/homeassistant/configuration.nix ]
            ++ (builtins.attrValues nixosModules);
          specialArgs = { inherit inputs outputs; };
        };
      };

      nixosConfigurations = {
        dewalt = nixpkgs.lib.nixosSystem {
          modules = [ ./nixos/dewalt/configuration.nix ]
            ++ (builtins.attrValues nixosModules);
          specialArgs = { inherit inputs outputs; };
        };
      }; # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#your-username@your-hostname'
      homeConfigurations = {
        "nokogiri@mowteng" = home-manager.lib.homeManagerConfiguration {
          pkgs =
            nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            # > Our main home-manager configuration file <
            ./home-manager/mowteng
          ];
        };
      };

      homeConfigurations = {
        "nokogiri@dewalt" = home-manager.lib.homeManagerConfiguration {
          pkgs =
            nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            # > Our main home-manager configuration file <
            ./home-manager/dewalt
          ];
        };
      };

      homeConfigurations = {
        "nokogiri@homeassistant" = home-manager.lib.homeManagerConfiguration {
          pkgs =
            nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            # > Our main home-manager configuration file <
            ./home-manager/homeassistant
          ];
        };
      };
    };
}
