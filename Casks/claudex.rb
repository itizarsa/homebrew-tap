cask "claudex" do
  version "0.2.1"
  sha256 "727286b6ef81ab16311cd443d1a4cf6c149a7fa16d5b5d5557316f572bbe4149"

  url "https://github.com/itizarsa/claudex/releases/download/v#{version}/Claudex-#{version}.zip"
  name "Claudex"
  desc "Show CLIProxyAPI Claude usage limits in the menu bar"
  homepage "https://github.com/itizarsa/claudex"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Claudex.app"

  # Claudex is self-signed, not notarized. Clearing quarantine lets it open without
  # the Gatekeeper prompt.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Claudex.app"], must_succeed: false
  end

  caveats <<~EOS
    Claudex reads usage from CLIProxyAPI. Install it and start its service with:
      brew install cliproxyapi
      brew services start cliproxyapi
  EOS
end
