
{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  time.timeZone = "Europe/London";
  nix.useChroot = true;
  users.mutableUsers = true;
  security.sudo.enable = true;

  networking = {
  hostName = "computer";
  wireless.enable = false;
  useDHCP = false;
  wicd.enable = true;
  interfaceMonitor.enable = false;
  wireless.userControlled.enable = true;
  };

  environment = {
    systemPackages = with pkgs; [
      vim
      emacs
      firmwareLinuxNonfree
      wicd
      gitAndTools.gitFull
      screen
      tmux
      iptables
      tor
      sysstat
      haskellPackages.haskellPlatform.ghc
      haskellPackages.xmobar
      haskellPackages.xmonad
      haskellPackages.xmonadContrib
      haskellPackages.xmonadExtras
      xfontsel
      xlsfonts
      chromium
      torbrowser
      pkgs.tahoelafs
    ];
  };

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      terminus_font
      corefonts
      inconsolata
      ubuntu_font_family  # Ubuntu fonts
    ];
  };

  services =
  {
    openssh.enable = true;

    tor.client.enable = true;
 
    xserver = {
      enable = true;
      layout = "us";
      windowManager.xmonad.enable = true;
      windowManager.xmonad.enableContribAndExtras = true;
      displayManager.lightdm.enable = true;
    };
  };

  users.extraUsers.human = {
    name = "human";
    group = "users";
    uid = 1000;
    extraGroups = [ "wheel" ];
    # password = "longunguessable";
    hashedPassword = "396JjRVXmdWiU";
    createHome = true;
    home = "/home/human";
    shell = "/run/current-system/sw/bin/bash";
  };

 # END
}
