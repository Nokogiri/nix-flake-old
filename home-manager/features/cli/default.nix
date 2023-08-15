{ pkgs, ... }: {
  imports = [
    ./bash.nix
    ./bat
    ./btop.nix
    ./fish.nix
    ./fzf.nix
    ./git.nix
    ./gpg-agent.nix
    ./lsd.nix
    ./micro
    ./pfetch.nix
    ./ranger.nix
    ./ssh.nix
    ./starship.nix
    ./tmux.nix
  ];

  home.sessionVariables = {
    PATH = "$PATH:$HOME/.local/bin";
    EDITOR = "${pkgs.micro}/bin/micro";
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

    fastfetch
    bc # Calculator
    #btop # same
    dfc # better df
    mediainfo
    gdu
    exa # Better ls
    ripgrep # Better grep
    fd # Better find
    file
    jq # JSON pretty printer and manipulator
    tealdeer
    ps_mem

    nix-stray-roots

  ];
}
