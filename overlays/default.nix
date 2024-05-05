# This file defines overlays
{ inputs, ... }:
{
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    #foot = prev.foot.overrideAttrs (old: { patches = (old.patches or []) ++ [ ./foot-fs-transparency.patch ]; })
    #fprintd = prev.fprintd.overrideAttrs (_: {
    #  mesonCheckFlags = [
    #    "--no-suite"
    #    "fprintd:TestPamFprintd"
    #  ];
    #});
  };
  #unstable-smallish = self: super: {
  #  chromium = inputs.unstable-small.legacyPackages.x86_64-linux.chromium;
  #};
  #master-pkgs = self: super: {

  #heroic-unwrapped = inputs.masterpkgs.legacyPackages.x86_64-linux.heroic-unwrapped;
  #heroic = inputs.masterpkgs.legacyPackages.x86_64-linux.heroic;
  #tlp = inputs.masterpkgs.legacyPackages.x86_64-linux.tlp;
  #};
}
