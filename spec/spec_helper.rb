require 'rspec'
require 'awesome_print'

require File.expand_path('../../lib/mongoid-embedded_with', __FILE__)
#puts "Mongoid::EmbeddedWith #{Mongoid.const_defined?(:EmbeddedWith)}"

def database_id
  ENV['CI'] ? "mongoid-embedded_with_#{Process.pid}" : 'mongoid-embedded_with_test'
end

Mongoid.configure do |config|
  config.connect_to database_id
end

Dir['./spec/models/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.before(:each) do
    Mongoid.purge!
    Mongoid::IdentityMap.clear
  end

  config.after(:suite) do
    Mongoid::Threaded.sessions[:default].drop if ENV['CI']
  end
end