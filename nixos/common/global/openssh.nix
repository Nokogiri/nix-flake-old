{ lib, config, ... }:
let
  #hosts = outputs.nixosConfigurations;
  hostname = config.networking.hostName;
  prefix = "/persist";
in
#pubKey = host: ../../${host}/ssh_host_ed25519_key.pub;
{
  services.openssh = {
    enable = true;
    # Harden
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
      GatewayPorts = "clientspecified";
    };
    # Automatically remove stale sockets
    extraConfig = ''
      StreamLocalBindUnlink yes
    '';
    # Allow forwarding ports to everywhere
    #gatewayPorts = "clientspecified";

    hostKeys = [
      {
        path = "/etc/ssh/ssh_host_ed25519_key";
        type = "ed25519";
      }
    ];
  };

  #programs.ssh = {
  # Each hosts public key
  #knownHosts = builtins.mapAttrs (name: _: {
  #publicKeyFile = pubKey name;
  #extraHostNames = lib.optional (name == hostname) "localhost";
  #}) hosts;
  #};

  # Passwordless sudo when SSH'ing with keys
  security.pam.sshAgentAuth.enable = true;
  security.pam.sshAgentAuth.authorizedKeysFiles = [ "/etc/ssh/authorized_keys.d/%u" ];
}
