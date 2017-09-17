require 'rubygems'
require 'watir'

class Clicker
  attr :pad
  def initialize
    @browser = Watir::Browser.new :chrome
    @pad=""
  end

  def login(arg1,arg2)
    @browser.goto SITE
    @browser.element(:xpath => "/html/body/div[1]/div[3]/div/div[1]/div/div[5]/div[3]").click
    @browser.text_field(xpath: "/html/body/div[6]/div/div[2]/div/div[4]/div[4]/div[1]/form/div[1]/input").set arg1
    @browser.text_field(xpath: "/html/body/div[6]/div/div[2]/div/div[4]/div[4]/div[1]/form/div[2]/input").set arg2
    @browser.button(xpath: "/html/body/div[6]/div/div[2]/div/div[4]/div[4]/div[2]/div/div[1]/button").click
  end

  def create_pad(arg)
    @browser.element(xpath: "/html/body/div[1]/div[3]/div/div/div/div[3]/div[2]/div/div/div/div[4]/div/div[1]").click
    @browser.text_field(xpath: "/html/body/div[1]/div[3]/div/div/div/div[3]/div[2]/div/div[1]/div/div/div[2]/div[1]/input").set arg
    @pad=@browser.text_field(xpath: "/html/body/div[1]/div[3]/div/div/div/div[3]/div[2]/div/div[1]/div/div/div[1]/input").value
    @browser.element(xpath: "/html/body/div[1]/div[3]/div/div/div/div[3]/div[2]/div/div[3]/div/div[3]/span[1]/span").click
    sleep 30
  end

  def create_block(title)
    @browser.link(text: "Создать блок").click
    @browser.span(title: title).click
    @browser.span(text: "Добавить блок").click
    sleep 30
  end

  def click_pad
    @browser.link(text: @pad).click
  end

  def take_ids
    ids =[]
    tmp1=[]
    tmp1= @browser.links.map(&:href).select {|x| x.match("edit")}[0].split('/')[4]
    ids<<tmp1
    tmp1=@browser.links.map(&:href).select {|x| x.match("pads")}
    tmp1.each do |element|
      ids<<element.split('/')[4]
    end
    puts ids
  end

  def quit
    @browser.quit
  end
end