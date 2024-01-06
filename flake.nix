{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    
    
    masterpkgs.url = "github:nixos/nixpkgs/master";
    unstable-small.url = "github:nixos/nixpkgs/nixos-unstable-small";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";

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

    slight = {
      url = "github:spikespaz/slight";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    spicetify-nix = { url = "github:the-argus/spicetify-nix"; };

    joshuto.url = "github:kamiyaa/joshuto";
    nix-colors.url = "github:misterio77/nix-colors";

    nix-index-database = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    extest.url = "git+https://forge.fishoeder.net/Nokogiri/extest";

    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-contrib.url = "github:hyprwm/contrib";

    #aagl = {
    #  url = "github:ezKEa/aagl-gtk-on-nix";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
    };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (self) outputs;
      forAllSystems = nixpkgs.lib.genAttrs [ "x86_64-linux" "x86_64-darwin" ];
    in rec {
      packages = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./pkgs { inherit pkgs; });

      devShells = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./shell.nix { inherit pkgs; });
      overlays = import ./overlays { inherit inputs; };

      nixosModules = import ./modules/nixos;

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

      #nixosConfigurations = {
      #  dewalt = nixpkgs.lib.nixosSystem {
      #    modules = [ ./nixos/dewalt/configuration.nix ]
      #      ++ (builtins.attrValues nixosModules);
      #    specialArgs = { inherit inputs outputs; };
      #  };
      #};

      homeConfigurations = {
        "nokogiri@mowteng" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ ./home-manager/mowteng ];
        };
      };

      #homeConfigurations = {
      #  "nokogiri@dewalt" = home-manager.lib.homeManagerConfiguration {
      #    pkgs = nixpkgs.legacyPackages.x86_64-linux;
      #    extraSpecialArgs = { inherit inputs outputs; };
      #    modules = [ ./home-manager/dewalt ];
      #  };
      #};

      homeConfigurations = {
        "nokogiri@homeassistant" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ ./home-manager/homeassistant ];
        };
      };
    };
}
