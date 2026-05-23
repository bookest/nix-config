# Home Manager Configuration

This repository manages personal dotfiles and environment configurations declaratively using Nix and Home Manager.

---

## Key Modules

Configurations are modularized under the `nix/modules/` directory:
- **shell**: Shell settings (Zsh, aliases, starship prompt, and directory helper tools).
- **git**: Git configuration and user profile.
- **neovim**: Neovim configurations.
- **tmux**: Multiplexer settings.
- **wezterm**: Terminal emulator preferences.

---

## Usage

### 1. Build the Configuration
To verify that the configuration compiles successfully without making system changes:
```bash
home-manager build
```

### 2. Activate the Configuration
To apply the changes and update your active environment:
```bash
home-manager switch
```

---

## Bootstrapping on macOS

To set up this configuration on a brand new macOS machine, follow these steps:

### 1. Install Nix
The recommended installer is the Determinate Systems Nix installer:
```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

### 2. Configure Trusted Users
To enable Nix store auto-optimization and silence restricted settings warnings, add your user as a trusted user:
```bash
echo "trusted-users = root @admin $USER" | sudo tee -a /etc/nix/nix.conf
sudo launchctl stop org.nixos.nix-daemon
sudo launchctl start org.nixos.nix-daemon
```

### 3. Clone this Repository
Clone this repository directly to `~/.config/home-manager`:
```bash
git clone <your-repository-url> ~/.config/home-manager
cd ~/.config/home-manager
```

### 4. Enter the Nix Shell
Enter the project's shell environment. This will automatically fetch and set up the pinned versions of `nixpkgs` and `home-manager` using `niv`:
```bash
nix-shell
```

### 5. Perform the Initial Switch
Within the `nix-shell` environment, activate your Home Manager configuration for the first time:
```bash
home-manager switch
```
Once complete, restart your terminal or re-source your environment to load the newly activated shell configuration.


