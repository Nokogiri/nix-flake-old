{
  lib,
  fetchgit,
  python310Packages,
  ryzenadj,
}:
with python310Packages;

buildPythonApplication rec {
  pname = "ryzen-ppd";
  version = "0.5";

  src = fetchgit {
    url = "https://forge.fishoeder.net/Nokogiri/ryzen-ppd.git";
    rev = "a001bdfb08eb660a0ca3d012174782ca5ece7f8d";
    sha256 = "sha256-w3Nq14QJkI68E4WH0gEiyp9ZQ01mLu8uWH8icy1w6Sc=";
  };

  propagatedBuildInputs = [
    python310Packages.dbus-python
    python310Packages.pygobject3
    python310Packages.setuptools
    python310Packages.dbus-next
    ryzenadj
  ];
  buildInputs = [ ryzenadj ];
  nativeBuildInputs = [ ryzenadj ];
  postInstall = ''
    install -Dm644 $src/scripts/systemd/ryzen-ppd.service -t $out/lib/systemd/system
    substituteInPlace $out/lib/systemd/system/ryzen-ppd.service --replace "/usr/bin/ryzen-ppd" "$out/bin/ryzen-ppd"
    substituteInPlace $out/lib/python3.10/site-packages/ryzen_ppd/cpu.py --replace "libryzenadj.so" "${pkgs.ryzenadj}/lib/libryzenadj.so"
  '';
  doCheck = false;

  meta = with lib; {
    description = "CHANGE";
    homepage = "https://github.com/CHANGE/ryzen-ppd";
    license = licenses.gpl3;
    maintainers = with maintainers; [ ];
  };
}
