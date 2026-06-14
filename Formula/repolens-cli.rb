class RepolensCli < Formula
  desc "Instant clarity on any codebase — navigate imports, trace functions, and get AI answers in one terminal view"
  homepage "https://github.com/Satyam12singh/repolens"
  url "https://files.pythonhosted.org/packages/83/b3/7d8e13d36072da095df9e42bfca7a1ecc2245390b8b29bf4503a845fef88/repolens_cli-0.2.0.tar.gz"
  sha256 "723cba65b564cf565db60f43f814b7d35a83921b63727f76073e4a62fd141f28"
  license "MIT"
  version "0.2.0"

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
