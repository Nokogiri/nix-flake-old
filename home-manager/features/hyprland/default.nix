{ lib, inputs, pkgs, config, ... }: {
  imports = [
    ../common-ui
    ../common-wl
    inputs.hyprland.homeManagerModules.default
    ./config.nix
    ./iio-hyprland.nix
  ];

  home.packages = with pkgs; [
    #inputs.hyprpicker.packages."x86_64-linux".hyprpicker
    grimblast
    hyprprop
    scratchpad
  ];

  programs = {
    fish.loginShellInit = ''
      if test (tty) = "/dev/tty1"
        exec systemd-cat --identifier=Hyprland Hyprland &> /dev/null
      end
    '';
    zsh.loginExtra = ''
      if [ "$(tty)" = "/dev/tty1" ]; then
        exec systemd-cat --identifier=Hyprland Hyprland &> /dev/null
      fi
    '';
    zsh.profileExtra = ''
      if [ "$(tty)" = "/dev/tty1" ]; then
        exec systemd-cat --identifier=Hyprland Hyprland &> /dev/null
      fi
    '';
  };

  programs.waybar = {
    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };
  };

  systemd.user.services = {
    wvkbd = { Install = { WantedBy = [ "hyprland-session.target" ]; }; };
    swaynotificationcenter = {
      Install = { WantedBy = [ "hyprland-session.target" ]; };
    };
    swaybg = { Install = { WantedBy = [ "hyprland-session.target" ]; }; };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = { enable = true; };
  };
}
