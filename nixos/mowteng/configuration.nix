# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix

    ../common/global
    ../common/optional/bluetooth.nix
    ../common/optional/desktop-common.nix
    ../common/optional/fprintd.nix
    ../common/optional/networkmanager.nix
    ../common/optional/pipewire.nix
    ../common/optional/quietboot.nix
    ../common/optional/ryzen-ppd.nix
    ../common/optional/sane.nix
    ../common/optional/systemd-boot.nix
    ../common/optional/zramswap.nix

    ../common/users/nokogiri.nix

    #./auto-cpufreq.nix
    ./firewall.nix
    ./nfs.nix
    ./power.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
    ];
    config = { allowUnfree = true; };
  };

  networking = {
    hostName = "mowteng";
    hostId = "05fc191c";
  };

  boot.kernel.sysctl = {
    # maximum possible
    "vm.max_map_count" = 2147483642; # 524288;
  };

  environment.variables.AMD_VULKAN_ICD = lib.mkDefault "RADV";

  environment.systemPackages = with pkgs; [
    amdctl
    gparted
    xorg.xhost
    exfatprogs
    Imaginarium
  ];

  hardware = {
    opengl = {
      enable = true;
      extraPackages = with pkgs; [ mangohud ];
      extraPackages32 = with pkgs; [ mangohud ];
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  powerManagement = {
    cpuFreqGovernor = "ondemand";
    powertop.enable = false;
  };

  programs.firefox.nativeMessagingHosts.ff2mpv = true;
  programs = {
    light.enable = true;
    mtr.enable = true;
  };

  location = {
    latitude = 50.9787;
    longitude = 11.03283;
  };

  services.acpid.enable = false;
  services.acpid.logEvents = false;
  services.fwupd.enable = true;
  services.logind = {
    extraConfig = ''
      RuntimeDirectorySize=8G
    '';
    powerKey = "ignore";
    powerKeyLongPress = "poweroff";
  };
  services.udev.extraRules = ''
    ENV{ID_FS_USAGE}=="filesystem|other|crypto", ENV{UDISKS_FILESYSTEM_SHARED}="1"
  '';

  systemd.tmpfiles.rules = [ "D /tmp/.X11-unix 1777 nokogiri root" ];
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "22.05";
}
