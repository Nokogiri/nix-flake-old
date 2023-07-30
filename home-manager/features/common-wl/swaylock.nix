{ pkgs, ... }:{
  programs.swaylock = {
    enable = true; 
    settings = {
      hide-keyboard-layout = true;
      
      image = "~/.local/share/wallpaper.png";
      indicator-radius = 310;
      font-size = "28";
      color = "282a36";
      inside-color = "1F202A44";
      line-color = "1F202A";
      ring-color = "bd93f9";
      text-color = "f8f8f2";
      layout-bg-color = "1F202A";
      layout-text-color = "f8f8f2";

      inside-clear-color = "6272a444";
      line-clear-color = "1F202A";
      ring-clear-color = "6272a4";
      text-clear-color = "1F202A";

      inside-ver-color = "bd93f944";
      line-ver-color = "1F202A";
      ring-ver-color = "bd93f9";
      text-ver-color = "1F202A";

      inside-wrong-color = "ff555544";
      line-wrong-color = "1F202A";
      ring-wrong-color = "ff5555";
      text-wrong-color = "1F202A";

      bs-hl-color = "ff5555";
      key-hl-color = "50fa7b";

      text-caps-lock-color = "f8f8f2";
    };
  };
}
