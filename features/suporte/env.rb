require 'capybara/cucumber'
require 'clipboard'
require 'faker'
require 'cpf_faker'
require "faker_credit_card"
require "pry"
require "pry-nav"

ROOT_DIR = File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
SUPPORT_DIR = File.join(ROOT_DIR, 'features', 'support')

if ENV['HEADLESS'] == 'false'
  require "selenium-webdriver"
  Capybara.default_driver = :selenium
  Capybara.javascript_driver = Capybara.default_driver
else
  require "capybara-webkit"
  Capybara.default_driver = :webkit
  Capybara.javascript_driver = Capybara.default_driver

  require 'headless'
  Headless.new.start
end

Capybara.default_wait_time = ENV['TIMEOUT'] || 60
