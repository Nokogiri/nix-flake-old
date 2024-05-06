# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'
{
  pkgs ? (import ../nixpkgs.nix) { },
}:
{
  amdctl = pkgs.callPackage ./amdctl { };
  #cemu = pkgs.callPackage ./cemu { };
  dracula-plymouth = pkgs.callPackage ./dracula-plymouth { };
  everforest-theme = pkgs.callPackage ./everforest-theme { };
  #fastfetch = pkgs.callPackage ./fastfetch { };
  #gamescope = pkgs.callPackage ./gamescope { };
  iio-hyprland = pkgs.callPackage ./iio-hyprland { };
  Imaginarium = pkgs.callPackage ./Imaginarium { };
  nix-stray-roots = pkgs.callPackage ./nix-stray-roots { };
  nwg-drawer = pkgs.callPackage ./nwg-drawer { };
  #pass-fuzzel = pkgs.callPackage ./pass-fuzzel { };
  #pass-wofi = pkgs.callPackage ./pass-wofi { };
  #openmw = pkgs.libsForQt5.callPackage ./openmw { };
  #patool = pkgs.python310Packages.callPackage ./patool { };
  #pcsx2 = pkgs.qt6Packages.callPackage ./pcsx2 { };
  #portmod = pkgs.callPackage ./portmod { };
  rofi-emoji = pkgs.callPackage ./rofi-emoji { };
  ryzen-ppd = pkgs.callPackage ./ryzen-ppd { };
  #swayfx-unwrapped = pkgs.callPackage ./swayfx { };
}
