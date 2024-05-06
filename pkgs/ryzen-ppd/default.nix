{
  lib,
  pkgs,
  fetchgit,
  python311Packages,
  ryzenadj,
  wrapGAppsHook,
}:
#with python311Packages;

python311Packages.buildPythonApplication {
  #rec {
  pname = "ryzen-ppd";
  version = "0.5";

  src = fetchgit {
    url = "https://codeberg.org/Nokogiri/ryzen-ppd.git";
    rev = "f1fe7aba834b32e117a33a33fe5b36e4192469a2";
    sha256 = "sha256-+yDdkL7DzgEFp5ncfg86h3eCtlK5mACdAW4N0rJoXyA=";
  };

  propagatedBuildInputs = [
    python311Packages.dbus-python
    python311Packages.pygobject3
    python311Packages.setuptools
    python311Packages.dbus-next
    ryzenadj
  ];
  buildInputs = [ ryzenadj ];
  nativeBuildInputs = [
    ryzenadj
    wrapGAppsHook
  ];
  postInstall = ''
    install -Dm644 $src/scripts/systemd/ryzen-ppd.service -t $out/lib/systemd/system
    substituteInPlace $out/lib/systemd/system/ryzen-ppd.service --replace "/usr/bin/ryzen-ppd" "$out/bin/ryzen-ppd"
    substituteInPlace $out/lib/python3.11/site-packages/ryzen_ppd/cpu.py --replace "libryzenadj.so" "${pkgs.ryzenadj}/lib/libryzenadj.so"
  '';
  doCheck = false;

  meta = with lib; {
    description = "CHANGE";
    homepage = "https://github.com/CHANGE/ryzen-ppd";
    license = licenses.gpl3;
  };
}
