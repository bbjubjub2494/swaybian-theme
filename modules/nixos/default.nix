{ flake, inputs }:
{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (flake.packages.${pkgs.stdenv.hostPlatform.system}) where-is-my-sddm-theme;
in
{
  imports = [ flake.modules.common.lib ];

  options = {
    themes.swaybian.sddm.enable = lib.mkEnableOption "setting up the Swaybian SDDM theme";
  };

  config = lib.mkIf config.themes.swaybian.sddm.enable {
    environment.systemPackages = [ where-is-my-sddm-theme ];
    services.displayManager.sddm = {
      theme = "where_is_my_sddm_theme";
      extraPackages = [ where-is-my-sddm-theme ];
    };
  };
}
