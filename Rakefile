require 'kitchen'
require 'cookstyle'
require 'rubocop/rake_task'

# # Style tests. cookstyle (rubocop) and Foodcritic
namespace :style do
  desc 'Run Chef and ruby style checks'
  RuboCop::RakeTask.new(:cookstyle)
  RuboCop::RakeTask.new(:correct) do |task|
    task.options = ['-a']
  end
  RuboCop::RakeTask.new(:config) do |task|
    task.options = ['--auto-gen-config']
  end
  RuboCop::RakeTask.new(:correctconfig) do |task|
    task.options = ['--auto-gen-config', '-a']
  end
end

desc 'Run all style checks'
task style: ['style:cookstyle']

namespace :unit do
  require 'rspec/core/rake_task'

  desc 'Run ChefSpec examples'
  RSpec::Core::RakeTask.new(:spec)
end

desc 'Run all unit tests'
task unit: ['unit:spec']

namespace :integration do
  desc 'Run Test Kitchen with Vagrant'
  task :vagrant do
    Kitchen.logger = Kitchen.default_file_logger
    config = Kitchen::Config.new
    config.instances.each do |instance|
      instance.test(:always)
    end
  end
end

desc 'Run all integration tests'
task integration: ['integration:vagrant']

task default: %w(style unit)
task kitchen: ['integration:vagrant']
