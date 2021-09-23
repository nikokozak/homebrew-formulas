class Moon < Formula
  desc "Display a daily, weekly, or monthly moon-phase calendar in your terminal!"
  homepage "https://github.com/nikokozak/moon"
  url "https://github.com/nikokozak/moon/blob/main/dist/0.0.1.tar"
  sha256 "d16874076ca05c4dff561d0e21312c721e89efebbca5916d9e6d1550cd1785f2"
  license "MIT"

  depends_on "ruby" if Hardware::CPU.arm?

  uses_from_macos "ruby", since: :catalina

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "moon.gemspec"
    system "gem", "install", "moon-#{version}.gem"

    bin.install libexec/"bin/moon"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
  end

  test do
  end
end
