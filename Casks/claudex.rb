cask "claudex" do
  version "0.1.5"
  sha256 "bb4ee21596839d7890c39295ed923a734f505ba8334684b87954aa4c43e4707f"

  url "https://github.com/itizarsa/claudex/releases/download/v#{version}/Claudex-#{version}.zip"
  name "Claudex"
  desc "Show tokenmaxx Claude and Codex usage limits in the menu bar"
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
    Claudex reads usage from tokenmaxx. Install it and start its daemon with:
      bun add -g tokenmaxx
      tokenmaxx daemon install
  EOS
end
