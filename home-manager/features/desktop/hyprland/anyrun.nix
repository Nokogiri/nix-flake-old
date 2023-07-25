{ inputs, pkgs, ... }: {
  imports = [ inputs.anyrun.homeManagerModules.anyrun ];

  programs.anyrun = {
    enable = true;
    config = {
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        dictionary
        kidex
        randr
        rink
        shell
        stdin
        symbols
        translate
      ];
      width = { fraction = 0.3; };
      #position = "top";
      #verticalOffset = { absolute = 0; };
      hideIcons = false;
      ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = false;
      closeOnClick = false;
      showResultsImmediately = true;
      maxEntries = 10;
    };
    extraCss = ''
      #window {
        background-color: rgba(0, 0, 0, 0);
      }

      box#main {
        border-radius: 10px;
        background-color: @theme_bg_color;
      }

      list#main {
        background-color: rgba(0, 0, 0, 0);
        border-radius: 10px;
      }

      list#plugin {
        background-color: rgba(0, 0, 0, 0);
      }

      label#match-desc {
        font-size: 24px;

      }

      label#plugin {
        font-size: 28px;
      }
    '';

    extraConfigFiles."randr.ron".text = ''
      Config(
        prefix: ":dp",
        max_entries: 5,
      )
    '';
    #    extraConfigFiles."some-plugin.ron".text = ''
    #      Config(
    #        // for any other plugin
    #        // this file will be put in ~/.config/anyrun/some-plugin.ron
    #        // refer to docs of xdg.configFile for available options
    #      )
    #    '';
  };

}
