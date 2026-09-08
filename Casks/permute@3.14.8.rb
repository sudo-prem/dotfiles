cask "permute@3.14.8" do
  version "3.14.8,4018"
  sha256 "eacd8883163f43d9b48ae42e0900096a0f7b323488aaf9276ce49dad017f6649"

  url "https://software.charliemonroe.net/trial/permute/v#{version.major}/Permute_#{version.major}_#{version.csv.second}.dmg"
  name "Permute"
  desc "Converts and edits video, audio or image files"
  homepage "https://software.charliemonroe.net/permute/"

  auto_updates true
  conflicts_with cask: "permute"
  depends_on macos: :big_sur

  app "Permute #{version.major}.app"
end
