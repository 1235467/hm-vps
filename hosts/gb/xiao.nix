{ config, pkgs, ... }:
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "xiao";
  home.homeDirectory = "/home/xiao";
  home.stateVersion = "23.11"; # Please read the comment before changing.
  home.packages = [
    pkgs.arion
  ];

  home.file = {
  ".local/bin/hms".text = "nix flake update ~\/hm\-vps\/gb\/ && home\-manager switch \-\-flake ~\/hm\-vps\/gb";
  ".local/bin/hms".executable = true;
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}
