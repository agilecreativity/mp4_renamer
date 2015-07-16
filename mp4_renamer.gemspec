# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mp4_renamer/version'
Gem::Specification.new do |spec|
  spec.name          = 'mp4_renamer'
  spec.version       = Mp4Renamer::VERSION
  spec.authors       = ['Burin Choomnuan']
  spec.email         = ['agilecreativity@gmail.com']
  spec.summary       = %q{Simple gem to rename mp4 and m4a files by adding running time to the filename using embeded metadata}
  spec.description   = %q{Rename the mp4 and m4a files by adding the running time to the end of the filename
                          TL;DR rename 'media_file.mp4' to 'media_file_12_34.mp4' if the running time is '12:34' minutes}
  spec.homepage      = 'https://github.com/agilecreativity/mp4_renamer'
  spec.required_ruby_version = ">= 1.9.3"
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'thor', '~> 0.19'
  spec.add_runtime_dependency 'mp4info', '~> 1.7.3'
  spec.add_runtime_dependency 'code_lister', '~> 0.2'

  spec.add_development_dependency 'awesome_print', '~> 1.6'
  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'gem-ctags', '~> 1.0'
  spec.add_development_dependency 'guard', '~> 2.12'
  spec.add_development_dependency 'guard-minitest', '~> 2.4'
  spec.add_development_dependency 'minitest', '~> 5.6'
  spec.add_development_dependency 'minitest-spec-context', '~> 0.0'
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency 'pry-byebug', '~> 1.3' if RUBY_VERSION >= '2.0.0'
  spec.add_development_dependency 'rake', '~> 10.4'
  spec.add_development_dependency 'rubocop', '~> 0.31'
  spec.add_development_dependency 'yard', '~> 0.8'
end
