class Moon < Formula
  desc "Display a daily, weekly, or monthly moon-phase calendar in your terminal!"
  homepage "https://github.com/nikokozak/moon"
  url "https://github.com/nikokozak/moon/raw/main/dist/0.0.1.tar"
  sha256 "a5b2cfb7564a3052743e6e92c8efa87fca380d0b445188e33977371c68c21710"
  license "MIT"

  depends_on "ruby" if Hardware::CPU.arm?

  uses_from_macos "ruby", since: :catalina

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "moon.gemspec"
    system "gem", "install", "mooncal-#{version}.gem"

    bin.install libexec/"bin/moon"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
  end

  test do
  end
end
