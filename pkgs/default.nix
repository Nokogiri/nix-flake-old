# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'
{ pkgs ? (import ../nixpkgs.nix) { } }: {
  amdctl = pkgs.callPackage ./amdctl { };
  cemu = pkgs.callPackage ./cemu { };
  dracula-plymouth = pkgs.callPackage ./dracula-plymouth { };
  fastfetch = pkgs.callPackage ./fastfetch { };
  iio-hyprland = pkgs.callPackage ./iio-hyprland { };
  iio-sensor-proxy = pkgs.callPackage ./iio-sensor-proxy { };
  nix-stray-roots = pkgs.callPackage ./nix-stray-roots { };
  pass-fuzzel = pkgs.callPackage ./pass-fuzzel { };
  pass-wofi = pkgs.callPackage ./pass-wofi { };
  openmw = pkgs.libsForQt5.callPackage ./openmw { };
  portmod = pkgs.callPackage ./portmod { };
  #RBDOOM-3-BFG = pkgs.callPackage ./RBDOOM-3-BFG { };
  #RBDOOM-3-BFG-vk = pkgs.callPackage ./RBDOOM-3-BFG-vk { };
  ryzen-ppd = pkgs.callPackage ./ryzen-ppd { };
}
