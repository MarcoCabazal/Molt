module Molt::CLI
  class Generator

    def self.create_module(module_name, template_set, options)
      puts "OPTIONS #{options.inspect}".blue
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
        destination_folder = "#{options.output_folder}/#{module_name}#{template_base_folder}"

        base_file = File.basename(template_file.gsub(/.liquid$/, ""))
        output_file = "#{destination_folder}/#{module_name}#{base_file}"
        rows << [template_file.gsub(/#{sets}\//, ""), output_file.blue]

        if options.do_it
          FileUtils.mkdir_p destination_folder
          Molt::Template.liquify(template: template_file, output_file: output_file, config: config)
        end
      end

      if options.create_model && options.model
        Dir["#{models}/**/*swift.liquid"].each do |template_file|
          destination_folder = "#{options.output_folder}/#{module_name}/Models"

          base_file = File.basename(template_file.gsub(/.liquid$/, ""))
          base_file = base_file.gsub(/Entity/, options.model)
          base_file = base_file.gsub(/Model/, "#{options.model}Model")
          output_file = "#{destination_folder}/#{base_file}"
          rows << [template_file.gsub(/#{models}\//, ""), output_file.blue]

          if options.do_it
            FileUtils.mkdir_p destination_folder
            Molt::Template.liquify(template: template_file, output_file: output_file, config: config)
          end
        end
      end
      output_table_with rows
      if !options.do_it
        puts "\nThat was just a dry-run. If this looks good to you, don't forget to add --do-it".green
      end
    end

    private
    def self.table_rows_for config
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

    def self.output_table_with rows
      puts Terminal::Table.new rows: rows
    end
  end
end
