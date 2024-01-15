{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ../global
    ../features/cli/nix-stuff.nix
    ../features/common-ui
    ../features/games
    ../features/helix
    ../features/media
    ../features/sway
    #../features/hyprland
    inputs.nur.nixosModules.nur
  ];

  #nixpkgs.overlays = [  ];
  
  nixpkgs.config.permittedInsecurePackages = [ "electron-24.8.6" "electron-25.9.0" ];
  home.packages = with pkgs; [
    #distrobox
    obsidian
    handlr-regex

    transmission-qt
    chromium
    nss
    xournalpp

    # graphics stuff
    krita
    mypaint
  ];

}
