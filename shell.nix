{ pkgs ? import <nixpkgs> {} }:

# Drop into a shell with GHC 9.6.7 + cabal + the libraries servant-snap
# depends on, for modernization work.
#
#   nix-shell
#   cabal build lib:servant-snap

let
  ghc = pkgs.haskell.packages.ghc967.ghcWithPackages (p: with p; [
    aeson
    attoparsec
    base64-bytestring
    bytestring
    case-insensitive
    containers
    filepath
    http-api-data
    http-media
    http-types
    io-streams
    mmorph
    mtl
    network-uri
    servant
    servant-server
    snap
    snap-core
    snap-server
    string-conversions
    tagged
    text
    transformers
    word8
  ]);
in
pkgs.mkShell {
  buildInputs = [
    ghc
    pkgs.cabal-install
  ];
}
