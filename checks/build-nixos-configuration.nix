{
  system,
  inputs,
  flake,
  ...
}:

(inputs.nixpkgs.lib.nixosSystem {
  modules = builtins.attrValues flake.nixosModules ++ [
    {
      boot.isContainer = true;
      nixpkgs = { inherit system; };
      system.stateVersion = "26.05";
    }
  ];
}).config.system.build.toplevel
