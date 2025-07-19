# Dotfiles

A NixOS and Home Manager configuration using Nix flakes.

## Usage

### NixOS Configuration

To rebuild the entire NixOS system:

```bash
sudo nixos-rebuild switch --flake .#nixos
```

### Home Manager Only

To apply only user-level configuration without affecting the system:

```bash
home-manager switch --flake .#home
```
