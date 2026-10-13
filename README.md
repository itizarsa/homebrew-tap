# Homebrew tap

Homebrew packages for [itizarsa](https://github.com/itizarsa) projects.

## Claudex

Claudex currently supports Apple silicon and macOS 14 Sonoma or newer.

    brew trust --cask itizarsa/tap/claudex
    brew install --cask itizarsa/tap/claudex

Claudex is self-signed, not notarized. The cask clears its quarantine flag, so it
opens without a Gatekeeper prompt.

Homebrew 7 requires explicit trust before loading third-party casks. Trust is
limited to Claudex, not every package in this tap.

Uninstall app:

    brew uninstall --cask claudex
