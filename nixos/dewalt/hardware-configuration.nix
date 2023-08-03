{ lib, config, modulesPath, pkgs, ... }: {

  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    extraModprobeConfig = ''
      blacklist pcspkr
      options usb-storage quirks=090c:1000:,152d:0578:u,0bc2:2322:u
    '';
    extraModulePackages = with config.boot.kernelPackages; [
      cpupower
    ];
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "applespi" "applesmc" ];
      kernelModules = [ "i915" ];
    };
    kernelModules = [ "kvm-amd" ];
    kernelPackages = pkgs.linuxPackages_latest;
    loader.efi.efiSysMountPoint = "/boot/efi";
    supportedFilesystems = [ "btrfs" ];
    tmp.cleanOnBoot = true;
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/c8743301-ac42-42f6-9570-12f2f177148d";
      fsType = "btrfs";
      options = [ "subvol=nixos/root" "compress=zstd" ];
    };

    "/var/lib" = {
      device = "/dev/disk/by-uuid/c8743301-ac42-42f6-9570-12f2f177148d";
      fsType = "btrfs";
      options = [ "subvol=nixos/lib" "compress=zstd" ];
    };

    "/var/log" = {
      device = "/dev/disk/by-uuid/c8743301-ac42-42f6-9570-12f2f177148d";
      fsType = "btrfs";
      options = [ "subvol=nixos/log" "compress=zstd" ];
    };

    "/nix" = {
      device = "/dev/disk/by-uuid/c8743301-ac42-42f6-9570-12f2f177148d";
      fsType = "btrfs";
      options = [ "subvol=nixos/store" "compress=zstd" ];
    };

    "/home/nokogiri" = {
      device = "/dev/disk/by-uuid/c8743301-ac42-42f6-9570-12f2f177148d";
      fsType = "btrfs";
      options = [ "subvol=@nokogiri" "compress=zstd" ];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/8C9D-013B";
      fsType = "vfat";
      options = [
        "fmask=0022"
        "dmask=0022"
        "codepage=437"
        "iocharset=ascii"
        "shortname=mixed"
        "utf8"
      ];
    };
  };

  swapDevices = [{
    device = "/dev/disk/by-uuid/93ae631f-7897-4c18-afd6-95d17c14ae2c";
    priority = 100;
  }];

  zramSwap = {
    enable = true;
    priority = 5;
  };

  hardware = {
    cpu.intel.updateMicrocode = true;
    sensor.iio.enable = true;
    steam-hardware.enable = true;
    uinput.enable = true;
    xpadneo.enable = true;
  };

  sound.enable = true;

  nixpkgs.hostPlatform = "x86_64-linux";
}
