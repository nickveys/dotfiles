require 'yaml'

module Config

  def self.load(config_file)
    YAML.load(open("./config/#{config_file}.yaml"))
  end

end
