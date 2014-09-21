require 'active_support'
require 'active_support/core_ext/object/blank'
require 'active_support/core_ext/hash/keys'
require 'thor'
require 'fileutils'
require 'mp4info'
require 'code_lister'

require_relative 'mp4_renamer/version'
require_relative 'mp4_renamer/cli'
require_relative 'mp4_renamer/renamer'
include Mp4Renamer
