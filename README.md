# Homebrew tap

Homebrew packages for [itizarsa](https://github.com/itizarsa) projects.

## Claudex

Claudex currently supports Apple silicon and macOS 14 Sonoma or newer.

    brew trust --cask itizarsa/tap/claudex
    brew install --cask itizarsa/tap/claudex

Claudex is ad-hoc signed and not notarized. If macOS blocks first launch, open
System Settings, choose Privacy & Security, then click Open Anyway. Do not disable
Gatekeeper globally.

Homebrew 7 requires explicit trust before loading third-party casks. Trust is
limited to Claudex, not every package in this tap.

Uninstall app:

    brew uninstall --cask claudex
