{ pkgs, ... }: {
  home.packages = with pkgs; [
    ranger
    calibre
    ffmpegthumbnailer
    fontforge
    #haskellPackages.pandoc-cli.out
    odt2txt
    patool
    poppler_utils
    w3m
    xlsx2csv
  ];
}
