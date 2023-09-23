{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ../global
    ../features/cli/nix-stuff.nix
    ../features/common-ui
    ../features/media
    ../features/sway
    inputs.nur.nixosModules.nur
  ];

  nixpkgs.overlays = [
    #inputs.hyprland-git.overlays.hyprland-extras
    #inputs.hyprwm-contrib.overlays.default
  ];
  home.packages = with pkgs; [

    handlr-regex

    transmission-qt
    obsidian

  ];

}
