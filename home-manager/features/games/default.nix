{ pkgs, config, inputs, ... }: {
  imports = [  ./steam.nix ./wine.nix ];
  nixpkgs.overlays = [ inputs.aagl.overlays.default ];
  home.packages = with pkgs; [
    # aagl
    anime-game-launcher
    anime-borb-launcher
    honkers-railway-launcher
    honkers-launcher
    
    # general
    gamescope
    mangohud
    vkbasalt
    prismlauncher
    #lutris
    heroic
    #portmod
    protonup-qt
    # native packaged games

    #zeroad
    airshipper # veloren
    #arx-libertatis
    #dhewm3
    eduke32
    gzdoom
    openjk
    #openmw
    sm64ex
    #vkquake
    #yquake2
    #yquake2-all-games

    # emulation
    cemu
    #citra-canary
    #yuzu
    #yuzu-early-access
    #ryujinx
    dolphinEmuMaster
    retroarch
    libretro.beetle-pce-fast
    #libretro.beetle-psx
    libretro.beetle-psx-hw
    #libretro.beetle-supergrafx
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
    #rpcs3
  ];
}
