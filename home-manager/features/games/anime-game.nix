{ inputs, ... }:{
  imports = [ inputs.aagl.nixosModules.default ];
  programs.anime-game-launcher.enable = true; # Adds launcher and /etc/hosts rules
  programs.anime-borb-launcher.enable = true;
  programs.honkers-railway-launcher.enable = true;
  programs.honkers-launcher.enable = true;
}
