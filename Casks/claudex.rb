cask "claudex" do
  version "0.1.1"
  sha256 "a5b99a7836885a5cf89499e1f0d0fcc1bed18495d8988a9a42e929bb66c80c1e"

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
    Open Claudex once after installation to configure local CLI routing.
  EOS
end
