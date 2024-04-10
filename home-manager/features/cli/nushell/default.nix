{ pkgs, lib, ... }:
with lib;
{
  programs.starship.enableNushellIntegration = true;
  programs.atuin.enableNushellIntegration = true;

  programs.nushell = {
    enable = true;
    configFile.source = ./config.nu;
    envFile.source = ./env.nu;
  };
  xdg.configFile = {
    "nushell/carapace.nu".text = (concatMapStringsSep "\n" readFile [ ./carapace.nu ]);
  };
}
