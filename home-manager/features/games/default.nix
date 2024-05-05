{
  pkgs,
  ...
}:
{
  imports = [ ./mangohud.nix ./steam.nix ];

  home.sessionVariables.WINEDEBUG = "-all";

  home.packages = with pkgs; [

    dwarfs
    fuse-overlayfs
    psmisc
    bubblewrap

    # general
    #cartridges
    gamescope
    mangohud
    vkbasalt
    #prismlauncher
    heroic
    #gogdl
    #protonup-qt
    #protontricks
    #moonlight-qt

    # native packaged games
    #airshipper # veloren
    dhewm3
    rbdoom-3-bfg
    gzdoom
    sm64ex
    vkquake
    yquake2
    yquake2-all-games

    # emulation
    #inputs.nixpkgs-stable.legacyPackages.x86_64-linux.cemu
    cemu
    dolphinEmuMaster
    retroarch
    #libretro.beetle-pce-fast
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
    ryujinx
  ];
}
