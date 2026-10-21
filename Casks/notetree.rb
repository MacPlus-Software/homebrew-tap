cask "notetree" do
  version "0.1.0"
  sha256 "f91d76ee91776ddd8b691374e209e821294d85a62c599fa6175c05f58b8f036a"

  url "https://macplus-software.com/downloads/NoteTree.zip",
      verified: "macplus-software.com/downloads/"
  name "NoteTree"
  desc "Notes app with nested folders and iCloud sync"
  homepage "https://noteifyapp.com/notetree/"

  livecheck do
    url "https://macplus-software.com/downloads/NoteTree.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "NoteTree.app"

  zap trash: [
    "~/Library/Application Support/NoteTree",
    "~/Library/Caches/com.macplus-software.NoteTree",
    "~/Library/HTTPStorages/com.macplus-software.NoteTree",
    "~/Library/Preferences/com.macplus-software.NoteTree.plist",
    "~/Library/Saved Application State/com.macplus-software.NoteTree.savedState",
  ]
end
