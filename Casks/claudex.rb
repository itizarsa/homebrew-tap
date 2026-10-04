cask "claudex" do
  version "0.1.2"
  sha256 "9c60a6fd7a183cbfe9c643b11cff497e20b24e9998eefc96639d7c34120bf53f"

  url "https://github.com/itizarsa/claudex/releases/download/v#{version}/Claudex-#{version}.dmg"
  name "Claudex"
  desc "Show tokenmaxx Claude and Codex usage limits in the menu bar"
  homepage "https://github.com/itizarsa/claudex"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Claudex.app"

  caveats <<~EOS
    Claudex reads usage from tokenmaxx. Install it with:
      bun add -g tokenmaxx

    Claudex is ad-hoc signed and not notarized. macOS may block its first launch.
    Open System Settings > Privacy & Security, then click Open Anyway.
  EOS
end
