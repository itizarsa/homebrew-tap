cask "claudex" do
  version "0.1.3"
  sha256 "b0802d73b53b2549f44142577d8eac24cfb6d560435a2b3a865687499331d48e"

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
