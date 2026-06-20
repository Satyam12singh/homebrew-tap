class RepolensCli < Formula
  desc "Instant clarity on any codebase — navigate imports, trace functions, and get AI answers in one terminal view"
  homepage "https://github.com/Satyam12singh/repolens"
  url "https://files.pythonhosted.org/packages/5e/25/b9ec3af44f22b74b3e9b0935e1c92e5d0288d797d274b33cef319a5e632f/repolens_cli-0.3.2.tar.gz"
  sha256 "9106553e63cda089cb64eaa6fe8da53e79c139389644db43a695c2141133d12f"
  license "MIT"
  version "0.3.2"

  depends_on "python@3.12"

  def install
    python3 = Formula["python@3.12"].opt_bin/"python3.12"
    system python3, "-m", "venv", libexec
    system libexec/"bin/pip", "install", "--no-cache-dir", "repolens-cli==#{version}"
    bin.install_symlink libexec/"bin/repolens"
  end

  test do
    assert_match "RepoLens", shell_output("#{bin}/repolens --help 2>&1")
  end
end
