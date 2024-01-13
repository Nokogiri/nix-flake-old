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

  nixpkgs.overlays = [ inputs.slight.overlays.default inputs.hyprland-contrib.overlays.default ];
  services.mpris-proxy.enable = true;
  nixpkgs.config.permittedInsecurePackages = [ "electron-24.8.6" "electron-25.9.0" ];
  home.packages = with pkgs; [
    #distrobox
    obsidian
    handlr-regex

    floorp

    transmission-qt
    chromium
    nss
    xournalpp

    vscode
    # graphics stuff
    krita
    mypaint
  ];

}
