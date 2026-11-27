class Grace < Formula
  desc "Site of Grace for project navigation, AI coding tools, and tmux workspaces"
  homepage "https://github.com/prathameshk421/grace"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/prathameshk421/grace/releases/download/v2.3.0/grace-v2.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "cbcda5cf583158aa2e11e1fc66bc15eab199a3ed5a07791d3f1981ba395822ca"
    else
      url "https://github.com/prathameshk421/grace/releases/download/v2.3.0/grace-v2.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "968e3571c12d02698dade46139e6b4c2d90ee1541af75dd206a5f49903f7a282"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/prathameshk421/grace/releases/download/v2.3.0/grace-v2.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "637652aaabccaa85825c2d7902a7fdda07d9758fe71e900317c6e2d1c0df4988"
    else
      url "https://github.com/prathameshk421/grace/releases/download/v2.3.0/grace-v2.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "271d7257df1f1fa196c2a0944dcc9dceacc9b340c8cab55d27f114afc1bdd337"
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
