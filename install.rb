#!/usr/bin/env ruby

require('yaml')

require_relative('support/brew')
require_relative('support/macos')
require_relative('support/string')
require_relative('support/symbolic_links')

config = YAML.load(open('./install.yaml'))

puts "\n« Setting macOS Defaults »".bold.blue
macos = MacOS.new(config['macos'], verbose: true)
macos.defaults!

puts "\n« Creating symbolic links »".bold.blue
links = SymbolicLinks.new(config['symlinks'], verbose: true)
links.create!

puts "\n« Installing homebrew »".bold.blue
brew = Brew.new(config['homebrew'], verbose: true)
brew.install!

puts "\n« Installing homebrew taps »".bold.blue
brew.tap!

puts "\n« Installing apps via homebrew »".bold.blue
brew.install_apps!

puts "\n« Installing asdf plugins »".bold.blue

puts "\n« Installing oh-my-zsh »".bold.blue