{ pkgs, config, inputs, ... }: {
  imports = [ ./steam.nix ];

  home.sessionVariables.WINEDEBUG = "-all";

  home.packages = with pkgs; [
    # aagl

    #anime-game-launcher

    dwarfs
    fuse-overlayfs
    psmisc
    bubblewrap

    # general
    cartridges
    gamescope
    mangohud
    vkbasalt
    #prismlauncher
    heroic
    protonup-qt
    protontricks
    gnome.zenity
    kbfs
    moonlight-qt

    # native packaged games
    #airshipper # veloren
    #arx-libertatis
    #dhewm3
    #eduke32
    gzdoom
    #openjk
    #sm64ex
    #config.nur.repos.kira-bruneau.pokemmo-installer

    # emulation
    #inputs.nixpkgs-stable.legacyPackages.x86_64-linux.cemu
    cemu
    dolphinEmuMaster
    #retroarch
    #libretro.beetle-pce-fast
    #libretro.beetle-psx-hw
    #libretro.dolphin
    #libretro.flycast
    #libretro.mgba
    #libretro.mupen64plus
    #libretro.parallel-n64
    #libretro.play
    #libretro.ppsspp
    #libretro.snes9x
    pcsx2
    ppsspp
  ];
}
