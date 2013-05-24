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