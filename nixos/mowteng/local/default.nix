{
  imports = [
    ./udisks.nix
    ./sysctl.nix
    ./steamcontroller.nix
    ./tmpfiles.nix
    ./tlp.nix
    ./nfs-client.nix
    ./firewall.nix
    #./bees.nix
  ];
  virtualisation.waydroid.enable = false;
}
