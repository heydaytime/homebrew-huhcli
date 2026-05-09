class Huhcli < Formula
  include Language::Python::Virtualenv

  desc "AI CLI Syntax Autocorrector"
  homepage "https://github.com/heydaytime/huhcli"
  url "https://github.com/heydaytime/huhcli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "c24af28a1f21b6a9696702a8d216d564cf8143ced340fec3a9cebda69da48ce4"
  license "MIT"

  depends_on "python@3.12"

  resource "typer" do
    url "https://files.pythonhosted.org/packages/source/t/typer/typer-0.16.0.tar.gz"
    sha256 "af377ffaee1dbe37ae9440cb4e8f11686ea5ce4e9bae01b84ae7c63b87f1dd3b"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/source/r/rich/rich-15.0.0.tar.gz"
    sha256 "ed07a4824c6b40189fb7ac9bc4c52536e9780fbbfbddf6f1e2502c31b068c36"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/source/r/requests/requests-2.33.1.tar.gz"
    sha256 "18817f8c57c6263968bc123d237e3b8b08ac046f5456bd1e307ee8f4250d3517"
  end

  def install
    virtualenv_install_with_resources
    bin.install_symlink libexec/"bin/huh" => "huhcli"
  end

  def caveats
    <<~EOS
      To finish setup, run:

        huhcli setup

      This adds a shell function to your ~/.zshrc or ~/.bashrc.
      Then reload your shell and select a model:

        source ~/.zshrc   # or ~/.bashrc
        huhcli select

      Make sure Ollama is running before using huhcli.
    EOS
  end

  test do
    system "#{bin}/huhcli", "--help"
  end
end
