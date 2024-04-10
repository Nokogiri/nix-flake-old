{
  pkgs,
  lib,
  config,
  ...
}:
{
  home.packages = [ pkgs.profile-sync-daemon ];

  systemd.user = {
    services = {
      psd = {
        Unit = {
          Description = "Profile-sync-daemon";
          Wants = "psd-resync.service";
          After = "winbindd.service";
        };
        Service = {
          Type = "oneshot";
          RemainAfterExit = "yes";
          ExecStart = "${pkgs.profile-sync-daemon}/bin/profile-sync-daemon startup";
          ExecStop = "${pkgs.profile-sync-daemon}/bin/profile-sync-daemon unsync";
          Environment = "LAUNCHED_BY_SYSTEMD=1";
        };
        Install = {
          WantedBy = [ "default.target" ];
        };
      };
      psd-resync = {
        Unit = {
          Description = "Timed resync";
          After = "psd.service";
          Wants = "psd-resync.timer";
          BindsTo = "psd.service";
        };
        Service = {
          Type = "oneshot";
          ExecStart = "${pkgs.profile-sync-daemon}/bin/profile-sync-daemon resync";
          Environment = "LAUNCHED_BY_SYSTEMD=1";
        };
        Install = {
          WantedBy = [ "default.target" ];
        };
      };
    };
    timers = {
      psd-resync = {
        Unit = {
          Description = "Timer for profile-sync-daemon - 1Hour";
          BindsTo = "psd.service";
        };
        Timer = {
          OnUnitActiveSec = "1h";
        };
      };
    };
  };
}
