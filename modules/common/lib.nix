{ flake, inputs }:
{ pkgs, ... }:
let
  inherit (pkgs.stdenv.hostPlatform) system;
in
{
  # expose here for convenience
  lib.swaybian-theme = flake.lib // {
    art = {
      inherit (flake.packages.${system}) byuns_eepies sleepy_no2;
    };
  };
}
