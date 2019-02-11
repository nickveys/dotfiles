require_relative('string')

RVM_KEYS = [
  'curl -sSL https://rvm.io/mpapis.asc | gpg --import -',
  'curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -',
]

RVM_SH = '''
\curl -sSL https://get.rvm.io | bash -s stable
'''

class RVM
  def initialize(options = {})
    @verbose = options[:verbose] || false
  end

  def install!
    if `which rvm`.empty?
      raise 'gpg key installation failed' unless system(RVM_KEYS[0])
      raise 'gpg key installation failed' unless system(RVM_KEYS[1])
      raise "rvm installation failed" unless system(RVM_SH)
    else
      puts " • rvm already installed".bold.magenta if @verbose
    end
  end
end
