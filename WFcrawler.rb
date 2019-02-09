require 'selenium-webdriver'
driver = Selenium::WebDriver.for :chrome 
driver.get("http://www.simtable.com/apps/fireProgression/output2011/MT_LCF_GE6Q_Taylor_Hills.html")
sleep(2)
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
exit
