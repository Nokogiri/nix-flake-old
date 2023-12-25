{ config, pkgs, ... }:{
  home.packages = [ pkgs.swaybg pkgs.swww ];

  xdg.dataFile."wallpaper" = {
    source = ./wallpaper;
    recursive = true;
  };
}
