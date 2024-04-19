{ pkgs, ... }:
{
  home.packages = [ pkgs.ouch ];

  xdg.configFile."yazi/plugins/ouch.yazi" = {
    source = ./ouch.yazi;
  };
}
