{ pkgs, ... }:
{
  xdg.configFile."fish/themes/Dracula.theme".source = ./Dracula.theme;
  programs.carapace.enableFishIntegration = true;
  programs.atuin.enableFishIntegration = true;
  programs.zoxide.enableFishIntegration = true;
  home.packages = [ pkgs.any-nix-shell ];
  programs.fish = {
    enable = true;
    functions = {
      fish_greeting = "";
    };
    plugins = [
      {
        name = "fzf";
        src = pkgs.fetchFromGitHub {
          owner = "PatrickF1";
          repo = "fzf.fish";
          rev = "8d99f0caa30a626369541f80848ffdbf28e96acc";
          sha256 = "nTiFD8vWjafYE4HNemyoUr+4SgsqN3lIJlNX6IGk+aQ=";
        };
        #}
        #{
        #  name = "nix";
        #  src = pkgs.fetchFromGitHub {
        #    owner = "kidonng";
        #    repo  = "nix.fish";
        #    rev = "ad57d970841ae4a24521b5b1a68121cf385ba71e";
        ##    sha256 = "GMV0GyORJ8Tt2S9wTCo2lkkLtetYv0rc19aA5KJbo48=";
        #  };
      }
    ];
    shellAbbrs = {
      ipa = "ip -color -brief a";
      ls = "eza";
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
      #kssh = "kitty +kitten ssh";
      # Clear screen and scrollback
      clear = "printf '\\033[2J\\033[3J\\033[1;1H'";
    };
    interactiveShellInit = ''
      fish_config theme choose Dracula
      any-nix-shell fish --info-right | source
      fzf_configure_bindings --history=\cr
    '';
  };
}
