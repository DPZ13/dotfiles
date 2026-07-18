{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		niripkg.url = "github:niri-wm/niri";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};
	outputs = inputs@{ self, nixpkgs, niripkg, home-manager, ... }: {
		nixosConfigurations = {
			dpz = nixpkgs.lib.nixosSystem {
				specialArgs = { inherit inputs; };
				modules = [ 
					./configuration.nix
					./hosts/LOQ_15ARP9/hardware-configuration.nix
					home-manager.nixosModules.default
					{
						home-manager = {
							useGlobalPkgs = true;
							useUserPackages = true;
							users.dpz = ./home.nix;
						}:
					};
				];
			};
		};
	};
}
