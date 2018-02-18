require "fileutils"
require "liquid"
require "terminal-table"
require "thor"
require "yaml"

require "molt/cli/version"
require "molt/cli/setup"
require "molt/cli/template_sets"
require "molt/cli/create_module"

module Molt::CLI
  class Main < Thor
  end
end
