{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libarchive
    lm_sensors
  ];
}
