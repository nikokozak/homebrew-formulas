class Moon < Formula
  desc "Display a daily, weekly, or monthly moon-phase calendar in your terminal!"
  homepage "https://github.com/nikokozak/moon"
  url "https://github.com/nikokozak/moon/raw/main/dist/0.0.1.tar"
  sha256 "0e60e0621ac9c9888603be06c408733ef351590a5e6e33af4e9c737eb7653bdd"
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
