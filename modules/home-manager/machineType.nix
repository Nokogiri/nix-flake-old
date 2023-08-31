{ config, pkgs, lib, ...}:

#let
#  cfg = machineType;
#in

with lib;

{
  options.machineType = {
    desktop = mkOption {
      default = false;
      type = with types; bool;
      description = ''
        Is it a Desktop (GUI)?
      '';
    };
    #server = mkOption {
    #  default = true;
    #  type = with types; bool;
    #  description = ''
    #    Is it a Server (CLI)?
    #  '';
    #};    
  };
}
