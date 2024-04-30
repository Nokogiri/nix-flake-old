{ pkgs, ... }:
{
  services = {
    gnome-keyring = {
      enable = true;
      components = [ "secrets" ];
    };
    gpg-agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-gnome3;
    };
  };
}
