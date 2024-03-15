{ inputs, lib, config, pkgs, ... }: {
  services = {
    gnome-keyring = {
      enable = true;
      components = [ "secrets" ];
    };
    gpg-agent = {
      enable = true;
        pinentryPackage = pkgs.pinentry-qt;
    };
  };
}
