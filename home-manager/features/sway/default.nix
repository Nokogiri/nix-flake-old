{ inputs, lib, config, pkgs, ... }:
let cfg = config.wayland.windowManager.sway.config;
in {
  imports = [ ./config.nix ../common-wl ../common-ui ../common-wl/anyrun.nix ];

  #home.packages = with pkgs; [
  #  swaybg
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

  programs.waybar.systemd = {
    enable = true;
    target = "sway-session.target";
  };
}
