{
  description = "A sublime colorscheme for Neovim, enveloping your coding environment in the tranquil shades of twilight, enhancing focus and fostering creativity.";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = {
    nixpkgs,
    neovim-nightly-overlay,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [neovim-nightly-overlay.overlay];
      config = {
        allowUnfree = true;
      };
    };
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        alejandra
        nil
        neovim-nightly
        stylua
        nodejs_22
        git-cliff
      ];
    };
    formatter.${system} = pkgs.alejandra;
  };
}
