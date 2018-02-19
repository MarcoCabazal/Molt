module Molt::CLI
  class Template

    def self.sets verbose = false
      [ Molt::MOLT_PROJECT, Molt::MOLT_GLOBAL].each do |path|
        puts "#{path.yellow}:"
        if verbose
          Dir["#{path}/**/*swift.liquid"].each { |template_file| puts template_file.blue }
        else
          Dir.glob("#{path}/template_sets/*").each { |entry| puts entry.blue if File.directory? entry }
        end
        puts
      end

      puts "Add --verbose to list all files in each template set".green if !verbose
    end
  end
end
