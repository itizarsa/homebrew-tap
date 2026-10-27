cask "claudex" do
  version "0.2.7"
  sha256 "b3532b5a25a1ce36b8c76b9eca458ea9b57c2888a1c88deb6052ce5e6a614738"

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
