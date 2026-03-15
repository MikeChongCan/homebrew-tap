class DocCrop < Formula
  desc "macOS CLI for document detection, perspective correction, and compression using Apple Vision"
  homepage "https://github.com/MikeChongCan/doc-preprocessing-cli"
  license "MIT"

  # When a GitHub release exists, use the pre-built universal binary:
  # url "https://github.com/MikeChongCan/doc-preprocessing-cli/releases/download/v#{version}/doc-crop-macos-universal.tar.gz"
  # sha256 "UPDATE_AFTER_FIRST_RELEASE"

  # Build from source (used until releases are available)
  url "https://github.com/MikeChongCan/doc-preprocessing-cli.git",
      tag:      "v0.1.0",
      revision: "713035490ae0abe0231e46108a4d6f44ea77411e"
  head "https://github.com/MikeChongCan/doc-preprocessing-cli.git", branch: "master"
  version "0.1.0"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/doc-crop"
  end

  test do
    assert_match "Usage: doc-crop", shell_output("#{bin}/doc-crop 2>&1", 1)
  end
end
