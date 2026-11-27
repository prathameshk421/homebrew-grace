class Grace < Formula
  desc "Site of Grace for project navigation, AI coding tools, and tmux workspaces"
  homepage "https://github.com/prathameshk421/grace"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/prathameshk421/grace/releases/download/v2.2.2/grace-v2.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "f22c1437bc3ec5f5ff7d5e334aca0f157f472befe8142ab68b9289e97afcc148"
    else
      url "https://github.com/prathameshk421/grace/releases/download/v2.2.2/grace-v2.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "4b2a6c5ba6346820235102b151c75c93baa9309ce0a4c0e32ccad5a824c8ebb0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/prathameshk421/grace/releases/download/v2.2.2/grace-v2.2.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3f6e0615136905f2299ad78ac1ce38aea952eecbf49802feed3503b7067e9bb6"
    else
      url "https://github.com/prathameshk421/grace/releases/download/v2.2.2/grace-v2.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "712586ebb26c18ede941fc83f90f359b68350bbc38be76f22bc7f1357ccd09ee"
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
