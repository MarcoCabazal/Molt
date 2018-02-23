require "commander"
require "fileutils"
require "terminal-table"
require "generamba/string-colorize.rb"

require "molt/cli/setup"
require "molt/cli/template_sets"
require "molt/cli/create_module"

module Molt::CLI
  class Main
    def self.start
      Commander.configure do
        program :name, "Molt".yellow
        program :version, Molt::VERSION.green
        program :description, "Molt is a simple VIPER module generator for Swift apps.".blue
        program :help, "Author", "@MarcoCabazal"
        program :help, "Source", "https://github.com/MarcoCabazal/Molt".blue
        program :help, "Version", Molt::VERSION

        default_command :help
        global_option("--verbose", "Add verbosity where applicable") { $verbose = false }

        command :setup do |c|
          c.syntax = 'molt setup'
          c.description = 'Setup global config and templates in ~/.molt (HOME)'
          c.action do |args, options|
            Molt::CLI::Setup.start(["perform", Molt::MOLT_GLOBAL, Molt::CONFIG_GLOBAL])
          end
        end

        command :'setup:project' do |c|
          c.syntax = "molt setup:project"
          c.summary = "Setup project-level config and templates in ./.molt (current directory)"
          c.description = "#{c.summary}\n\nIf you're working with other developers on this project, it's best to agree on the templates and have this commited to git. Now everyone gets to be lazy. 🍺"
          c.action do |args, options|
            Molt::CLI::Setup.start(["perform", Molt::MOLT_PROJECT, Molt::CONFIG_PROJECT])
          end
        end

        command :template_sets do |c|
          c.syntax = 'molt template_sets'
          c.description = "List templates sets (add --verbose to see list of files)"
          c.action do |args, options|
            Molt::CLI::Template.sets(options.verbose)
          end
        end
        alias_command :'t', :template_sets

        command :create_module do |c|
          c.syntax = 'molt create_module MODULE_NAME TEMPLATE_SET'
          c.summary = "Generate component files for a VIPER module"
          c.description = Molt::LONG_DESC_CREATE_MODULE
          c.option '--name NAME', String, "Author name"
          c.option '--email EMAIL', String, "Author email"
          c.option '--company COMPANY', String, "Author company"
          c.option '--project PROJECT', String, "Project name"
          c.option '--output-folder DIRECTORY', String, "Create module folder in this directory. Defaults to \"./\""
          c.option '--model MODEL', String, "Model name. If unspecified, Xcode placeholders will be used instead"
          c.option '--create-model', false, "If specified, it creates corresponding Mappable struct (ObjectMapper) and Core Data entity; requires --model to be set"
          c.option '--do-it', false, "Release the Kraken and write the files"
          c.action do |args, options|
            options.default :output_folder => "."
            Molt::CLI::Generator.create_module(args[0], args[1], options)
          end
        end
        alias_command :'c', :create_module

        command :xcode do |c|
          c.syntax = 'molt xcode TEMPLATE_SET'
          c.summary = "Export template set as Xcode template"
          c.description = Molt::LONG_DESC_XCODE
          c.option '--output-folder DIRECTORY', String, "Create module folder in this directory. Defaults to \"./\""
          c.option '--do-it', false, "Release the Kraken and write the files"
          c.action do |args, options|
            options.default :output_folder => "."
            Molt::CLI::Generator.create_module("", args[0], options, true)
          end
        end
        alias_command :'x', :xcode
      end
    end
  end
end
