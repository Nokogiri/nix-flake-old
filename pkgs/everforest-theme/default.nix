{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  gtk-engine-murrine,
}:
stdenvNoCC.mkDerivation {
  pname = "everforest-theme";
  version = "0-unstable-2024-05-03";
  srcs = [
    (fetchFromGitHub {
      owner = "Fausto-Korpsvart";
      repo = "Everforest-GTK-Theme";
      rev = "8481714cf9ed5148694f1916ceba8fe21e14937b";
      hash = "sha256-NO12ku8wnW/qMHKxi5TL/dqBxH0+cZbe+fU0iicb9JU=";
      name = "Everforest-GTK";
    })
    (fetchFromGitHub {
      owner = "binEpilo";
      repo = "materia-everforest-kvantum";
      rev = "391eb1d917dab900dc1ef16ffdff1a4546308ee4";
      hash = "sha256-5ihKScPJMDU0pbeYtUx/UjC4J08/r40mAK7D+1TK6wA=";
      name = "Everforest-Kvantum";
    })
    (fetchFromGitHub {
    owner = "Apeiros-46B";
    repo = "everforest-walls";
    rev = "0ae7c31e34385b9af33a74a707b9c4acbfef4d8c";
    hash = "sha256-RKebxSl3c18cqGQgiF/wOHezmwjEYKn+YhgEAc9nJPc=";
    name = "Everforest-Wallpaper";
    })
  ];
  sourceRoot = ".";

  propagatedUserEnvPkgs = [ gtk-engine-murrine ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/themes
    mkdir -p $out/share/icons
    mkdir -p $out/share/Kvantum/Everforest
    mkdir -p $out/share/wallpaper/Everforest

    cp -a Everforest-GTK/themes $out/share
    cp -a Everforest-GTK/icons $out/share
    cp -a Everforest-Kvantum/MateriaEverforestDark/MateriaEverforestDark.kvconfig $out/share/Kvantum/Everforest/Everforest.kvconfig
    cp -a Everforest-Kvantum/MateriaEverforestDark/MateriaEverforestDark.svg $out/share/Kvantum/Everforest/Everforest.svg
    cp -a Everforest-Wallpaper/*/*.png $out/share/wallpaper/Everforest/
    runHook postInstall
  '';
}
