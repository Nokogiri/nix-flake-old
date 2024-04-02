{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ../global
    ../features/cli/nix-stuff.nix
    ../features/desktop
    ../features/games
    ../features/helix
    ../features/media
    #../features/sway
    ../features/hyprland
    inputs.nur.nixosModules.nur
  ];

  #nixpkgs.overlays = [  ];

  #programs.zsh.enable = true;
  services.mpris-proxy.enable = true;
  #nixpkgs.config.permittedInsecurePackages = [ "electron-24.8.6" "electron-25.9.0" ];
  home.packages = with pkgs; [
    #distrobox
    #ueberzugpp
    #obsidian
    logseq
    handlr-regex

    appimage-run
    transmission-qt
    #chromium
    #nss
    xournalpp

    # graphics stuff
    gimp
    krita
    mypaint
  ];

}
