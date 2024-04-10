{
  lib,
  config,
  pkgs,
  ...
}:
# This is just an example, you should generate yours with nixos-generate-config and put it in here.
{
  boot = {
    blacklistedKernelModules = [
      "b43"
      "snd_had_intel"
    ];
    consoleLogLevel = 3;
    extraModprobeConfig = ''
      options hid_apple fnmode=2 swap_fn_leftctrl=1 iso_layout=0
    '';
    #  options usb-storage quirks=090c:1000:,152d:0578:u,0bc2:2322:u
    #'';
    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "ehci_pci"
        "ahci"
        "firewire_ohci"
        "usb_storage"
        "usbhid"
        "sd_mod"
        "sdhci_pci"
      ];
      kernelModules = [ "hid-apple" ];
    };
    kernelModules = [ "kvm-intel" ];
    kernelPackages = pkgs.linuxPackages;
    kernelParams = [
      "acpi_backlight=video"
      "intremap=off"
      "i915.fastboot=1"
      "i915.enable_fbc=1"
      "i915_enable_rc6=7"
      "noibrs"
      "noibpb"
      "nopti"
      "nospectre_v2"
      "nospectre_v1"
      "l1tf=off"
      "nospec_store_bypass_disable"
      "no_stf_barrier"
      "mds=off"
      "tsx=on"
      "tsx_async_abort=off"
      "mitigations=off"
      "sdhci.debug_quirks2=4"
      "mitigations=off"
    ];
    supportedFilesystems = [ "btrfs" ];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/4611724f-8582-4a42-9a29-9e11c599ace9";
    fsType = "btrfs";
    options = [
      "subvol=nixos/root"
      "compress=zstd:6"
    ];
  };

  fileSystems."/var/lib" = {
    device = "/dev/disk/by-uuid/4611724f-8582-4a42-9a29-9e11c599ace9";
    fsType = "btrfs";
    options = [
      "subvol=nixos/lib"
      "compress=zstd:6"
    ];
  };

  fileSystems."/var/log" = {
    device = "/dev/disk/by-uuid/4611724f-8582-4a42-9a29-9e11c599ace9";
    fsType = "btrfs";
    options = [
      "subvol=nixos/log"
      "compress=zstd:6"
    ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/4611724f-8582-4a42-9a29-9e11c599ace9";
    fsType = "btrfs";
    options = [
      "subvol=home"
      "compress=zstd:6"
    ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/4611724f-8582-4a42-9a29-9e11c599ace9";
    fsType = "btrfs";
    options = [
      "subvol=nixos/store"
      "compress=zstd:6"
    ];
  };

  fileSystems."/media/Vault1.1" = {
    device = "/dev/disk/by-uuid/10a2e8f7-656f-414a-bddf-e3d5e6a6d7a0";
    fsType = "btrfs";
    options = [
      "compress=zstd:6"
      "noatime"
      "nofail"
    ];
  };
  fileSystems."/media/Vault3.1" = {
    device = "/dev/disk/by-uuid/aee8a1c9-f265-4103-ba79-869773e4e99c";
    fsType = "btrfs";
    options = [
      "compress=zstd:6"
      "noatime"
      "nofail"
    ];
  };
  swapDevices = [ { device = "/dev/disk/by-uuid/0cd7afe0-c1e1-4d9f-8172-48f677434826"; } ];

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/67E3-17ED";
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
  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/6e0db31b-59b0-48e4-ae1e-acf978c22a66";
    fsType = "ext4";
  };

  #zramSwap = {
  #
  #};

  hardware = {
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    enableRedistributableFirmware = true;
    bluetooth.enable = false;
  };
  # Set your system kind (needed for flakes)
  nixpkgs.hostPlatform = "x86_64-linux";
}
