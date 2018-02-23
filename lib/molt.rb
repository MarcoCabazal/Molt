require "molt/version.rb"
require "molt/cli/main.rb"

module Molt
  ROOT = File.expand_path(File.join(File.dirname(__FILE__), ".."))
  MOLT_GLOBAL    = "#{Dir.home}/.molt"
  MOLT_PROJECT   = "./.molt"
  CONFIG_GLOBAL  = "#{MOLT_GLOBAL}/config.yml"
  CONFIG_PROJECT = "#{MOLT_PROJECT}/config.yml"
  LONG_DESC_CREATE_MODULE = <<-TAG
This generates a scaffold for a new VIPER module all contained in a folder. You will then have onto drag this folder onto Xcode.

This command runs in dry-run mode by default (without using -f). That means this will only print the project/module configuration, list of templates, and eventual output files.

When you're happy with what you see, just add --do-it or -f to exit dry-run mode.

* Note that the default template set "viper_table" uses several Swift helper extensions all of which could be found in either ~/.molt or your project's ./.molt folder. These were all copied when you ran "molt setup" or "molt setup_project". Feel free to copy them or modify the template files to suit your preference.
TAG
  LONG_DESC_XCODE = <<-TAG

This command basically exports a template set and makes it available as an Xcode template, which makes your often-used template instantly available from within Xcode itself. When you do create a new file from within Xcode, you will be prompted for the module name and the model. Other meta details normally available in create_module won't be necessary during the export.

This command runs in dry-run mode by default (without using -f). That means this will only print the project/module configuration, list of templates, and eventual output files.

When you're happy with what you see, just add --do-it or -f to exit dry-run mode.

* Note that the default template set "viper_table" uses several Swift helper extensions all of which could be found in either ~/.molt or your project's ./.molt folder. These were all copied when you ran "molt setup" or "molt setup_project". Feel free to copy them or modify the template files to suit your preference.
TAG
end

