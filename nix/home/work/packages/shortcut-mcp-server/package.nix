# stolen from smootz!
{
  lib,
  stdenv,
  nodejs,
  makeWrapper,
}:

stdenv.mkDerivation rec {
  pname = "shortcut-mcp-server";
  version = "0.15.2";

  # Skip unpacking since we are not using any source files
  dontUnpack = true;

  nativeBuildInputs = [ makeWrapper ];

  # This package doesn't actually build the mcp-server-shortcut, it only wraps
  # a self-contained NodeJS environment to run it via npx.
  #
  # This literally is just to see how far I can go without installing NodeJS globally.
  installPhase = ''
    mkdir -p $out/bin
    makeWrapper ${nodejs}/bin/npx $out/bin/mcp-server-shortcut \
      --add-flags "@shortcut/mcp@${version}" \
      --prefix PATH : ${nodejs}/bin
  '';

  meta = {
    description = "MCP server for Shortcut project management integration";
    homepage = "https://github.com/useshortcut/mcp-server-shortcut";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "shortcut-mcp-server";
  };
}
