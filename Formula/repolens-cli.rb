class RepolensCli < Formula
  desc "Instant clarity on any codebase — navigate imports, trace functions, and get AI answers in one terminal view"
  homepage "https://github.com/Satyam12singh/repolens"
  url "https://files.pythonhosted.org/packages/c0/bb/8d34c030af30918b6bd110d6d77f7528590ac58e4d48f3587555328abd96/repolens_cli-0.3.0.tar.gz"
  sha256 "585f38e85ed130b88b08ee7ad19731accc2ea6e452ff1605ee9801df6735f93c"
  license "MIT"
  version "0.3.0"

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
