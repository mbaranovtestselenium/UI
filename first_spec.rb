require 'selenium-webdriver'
require 'rspec'

describe 'Search' do
	before(:each) do
		@driver = Selenium::WebDriver.for(:chrome)
		@wait = Selenium::WebDriver::Wait.new(:timeout => 10)
		@base_url = "https://www.google.com"
	end

	it 'should fine something in Google' do
		@driver.get(@base_url)

		element = @driver.find_element(:name, 'q')
		element.send_keys 'selenium'
		@driver.find_element(:name, 'btnG').click
		@wait.until { @driver.title == 'selenium - Google Search' }
	end

	after(:each) do
		@driver.quit
	end
end
