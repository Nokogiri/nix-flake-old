{
  lib,
  stdenv,
  fetchFromGitHub,
  meson,
  pkg-config,
  ninja,
  dbus,
  cmake,
  systemd,
}:

stdenv.mkDerivation rec {
  pname = "iio-hyprland";
  version = "0.1";

  #src = ./src;
  src = fetchFromGitHub {
    owner = "JeanSchoeller";
    repo = "iio-hyprland";
    rev = "f31ee4109379ad7c3a82b1a0aef982769e482faf";
    hash = "sha256-P+m2OIVS8QSQmeVYVIgt2A6Q/I3zZX3bK9UNLyQtNOg=";
  };

  patches = [ ./test.patch ];

  buildInputs = [
    dbus
    systemd
  ];

  nativeBuildInputs = [
    ninja
    meson
    pkg-config
  ];
}
