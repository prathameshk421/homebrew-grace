class Grace < Formula
  desc "Site of Grace for project navigation, AI coding tools, and tmux workspaces"
  homepage "https://github.com/prathameshk421/grace"
  version "2.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/prathameshk421/grace/releases/download/v2.2.0/grace-v2.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "7c67f858666d6eaab7f1b535c760853b183979d6b1ab69b1ae4840b326694fac"
    else
      url "https://github.com/prathameshk421/grace/releases/download/v2.2.0/grace-v2.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "826ccf861b05c0f5de8aeea50d8ae1271aa5d01b21c5ef206fb5a3e35678b35e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/prathameshk421/grace/releases/download/v2.2.0/grace-v2.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cb8b07245c5e873dbfc6432e02275ece9efb86ee7f3a0ebe2ff66fe9f4542094"
    else
      url "https://github.com/prathameshk421/grace/releases/download/v2.2.0/grace-v2.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "554237bb8d02484f6e51dbdf069d74dd3ebcbc3897b1380b602e6ea8c9ebd03e"
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
