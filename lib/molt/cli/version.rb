module Molt::CLI
  class Main < Thor
    desc 'version', 'Prints out current version'
    def version
      puts "Version: " + Molt::VERSION.yellow
    end
  end
end
