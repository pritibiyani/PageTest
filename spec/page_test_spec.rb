require 'spec_helper'
require_relative '../src/PageTest'

describe 'Tools Pingdom' do
  SITE_ONE = 'www.delta.com'
  before(:all) do
    @driver   = Selenium::WebDriver.for :firefox
    @page_test = PageTest.new @driver
  end

  it 'should test speed of site1' do
    result = @page_test.test_for SITE_ONE
    expect(result).to be_a_kind_of(Fixnum)
    puts "Result is :#{result}"
  end

  after(:all) do
    @driver.quit
  end

end