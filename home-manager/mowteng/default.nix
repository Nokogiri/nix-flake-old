{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ../global
    ../features/cli/nix-stuff.nix
    ../features/desktop
    ../features/desktop/sway
    ../features/games
    ../features/helix
    ../features/media
    inputs.nur.nixosModules.nur
  ];

  #nixpkgs.overlays = [  ];

  services.mpris-proxy.enable = true;
  nixpkgs.config.permittedInsecurePackages = [ "electron-24.8.6" "electron-25.9.0" ];
  home.packages = with pkgs; [
    #distrobox
    #obsidian
    logseq
    handlr-regex

    appimage-run
    transmission-qt
    chromium
    nss
    xournalpp

    # graphics stuff
    gimp
    krita
    mypaint
  ];

}
