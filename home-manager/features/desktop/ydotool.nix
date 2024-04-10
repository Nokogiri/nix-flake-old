{ pkgs, ... }:
{
  home.packages = [ pkgs.ydotool ];
  systemd.user.services.ydotool = {
    Unit = {
      Description = "ydotool";
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.ydotool}/bin/ydotoold";
      Restart = "on-failure";
    };
  };
}
