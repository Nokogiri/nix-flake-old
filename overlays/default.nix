# This file defines overlays
{ inputs, ... }:
{
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    # example = prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });
    pfetch = prev.pfetch.overrideAttrs (oldAttrs: {
      version = "unstable-2021-12-10";
      src = final.fetchFromGitHub {
        owner = "dylanaraps";
        repo = "pfetch";
        rev = "a906ff89680c78cec9785f3ff49ca8b272a0f96b";
        sha256 = "sha256-9n5w93PnSxF53V12iRqLyj0hCrJ3jRibkw8VK3tFDvo=";
      };
      # Add term option, rename de to desktop, add scheme option
      patches = (oldAttrs.patches or [ ]) ++ [ ./pfetch.patch ];
    });
    myGTK = prev.catppuccin-gtk.override {
      accents = [ "sapphire" ];
      size = "standard";
      tweaks = [ "rimless" ];
      variant = "frappe";
    };
    myQT = prev.catppuccin-kvantum.override {
      accent = "Sapphire";
      variant = "Frappe";
    };
    myFolders = prev.catppuccin-papirus-folders.override {
      accent = "sapphire";
      flavor = "frappe";      
    };
    wayland-protocols = inputs.masterpkgs.legacyPackages.x86_64-linux.wayland-protocols;
    };

  #master-pkgs = self: super: {
  #  mangohud = inputs.masterpkgs.legacyPackages.x86_64-linux.mangohud;
  #  wayland-protocols = inputs.masterpkgs.legacyPackages.x86_64-linux.wayland-protocols;
  #};
}
