require_relative('string')

ASDF_VERSION = 'v0.6.3'

ASDF_SH = """
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch #{ASDF_VERSION}
"""

class ASDF
  def initialize(config, options = {})
    @plugins = config['plugins'] rescue []

    @verbose = options[:verbose] || false
  end

  def install!
    if `which asdf`.empty?
      raise "asdf installation failed" unless system(ASDF_SH)
    else
      puts " • asdf already installed".bold.magenta if @verbose
    end
  end

  def plugins!
    current = `asdf plugin-list`.split
    existing = @plugins & current
    needed = @plugins - existing

    if @verbose && existing.any?
      puts " • Skipping #{@plugins.length - needed.length} existing plugins".bold.magenta
    end

    results = needed.map do |plugin|
      puts " • Installing asdf #{plugin} plugin".bold.green if @verbose
      system("asdf plugin-add #{plugin}")
    end

    raise "Some plugins failed" unless results.all?
  end
end
