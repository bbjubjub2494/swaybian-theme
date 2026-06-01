{ flake, inputs }:
{ pkgs, ... }:
let
  inherit (flake.packages.${pkgs.stdenv.hostPlatform.system}) where-is-my-sddm-theme;
in
{
  environment.systemPackages = [ where-is-my-sddm-theme ];
  services.displayManager.sddm = {
    theme = "where_is_my_sddm_theme";
    extraPackages = [ where-is-my-sddm-theme ];
  };
}
