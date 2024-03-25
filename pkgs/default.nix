# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'
{ pkgs ? (import ../nixpkgs.nix) { } }: {
  amdctl = pkgs.callPackage ./amdctl { };
  #cemu = pkgs.callPackage ./cemu { };
  dracula-plymouth = pkgs.callPackage ./dracula-plymouth { };
  #fastfetch = pkgs.callPackage ./fastfetch { };
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
  ryzen-ppd = pkgs.callPackage ./ryzen-ppd { };
  swayfx-unwrapped = pkgs.callPackage ./swayfx { };
}
