{
  pkgs,
  perSystem,
}:
pkgs.where-is-my-sddm-theme.override {
  themeConfig.General = {
    background = perSystem.self.byuns_eepies;
    backgroundMode = "fill";
    hideCursor = true;
    showUsersByDefault = true;
  };
}
