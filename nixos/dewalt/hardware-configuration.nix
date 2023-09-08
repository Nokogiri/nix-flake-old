{ lib, config, modulesPath, pkgs, ... }: {

  imports = [
    (modulesPath + "/hardware/network/broadcom-43xx.nix")
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    extraModprobeConfig = ''
      blacklist pcspkr
      options usb-storage quirks=090c:1000:,152d:0578:u,0bc2:2322:u
    '';
    extraModulePackages = with config.boot.kernelPackages; [ cpupower ];
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "applespi" "applesmc" ];
      kernelModules = [ "i915" ];
    };
    kernelModules = [ "kvm-intel" "applespi" "applesmc" ];
    kernelPackages = pkgs.linuxPackages_latest;
    loader.efi.efiSysMountPoint = "/boot/efi";
    supportedFilesystems = [ "btrfs" ];
    tmp.cleanOnBoot = true;
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/b9405584-5f46-4dbe-92a1-721e9e72170a";
      fsType = "btrfs";
      options = [ "subvol=nixos/root" "compress=zstd" ];
    };

    "/var/lib" = {
      device = "/dev/disk/by-uuid/b9405584-5f46-4dbe-92a1-721e9e72170a";
      fsType = "btrfs";
      options = [ "subvol=nixos/lib" "compress=zstd" ];
    };

    "/var/log" = {
      device = "/dev/disk/by-uuid/b9405584-5f46-4dbe-92a1-721e9e72170a";
      fsType = "btrfs";
      options = [ "subvol=nixos/log" "compress=zstd" ];
    };

    "/nix" = {
      device = "/dev/disk/by-uuid/b9405584-5f46-4dbe-92a1-721e9e72170a";
      fsType = "btrfs";
      options = [ "subvol=nixos/store" "compress=zstd" ];
    };

    "/home" = {
      device = "/dev/disk/by-uuid/b9405584-5f46-4dbe-92a1-721e9e72170a";
      fsType = "btrfs";
      options = [ "subvol=home" "compress=zstd" ];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/fb184598-96f7-4123-af47-9dc00f9581a6";
      fsType = "ext4";
    };
    "/boot/efi" = {
      device = "/dev/disk/by-uuid/5F66-17ED";
      fsType = "vfat";
    };

  };

  swapDevices = [{
    device = "/dev/disk/by-uuid/906d022c-2126-4bff-8a5e-ec337b8ba115";
    priority = 100;
  }];

  #zramSwap = {
  #  enable = true;
  #  priority = 5;
  #};

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
