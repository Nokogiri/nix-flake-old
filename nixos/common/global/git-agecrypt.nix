{ pkgs, inputs, ... }:
{
  environment.systemPackages = [ inputs.git-agecrypt.packages.x86_64-linux.default ];
  
}
