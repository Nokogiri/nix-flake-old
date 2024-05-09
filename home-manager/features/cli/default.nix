{ pkgs, config, ... }:
{
  imports = [
    ./atuin.nix
    ./bat
    ./btop.nix
    ./eza.nix
    ./fish
    ./fzf.nix
    ./git.nix
    ./gpg-agent.nix
    ./micro
    ./nushell
    ./ssh.nix
    ./starship.nix
    ./tmux.nix
    ./yazi
    #./zoxide.nix
  ];

  home.sessionVariables = {
    PATH = "$PATH:$HOME/.local/bin";
    #    MANPAGER
    XDG_CACHE_HOME = "\${HOME}/.cache";
    XDG_CONFIG_HOME = "\${HOME}/.config";
    XDG_BIN_HOME = "\${HOME}/.local/bin";
    XDG_DATA_HOME = "\${HOME}/.local/share";
  };

  home.packages = with pkgs; [
    aria2
    comma # Install and run programs by sticking a , before them
    #distrobox # Nice escape hatch, integrates docker images with my environment
    glow

    # archive stuff
    p7zip
    unzip
    unrar
    # misc
    pamixer
    ponymix
    sshfs-fuse

    trash-cli
    pfetch
    bc # Calculator
    dfc # better df
    mediainfo
    gdu
    ripgrep # Better grep
    fd # Better find
    file
    jq # JSON pretty printer and manipulator
    tealdeer
    patool
    ps_mem
    yazi
    nix-stray-roots
    #ueberzugpp
  ];
}
