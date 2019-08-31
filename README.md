# Pinning NixPkgs simply

does it really need to be more complicated?

## setup

yes, i agree. they should be the same output.

### builtins.fetchTarball

```nix
import (
  builtins.fetchTarball {
    url = "https://github.com/nixos/nixpkgs/archive/19c18e104b14f3203a419c5ea3159e615e312c58.tar.gz";
    sha256 = "1csy5q2zc48b1v775vbcph5d7l2rhqz112bxpfg8igl4nzmgnfd7";
  }
)
```

### nixpkgs fetchFromGitHub

```nix
let
  pkgs = import <nixpkgs> {};
in
import (
  pkgs.fetchFromGitHub {
    owner = "nixos";
    repo = "nixpkgs";
    rev = "19c18e104b14f3203a419c5ea3159e615e312c58";
    sha256 = "1csy5q2zc48b1v775vbcph5d7l2rhqz112bxpfg8igl4nzmgnfd7";
  }
)
```

## usage

```bash
$ nix run hello -f pinned.nix -c hello
Hello, world!

$ nix run hello -f pinned2.nix -c hello
Hello, world!
```

or in expressions

```diff
-{ pkgs ? import <nixpkgs> {} }:
+{ pkgs ? import ./pinned.nix {} }:
```
