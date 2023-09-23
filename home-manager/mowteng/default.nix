{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ../global
    ../features/cli/nix-stuff.nix
    ../features/common-ui
    ../features/games
    ../features/helix
    ../features/media
    ../features/sway
    inputs.nur.nixosModules.nur
  ];

  nixpkgs.overlays = [
    inputs.hyprland-git.overlays.hyprland-extras
    inputs.hyprwm-contrib.overlays.default
    inputs.slight.overlays.default
  ];
  home.packages = with pkgs; [
    handlr-regex

    transmission-qt
    snapcast
    dwarfs
    fuse-overlayfs
    obsidian

    nss
    xournalpp

    # graphics stuff
    #gimp
    krita
  ];

  machineType.desktop = true;
}
