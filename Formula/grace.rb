class Grace < Formula
  desc "Fast travel between project folders, with tags for the AI tools used there"
  homepage "https://github.com/prathameshk421/grace"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/prathameshk421/grace/releases/download/v2.0.2/grace-v2.0.2-aarch64-apple-darwin.tar.gz"
      sha256 "595996f8d4626608357dc7c18410239143ab72c302241674cd2337810885c5df"
    end
    on_intel do
      url "https://github.com/prathameshk421/grace/releases/download/v2.0.2/grace-v2.0.2-x86_64-apple-darwin.tar.gz"
      sha256 "9aad033861d87eb5523a474effcd15cccee88f1a134538821f3fac46cb54b08b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prathameshk421/grace/releases/download/v2.0.2/grace-v2.0.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "516c4c80bd5a9ec3fc47dab6071a8cb04eb77f806333a4442eaa1c20f08ebe13"
    end
    on_intel do
      url "https://github.com/prathameshk421/grace/releases/download/v2.0.2/grace-v2.0.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0285f5f0df00f10b5a8c2900c58606686464916ffd97d9b3d8851ce35d0bc5ac"
    end
  end

  def install
    bin.install "grace"
  end

  def caveats
    <<~EOS
      grace is fast travel for your terminal.
      It remembers every project folder you work in, on any disk,
      and tags each one with the AI tools and editors you used there.
      Type `grace` and pick a folder to jump to it.

      Set it up in 2 steps:
        1. Add one line to your shell, then open a new terminal:
             zsh:  echo 'eval "$(grace init zsh)"' >> ~/.zshrc
             bash: echo 'eval "$(grace init bash)"' >> ~/.bashrc
             fish: echo 'grace init fish | source' >> ~/.config/fish/config.fish
        2. Run `grace`. The first run imports your Claude Code and editor history.

      More to try:
        grace hub      agents, shell, live diff and file tree in one window
        grace diff     the git changes of a folder
        grace tree     the files of a folder as a tree
        grace --help   every command

      `grace hub` needs tmux: brew install tmux
      Docs: https://github.com/prathameshk421/grace
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/grace --version")
  end
end
