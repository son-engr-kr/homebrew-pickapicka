class Pickapicka < Formula
  desc "Cull and edit a photo shoot locally, with a non-destructive RAW editor"
  homepage "https://github.com/son-engr-kr/pickapicka"
  url "https://github.com/son-engr-kr/pickapicka/archive/refs/tags/v0.16.1.tar.gz"
  sha256 "0f8c5b853c5c96fd98de86ff7224562446ffa3f35b1cb3839698701d96fb74cf"
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
