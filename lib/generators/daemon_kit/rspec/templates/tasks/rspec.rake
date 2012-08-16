begin
  require 'rspec'
rescue LoadError
  begin
    require 'rubygems'
    require 'rspec'
  rescue LoadError
    puts <<-EOS
To use rspec for testing you must install rspec gem:

    gem install rspec

or add it to your Gemfile and install it:

    echo "gem 'rspec'" >> Gemfile
    bundle install

EOS
    exit 1
  end
end

begin
  require 'rspec/core/rake_task'

  desc "Run the specs under spec/"
  RSpec::Core::RakeTask.new do |t|
    t.rspec_opts = ['--options', "spec/spec.opts"]
  end

  # Want other tests/tasks run by default?
  # Add them to the list
  task :default => [:spec] #, :features]

rescue LoadError, NameError
  puts "Unable to define the rake spec task"
end
