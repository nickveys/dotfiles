require_relative('string')

OH_MY_ZSH = '''
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
'''

class OhMyZSH
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
