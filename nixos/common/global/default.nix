# This file (and the global directory) holds config that i use on all hosts
{ lib, inputs, outputs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.nix-index-database.nixosModules.nix-index

    ./console.nix
    ./doas.nix
    ./fish.nix
    ./locale.nix
    ./nix.nix
    ./openssh.nix
    ./sops.nix

    ../fixes/fix-nfs4-kernel.nix
  ];

  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
  };

  documentation = {
    info.enable = false;
    doc.enable = false;
    dev.enable = false;
  };
  environment = {
    #persistence = {
    #  "/persist".directories = [ "/var/lib/systemd" "/var/log" "/srv" ];
    #};
    enableAllTerminfo = false;
    pathsToLink = [ "/share/nix-direnv" "/share/zsh" "/share/bash-completion" ];
  };

  programs = {
    fuse.userAllowOther = true;
    git.enable = true;
    nix-index-database.comma.enable = true;
    nix-index.enableZshIntegration = false;
    nix-index.enableBashIntegration = false;
  };
  hardware.enableRedistributableFirmware = true;

  # Increase open file limit for sudoers
  security.pam.loginLimits = [
    {
      domain = "@wheel";
      item = "nofile";
      type = "soft";
      value = "524288";
    }
    {
      domain = "@wheel";
      item = "nofile";
      type = "hard";
      value = "1048576";
    }
  ];
}
