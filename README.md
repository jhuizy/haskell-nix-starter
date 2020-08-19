# Haskell nix starter

This is a template to be used for bootstrapping new haskell projects using [nix](https://nixos.org/).

The sample program is a simply "hello world" style [scotty](https://hackage.haskell.org/package/scotty) application.

# Dev environment

To spin up a new dev environment, simply run `nix-shell`.
This will set up a new environment with correct versions of `ghc`, `cabal`, `ghcid`, `hlint`, `brittany` and `ghcide` setup.

# Run tests

The test suite can be run using

```bash
nix-shell --command "cabal test"
```

# Building

The program can be run (with automatic reloading) using 

```bash
# Enter into a new nix shell
nix-shell

ghcid -c 'cabal new-repl budget' -T ':main'
```

# Deployment

TODO

# To do

- [ ] Create deployment/release process and document (build docker images using nix-build?)
- [ ] Create alias for spinning up ghcid and running test suite