# This file defines overlays
{ inputs, ... }: {
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
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
  };

  #master-pkgs = self: super: {

  #heroic-unwrapped = inputs.masterpkgs.legacyPackages.x86_64-linux.heroic-unwrapped;
  #heroic = inputs.masterpkgs.legacyPackages.x86_64-linux.heroic;
  #tlp = inputs.masterpkgs.legacyPackages.x86_64-linux.tlp;
  #};
}
