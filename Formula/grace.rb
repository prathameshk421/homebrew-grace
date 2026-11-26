class Grace < Formula
  desc "Site of Grace for project navigation, AI coding tools, and tmux workspaces"
  homepage "https://github.com/prathameshk421/grace"
  version "2.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/prathameshk421/grace/releases/download/v2.2.1/grace-v2.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "6130edb99edc3eff85325205118926ecea7e3579f9071967f13f6e1078fd8497"
    else
      url "https://github.com/prathameshk421/grace/releases/download/v2.2.1/grace-v2.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "df5cd066c0cfa4001dc5908b310779da3e434a4436a5c396c8afe13b9fb95af8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/prathameshk421/grace/releases/download/v2.2.1/grace-v2.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e09b868ca7f07fe6bd1a650dde2454b9fc19664e102dd4074362dc69df2ed513"
    else
      url "https://github.com/prathameshk421/grace/releases/download/v2.2.1/grace-v2.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a29e8f9230bb302bba549994523cb8920c5a2d5baf3059570feafa3231181141"
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
