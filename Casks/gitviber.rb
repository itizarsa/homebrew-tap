cask "gitviber" do
  version "0.3.1"
  sha256 "37d665c815672eefd27a3f533c43993088c647eaae3d00111db8a53206feadc9"

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

  # An upgrade replaces the app under a running copy, which then breaks. If it's running, it
  # quits first (saving its terminals) and opens again once the new version is in place.
  preflight_steps do
    run "/bin/sh",
        args:         [
          "-c",
          'pgrep -x gitviber >/dev/null && touch "$HOME/Library/Caches/app.gitviber.desktop.relaunch"',
        ],
        must_succeed: false
    run "/usr/bin/osascript",
        args:         ["-e", 'tell application id "app.gitviber.desktop" to if running then quit'],
        must_succeed: false
    run "/bin/sh",
        args:         [
          "-c",
          'i=0; while pgrep -x gitviber >/dev/null && [ "$i" -lt 20 ]; do sleep 1; i=$((i+1)); done',
        ],
        must_succeed: false
  end

  # GitViber is self-signed, not notarized. Clearing quarantine lets it open without
  # the Gatekeeper prompt.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/GitViber.app"], must_succeed: false
    run "/bin/sh",
        args:         [
          "-c",
          'cd "$HOME/Library/Caches" && rm app.gitviber.desktop.relaunch 2>/dev/null && open -b app.gitviber.desktop',
        ],
        must_succeed: false
  end

  zap trash: [
    "~/Library/Caches/app.gitviber.desktop",
    "~/Library/Caches/app.gitviber.desktop.relaunch",
    "~/Library/HTTPStorages/app.gitviber.desktop",
    "~/Library/Logs/app.gitviber.desktop",
    "~/Library/Preferences/app.gitviber.desktop.plist",
    "~/Library/Saved Application State/app.gitviber.desktop.savedState",
    "~/Library/WebKit/app.gitviber.desktop",
  ]
end
