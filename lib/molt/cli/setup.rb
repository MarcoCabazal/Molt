module Molt::CLI
  class Main < Thor
    include Thor::Actions

    def self.source_root
      File.dirname "."
    end

    desc "setup", "Setup global config and templates in ~/.molt (HOME)"
    def setup
      config = Molt::Configuration.defaults_from_git_config
      copy_templates_to_home config if !Dir.exist? Molt::MOLT_GLOBAL
    end

    desc "setup_project", "Setup project-level config and templates in ./.molt (current directory)"
    long_desc "If you're working with other developers on this project, it's best to agree on the templates and have this commited to git. Now everyone gets to be lazy. 🍺"
    def setup_project
      config = Molt::Configuration.load_or_initialize
      copy_templates_to_project config if !Dir.exist? Molt::MOLT_PROJECT
    end

  private
    def copy_templates_to_home config
      directory "bundled", Molt::MOLT_GLOBAL
      template "sample_configs/global_config.yml.erb", Molt::CONFIG_GLOBAL, config
    end

    def copy_templates_to_project config
      directory "bundled", Molt::MOLT_PROJECT
      template "sample_configs/global_config.yml.erb", Molt::CONFIG_PROJECT, config
    end
  end
end
