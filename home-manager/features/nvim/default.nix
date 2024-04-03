{ pkgs, ... }:{
  home.packages = [ pkgs.neovide pkgs.lunarvim ];
  programs.neovim = {
    enable = true;
  };
}
