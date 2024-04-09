{ pkgs, ... }: {
  home.packages = with pkgs; [
    nixfmt-classic
    nix-diff
    nix-direnv
    nix-top
    nix-tree
    nix-pin
  ];
}
