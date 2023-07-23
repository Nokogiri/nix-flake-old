{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation {
  name = "dracula-plymouth";
  version = "2021-01-14";

  src = fetchFromGitHub {
    repo = "plymouth";
    owner = "dracula";
    rev = "37aa09b27ecee4a825b43d2c1d20b502e8f19c96";
    hash = "sha256-7YwkBzkAND9lfH2ewuwna1zUkQStBBx4JHGw3/+svhA=";
  };

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/plymouth/themes/
    cp -r $src/dracula $out/share/plymouth/themes/dracula
    substituteInPlace $out/share/plymouth/themes/dracula/*.plymouth --replace '/usr' "$out"

    runHook postInstall
  '';

  meta = with lib; {
    description = "Dracula for Plymouth";
    homepage = "https://draculatheme.com/plymouth";
    license = licenses.mit;
    maintainers = with maintainers; [ nokogiri ];
    platforms = platforms.all;
  };
}
