class Huhcli < Formula
  include Language::Python::Virtualenv

  desc "AI CLI Syntax Autocorrector"
  homepage "https://github.com/heydaytime/huhcli"
  url "https://github.com/heydaytime/huhcli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "c24af28a1f21b6a9696702a8d216d564cf8143ced340fec3a9cebda69da48ce4"
  license "MIT"

  depends_on "python@3.12"

  resource "typer" do
    url "https://files.pythonhosted.org/packages/e6/7e/e26b8f1bd9d982891dc93b5006c80b52b92f0b64626a53bfc4e3d0e5c6ce/typer-0.16.0.tar.gz"
    sha256 "18447e58f6f4379ba51785f2ba469acc5981fdb921f6d75f25726f0190ca4c5a"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/a2/18/470f024c5c3b6aff12fbf8f43e6aa0de4d9e31782c783b8c22b29f96863d/rich-13.0.1.tar.gz"
    sha256 "12b1d77ee7ed25110be74521e28ff1637dee4909f7a33aa52a2178e9f1c5dc43"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/9c/28/6f7b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6/requests-2.32.3.tar.gz"
    sha256 "55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760"
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
