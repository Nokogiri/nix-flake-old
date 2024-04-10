{ config, ... }:
{
  sops.secrets."wg_private/${config.networking.hostName}" = {
    sopsFile = ../../common/secrets.yaml;
    owner = config.users.users.systemd-network.name;
  };
  sops.secrets."wg_psk/${config.networking.hostName}" = {
    sopsFile = ../../common/secrets.yaml;
    owner = config.users.users.systemd-network.name;
  };
  networking.firewall = {
    allowedUDPPorts = [ 51872 ];
    trustedInterfaces = [ "wg0" ];
  };
  systemd.network.netdevs."90-wireguard" = {
    netdevConfig = {
      Kind = "wireguard";
      Name = "calvin";
    };
    wireguardConfig = {
      PrivateKeyFile = config.sops.secrets."wg_private/${config.networking.hostName}".path;
      ListenPort = 51872;
    };
    wireguardPeers = [
      {
        wireguardPeerConfig = {
          AllowedIPs = [
            "10.200.200.0/24"
            "::/1"
          ];
          Endpoint = "46.38.240.252:51871";
          PersistentKeepalive = 25;
          PresharedKeyFile = config.sops.secrets."wg_psk/${config.networking.hostName}".path;
          PublicKey = "IqYGE/5SPmMPEs0us6ZkH5RlePZ2KJDpGxBgjCBnQno=";
        };
      }
    ];
  };
}
