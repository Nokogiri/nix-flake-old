{ inputs, lib, config, pkgs, ... }: {
  services = {
    gnome-keyring = {
      enable = true;
      components = [ "secrets" ];
    };
    gpg-agent = {
      enable = true;
      pinentryFlavor = "qt";
    };
  };
}
