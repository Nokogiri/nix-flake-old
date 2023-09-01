{ pkgs, ... }: {
  xdg.configFile."fish/themes/Dracula.theme".source = ./Dracula.theme;
  programs.fish = {
    enable = true;
    functions = { fish_greeting = ""; };
    plugins = [{
      name = "fzf";
      src = pkgs.fetchFromGitHub {
        owner = "PatrickF1";
        repo = "fzf.fish";
        rev = "f9e2e48a54199fe7c6c846556a12003e75ab798e";
        sha256 = "CqRSkwNqI/vdxPKrShBykh+eHQq9QIiItD6jWdZ/DSM=";
      };
    }
    #{
    #  name = "man";
    #  src = pkgs.fetchFromGitHub {
    #    owner = "PatrickF1";
    #    repo = "colored_man_pages.fish";
    #    rev = "f885c2507128b70d6c41b043070a8f399988bc7a";
    #    sha256 = "ii9gdBPlC1/P1N9xJzqomrkyDqIdTg+iCg0mwNVq2EU=";
    #  };
    #:}
    #{
    #  name = "catppuccin";
    #  src = pkgs.fetchFromGitHub {
    #    owner = "catppuccin";
    #    repo = "fish";
    #    rev = "b90966686068b5ebc9f80e5b90fdf8c02ee7a0ba";
    #    sha256 = "wQlYQyqklU/79K2OXRZXg5LvuIugK7vhHgpahpLFaOw=";
    #  };
    #}
      ];
    shellAbbrs = {

      ipa = "ip -color -brief a";
      ls = "exa";
      n = "nix";
      nd = "nix develop -c $SHELL";
      ns = "nix shell";
      nsn = "nix shell nixpkgs#";
      nb = "nix build";
      nbn = "nix build nixpkgs#";
      nf = "nix flake";

      nr = "nixos-rebuild --flake .";
      nrs = "nixos-rebuild --flake . switch";
      snr = "doas nixos-rebuild --flake .";
      snrs = "doas nixos-rebuild --flake . switch";
      hm = "home-manager --flake .";
      hms = "home-manager --flake . switch";

    };
    shellAliases = {
      cat = "bat --paging=never --decorations=never";
      # Get ip
      getip = "curl ifconfig.me";
      # SSH with kitty terminfo
      kssh = "kitty +kitten ssh";
      # Clear screen and scrollback
      clear = "printf '\\033[2J\\033[3J\\033[1;1H'";
    };
    interactiveShellInit = ''
      fish_config theme choose Dracula
      fzf_configure_bindings --history=\cr
      set --global KITTY_INSTALLATION_DIR "${pkgs.kitty}/lib/kitty"
      set --global KITTY_SHELL_INTEGRATION enabled
      source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
      set --prepend fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"
    '';
  };
}
