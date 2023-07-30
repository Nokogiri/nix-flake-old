{ pkgs, ... }:{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects; 
    settings = {
      hide-keyboard-layout = true;
      
      image = "~/.local/share/wallpaper.png";
      indicator-radius = 192;
      font = "FiraCode Nerd Font";
      font-size = "32";
      color = "282a36";
      inside-color = "1F202A33";
      line-color = "1F202A33";
      ring-color = "bd93f933";
      text-color = "f8f8f2";
      layout-bg-color = "1F202A";
      layout-text-color = "f8f8f2";

      inside-clear-color = "6272a433";
      line-clear-color = "1F202A33";
      ring-clear-color = "6272a4";
      text-clear-color = "1F202A";

      inside-ver-color = "bd93f933";
      line-ver-color = "1F202A11";
      ring-ver-color = "bd93f9";
      text-ver-color = "1F202A";

      inside-wrong-color = "ff555533";
      line-wrong-color = "1F202A11";
      ring-wrong-color = "ff5555";
      text-wrong-color = "1F202A";

      bs-hl-color = "ff5555";
      key-hl-color = "50fa7b";

      text-caps-lock-color = "f8f8f2";

      effect-blur = "4x3";
      clock = true;
      indicator-idle-visible = true;
      screenshots = true;
      timestr = "%H:%M";
    };
  };
}
