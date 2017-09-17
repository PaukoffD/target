require 'watir'
require 'spec_helper'
require_relative '../lib/clicker.rb'

chromedriver_path = File.join('../..',"ror","target","chromedriver")
Selenium::WebDriver::Chrome.driver_path = chromedriver_path
SITE='https://target-sandbox.my.com/'

describe "check goto" do

  before :all do
    @browser = Watir::Browser.new
    @browser.goto SITE
  end
  it "site" do
    expect(@browser.title).to eq("Target.my.com")
  end

  after :all do
   @browser.close
  end
end

describe "login" do

    before :all do
      @browser = Watir::Browser.new
      @browser.goto SITE
    end

    it "successfull" do
      arg0='xulia@paukoff.ru'
      arg1='987654321q'

      @clicker=Clicker.new
      @clicker.login(arg0,arg1)
      expect(@browser.title).to eq("myTarget")
    end
    it "non-successfull"

    after :all do
      @browser.close
    end
end
  describe "create pad"
  describe "create block"
  describe "take ids"
