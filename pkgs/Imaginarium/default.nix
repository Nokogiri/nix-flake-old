{ lib
, formats
, stdenvNoCC
}:

stdenvNoCC.mkDerivation rec {
  pname = "Imaginarium";
  version = "9.9.9";

  src = ./src;

  installPhase = ''
    mkdir -p $out/
    cp -r Imaginarium/* $out/
  '';
  
  meta = with lib; {
    description = "just images";
    homepage = "https://none.com";
    license = licenses.mit;
  };
}
