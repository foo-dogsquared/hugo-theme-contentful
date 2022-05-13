{ pkgs ? import <nixpkgs> { } }:

with pkgs;

mkShell { packages = [
  asciidoctor
  go
  hugo
]; }
