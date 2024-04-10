{ pkgs, ... }:
{
  home.packages = with pkgs; [ wvkbd ];
  systemd.user.services.wvkbd = {
    Unit = {
      Description = "wvkbd";
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.wvkbd}/bin/wvkbd-mobintl -H 600 -L 420 --hidden";
      Restart = "on-failure";
    };
  };
}
