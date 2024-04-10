{
  config,
  lib,
  pkgs,
  ...
}:
{

  home.packages = [ pkgs.nwg-drawer ];
  xdg.configFile."nwg-drawer/drawer.css".source = ./drawer.css;
}
