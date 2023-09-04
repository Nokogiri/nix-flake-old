# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'
{ pkgs ? (import ../nixpkgs.nix) { } }: {
  amdctl = pkgs.callPackage ./amdctl { };
  dracula-plymouth = pkgs.callPackage ./dracula-plymouth { };
  fastfetch = pkgs.callPackage ./fastfetch { };
  #heroic-unwrapped = pkgs.callPackage ./heroic {};
  iio-hyprland = pkgs.callPackage ./iio-hyprland { };
  nix-stray-roots = pkgs.callPackage ./nix-stray-roots { };
  pass-fuzzel = pkgs.callPackage ./pass-fuzzel { };
  pass-wofi = pkgs.callPackage ./pass-wofi { };
  openmw = pkgs.libsForQt5.callPackage ./openmw { };
  portmod = pkgs.callPackage ./portmod { };
  ryzen-ppd = pkgs.callPackage ./ryzen-ppd { };
}
