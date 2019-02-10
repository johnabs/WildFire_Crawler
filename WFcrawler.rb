require 'selenium-webdriver'
require 'fileutils'
driver = Selenium::WebDriver.for :chrome 
site = ARGV
driver.get(site[0])
sleep(2)
dir = driver.title()
if !site[0].include? "2012" 
	driver.find_element(:id, "btnToBegining").click
	containerFrame = driver.find_element(:class => "ui-slider-track")
	slider = driver.find_element(:class => "ui-slider-handle")
else
	driver.find_element(:class, "ui-icon-seek-start").click
	containerFrame = driver.find_element(:class => "ui-slider-horizontal")
	slider = driver.find_element(:class => "ui-slider-handle")
end
width = containerFrame.size.width
i=0
while i < 100
	driver.action.drag_and_drop_by(slider,width/100,0).perform
	system("scrot")
	sleep(0.5)
	i += 1
end
FileUtils.mkdir_p dir 
dir="mv *.png " + dir.gsub(" ","\\ ")
system(dir)
exit
