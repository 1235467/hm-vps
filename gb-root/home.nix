{ config, pkgs, ... }:
let
 variables = import ./variables.nix;
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "${variables.username}";
  home.homeDirectory = "/${variables.username}";
  home.stateVersion = "23.05"; # Please read the comment before changing.
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
