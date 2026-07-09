{ config, lib, pkgs, inputs, ... }:

{
	boot = {
		loader = {
			efi.canTouchEfiVariables = true;
			grub = {
				enable = true;
				device = "nodev";
				efiSupport = true;
				useOSProber = true;
			};
		};
		KernelPackages = pkgs.linuxPackages_latest;
		KernelParams = [ "pcie.aspm=off" ];
	};
}
