{ lib, pkgs, ... }:
{
  services.swayosd.enable = true;
  systemd.user.services.swayosd.Service.ExecStart = lib.mkForce "${pkgs.swayosd}/bin/swayosd-server";
}
