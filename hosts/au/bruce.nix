{ config, pkgs, nur, nur-custom, ... }:
let
  nurpkgs = import nur { inherit pkgs; };
  nurpkgs-custom = import nur-custom { inherit pkgs; };
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "bruce";
  home.homeDirectory = "/home/bruce";
  home.stateVersion = "23.11"; # Please read the comment before changing.
  home.packages = [
    pkgs.arion
    pkgs.tcping-go
  ];

  home.file = {
  };

  home.sessionVariables = {
  };
  programs.home-manager.enable = true;
}
