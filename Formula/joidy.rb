class Joidy < Formula
  desc "Personal knowledge management with gamification"
  homepage "https://github.com/Axel-DaMage/joidy"
  license "GPL-3.0-only"
  depends_on "docker"
  depends_on "docker-compose"

  on_macos do
    url "https://github.com/Axel-DaMage/joidy/archive/refs/tags/v1.0.0-alpha.tar.gz"
    sha256 "d41d8cd98f00b204e9800998ecf8427e"
  end

  on_linux do
    url "https://github.com/Axel-DaMage/joidy/archive/refs/tags/v1.0.0-alpha.tar.gz"
    sha256 "d41d8cd98f00b204e9800998ecf8427e"
  end

  def install
    bin.install "bin/joidy"
    prefix.install "docker-compose.yml"
    prefix.install ".env.example"
  end

  def post_install
    cp prefix/".env.example", prefix/".env" unless File.exist?(prefix/".env")
  end

  def caveats
    <<~EOS
      Edit your config: #{prefix}/.env
      Then run:  joidy up
    EOS
  end
end
