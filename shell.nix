let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs { };
  gitignoreSource = (import sources."gitignore.nix" { inherit (pkgs) lib;}).gitignoreSource;
  project = pkgs.haskellPackages.callCabal2nix "budget" (gitignoreSource ./.) { };
in
pkgs.mkShell {
  buildInputs = with pkgs; project.env.nativeBuildInputs ++ [
    haskellPackages.cabal-install
    haskellPackages.ghcid
    haskellPackages.ghcide
    haskellPackages.cabal2nix
    haskellPackages.hlint
    haskellPackages.brittany
  ];
  shellHook = ''
    export NIX_GHC="`which ghc`"
    export NIX_GHCPKG="`which ghc`/../ghc-pkg"
    export NIX_GHC_DOCDIR="`which ghc`/../../share/doc/ghc/html"
    export NIX_GHC_LIBDIR=$( $NIX_GHC --print-libdir )
  '';
}
