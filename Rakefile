#!/usr/bin/env rake

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

desc "Run Specs"
RSpec::Core::RakeTask.new(:spec)

desc "Default: Run Specs"
task :default => :spec

desc "Test: Run Specs"
task :test => :spec

# Bundler::GemHelper.install_tasks





# require 'yard'
# namespace :doc do
#   YARD::Rake::YardocTask.new do |task|
#     task.files   = ['LICENSE.md', 'lib/**/*.rb']
#     task.options = ['--markup', 'markdown']
#   end
# end
