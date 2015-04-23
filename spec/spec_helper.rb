require 'rspec'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'cezanne/rspec'


RSpec.configure do |config|
  config.include Cezanne
end

Cezanne.configure do |config|
  config.uid = Time.now.to_i.to_s 
  config.project_name = 'Demo'
end

Capybara.default_driver = :selenium
Capybara.app_host = 'http://www.google.it' 
