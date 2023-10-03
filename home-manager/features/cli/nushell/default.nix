{
  programs.starship.enableNushellIntegration = true;

  programs.nushell = {
    enable = true;
    envFile.source = ./env.nu ;
  };
  #home.configFile = {
  #  "nushell/env.nu".text = (concatMapStringsSep "\n" readFile [ ./env.nu ]);
  #};
}
