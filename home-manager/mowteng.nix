{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./global
    ./features/cli/nix-stuff.nix
    ./features/desktop/common
    ./features/firefox
    ./features/games
    #./features/desktop/gtk.nix
    ./features/media
    ./features/helix
    ./features/desktop/eww
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
    
           
    #libsForQt5.kio-extras
    #kio-fuse
    #libsForQt5.kdegraphics-thumbnailers
    #libsForQt5.kimageformats
    #libsForQt5.ffmpegthumbs
    #libsForQt5.dolphin

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
