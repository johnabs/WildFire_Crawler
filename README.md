# Wildfire_Crawler
Crawls Simtable to Extact Wildfire Spread Data

**Dependencies:** Ruby, Selenium-Webdriver, Chrome/Chromium with Chromedriver (this can be changed to your browser of choice by modifing the first line of the script)

This software is used to extract image data of wildfire spread from simtable movies. This script leverages scrot to take screenshots, which are saved to a directory named after the title of the webpage. Post processing with the mogrify or imagemagick tool is heavily suggested; however, the way the website rendered the data made it infeasible to do so with through the script itself. When running the script from the command line, use the following command ***ruby WFcrawler.rb your_url_here***. 

