{ lib
, buildGo122Module
, fetchFromGitHub
, cairo
, gobject-introspection
, gtk3
, gtk-layer-shell
, pkg-config
, wrapGAppsHook
, xdg-utils
}:

buildGo122Module rec {
  pname = "nwg-drawer";
  version = "0.4.7";

  src = fetchFromGitHub {
    owner = "nwg-piotr";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-rBb2ArjllCBO2+9hx3f/c+uUQD1nCZzzfQGz1Wovy/0=";
  };

  vendorHash = "sha256-L8gdJd5cPfQrcSXLxFx6BAVWOXC8HRuk5fFQ7MsKpIc=";

  #patches = [ ./nwg-drawer-power-icons.diff ];


  buildInputs = [ cairo gtk3 gtk-layer-shell ];
  nativeBuildInputs = [ pkg-config wrapGAppsHook gobject-introspection ];

  doCheck = false;

  preConfigure = ''
    substituteInPlace main.go --replace "/usr/share/nwg-drawer/img" "$out/share/nwg-drawer/img"
  '';
  preInstall = ''
    mkdir -p $out/share/nwg-drawer
    cp -r desktop-directories img drawer.css $out/share/nwg-drawer
  '';

  preFixup = ''
    # make xdg-open overrideable at runtime
    gappsWrapperArgs+=(
      --suffix PATH : ${xdg-utils}/bin
      --prefix XDG_DATA_DIRS : $out/share
    )
  '';

  meta = with lib; {
    description = "Application drawer for sway Wayland compositor";
    homepage = "https://github.com/nwg-piotr/nwg-drawer";
    license = licenses.mit;
    platforms = platforms.linux;
    mainProgram = "nwg-drawer";
    maintainers = with maintainers; [ plabadens ];
  };
}

