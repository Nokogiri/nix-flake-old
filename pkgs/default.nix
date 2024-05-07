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
  iio-hyprland = pkgs.callPackage ./iio-hyprland { };
  Imaginarium = pkgs.callPackage ./Imaginarium { };
  nix-stray-roots = pkgs.callPackage ./nix-stray-roots { };
  nwg-drawer = pkgs.callPackage ./nwg-drawer { };
  rofi-emoji = pkgs.callPackage ./rofi-emoji { };
  ryzen-ppd = pkgs.callPackage ./ryzen-ppd { };
}
