class RepolensCli < Formula
  desc "Instant clarity on any codebase — navigate imports, trace functions, and get AI answers in one terminal view"
  homepage "https://github.com/Satyam12singh/repolens"
  url "https://files.pythonhosted.org/packages/e1/9e/74b380d9ea09903931edca4c62558354c4f6a4d167f2f80492d701cbbcc3/repolens_cli-0.3.1.tar.gz"
  sha256 "e6b69a9ac30e017ed3116b97ec833b97576c5640ab5b969dd85436a1911d3a4c"
  license "MIT"
  version "0.3.1"

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
