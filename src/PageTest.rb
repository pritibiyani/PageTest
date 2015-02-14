class PageTest
  BASE_URL          = 'http://tools.pingdom.com/fpt/'
  SITE_IDENTIFIER   = '#urlinput'
  SUBMIT_BUTTON     = '.TestButt'
  RESULT_IDENTIFIER = '.last>dd'

  def initialize driver
    @driver = driver
    navigate_to_page_test
  end


  def test_for site_name
    enter_site site_name
    wait_for_result_to_appear
  end

  private
  def navigate_to_page_test
    @driver.navigate.to BASE_URL
  end

  def enter_site site_name
    element = @driver.find_element(:css, SITE_IDENTIFIER)
    element.send_keys site_name
    @driver.find_element(:css, SUBMIT_BUTTON).click
  end

  def result_present?
    p result_text
    result_text.match(/^[0-9]+/) != nil
  end

  def result_text
    @driver.find_element(:css, RESULT_IDENTIFIER).text
  end

  def wait_for_result_to_appear
    until result_present?
      sleep(1)
    end
    result_text.to_i
  end

end