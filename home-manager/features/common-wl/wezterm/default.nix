{ pkgs, inputs, ... }: {
  xdg.configFile."wezterm/colors/dracula.toml".source = ./dracula.toml;
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      return {
       check_for_updates = false,
       -- front_end = "WebGpu",
       color_scheme = "Dracula",
       font_size = 12 ,
       font = wezterm.font_with_fallback {
           'JetBrainsMono Nerd Font Propo',
         },
       warn_about_missing_glyphs=false,
       enable_kitty_graphics=true,
       enable_wayland = true,
       -- default_cursor_style = "BlinkingUnderline",
       window_background_opacity = 0.9,
       hide_tab_bar_if_only_one_tab = true,
       tab_bar_at_bottom = true,
       use_fancy_tab_bar = true,
       show_tab_index_in_tab_bar = false,
       }
    '';
  };
}

