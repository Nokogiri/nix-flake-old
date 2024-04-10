{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libnotify
    swaynotificationcenter
  ];
  systemd.user.services.swaynotificationcenter = {
    Unit = {
      Description = "swaynotificationcenter";
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.swaynotificationcenter}/bin/swaync";
      Restart = "on-failure";
    };
  };
}
