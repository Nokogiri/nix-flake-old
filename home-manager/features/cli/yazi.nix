{ pkgs, lib, config, ... }: 
lib.mkMerge [{
  home.packages = with pkgs; [ unar jq fd ripgrep fzf zoxide ];
  programs.yazi = {
    enable = true;
    settings = {
      sort_by = "natural";
      sort_dir_first = true;
      show_symlink = true;
    };
  };
}
(lib.mkIf config.machineType.desktop  {
  home.packages = with pkgs; [ unar jq fd ripgrep fzf zoxide ];
})]
