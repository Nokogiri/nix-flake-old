{ inputs, lib, ... }:
{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "sm64ex" ];
  home.packages = [
    #inputs.nixpkgs-old.legacyPackages.x86_64-linux.openmw
    inputs.nixpkgs-stable.legacyPackages.x86_64-linux.openjk
    #inputs.nixpkgs-stable.legacyPackages.x86_64-linux.sm64ex
  ];
}
