#!/usr/bin/env ruby

require('yaml')

require_relative('support/links')
require_relative('support/string')

config = YAML.load(open('./install.yaml'))

links = Links.new(config['links'], verbose: true)
links.create!

puts

puts "« Installing homebrew »".bold.blue
BREW_SH = """
'/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
"""

puts "« Installing homebrew casks »".bold.blue

puts "« Installing apps via homebrew »".bold.blue

puts "« Installing asdf plugins »".bold.blue

puts "« Installing oh-my-zsh »".bold.blue
