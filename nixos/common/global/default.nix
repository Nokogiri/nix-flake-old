# This file (and the global directory) holds config that i use on all hosts
{ lib, inputs, outputs, pkgs, config, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.nix-index-database.nixosModules.nix-index
    inputs.hyprland.nixosModules.default
    ./applications.nix
    ./console.nix
    ./fish.nix
    ./locale.nix
    ./openssh.nix
    ./please.nix
    ./sops.nix
    ./sudo.nix
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
    pathsToLink = [ "/share/nix-direnv" "/share/bash-completion" ];
  };

  nix = {
    settings = {
      substituters = [
        "https://nix-community.cachix.org"
        #"https://ezkea.cachix.org"
        #"https://anyrun.cachix.org"
        "https://hyprland.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
        "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
      ];
      trusted-users = [ "root" "@wheel" "nokogiri" ];
      auto-optimise-store = lib.mkDefault true;
      experimental-features = [ "nix-command" "flakes" "auto-allocate-uids" ];
      warn-dirty = false;
      keep-outputs = false;
      keep-derivations = true;
    };
    #package = pkgs.nixUnstable;
    gc = {
      automatic = lib.mkDefault true;
      dates = "monthly";
    };

    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;
  };

  programs.zsh.enable = true;
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
