{ pkgs, lib, config, ... }:
lib.mkMerge [
  {
    home.packages = with pkgs; [ unar jq fd ripgrep fzf zoxide ];
    programs.yazi = {
      enable = true;
      settings = {
        manager = {
          sort_by = "alphabetical";
          sort_dir_first = true;
          show_symlink = true;
        };
        opener = {
          text = [{
            exec = "$EDITOR $@";
            block = true;
          }];
        };
      };
    };
  }
  (lib.mkIf config.machineType.desktop {
    home.packages = with pkgs; [ unar jq fd ripgrep fzf zoxide ];
  })
]
