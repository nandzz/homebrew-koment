cask "koment" do
  version "0.1.0"
  sha256 "1a0019c0e0b3621fbe9132a9c90d516bd0d866a3cbd16a5cf86cfe87c790d027"

  url "https://github.com/nandzz/koment/releases/download/v#{version}/Koment-#{version}.dmg"
  name "Koment"
  desc "Menu-bar app to leave inline notes on code for Claude Code to act on"
  homepage "https://github.com/nandzz/koment"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "Koment.app"

  zap trash: [
    "~/.claude/commands/koment.md",
    "~/Library/Application Support/com.nandzz.koment",
    "~/Library/Caches/com.nandzz.koment",
    "~/Library/HTTPStorages/com.nandzz.koment",
    "~/Library/Preferences/com.nandzz.koment.plist",
    "~/Library/Saved Application State/com.nandzz.koment.savedState",
  ]

  caveats do
    <<~EOS
      Koment needs Claude Code in your PATH:
        brew install --cask claude-code

      Open Koment and use its Setup window to grant Accessibility access,
      register the comment server, and install the /koment command.

      To unregister the comment server before you uninstall, run:
        claude mcp remove -s user koment
    EOS
  end
end
