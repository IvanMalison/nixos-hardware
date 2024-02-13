{ lib, pkgs, ... }:

{
  # Boot loader
  boot.kernelParams = lib.mkDefault [ "acpi_rev_override" ];
  boot.kernelModules = lib.mkDefault [ "kvm-intel" ];

  hardware.enableRedistributableFirmware = lib.mkDefault true;

  # This will save you money and possibly your life!
  services.thermald.enable = lib.mkDefault true;

  boot.kernelPackages =
    lib.mkIf (lib.versionOlder pkgs.linux.version "5.11")
      pkgs.linuxPackages_latest;
}
