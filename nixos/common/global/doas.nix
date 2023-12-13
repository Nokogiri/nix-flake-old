{
  security = {
    sudo-rs.enable = true;
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
