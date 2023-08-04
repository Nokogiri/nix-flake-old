# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)

{ inputs, outputs, lib, config, pkgs, ... }: {

  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix
    ./fixes
    ../common/global
    ../common/optional/avahi.nix
    ../common/optional/bluetooth.nix
    ../common/optional/desktop-common.nix
    ../common/optional/fonts.nix
    ../common/optional/greetd.nix
    ../common/optional/grub-efi.nix
    ../common/optional/networkmanager.nix
    ../common/optional/pipewire.nix
    ../common/optional/quietboot.nix
    ../common/optional/sane.nix
    #../common/optional/systemd-boot.nix
    ../common/optional/xdg-portal.nix
    
    ../common/users/nokogiri.nix

    ./local
  ];

  nixpkgs = {
    overlays = [ outputs.overlays.additions outputs.overlays.modifications ];
    config = { allowUnfree = true; };
  };

  networking = {
    hostName = "dewalt";
    hostId = "05fc919c";
  };

    environment.systemPackages = with pkgs; [
      lm_sensors
    exfatprogs
  ];

  hardware = {
    opengl = {
      enable = true;
      extraPackages = with pkgs; [ mangohud vaapiIntel ];
      extraPackages32 = with pkgs; [ mangohud ];
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  powerManagement = {
    cpuFreqGovernor = "powersave";
    powertop.enable = false;
  };

  programs = {
    light.enable = true;
    mtr.enable = true;
  };

  location = {
    latitude = 50.9787;
    longitude = 11.03283;
  };

  services.logind.extraConfig = ''
    RuntimeDirectorySize=8G
  '';
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
