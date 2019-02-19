require 'selenium-webdriver'
require 'fileutils'
#Open new browser
driver = Selenium::WebDriver.for :chrome 
#Pass website as command line argument
site = ARGV
#Open Website and wait for it to load
driver.get(site[0])
sleep(2)
dir = driver.title()
#Check to see if link contains the year 2012, as the web formatting is drastically different
if !site[0].include? "2012" 
	driver.find_element(:id, "btnToBegining").click
	containerFrame = driver.find_element(:class => "ui-slider-track")
	slider = driver.find_element(:class => "ui-slider-handle")
#Otherwise, use the normal script to find the relevant UI parts 
else
	driver.find_element(:class, "ui-icon-seek-start").click
	containerFrame = driver.find_element(:class => "ui-slider-horizontal")
	slider = driver.find_element(:class => "ui-slider-handle")
end
#Get width of the frame, divide by 100 later so we move the slider by 1% each time
width = containerFrame.size.width
i=0
while i < 100
	driver.action.drag_and_drop_by(slider,width/100,0).perform
	system("scrot")
	sleep(0.5)
	i += 1
end
# Makes new folder named after the web directory, and moves all the screenshotted images to that directory (defaults to ALL png files)
FileUtils.mkdir_p dir 
dir="mv *.png " + dir.gsub(" ","\\ ")
system(dir)
exit
