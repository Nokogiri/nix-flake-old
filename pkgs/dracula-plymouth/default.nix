{
  lib,
  stdenv,
  fetchFromGitHub,
  fetchgit,
}:

stdenv.mkDerivation {
  name = "dracula-plymouth";
  version = "2021-01-14";

  #src = fetchFromGitHub {
  #  repo = "plymouth";
  #  owner = "dracula";
  #  rev = "37aa09b27ecee4a825b43d2c1d20b502e8f19c96";
  #  hash = "sha256-7YwkBzkAND9lfH2ewuwna1zUkQStBBx4JHGw3/+svhA=";
  #};

  src = fetchgit {
    url = "https://forge.fishoeder.net/Nokogiri/dracula-plymouth";
    rev = "83ba3ff0f490fb64dc225c4d82b0a19edc0db770";
    hash = "sha256-PWnI3OoIlHmQ1HIvcKQk1A+bbb6WsIiWvkWIqJ3CNS8=";
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
