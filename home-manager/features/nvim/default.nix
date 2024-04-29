{ pkgs, ... }:
{
  home.packages = with pkgs; [
    neovide
    lua-language-server
    nixd
  ];
  programs.neovim = {
    defaultEditor = true;
    enable = true;
    plugins = with pkgs.vimPlugins; [
      mason-nvim
      nvchad
      #nvim-treesitter
      nvchad-ui
      lazy-nvim
      LazyVim
    ];
  };
}
