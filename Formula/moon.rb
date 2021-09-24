class Moon < Formula
  desc "Display a moon calendar in your terminal!"
  homepage "https://github.com/nikokozak/moon"
  url "https://github.com/nikokozak/moon/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "e0007d9e772af22a2d3c01b8a214cebf971d022447f766bb5fe97c945b5e9e60"
  license "MIT"
  
  # Taken from Cocoapods
  depends_on "ruby" if Hardware::CPU.arm? 
  uses_from_macos "ruby", since: :catalina 

  def install
    system "gem", "build", "moon.gemspec"
    system "gem", "install", "mooncal-*.gem"
  end

  test do
  end
end
