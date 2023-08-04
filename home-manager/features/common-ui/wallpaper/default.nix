{ config, pkgs, ... }:
let wallFile = "${config.home.homeDirectory}/.local/share/wallpaper.png";
in {
  home.packages = [ pkgs.swaybg ];

  xdg.dataFile."wallpaper.png".source = ./Totoro-Dracula.png;

  systemd.user.services.swaybg = {
    Unit = { Description = "swaybg"; };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.swaybg}/bin/swaybg -i ${wallFile} -m fill";
      Restart = "on-failure";
    };
  };
}
