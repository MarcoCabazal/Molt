require "yaml"

module Molt
  class Configuration
    def self.load_or_initialize
      config_path = nil
      [ Molt::CONFIG_PROJECT, Molt::CONFIG_GLOBAL ].each do |path|
        if File.exist? path
          config_path = path
          break
        end
      end

      return YAML.load_file(config_path) if config_path
      puts 'Please run "molt setup" first'.red
      exit
    end

    def self.defaults_from_git_config
      user = { }
      name = `git config --get user.name`.chomp
      email = `git config --get user.email`.chomp
      user["name"] = name.length > 0 ? name : "REPLACE_ME_IN_CONFIG"
      user["email"] = email.length > 0 ? email : "REPLACE_ME_IN_CONFIG"
      return { "developer" => user }
    end

    def self.apply_cli_overrides config, options, module_name, template_set
      config["template_set"] = template_set
      config["target"] = "raw"

      config["developer"]["name"] = options.name if options.name
      config["developer"]["email"] = options.email if options.email
      config["developer"]["company"] = options.company if options.company
      config["project"]["name"] = options.project if options.project

      config["module_name"] = module_name
      config["model"] = "#{options.model}Model" || "<# Model #>"
      config["entity"] = options.model || "<# Entity #>"

      config["year"] = Time.now.strftime("%Y")
      config["date"] = Time.now.strftime("%d/%m/%Y")
      config
    end

    def self.config_for_xcode config, options, module_name, template_set
      config["template_set"] = template_set
      config["target"] = "xcode"

      config["module_name"] = "___VARIABLE_productName:identifier___"
      config["model"] = "___VARIABLE_MODEL___Model"
      config["entity"] = "___VARIABLE_MODEL___"
      config
    end
  end
end
