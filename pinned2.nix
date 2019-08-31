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
