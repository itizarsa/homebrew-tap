cask "claudex" do
  version "0.2.9"
  sha256 "27c7060a1337dac4a6eedb40930b86eb2b73dc30dbe0c4b38115a15917e53148"

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
