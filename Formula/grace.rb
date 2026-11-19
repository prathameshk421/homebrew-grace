class Grace < Formula
  desc "Fast travel between project folders, with tags for the AI tools used there"
  homepage "https://github.com/prathameshk421/grace"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/prathameshk421/grace/releases/download/v2.0.1/grace-v2.0.1-aarch64-apple-darwin.tar.gz"
      sha256 "5f3655b4bfd6649507de8c7e4e94dfbc88661a081c2f7390bc4c5d5af75c05c2"
    end
    on_intel do
      url "https://github.com/prathameshk421/grace/releases/download/v2.0.1/grace-v2.0.1-x86_64-apple-darwin.tar.gz"
      sha256 "f9727bc3d0c5b48498af6973a06631328916612fa8b3db9e019cef513af53438"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prathameshk421/grace/releases/download/v2.0.1/grace-v2.0.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1f78cc46637b35cf6d349f2e56f42e61da8eef62b1dbff0364ff779aff828f5f"
    end
    on_intel do
      url "https://github.com/prathameshk421/grace/releases/download/v2.0.1/grace-v2.0.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f41b9b16e57e569898d3d5da400124aae1a21708ec9c34b35e509ed058cfa5bc"
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
