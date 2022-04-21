{ config, pkgs, lib, ... }: 
{
    imports = [ ./. ];
    boot.kernelPackages = lib.mkOverride 99 (pkgs.callPackage ./kernel/xanmod-ck.nix { });
}