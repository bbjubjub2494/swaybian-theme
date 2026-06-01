{
  system,
  pkgs,
  inputs,
  flake,
  ...
}:

(inputs.home-manager.lib.homeManagerConfiguration {
  modules = builtins.attrValues flake.homeModules ++ [
    {
      home.stateVersion = "26.05";
      home.username = "jade";
      home.homeDirectory = "/home/jade";
    }
  ];
  inherit pkgs;
}).config.home.path
