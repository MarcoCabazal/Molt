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
end

