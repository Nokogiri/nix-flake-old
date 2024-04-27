{ pkgs, config, ... }:
{
  boot = {
    plymouth = {
      enable = true;
      #theme = "dracula";
      #themePackages = [ pkgs.dracula-plymouth ];
    };
    loader.timeout = 0;
    kernelParams = [
      "fbcon=nodefer"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "quiet"
      "splash"
      "vt.global_cursor_default=0"
    ];
    consoleLogLevel = 0;
    initrd.verbose = false;
  };
}
