require_relative('string')

class MacOS
  def initialize(config, options = {})
    @write = config['defaults']['write'] rescue {}
    @apps = config['app-store']['install'] rescue []
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

  def install_apps!
    raise "mas-cli not installed" if `which mas`.empty?
    raise "Sign In to App Store via GUI first" unless is_mas_logged_in?
    raise "Some mas-cli installations failed (#{$?})" unless do_install_apps
  end

  private

  def do_install_apps
    system("mas install #{@apps.join(' ')}")
  end

  def is_mas_logged_in?
    system("mas account")
  end
end
