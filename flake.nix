{
  inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur-custom.url = "github:1235467/nurpkgs";
    nur-custom.inputs.nixpkgs.follows = "nixpkgs";
    nur.url = "github:nix-community/nur";

  };
  outputs = { nixpkgs, home-manager, nur-custom, nur, ... }:
    let
      users = {
        xiao = {
          name = "xiao";
          username = "xiao";
          homeDirectory = "/home/xiao";
          email = "example";
        };
        root = {
          name = "root";
          username = "root";
          homeDirectory = "/root";
          email = "example";
        };
        bruce = {
          name = "bruce";
          username = "bruce";
          homeDirectory = "/home/bruce";
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
            inherit nur nur-custom;
          };
        };
        root = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsForSystem { system = "x86_64-linux"; };
          modules = [
            ./hosts/gb/root.nix
          ];
          extraSpecialArgs = {
            user = users.root;
            inherit nur nur-custom;
          };
        };
        gb2-root = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsForSystem { system = "x86_64-linux"; };
          modules = [
            ./hosts/gb2/root.nix
          ];
          extraSpecialArgs = {
            user = users.root;
            inherit nur nur-custom;
          };
        };
        ro-root = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsForSystem { system = "x86_64-linux"; };
          modules = [
            ./hosts/ro/root.nix
          ];
          extraSpecialArgs = {
            user = users.root;
            inherit nur nur-custom;
          };
        };
        au = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsForSystem { system = "x86_64-linux"; };
          modules = [
            ./hosts/au/bruce.nix
          ];
          extraSpecialArgs = {
            user = users.bruce;
            inherit nur nur-custom;
          };
        };
      };
    };
}
