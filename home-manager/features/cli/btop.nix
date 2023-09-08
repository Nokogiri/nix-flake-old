{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "dracula";
      theme_background = false;
      swap_disk = false;
      use_fstab = true;
      only_physicla = true;

      disks_filter =
        "exclude=tmp /nix/store /var/lib /var/log /export/Vault3.1 /export/Downloads /export/Vault1.1 /boot/efi /boot / /home";
    };
  };
}
