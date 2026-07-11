[🇺🇸 English README]

**Это руководство подразумевает что вы уже создали разделы на диске, монтировали файловые системы и **
[Руководство по установке NixOS] (https://wiki.nixos.org/wiki/NixOS_Wiki/ru)

# Установка конфигурации системы

## Загрузка конфигурации

Запустите `git`, используя оболочку `nix-shell`.

```
nix-shell -p git
```

Создайте директорию для конфигурации системы и клонируйте репозиторий:

```
git clone https://github.com/DPZ13/dotfiles.git /mnt/etc/nixos
cd /mnt/etc/nixos
```

## Настройка конфигурации

Так как `hardware-configuration.nix` всегда уникален для каждого устройства, вам необходимо сгенерировать свою личную конфигурацию.

``` 
mkdir -p hosts/your_device
nixos-generate-config --root /mnt --dir hosts/your_device"
```

Удалите все файлы, которые вы сгенерировали, за исключением `hardware-configuration.nix`.

### ВАЖНО!
> Не используйте другие `hardware-configuration.nix` в директории /hosts/other_devices, так как даже при одинаковых характеристиках вашего компьютера и компьютера, для которого данная конфигурация была создана, UUID всегда будет разный. Также рекомендуется удалить другие директории в `/hosts` во избежание лишних файлов и директорий в конфигурации.

перейдите в директорию `/mnt/etc/nixos directory` и редактируйте `flake.nix` подобным образом, заменив `your_device` на имя вашего устройства:

```nix
modules = [
    ./configuration.nix
    ./hosts/your_device/hardware-configuration.nix
];
```

## Сборка и установка

Далее вы можете изменить конфигурацию по своему усмотрению и запустить установку.

```
nixos-install --root /mnt --flake .#your_device 
```

После установки, отмонтируйте корень и перезагрузитесь.

```
exit
cd /
umount -R /mnt
reboot
```

> Рекомендуется сменить владельца директории:

```
sudo chown -R $USER:users /etc/nixos
```

Ваша система готова к использованию. Для вашего удобства, были созданы алиасы:

```nix
"nix.update" = "sudo nixos-rebuild switch --flake /etc/nixos#dpz";
"flake.update" = "sudo nix flake update --flake /etc/nixos";
```

Более подробно вы можете посмотреть в файле `/etc/nixos/modules/aliases.nix`. Перед использованием некоторых, вам будет необходимо отредактировать под свою конфигурацию, например:

```nix 
"nix.update" = "sudo nixos-rebuild switch --flake /etc/nixos#your_device";
```

# Приятного пользования!
