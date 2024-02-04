{ inputs, lib, config, pkgs, ... }:
let cfg = config.wayland.windowManager.sway.config;
in {
  imports = [ ./config.nix ./user-services.nix ./waybar ../common-wl ../common-ui ../common-wl/anyrun.nix ];

  #home.packages = with pkgs; [
  #  swaybg
  #vulkan-validation-layers
  #];

  programs = {
    fish.loginShellInit = ''
      if test (tty) = "/dev/tty1"
        exec systemd-cat --identifier=sway sway &> /dev/null
      end
    '';
    zsh.loginExtra = ''
      if [ "$(tty)" = "/dev/tty1" ]; then
        exec sway &> /dev/null
      fi
    '';
    zsh.profileExtra = ''
      if [ "$(tty)" = "/dev/tty1" ]; then
        exec sway &> /dev/null
      fi
    '';
  };

  #
  # systemd.user.services.rot8 = {
  #    Unit = { Description = "Rot8 Screen"; };
  #    Service = {
  #      Type = "simple";
  #      ExecStart = "${pkgs.rot8}/bin/rot8 --display eDP-1 --touchscreen 1386:18888:Wacom_HID_49C8_Finger --normalization-factor 1e1 --threshold 0.7";
  #      Restart = "on-failure";
  #    };
  #    Install = { WantedBy = [ "sway-session.target" ]; };
  #  };
  programs.waybar.systemd = {
    enable = true;
    target = "sway-session.target";
  };
}
