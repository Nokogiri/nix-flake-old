{ lib
, formats
, stdenvNoCC
, fetchFromGitHub
, qtgraphicaleffects
}:

stdenvNoCC.mkDerivation rec {
  pname = "mySDDM";
  version = "9.9.9";

  src = ./src;

  propagatedUserEnvPkgs = [ qtgraphicaleffects ];

  installPhase = ''
    mkdir -p $out/share/sddm/themes/
    cp -r mySDDM/ $out/share/sddm/themes/
  '';
  
  meta = with lib; {
    description = "minimal sddm theme based on https://github.com/surajmandalcell/Elegant-sddm";
    homepage = "https://github.com/surajmandalcell/Elegant-sddm";
    license = licenses.mit;
  };
}
