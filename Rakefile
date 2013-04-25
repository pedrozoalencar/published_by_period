# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end
require 'rake'

begin
  require 'jeweler'
  require './lib/publish_by_period/version.rb'
  Jeweler::Tasks.new do |gem|
    gem.name = 'publishable_by_period'
    gem.license = 'MIT'
    gem.summary = 'Adds publishing period functionality to your active record model'
    gem.description = 'Provides methods to publish period your active record models based on a boolean flag, a date, or a datetime. Also adds named scopes to nicely filter your records. Does not touch any controller or views.'
    gem.email = ['pedrozo.alencar@gmail.com']
    gem.homepage = 'http://github.com/pedrozoalencar/publish_by_period'
    gem.authors = ['Renato Alencar']
    gem.version = "#{PublishByPeriod::VERSION}"
    # dependencies defined in Gemfile
    # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  end
  Jeweler::RubygemsDotOrgTasks.new
rescue LoadError
  puts 'Jeweler (or a dependency) not available. Install it with: gem install jeweler'
end

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new