{
  system,
  pkgs,
  inputs,
  flake,
  ...
}:

(inputs.home-manager.lib.homeManagerConfiguration {
  modules = [
    flake.homeModules.default
    (
      { config, ... }:
      {
        home.stateVersion = "26.05";
        home.username = "jade";
        home.homeDirectory = "/home/jade";

        themes.swaybian.i3.enable = true;
        themes.swaybian.sway.enable = true;

        xsession.windowManager.i3.enable = true;
        xsession.windowManager.i3.config = {
          startup = [
            { command = "feh --bg-scale ${config.lib.swaybian-theme.art.sleepy_no2}"; }
          ];
        };

        wayland.windowManager.sway.enable = true;
      }
    )
  ];
  inherit pkgs;
}).config.home.path
