{ pkgs, ... }:
{
  systemd.user.services = {
    rot8 = {
      Unit = {
        Description = "Rot8 Screen";
      };
      Service = {
        Type = "simple";
        ExecStart = "${pkgs.rot8}/bin/rot8 --display eDP-1 --touchscreen 1386:18888:Wacom_HID_49C8_Finger --normalization-factor 1e1 --threshold 0.7";
        Restart = "on-failure";
      };
      Install = {
        WantedBy = [ "sway-session.target" ];
      };
    };
    polkit-kde-authentication-agent-1 = {
      Unit = {
        Description = "Auth Agent";
      };
      Service = {
        Type = "simple";
        ExecStart = "${pkgs.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1";
        Restart = "on-failure";
      };
      Install = {
        WantedBy = [ "sway-session.target" ];
      };
    };
  };
}
