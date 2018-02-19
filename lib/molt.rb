require "molt/version"
require "molt/configuration"
require "molt/template"
require "molt/cli/main"
require "generamba/string-colorize"

module Molt
  MOLT_GLOBAL    = "#{Dir.home}/.molt"
  MOLT_PROJECT   = "./.molt"
  CONFIG_GLOBAL  = "#{MOLT_GLOBAL}/config.yml"
  CONFIG_PROJECT = "#{MOLT_PROJECT}/config.yml"
  LONG_DESC      = <<-TAG
This generates a scaffold for a new VIPER module all contained in a folder. You will then have onto drag this folder onto Xcode.

This command runs in dry-run mode by default (without using -f). That means this will only print the project/module configuration, list of templates, and eventual output files.

When you're happy with what you see, just add --do-it or -f to exit dry-run mode.

* Note that the default template set "viper_table" uses several Swift helper extensions all of which could be found in either ~/.molt or your project's ./.molt folder. These were all copied when you ran "molt setup" or "molt setup_project". Feel free to copy them or modify the template files to suit your preference.
TAG
end

