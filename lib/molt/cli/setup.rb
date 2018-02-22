require "thor"

module Molt::CLI
  class Setup < Thor
    include Thor::Actions

    def self.source_root
      Molt::ROOT
    end

    desc "perform", "perform"
    def perform(molt_path, config_path)
      config = molt_path == Molt::MOLT_GLOBAL ? Molt::Configuration.defaults_from_git_config : Molt::Configuration.load_or_initialize

      if !Dir.exist? molt_path
        directory "bundle", molt_path
        template "sample_configs/global_config.yml.erb", config_path, config
      else
        puts "Doing nothing. #{molt_path} is already existing.".yellow
      end
    end
  end
end
