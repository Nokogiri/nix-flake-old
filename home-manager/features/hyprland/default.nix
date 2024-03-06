{ lib, inputs, pkgs, config, ... }: {
  imports = [
    ./hyprpaper
    inputs.hyprland.homeManagerModules.default
    ./config.nix
    ./hyprlock.nix
    ./swaylock.nix
    ./swaync.nix
    ./swayosd.nix
    ./user-services.nix
    ./waybar
    ./wlogout.nix
  ];

  nixpkgs.overlays = [ inputs.hyprland-contrib.overlays.default ];

  home.packages = with pkgs; [ hyprpicker hyprpaper grimblast hyprprop iio-hyprland scratchpad ];

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

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = { enable = true; };
  };
}
