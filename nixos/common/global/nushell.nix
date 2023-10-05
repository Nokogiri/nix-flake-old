{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ nushellFull nu_scripts ];
}
