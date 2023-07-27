{ lib, inputs, pkgs, config, ... }: {
  imports = [
    ../desktop/common
    ../desktop/common/wayland
    inputs.hyprland.homeManagerModules.default
    ./config.nix
    ./iio-hyprland.nix
    ./swaync.nix
    ./wallpaper.nix
    #./hyprpaper.nix
    ./wvkbd.nix
  ];

  home.packages = with pkgs; [
    inputs.hyprpicker.packages."x86_64-linux".hyprpicker
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

  wayland.windowManager.hyprland = {
    enable = true;
    #plugins = [ inputs.hyprland-plugins.packages.x86_64-linux.hyprbars ];
    xwayland = {
      enable = true;
      hidpi = false;
    };
    recommendedEnvironment = true;
  };
}
