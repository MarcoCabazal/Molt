
module Molt::CLI
  class Main < Thor
    include Thor::Actions

    option :name, type: :string
    option :email, type: :string
    option :company, type: :string
    option :project, type: :string
    option :model, type: :string, desc: "if not supplied, xcode placeholders will instead be used"
    option :create_model, type: :boolean, desc: "creates corresponding Mappable struct (ObjectMapper) and Core Data entity; requires --model to be set"
    option :output_folder, type: :string, desc: "create module folder in this directory", default: "."
    option :do_it, type: :boolean, default: false, aliases: "-f", desc: "Release the Kraken and write the files"

    desc "create_module MODULE_NAME TEMPLATE_SET", "NewShinyFeature"
    long_desc <<-LONG_DESC
    This generates a scaffold for a new VIPER module all contained in a folder.
    You will then have onto drag this folder onto Xcode.

    This command runs in dry-run mode by default (without using -f). That means this will only print the project/module
    configuration, list of templates, and eventual output files.

    When you're happy with what you see, just add --do-it or -f to exit dry-run mode.

    * Note that the default template set "viper_table" uses several Swift helper extensions all of which could be found in either ~/.molt or your project's ./.molt folder. These were all copied when you ran "molt setup" or "molt setup_project". Feel free to copy them or modify the template files to suit your preference.
    LONG_DESC
    def create_module(module_name, template_set)
      config = Molt::Configuration.load_or_initialize
      config = Molt::Configuration.apply_cli_overrides config, options, module_name, template_set
      rows = table_rows_for config

      sets = ""
      models = ""

      [Molt::MOLT_GLOBAL, Molt::MOLT_PROJECT ].each do |path|
        if Dir.exist? "#{path}/template_sets/#{template_set}"
          sets = "#{path}/template_sets"
          models = "#{path}/models"
          Liquid::Template.file_system = Liquid::LocalFileSystem.new("#{path}/partials/", '_%s.liquid')
        end
      end

      Dir["#{sets}/#{template_set}/**/*swift.liquid"].each do |template_file|
        template_base_folder = File.dirname(template_file).gsub(/#{sets}\/#{template_set}/, "")
        destination_folder = "#{options[:output_folder]}/#{module_name}#{template_base_folder}"

        base_file = File.basename(template_file.gsub(/.liquid$/, ""))
        output_file = "#{destination_folder}/#{module_name}#{base_file}"
        rows << [template_file.gsub(/#{sets}\//, ""), output_file.blue]

        if options[:do_it]
          FileUtils.mkdir_p destination_folder
          Molt::Template.liquify(template: template_file, output_file: output_file, config: config)
        end
      end

      if options[:create_model] && options[:model]
        Dir["#{models}/**/*swift.liquid"].each do |template_file|
          destination_folder = "#{options[:output_folder]}/#{module_name}/Models"

          base_file = File.basename(template_file.gsub(/.liquid$/, ""))
          base_file = base_file.gsub(/Entity/, options[:model])
          base_file = base_file.gsub(/Model/, "#{options[:model]}Model")
          output_file = "#{destination_folder}/#{base_file}"
          rows << [template_file.gsub(/#{models}\//, ""), output_file.blue]

          if options[:do_it]
            FileUtils.mkdir_p destination_folder
            Molt::Template.liquify(template: template_file, output_file: output_file, config: config)
          end
        end
      end
      output_table_with rows
      if !options[:do_it]
        puts "\nThat was just a dry-run. If this looks good to you, don't forget to add --do-it".green
      end
    end

    private
    def table_rows_for config
      rows = []
      rows << ["Developer", config["developer"]["name"].blue]
      rows << ["Email", config["developer"]["email"].blue]
      rows << ["Company", config["developer"]["company"].blue]
      rows << ["Project", config["project"]["name"].blue]

      rows << [" ", " "]
      rows << ["Template Set", config["template_set"].yellow]
      rows << [" ", " "]
      rows << ["Source".green, "Destination".green]
      rows
    end

    def output_table_with rows
      puts Terminal::Table.new rows: rows
    end
  end
end
