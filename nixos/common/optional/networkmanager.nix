{ pkgs, ... }:
{
  networking.networkmanager = {
    wifi.backend = "iwd";
    wifi.powersave = true;
    enable = true;
    logLevel = "ERR";
    plugins = [ ];
  };
  environment.systemPackages = [ pkgs.networkmanagerapplet ];
}
