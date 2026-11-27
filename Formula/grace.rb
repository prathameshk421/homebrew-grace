class Grace < Formula
  desc "Site of Grace for project navigation, AI coding tools, and tmux workspaces"
  homepage "https://github.com/prathameshk421/grace"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/prathameshk421/grace/releases/download/v2.3.1/grace-v2.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "6d15352822addf4eb81dd3b723083aeb6a0a6b079e81a34189217914387ca7ed"
    else
      url "https://github.com/prathameshk421/grace/releases/download/v2.3.1/grace-v2.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "599b1f909e02758bfbefb0576e4dd546237a891e2769b046ba1765916439ee41"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/prathameshk421/grace/releases/download/v2.3.1/grace-v2.3.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "419b57a073d48cc3e5e5af607b23232d5a3d29ddf1d66c94c04ef56c462ab0c6"
    else
      url "https://github.com/prathameshk421/grace/releases/download/v2.3.1/grace-v2.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ffa84e25c9ed4284ac9c43d35b4dcf4993fcfcac0342e23a9f2984ef98f386ce"
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
