{ flake, inputs }:
{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [ flake.modules.common.lib ];

  options = {
    themes.swaybian.sway.enable = lib.mkEnableOption "setting up the Swaybian Sway theme";
    themes.swaybian.i3.enable = lib.mkEnableOption "setting up the Swaybian i3 theme";
  };

  config = lib.mkMerge [
    (lib.mkIf config.themes.swaybian.sway.enable {
      programs.swaylock.settings = {
        image = config.lib.swaybian-theme.art.byuns_eepies;
        scaling = "stretch";
      };

      wayland.windowManager.sway.config = {
        inherit (flake.lib) colors;
        menu =
          with flake.lib.menu.colors;
          "wmenu -i -l 20 -M \\${selection.background} -m \\${selection.foreground} -N \\${normal.background} -n \\${normal.foreground} -S \\${selection.background} -s \\${selection.foreground}";

        output."*".bg = "${config.lib.swaybian-theme.art.sleepy_no2} stretch";
      };
    })
    (lib.mkIf config.themes.swaybian.i3.enable {
      xsession.windowManager.i3.config = {
        inherit (flake.lib) colors;
        menu =
          with flake.lib.menu.colors;
          "dmenu -i -l 20 -nb \\${normal.background} -nf \\${normal.foreground} -sb \\${selection.background} -sf \\${selection.foreground}";
      };
    })
  ];
}
