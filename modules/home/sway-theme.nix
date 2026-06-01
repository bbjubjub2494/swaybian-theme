{ flake, inputs }:
{ pkgs, ... }:
let
  inherit (flake.packages.${pkgs.stdenv.hostPlatform.system}) byuns_eepies sleepy_no2;
in
{
  programs.swaylock.settings = {
    image = byuns_eepies;
    scaling = "stretch";
  };

  wayland.windowManager.sway.config = {
    inherit (flake.lib) colors;
    menu =
      with flake.lib.menu.colors;
      "wmenu -i -l 20 -M \\${selection.background} -m \\${selection.foreground} -N \\${normal.background} -n \\${normal.foreground} -S \\${selection.background} -s \\${selection.foreground}";

    output."*".bg = "${sleepy_no2} stretch";
  };

  xsession.windowManager.i3.config = {
    inherit (flake.lib) colors;
    menu =
      with flake.lib.menu.colors;
      "dmenu -i -l 20 -nb \\${normal.background} -nf \\${normal.foreground} -sb \\${selection.background} -sf \\${selection.foreground}";
  };
}
