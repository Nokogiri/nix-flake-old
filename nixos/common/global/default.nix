# This file (and the global directory) holds config that i use on all hosts
{ lib, inputs, outputs, pkgs, config, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.nix-index-database.nixosModules.nix-index

    ./console.nix
    ./doas.nix
    ./fish.nix
    ./locale.nix
    #./nix.nix
    ./openssh.nix
    ./sops.nix

    #../fixes/fix-nfs4-kernel.nix
  ];

  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
  };

  documentation = {
    info.enable = false;
    doc.enable = false;
    dev.enable = false;
  };
  
  environment = {
    enableAllTerminfo = false;
    pathsToLink = [ "/share/nix-direnv" "/share/zsh" "/share/bash-completion" ];
  };

  nix = {
    settings = {
      substituters = [
        "https://nix-community.cachix.org"
        "https://cache.nixos.org"
        "https://cache.fishoeder.net"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.fishoeder.net:8LJqtsUc2Sdbvucf7HCakDEetd1b2rGLFmVaDF1POdc="
      ];
      trusted-users = [ "root" "@wheel" "nokogiri" ];
      auto-optimise-store = lib.mkDefault true;
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      warn-dirty = false;
    };
    package = pkgs.nixUnstable;
    gc = {
      automatic = lib.mkDefault false;
      dates = "monthly";
    };

    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}")
      config.nix.registry;
  };
  
  programs = {
    fuse.userAllowOther = true;
    git.enable = true;
    nix-index-database.comma.enable = true;
    nix-index.enableZshIntegration = false;
    nix-index.enableBashIntegration = false;
  };
  hardware.enableRedistributableFirmware = true;

  # Increase open file limit for sudoers
  security.pam.loginLimits = [
    {
      domain = "@wheel";
      item = "nofile";
      type = "soft";
      value = "524288";
    }
    {
      domain = "@wheel";
      item = "nofile";
      type = "hard";
      value = "1048576";
    }
  ];
}
