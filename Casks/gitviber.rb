cask "gitviber" do
  version "0.3.9"
  sha256 "4342da5532fd3f0183a5e0ec3feb04d4902d16c6d0814244724e72fd1bec8627"

  url "https://github.com/itizarsa/gitviber/releases/download/v#{version}/GitViber_#{version}_universal.dmg"
  name "GitViber"
  desc "Git client for reviewing and committing what coding agents write"
  homepage "https://github.com/itizarsa/gitviber"

  livecheck do
    url :url
    strategy :github_latest
  end

  # This fork has no in-app updater: `brew upgrade` brings new versions.
  auto_updates false
  depends_on macos: :ventura

  app "GitViber.app"

  # GitViber is self-signed, not notarized. Clearing quarantine lets it open without
  # the Gatekeeper prompt.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/GitViber.app"], must_succeed: false
  end

  zap trash: [
    "~/Library/Caches/app.gitviber.desktop",
    "~/Library/HTTPStorages/app.gitviber.desktop",
    "~/Library/Logs/app.gitviber.desktop",
    "~/Library/Preferences/app.gitviber.desktop.plist",
    "~/Library/Saved Application State/app.gitviber.desktop.savedState",
    "~/Library/WebKit/app.gitviber.desktop",
  ]
end
