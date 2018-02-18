module Molt::CLI
  class Main < Thor
    option :verbose, type: :boolean

    desc "template_sets", "List templates sets (add --verbose to see list of files)"
    def template_sets
      [ Molt::MOLT_PROJECT, Molt::MOLT_GLOBAL].each do |path|
        puts "#{path.yellow}:"
        if options[:verbose]
          Dir["#{path}/**/*swift.liquid"].each { |template_file| puts template_file.blue }
        else
          Dir.glob("#{path}/template_sets/*").each { |entry| puts entry.blue if File.directory? entry }
        end
        puts
      end

      puts "Add --verbose to list all files in each template set".green if !options[:verbose]
    end
  end
end
