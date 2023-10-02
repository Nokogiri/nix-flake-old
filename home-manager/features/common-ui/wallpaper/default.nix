{ config, pkgs, ... }:
#let wallFile = "${config.home.homeDirectory}/.local/share/wallpaper/default.png";
#in
{
  home.packages = [ pkgs.swaybg pkgs.swww ];

  xdg.dataFile."wallpaper" = {
    source = ./wallpaper;
    recursive = true;
  };
  xdg.dataFile."wallpaper/default.png".source = ./wallpaper/FireWatch_1.png;

  #systemd.user.services.swaybg = {
  #  Unit = { Description = "swaybg"; };
  #  Service = {
  #    Type = "simple";
  #    ExecStart = "${pkgs.swaybg}/bin/swaybg -i ${wallFile} -m fill";
  #    Restart = "on-failure";
  #  };
  #};
}
