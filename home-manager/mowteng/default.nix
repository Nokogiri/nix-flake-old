{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ../global
    ../features/cli/nix-stuff.nix
    ../features/common-ui
    ../features/games
    ../features/helix
    ../features/media
    #../features/sway
    ../features/hyprland
    inputs.nur.nixosModules.nur
  ];

  nixpkgs.overlays = [ inputs.slight.overlays.default inputs.hyprland-contrib.overlays.default ];

  #nixpkgs.config.permittedInsecurePackages = [ "electron-24.8.6" ];

  home.packages = with pkgs; [
    handlr-regex

    transmission-qt
    #obsidian
    chromium
    nss
    xournalpp
    #python3

    # graphics stuff
    #gimp
    krita
    mypaint
  ];

}
