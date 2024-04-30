{ pkgs, ... }:
{
  security = {
    sudo-rs = {
      enable = true;
      wheelNeedsPassword = false;
      extraRules = [
        {
          users = [ "nokogiri" ];
          commands = [
            {
              command = ''${pkgs.linuxPackages.cpupower}/bin/cpupower ""'';
              options = [ "NOPASSWD" ];
            }
            {
              command = ''${pkgs.profile-sync-daemon}/bin/psd-overlay-helper ""'';
              options = [ "NOPASSWD" ];
            }
          ];
        }
      ];
    };
    doas = {
      enable = false;
      wheelNeedsPassword = true;
      extraRules = [
        {
          groups = [ "wheel" ];
          noPass = false;
          keepEnv = true;
          persist = true;
        }
        {
          users = [ "nokogiri" ];
          noPass = false;
          keepEnv = true;
          persist = true;
        }
      ];
    };
  };
}
