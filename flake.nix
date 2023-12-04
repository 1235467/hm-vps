{
  inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, home-manager, ... }:
    let
      users = {
        xiao = {
          # CHANGE ME TO YOUR USER
          name = "xiao";
          username = "xiao";
          homeDirectory = "/home/xiao";
          email = "example";
        };
        root = {
          # CHANGE ME TO YOUR USER
          name = "root";
          username = "root";
          homeDirectory = "/root";
          email = "example";
        };

      };
      pkgsForSystem = { system, pkgs ? nixpkgs }: import pkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      homeConfigurations = {
        xiao = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsForSystem { system = "x86_64-linux"; };
          modules = [
            ./hosts/gb/xiao.nix
          ];
          extraSpecialArgs = {
            user = users.xiao;
          };
        };
        root = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsForSystem { system = "x86_64-linux"; };
          modules = [
            ./hosts/gb/root.nix
          ];
          extraSpecialArgs = {
            user = users.root;
          };
      };
      gb2-root = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsForSystem { system = "x86_64-linux"; };
          modules = [
            ./hosts/gb2/root.nix
          ];
          extraSpecialArgs = {
            user = users.root;
          };
      };
    };
};
}
