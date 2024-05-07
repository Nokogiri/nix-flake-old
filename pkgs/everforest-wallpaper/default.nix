{ fetchFromGitHub , stdenvNoCC }:

stdenvNoCC.mkDerivation {
  pname = "everforest-wallpaper";
  version = "20240507";

  src = fetchFromGitHub {
    owner = "Apeiros-46B";
    repo = "everforest-walls";
    rev = "0ae7c31e34385b9af33a74a707b9c4acbfef4d8c";
    hash = "sha256-RKebxSl3c18cqGQgiF/wOHezmwjEYKn+YhgEAc9nJPc=";
  };

  installPhase = ''

    runHook preInstall

    mkdir -p $out/share/wallpaper/everforest
    cp -a */*.png $out/share/wallpaper/everforest/
    
    runHook postInstall
  '';
}
