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
    #../common/optional/greetd.nix
    ../common/optional/sddm.nix
    ../common/optional/networkmanager.nix
    ../common/optional/pipewire.nix
    #../common/optional/podman.nix
    ../common/optional/quietboot.nix
    ../common/optional/ryzen-ppd.nix
    ../common/optional/sane.nix
    ../common/optional/systemd-boot.nix
    ../common/optional/zramswap.nix

    ../common/users/nokogiri.nix

    ./firewall.nix
    ./nfs.nix
    ./power.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      #outputs.overlays.master-pkgs
    ];
    config = { allowUnfree = true; };
  };

  networking = {
    hostName = "mowteng";
    hostId = "05fc191c";
  };

  # aagl
  networking.hosts = {
      "0.0.0.0" = [
        "overseauspider.yuanshen.com"
        "log-upload-os.hoyoverse.com"
        "log-upload-os.mihoyo.com"
        "dump.gamesafe.qq.com"

        "log-upload.mihoyo.com"
        "devlog-upload.mihoyo.com"
        "uspider.yuanshen.com"
        "sg-public-data-api.hoyoverse.com"
        "public-data-api.mihoyo.com"

        "prd-lender.cdp.internal.unity3d.com"
        "thind-prd-knob.data.ie.unity3d.com"
        "thind-gke-usc.prd.data.corp.unity3d.com"
        "cdp.cloud.unity3d.com"
        "remote-config-proxy-prd.uca.cloud.unity3d.com"
      ];
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
    lm_sensors
    exfatprogs
    #doas-sudo-shim
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

  services.acpid.enable = true;
  services.acpid.logEvents = true;
  services.fwupd.enable = true;
  services.logind.extraConfig = ''
    RuntimeDirectorySize=8G
  '';
  services.udev.extraRules = ''
      ENV{ID_FS_USAGE}=="filesystem|other|crypto", ENV{UDISKS_FILESYSTEM_SHARED}="1"
    '';

  systemd.tmpfiles.rules = [ "D /tmp/.X11-unix 1777 nokogiri root" ];
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "22.05";
}
