{ inputs, pkgs, ... }:
{
  imports = [
    ../global
    ../features/cli/nix-stuff.nix
    ../features/desktop
    ../features/games
    ../features/media
    ../features/nvim
    ../../stylix/home.nix
    ../features/sway
    #../features/hyprland

    inputs.nur.nixosModules.nur
  ];

  #nixpkgs.overlays = [  ];

  services.mpris-proxy.enable = true;
  home.packages = with pkgs; [
    handlr-regex

    appimage-run
    transmission_4-qt6
    #transmission_4-gtk
    xournalpp

    # graphics stuff
    gimp
    krita
    mypaint
    #walker
  ];
}
