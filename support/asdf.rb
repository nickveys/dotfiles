require_relative('string')

class ASDF
  def initialize(config, options = {})
    @plugins = config['plugins'] rescue []

    @verbose = options[:verbose] || false
  end

  def plugins!
    current = `asdf plugin-list`.split
    existing = @plugins & current
    needed = @plugins - existing

    if @verbose && existing.any?
      puts " • Skipping #{@plugins.length - needed.length} existing plugins".bold.magenta
    end

    results = needed.map do |plugin|
      puts " • Installing asdf #{plugin} plugin".bold.green
      system("asdf plugin-add #{plugin}")
    end

    raise "Some plugins failed" unless results.all?
  end
end
