class Grace < Formula
  desc "Site of Grace for project navigation, AI coding tools, and tmux workspaces"
  homepage "https://github.com/prathameshk421/grace"
  version "2.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/prathameshk421/grace/releases/download/v2.1.0/grace-v2.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "9a0134b8034a820ddb0682080bafc740a03106482d03cd3252682fc22e07ad22"
    else
      url "https://github.com/prathameshk421/grace/releases/download/v2.1.0/grace-v2.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "a28ebbc3aa172389012dc0dddb9cdede57e53757e6ca90737494adebf2b43d4a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/prathameshk421/grace/releases/download/v2.1.0/grace-v2.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c437e32befa267d6bb30c710dc811ca60a32f74b0f404e591b8b6efade542808"
    else
      url "https://github.com/prathameshk421/grace/releases/download/v2.1.0/grace-v2.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "17169a100b5337dbffdde4a7d56f733dde1949b2aedce6281a7a990d84a7d5a3"
    end
  end

  def install
    bin.install "grace"
  end

  def caveats
    <<~EOS
      Add one line to your shell config, then open a new terminal:

        zsh:   eval "$(grace init zsh)"
        bash:  eval "$(grace init bash)"
        fish:  grace init fish | source

      Optional completions and health diagnostics:
        grace completions zsh
        grace setup --all
        grace doctor
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/grace --version")
  end
end
