{ config, pkgs, nur, nur-custom, ... }:
let
  nurpkgs = import nur { inherit pkgs; };
  nurpkgs-custom = import nur-custom { inherit pkgs; };
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "root";
  home.homeDirectory = "/root";
  home.stateVersion = "23.11"; # Please read the comment before changing.
  home.packages = [
    pkgs.arion
    nurpkgs-custom.swgp-go
  ];

  home.file = {
  #".local/bin/hms".text = "nix flake update \/home\/xiao\/hm\-vps\/gb\-root\/ && home\-manager switch \-\-flake \/home\/xiao\/hm\-vps\/gb\-root\/";
  #".local/bin/hms".executable = true;
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}
