{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nixfmt-rfc-style
    nix-diff
    nix-direnv
    nix-top
    nix-tree
    nix-pin
  ];
}
