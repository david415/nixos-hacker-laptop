# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  time.timeZone = "Europe/London";
  users.mutableUsers = true;
  security.sudo.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_3_2;

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda";

  networking = {
  hostName = "computer";
  wireless.enable = false;
  useDHCP = false;
  wicd.enable = true;
  interfaceMonitor.enable = false;
  wireless.userControlled.enable = true;
  };

  # List packages installed in system profile. To search by name, run:
  # -env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    vim
    emacs
    firmwareLinuxNonfree
    wicd
    gitAndTools.gitFull
    screen
    iptables
    haskellPackages.haskellPlatform.ghc
    haskellPackages.xmobar
    haskellPackages.xmonad
    haskellPackages.xmonadContrib
    haskellPackages.xmonadExtras
    xfontsel
    xlsfonts
    chromium
    tor
  ];


  services =
  {

    openssh.enable = true;
 
    xserver = {
      enable = true;
      layout = "us";
      windowManager.xmonad.enable = true;
      windowManager.xmonad.enableContribAndExtras = true;
      displayManager.lightdm.enable = true;
    };

  };

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      corefonts  # Micrsoft free fonts
      inconsolata  # monospaced
      ubuntu_font_family  # Ubuntu fonts
    ];
  };

  users.extraUsers.human = {
    name = "human";
    group = "users";
    uid = 1000;
    extraGroups = [ "wheel" ];
    password = "longunguessable";
    createHome = true;
    home = "/home/human";
    shell = "/run/current-system/sw/bin/bash";
  };

  users.extraUsers.tor = {
    name = "tor";
    group = "users";
    uid = 1001;
    home = "/home/tor";
    shell = "/run/current-system/sw/bin/bash";
  };

 # END
}
