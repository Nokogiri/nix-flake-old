{ pkgs, inputs, lib, config, outputs, ... }: {
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
}
