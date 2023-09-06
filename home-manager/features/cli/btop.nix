{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "dracula";
      theme_background = false;
      swap_disk = false;
      use_fstab = true;
      only_physicla = true;

      disks_filter = "exclude=tmp /nix/store /var/lib /var/log /export/extHDD /export/Downloads /export/webdav /boot/efi /boot";
    };
  };
}
