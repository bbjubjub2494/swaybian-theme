{ flake, inputs, ... }:
let
  palette = {
    green = "#5e7259";
    dgreen = "#536857";
    lgreen = "#89997c";
    seethru = "#00000000";
    graytint = "#32323280";
    pink = "#e7bc9c";
    lpink = "#debb9f";
    dpink = "#e8ab8f";
    gray = "#5c5c5c";
    lgray = "#dfdfdf";
    yellow = "#fffad4";
    black = "#000000";
    white = "#ffffff";
  };
in
{
  inherit palette;
  colors = with palette; {
    focused.border = dpink;
    focused.background = pink;
    focused.text = white;
    focused.indicator = pink;
    focused.childBorder = lpink;

    focusedInactive.border = yellow;
    focusedInactive.background = seethru;
    focusedInactive.text = gray;
    focusedInactive.indicator = graytint;
    focusedInactive.childBorder = yellow;

    unfocused.border = gray;
    unfocused.background = graytint;
    unfocused.text = gray;
    unfocused.indicator = graytint;
    unfocused.childBorder = gray;

    urgent.border = green;
    urgent.background = dgreen;
    urgent.text = white;
    urgent.indicator = lgreen;
    urgent.childBorder = green;

    placeholder.border = black;
    placeholder.background = graytint;
    placeholder.text = white;
    placeholder.indicator = graytint;
    placeholder.childBorder = yellow;
  };

  bars.colors = with palette; {
    statusline = gray;
    background = seethru;
    focusedWorkspace = {
      border = dpink;
      background = pink;
      text = white;
    };
    activeWorkspace = {
      border = yellow;
      background = seethru;
      text = gray;
    };
    inactiveWorkspace = {
      border = seethru;
      background = seethru;
      text = gray;
    };
    urgentWorkspace = {
      border = green;
      background = dgreen;
      text = white;
    };
  };

  menu.colors = with palette; {
    normal.background = graytint;
    normal.foreground = lgray;
    selection.background = dpink;
    selection.foreground = white;
  };
}
