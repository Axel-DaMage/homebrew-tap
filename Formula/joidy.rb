class Joidy < Formula
  desc "Personal knowledge management with gamification"
  homepage "https://github.com/Axel-DaMage/joidy"
  license "GPL-3.0-only"
  depends_on "docker"
  depends_on "docker-compose"

  on_macos do
    url "https://github.com/Axel-DaMage/joidy/archive/refs/tags/v1.0.0-beta.2.tar.gz"
    sha256 "9b7b6bcb070c8f757b45a74dfce79e88b4467bda7cb72a4b0ea6fbad950d17ea"
  end

  on_linux do
    url "https://github.com/Axel-DaMage/joidy/archive/refs/tags/v1.0.0-beta.2.tar.gz"
    sha256 "9b7b6bcb070c8f757b45a74dfce79e88b4467bda7cb72a4b0ea6fbad950d17ea"
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
