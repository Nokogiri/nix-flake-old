{ pkgs, ... }:
{
  programs.foot = {
    enable = true;
    settings = {
      cursor = {
        style = "beam";
        blink = "yes";
        beam-thickness = 1.5;
        color = "ff0000 00ff00";
      };
      main = {
        #font = "CaskaydiaCove Nerd Font:size=12";
        dpi-aware = "no";
        pad = "10x10";
      };
      scrollback = {
        indicator-position = "fixed";
        indicator-format = "percentage";
      };
      #colors = {
      #  alpha = "0.9";
      #  background = "282A36";
      #  foreground = "f8f8f2";

      ## Normal/regular colors (color palette 0-7)
      #  regular0 = "21222c"; # black
      #  regular1 = "ff5555"; # red
      #  regular2 = "50fa7b"; # green
      #  regular3 = "f1fa8c"; # yellow
      #  regular4 = "bd93f9"; # blue
      #  regular5 = "ff79c6"; # magenta
      #  regular6 = "8be9fd"; # cyan
      #  regular7 = "f8f8f2"; # white#

      ## Bright colors (color palette 8-15)
      #  bright0 = "6272a4"; # bright black
      #  bright1 = "ff6e6e"; # bright red
      #  bright2 = "69ff94"; # bright green
      #  bright3 = "ffffa5"; # bright yellow
      #  bright4 = "d6acff"; # bright blue
      #  bright5 = "ff92df"; # bright magenta
      #  bright6 = "a4ffff"; # bright cyan
      #  bright7 = "ffffff"; # bright white

      ## Misc colors
      #  selection-foreground = "ffffff";
      #  selection-background = "44475a";
      # jump-labels=<regular0> <regular3>          # black-on-yellow
      # scrollback-indicator=<regular0> <bright4>  # black-on-bright-blue
      # search-box-no-match=<regular0> <regular1>  # black-on-red
      # search-box-match=<regular0> <regular3>     # black-on-yellow
      #  urls = "8be9fd";
      #};
    };
  };
}
