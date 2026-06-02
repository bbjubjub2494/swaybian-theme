{
  system,
  inputs,
  flake,
  ...
}:

(inputs.nixpkgs.lib.nixosSystem {
  modules = [
    flake.nixosModules.default
    {
      boot.isContainer = true;
      nixpkgs = { inherit system; };
      system.stateVersion = "26.05";

      themes.swaybian.sddm.enable = true;

      services.displayManager.sddm.enable = true;
      services.xserver.enable = true;
    }
  ];
}).config.system.build.toplevel
