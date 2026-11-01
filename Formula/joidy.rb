class Joidy < Formula
  desc "Personal knowledge management with gamification"
  homepage "https://github.com/Axel-DaMage/joidy"
  license "GPL-3.0-only"
  depends_on "docker"
  depends_on "docker-compose"

  on_macos do
    url "https://github.com/Axel-DaMage/joidy/archive/refs/tags/v1.1.0-beta.7.tar.gz"
    sha256 "c77dee045f15f1ef2ed37d5946c9620e45da4eb54b19b6643739ba6e8b628a70"
  end

  on_linux do
    url "https://github.com/Axel-DaMage/joidy/archive/refs/tags/v1.1.0-beta.7.tar.gz"
    sha256 "c77dee045f15f1ef2ed37d5946c9620e45da4eb54b19b6643739ba6e8b628a70"
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
