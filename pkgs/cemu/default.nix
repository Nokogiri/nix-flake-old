{
  lib,
  stdenv,
  fetchFromGitHub,
  fetchpatch,
  addOpenGLRunpath,
  wrapGAppsHook,
  cmake,
  glslang,
  nasm,
  pkg-config,

  SDL2,
  boost,
  cubeb,
  curl,
  fmt_9,
  glm,
  gtk3,
  hidapi,
  imgui,
  libpng,
  libusb1,
  libzip,
  libXrender,
  pugixml,
  rapidjson,
  vulkan-headers,
  wayland,
  wxGTK32,
  zarchive,
  gamemode,
  vulkan-loader,

  nix-update-script,
}:

let
  #cemu 2.0-65 doesn't build with imgui 1.90.2 or newer
  imgui' = imgui.overrideAttrs {
    version = "1.90.1";
    src = fetchFromGitHub {
      owner = "ocornut";
      repo = "imgui";
      rev = "v1.90.1";
      sha256 = "sha256-gf47uLeNiXQic43buB5ZnMqiotlUfIyAsP+3H7yJuFg=";
    };
  };
in
stdenv.mkDerivation rec {
  pname = "cemu";
  version = "2.0-65";

  src = fetchFromGitHub {
    owner = "cemu-project";
    repo = "Cemu";
    rev = "v${version}";
    hash = "sha256-jsDmxol3zZMmpo4whDeUXTzfO+QVK/h6lItXTyJyoak=";
  };

  patches = [
    # glslangTargets want SPIRV-Tools-opt to be defined:
    # > The following imported targets are referenced, but are missing:
    # > SPIRV-Tools-opt
    ./cmakelists.patch
    # Remove on next release
    # https://github.com/cemu-project/Cemu/pull/1076
    (fetchpatch {
      url = "https://github.com/cemu-project/Cemu/commit/72aacbdcecc064ea7c3b158c433e4803496ac296.patch";
      hash = "sha256-x+ZVqXgGRSv0VYwJAX35C1p7PnmCHS7iEO+4k8j0/ug=";
    })
  ];

  nativeBuildInputs = [
    addOpenGLRunpath
    wrapGAppsHook
    cmake
    glslang
    nasm
    pkg-config
  ];

  buildInputs = [
    SDL2
    boost
    cubeb
    curl
    fmt_9
    glm
    gtk3
    hidapi
    imgui'
    libpng
    libusb1
    libzip
    libXrender
    pugixml
    rapidjson
    vulkan-headers
    wayland
    wxGTK32
    zarchive
  ];

  cmakeFlags = [
    "-DCMAKE_C_FLAGS_RELEASE=-DNDEBUG"
    "-DCMAKE_CXX_FLAGS_RELEASE=-DNDEBUG"
    "-DENABLE_VCPKG=OFF"
    "-DENABLE_FERAL_GAMEMODE=ON"

    # PORTABLE:
    # "All data created and maintained by Cemu will be in the directory where the executable file is located"
    "-DPORTABLE=OFF"
  ];

  preConfigure =
    with lib;
    let
      tag = last (splitString "-" version);
    in
    ''
      rm -rf dependencies/imgui
      ln -s ${imgui'}/include/imgui dependencies/imgui
      substituteInPlace src/Common/version.h --replace " (experimental)" "-${tag} (experimental)"
      substituteInPlace dependencies/gamemode/lib/gamemode_client.h --replace "libgamemode.so.0" "${gamemode.lib}/lib/libgamemode.so.0"
    '';

  installPhase = ''
    runHook preInstall

    install -Dm755 ../bin/Cemu_release $out/bin/Cemu
    ln -s $out/bin/Cemu $out/bin/cemu

    mkdir -p $out/share/applications
    substitute ../dist/linux/info.cemu.Cemu.desktop $out/share/applications/info.cemu.Cemu.desktop \
      --replace "Exec=Cemu" "Exec=$out/bin/Cemu"

    install -Dm644 ../dist/linux/info.cemu.Cemu.metainfo.xml -t $out/share/metainfo
    install -Dm644 ../src/resource/logo_icon.png $out/share/icons/hicolor/128x128/apps/info.cemu.Cemu.png

    runHook postInstall
  '';

  preFixup =
    let
      libs = [ vulkan-loader ] ++ cubeb.passthru.backendLibs;
    in
    ''
      gappsWrapperArgs+=(
        --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath libs}"
      )
    '';

  passthru.updateScript = nix-update-script { };

  meta = with lib; {
    description = "Cemu is a Wii U emulator";
    homepage = "https://cemu.info";
    license = licenses.mpl20;
    platforms = [ "x86_64-linux" ];
    maintainers = with maintainers; [
      zhaofengli
      baduhai
    ];
    mainProgram = "cemu";
  };
}
