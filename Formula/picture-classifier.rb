class PictureClassifier < Formula
  desc "Score photos for blur/exposure/face-clustering and cull via local web viewer"
  homepage "https://github.com/son-engr-kr/picture-classifier"
  url "https://github.com/son-engr-kr/picture-classifier/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "dc57833a01593cc53ecd4683bf4e8fdc1527eab8542fa0c9e84518750f15d785"
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
