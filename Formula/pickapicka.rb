class Pickapicka < Formula
  desc "Cull and edit a photo shoot locally, with a non-destructive RAW editor"
  homepage "https://github.com/son-engr-kr/pickapicka"
  url "https://github.com/son-engr-kr/pickapicka/archive/refs/tags/v0.13.0.tar.gz"
  sha256 "3828339d5d5872a38f26c2eddd9750a78b6f694a375a39d7887aaef0af75e18c"
  license "MIT"

  depends_on "python@3.12"

  def install
    venv_dir = libexec/"venv"
    system Formula["python@3.12"].opt_libexec/"bin/python", "-m", "venv", venv_dir
    system venv_dir/"bin/pip", "install", "--upgrade", "pip", "setuptools", "wheel"
    system venv_dir/"bin/pip", "install", buildpath
    bin.install_symlink venv_dir/"bin/pickapicka"
  end

  test do
    assert_match "Pickapicka", shell_output("#{bin}/pickapicka --help")
  end
end
