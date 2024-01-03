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
    distrobox
    
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
