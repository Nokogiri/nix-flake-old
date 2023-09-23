# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./sops.nix
    ../features/cli
    ../colors
    inputs.nix-colors.homeManagerModules.default
    inputs.sops-nix.homeManagerModules.sops
    inputs.nix-index-database.hmModules.nix-index
    outputs.homeManagerModules.machineType
  ];
  nixpkgs = {
    overlays = [
      outputs.overlays.modifications
      outputs.overlays.additions
      #outputs.overlays.master-pkgs
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = lib.mkDefault "nokogiri";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = lib.mkDefault "22.05";
  };

  programs = {
    home-manager.enable = true;
    git.enable = true;
    gpg.enable = true;
    neovim.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
