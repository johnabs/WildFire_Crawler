require 'selenium-webdriver'
require 'fileutils'
driver = Selenium::WebDriver.for :chrome 
site = ARGV
driver.get(site[0])
sleep(2)
dir = driver.title()
FileUtils.mkdir_p dir 
driver.find_element(:id, "btnToBegining").click
containerFrame = driver.find_element(:class => "ui-slider-track")
width = containerFrame.size.width
slider = driver.find_element(:class => "ui-slider-handle")
i=0
while i < 100
	driver.action.drag_and_drop_by(slider,width/100,0).perform
	system("scrot")
	sleep(0.5)
	i += 1
end
dir="mv *.png " + dir.gsub(" ","\\ ")
system(dir)
exit
