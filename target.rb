require 'rubygems'
require 'pry-rails'
require 'watir'
require_relative './lib/clicker'

SITE='https://target-sandbox.my.com/'

chromedriver_path = File.join('../..',"ror","target","chromedriver")
Selenium::WebDriver::Chrome.driver_path = chromedriver_path



clicker=Clicker.new

unless ARGV.size==2
  puts "Аргументов должно быть 3"
  return
end


clicker.login(ARGV[0],ARGV[1])
clicker.create_pad("feeds.paukoff.ru")
clicker.click_pad
clicker.create_block("medium")
clicker.create_block("leaderboard")
clicker.take_ids
clicker.quit
