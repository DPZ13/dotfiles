{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    niripkg.url = "github:niri-wm/niri";
  };
  outputs = inputs@{ self, nixpkgs, niripkg, ... }: {
    nixosConfigurations.dpz = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [ ./configuration.nix ];
    };
  };
}

