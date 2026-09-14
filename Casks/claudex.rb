cask "claudex" do
  version "0.1.0"
  sha256 "3b57fd9167e360fe48ff39d6271b1485b929397a705717d456ef8350a020f757"

  url "https://github.com/itizarsa/claudex/releases/download/v#{version}/Claudex-#{version}.dmg"
  name "Claudex"
  desc "Track and switch Claude and Codex accounts from the menu bar"
  homepage "https://github.com/itizarsa/claudex"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Claudex.app"

  caveats <<~EOS
    Claudex is ad-hoc signed and not notarized. macOS may block its first launch.
    Open System Settings > Privacy & Security, then click Open Anyway.
  EOS
end
