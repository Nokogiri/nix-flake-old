{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./global
    ./features/cli/nix-stuff.nix
    ./features/common-ui
    ./features/games
    #./features/desktop/gtk.nix
    ./features/media
    ./features/helix
    #./features/desktop/eww
    ./features/hyprland
    #    ./features/sway
    inputs.nur.nixosModules.nur
  ];

  nixpkgs.overlays = [
    inputs.hyprland.overlays.hyprland-extras
    inputs.hyprwm-contrib.overlays.default
  ];
  home.packages = with pkgs; [

    handlr-regex

    transmission-qt
    snapcast
    dwarfs
    fuse-overlayfs
    obsidian

    xournalpp

    # graphics stuff
    gimp
    krita
    ];

}
