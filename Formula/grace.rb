class Grace < Formula
  desc "Fast travel between project folders, with tags for the AI tools used there"
  homepage "https://github.com/prathameshk421/grace"
  version "2.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/prathameshk421/grace/releases/download/v2.0.0/grace-v2.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "6948690fe8fba352c47ce3a5a1667bff9ff6ddfccc13fb526216f267330e41bb"
    end
    on_intel do
      url "https://github.com/prathameshk421/grace/releases/download/v2.0.0/grace-v2.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "ebb6066bfced2da3a51678302ad8954c34b5aca39f60942950a2cf05e7990572"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prathameshk421/grace/releases/download/v2.0.0/grace-v2.0.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c507b342ee4968f0e059c1aaeca60f3122efd455fa3eb3a242208f962a050234"
    end
    on_intel do
      url "https://github.com/prathameshk421/grace/releases/download/v2.0.0/grace-v2.0.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d04f1943dae4b184baaaee21ad0406bb116fbd87bb8085fce2a0933ab7365339"
    end
  end

  def install
    bin.install "grace"
  end

  def caveats
    <<~EOS
      Add grace to your shell, then open a new terminal:
        zsh:  echo 'eval "$(grace init zsh)"' >> ~/.zshrc
        bash: echo 'eval "$(grace init bash)"' >> ~/.bashrc
        fish: echo 'grace init fish | source' >> ~/.config/fish/config.fish

      `grace hub` needs tmux:
        brew install tmux
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/grace --version")
  end
end
