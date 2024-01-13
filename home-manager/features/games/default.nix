{ pkgs, config, inputs, ... }: {
  imports = [ ./steam.nix ./wine.nix ];
  #nixpkgs.overlays = [ inputs.aagl.overlays.default ];
  home.packages = with pkgs; [
    # aagl

    #anime-game-launcher

    dwarfs
    fuse-overlayfs
    psmisc
    bubblewrap

    # general
    gamescope
    mangohud
    vkbasalt
    prismlauncher
    heroic
    protonup-qt

    # native packaged games
    airshipper # veloren
    arx-libertatis
    dhewm3
    eduke32
    gzdoom
    openjk
    sm64ex

    # emulation
    cemu
    dolphinEmuMaster
    retroarch
    libretro.beetle-pce-fast
    libretro.beetle-psx-hw
    libretro.dolphin
    libretro.flycast
    libretro.mgba
    libretro.mupen64plus
    libretro.parallel-n64
    libretro.play
    libretro.ppsspp
    libretro.snes9x
    pcsx2
    ppsspp
  ];
}
