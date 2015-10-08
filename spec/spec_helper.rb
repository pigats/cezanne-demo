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

Capybara.register_driver(:iphone6) do |app|
  desired_caps_ios = { 
    :name => "iPhone 6", 
    :platformName => "iOS", 
    :platformVersion => "8.4", 
    :deviceName =>  "iPhone 6", 
    :browserName => "Safari", 
    :orientation => "portrait",  
    :type => "mobile" 
  }

  appium_lib_options = {
    server_url: 'http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_API_KEY']}@ondemand.saucelabs.com:80/wd/hub'
  }

  all_options = {
      appium_lib:  appium_lib_options,
      caps:        desired_caps_ios
  }

  Appium::Capybara::Driver.new app, all_options
end

Capybara.default_driver = :iphone6

Capybara.app_host = 'http://www.google.it' 
