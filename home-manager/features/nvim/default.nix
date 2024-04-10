{ pkgs, ... }:
{
  home.packages = with pkgs; [
    neovide
    lunarvim
    lua-language-server
    nixd
  ];
  programs.neovim = {
    enable = true;
  };
}
