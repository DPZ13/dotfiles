** This guide addumnes that you have already partitioned your disks, mounted the file systems to /mnt and you are at the stage of configuring your system. **
[ NixOS Install Guide ] (https://wiki.nixos.org/wiki/NixOS_Wiki)

# Installing Dots on NixOS

## Downloading the configuration

Lauching a temporary nix-shell environment.

```
nix-shell -p git
```

Next, create a directory for the configuration and clone the repository there:

```
git clone https://github.com/DPZ13/dotfiles.git /mnt/etc/nixos
cd /mnt/etc/nixos
```

## Configuration setup

Since the hardware-configuration.nix file is always unique to different devices, you need to create your own file.

``` 
mkdir -p hosts/your_device
nixos-generate-config --root /mnt --dir hosts/your_device"
```

Delete all files in the directory except hardware-configuration.nix.

### IMPORTANT!
> Do not use the existing hardware-configuration.nix files in the /hosts/other_devices directories, it is also recommended to delete the remaining directories in /hosts to avoid cluttering the configuration.

Go to the /mnt/etc/nixos directory and edit your configuration as follows:

```nix
outputs = inputs@{self, nixpkgs, niripkg, ... }: {
    nixosConfigurations = {
        your_device = nixpkgs.lib.nixosSystem {
            specialArgs = { inherit inputs; };
            modules = [
                ./configuration.nix
                ./hosts/your_device/hardware-configuration.nix
            ];
        };
    };
};
```

Add the file to Git, as the Nix package manager in the Flakes ecosystem only sees files that are tracked by Git.

```
git add .
```

## Build and installation

Next, you can change the configuration to your liking and start installation.

```
nixos-install --root /mnt --flake .#your_device 
```

After installation, unmount the root and reboot.

```
exit
cd /
umount -R /mnt
reboot
```

> It is recommended to change the owner of the directory to avoid inconvenience with git:

```
sudo chown -R $USER:users /etc/nixos
```

Now you can use the system. For your convenience, aliases have been created:

```nix
"nix.update" = "sudo nixos-rebuild switch --flake /etc/nixos#dpz";
"flake.update" = "sudo nix flake update --flake /etc/nixos";
```

You can view and edit a more detailed list of aliases in the file located at /etc/nixos/configuration.nix. Also, before using the aliases, you need edit them to fit your flake configuration, for example:

```nix 
"nix.update" = "sudo nixos-rebuild switch --flake /etc/nixos#your_device";
```

# Enjoy using it!
