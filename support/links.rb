require('fileutils')
require_relative('string')

class Links
  def initialize(links, options = {})
    @links = links
    # @force = options[:force] || false
    @verbose = options[:verbose] || false
  end

  def create!
    puts "« Creating #{@links.length} links »".bold.blue
    results = @links.map do |from, details|
      to = details['to']
      create_link(from, to)
    end

    raise "Some link creation failed" unless results.all?
  end

  def create_link(from, to)
    print " • Link #{from} -> #{to} ".green if @verbose
    from = File.expand_path(from)
    to = File.expand_path(to)

    # already linked? done.
    if already_linked?(from, to)
      puts "link exists".bold.magenta if @verbose
      return true
    end

    # something there? warn.
    if File.exist?(from) || Dir.exist?(from)
      puts "something in the way".bold.red if @verbose
      return false
    end

    # should be clear, make the link
    FileUtils.mkdir_p(File.dirname(from))
    if 0 == File.symlink(to, from)
      puts "created".bold.green if @verbose
    end

    true
  end

  def already_linked?(from, to)
    current = File.readlink(from) rescue nil
    return to == current
  end
end
