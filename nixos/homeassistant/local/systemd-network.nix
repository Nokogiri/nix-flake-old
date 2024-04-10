{
  imports = [ ../../common/optional/systemd-network.nix ];
  networking.useDHCP = false;
  #systemd.network.netdevs."qbridge" = {
  #  netdevConfig = {
  #    #MACAddress = "68:5b:35:95:d3:8b";
  #    Name = "br0";
  #    Kind = "bridge";
  #  };
  #};
  #systemd.network.networks."10_bind" = {
  #  matchConfig.Name = [ "en*" ];
  #  bridge = [ "br0" ];
  #};
  systemd.network.networks."wired" = {
    matchConfig.Name = [ "en*" ];
    DHCP = "yes";
    dhcpV4Config = {
      UseDomains = true;
    };
    networkConfig = {
      IPv6AcceptRA = "no";
      MulticastDNS = true;
    };
  };
}
