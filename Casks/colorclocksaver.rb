cask "colorclocksaver" do
  version "1.0.1"
  sha256 "376ed6b2549b5b7990678029fd04e07e8f7a66a94056f4d2445ee6bb72cf937d"

  repo = Pathname "github.com/edwardloveall/ColorClockSaver"
  url "https://#{repo}/releases/download/#{version}/#{repo.basename}.saver.zip", verified: repo.to_s
  name repo.basename
  desc "Digital clock and background with hex color code based on the time"
  homepage "https://blog.edwardloveall.com/#{token}"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sierra"

  screen_saver File.basename url.uri.path, ".*"
end
