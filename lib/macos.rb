require_relative('string')

class MacOS
  def initialize(config, options = {})
    @write = config['defaults']['write'] rescue {}

    @verbose = options[:verbose] || false
  end

  def defaults!
    results = @write.map do |domain, keys|
      puts " • Writing #{keys.length} keys for #{domain}".bold.green if @verbose
      key_results = keys.each do |key|
        system("defaults write #{domain} #{key}")
      end

      key_results.all?
    end

    raise "Some defaults failed" unless results.all?
  end
end
