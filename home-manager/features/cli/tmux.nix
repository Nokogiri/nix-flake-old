{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    escapeTime = 0;
    extraConfig = ''
      set -g mouse on
      set -ga terminal-overrides ",xterm-kitty:Tc"
      bind-key a last-window
      bind-key ^D detach-client

      set-option -g set-titles on
      set-option -g set-titles-string '[#S:#I #T] #W'
      set-option -g status-position top

      set-option -g repeat-time 0
    '';
    newSession = true;
    prefix = "C-a";
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.dracula;
        extraConfig = ''
          set -g @dracula-border-contrast true
          set -g @dracula-show-empty-plugins false
          set -g @dracula-show-flags true

          set -g @dracula-show-powerline true
          set -g @dracula-refresh-rate 10
          set -g @dracula-plugins "cpu-usage ram-usage"
        '';
      }
    ];
    shortcut = "a";
    terminal = "tmux-256color";
  };
}
