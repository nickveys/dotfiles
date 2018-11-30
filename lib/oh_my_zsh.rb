require_relative('string')

OH_MY_ZSH = '''
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
'''

class OhMyZsh
  def initialize(options = {})
    @verbose = options[:verbose] || false
  end

  def install!
    if Dir["#{Dir.home}/.oh-my-zsh"].empty?
      raise "oh-my-zsh installation failed" unless system(OH_MY_ZSH)
    else
      puts " • oh-my-zsh already installed".bold.magenta if @verbose
    end
  end
end
