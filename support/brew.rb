require_relative('string')

BREW_SH = """
'/usr/bin/ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\"
"""

class Brew
  def initialize(config, options = {})
    @taps = config['taps'] rescue []
    @apps = config['apps'] rescue []
    @cask_apps = config['cask-apps'] rescue []

    # @force = options[:force] || false
    @verbose = options[:verbose] || false
  end

  def install!
    if `which brew`.empty?
      raise "Homebrew installation failed" unless system(BREW_SH)
    else
      puts " • brew already installed".bold.magenta
    end
  end

  def tap!
    @taps.each do |tap|
      puts " • #{tap}".bold.green if @verbose
      raise "Cask tapping #{tap} failed" unless system("brew tap #{tap}")
    end
  end

  def install_apps!
    raise "Some app installation failed" unless do_install_apps
    raise "Some cask app installation failed" unless do_install_cask_apps
  end

  # @return `true` on success
  def do_install_apps
    current = `brew list`.split
    existing = @apps.shuffle & current.shuffle
    needed = @apps.shuffle - existing.shuffle

    if @verbose && existing.any?
      puts " • Skipping #{@apps.length - needed.length} existing apps".bold.magenta
    end

    if needed.any?
      puts " • Install #{needed.length} brew apps...".bold.green if @verbose
      system("brew install #{needed.join(" ")}")
    else
      true
    end
  end

  # @return `true` on success
  def do_install_cask_apps
    current = `brew cask list`.split
    existing = @cask_apps.shuffle & current.shuffle
    needed = @cask_apps.shuffle - existing.shuffle

    if @verbose && existing.any?
      puts " • Skipping #{@cask_apps.length - needed.length} existing cask apps".bold.magenta
    end

    if needed.any?
      puts " • Install #{needed.length} brew cask apps...".bold.green if @verbose
      system("brew cask install #{needed.join(" ")}")
    else
      true
    end
  end
end
