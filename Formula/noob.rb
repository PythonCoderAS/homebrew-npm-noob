class Noob < Formula
  include Language::Python::Virtualenv

  desc "Generate Homebrew formulae for npm packages"
  homepage "https://github.com/PythonCoderAS/homebrew-npm-noob"
  url "https://github.com/PythonCoderAS/homebrew-npm-noob/archive/v0.3.1.tar.gz"
  sha256 "c6ebc3285ce34af5931e9bb4e5c911344135d69cb64a108bb9aa9c611825b4a6"

  depends_on "python3"

  def install
    virtualenv_create(libexec, "python3")
    system libexec/"bin/pip", "install", "."
    bin.install_symlink libexec/"bin/noob"
    man1.install "docs/noob.1"
  end

  test do
    assert_match "class Svgo < Formula", shell_output("#{bin}/noob svgo")
  end
end
