class PictureClassifier < Formula
  desc "Score photos for blur/exposure/face-clustering and cull via local web viewer"
  homepage "https://github.com/son-engr-kr/picture-classifier"
  url "https://github.com/son-engr-kr/picture-classifier/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "3dcae778e79225f8815aa6ef0f0abb2e96278359e633468c0deec4403663bb9b"
  license "MIT"

  depends_on "python@3.12"

  def install
    venv_dir = libexec/"venv"
    system Formula["python@3.12"].opt_libexec/"bin/python", "-m", "venv", venv_dir
    system venv_dir/"bin/pip", "install", "--upgrade", "pip", "setuptools", "wheel"
    system venv_dir/"bin/pip", "install", buildpath
    bin.install_symlink venv_dir/"bin/pcls"
  end

  test do
    assert_match "Picture classifier", shell_output("#{bin}/pcls --help")
  end
end
