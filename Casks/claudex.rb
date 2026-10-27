cask "claudex" do
  version "0.2.3"
  sha256 "b560562b5771718bdd78c5a7e922a95d723b9af465ef546e9d6383ebb1c00c7a"

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
