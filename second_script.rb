require 'rubygems'
require 'watir-webdriver'

def goto_puppy_adoption_site
  @browser = Watir::Browser.new :firefox
  @browser.goto 'http://puppies.herokuapp.com'
end

def adopt_puppy_number(num)
  @browser.button(:value => 'View Details', :index => -1).click
  @browser.button(:value => 'Adopt Me!').click
end

def continue_adopting_puppies
  @browser.button(:value => 'Adopt Another Puppy').click
end

def complete_adoption_puppies
  @browser.button(:value => 'Complete the Adoption').click
end

def place_order
  @browser.button(:value => 'Place Order').click
end

def verify_page_contains(text)
  fail 'Confirmation Message is not as expected' unless browser.text.include? text
end

def close_browser
  @browser.close
end

goto_puppy_adoption_site
adopt_puppy_number 1
continue_adopting_puppies
adopt_puppy_number 2
complete_adoption_puppies
browser.text_field(:id => 'order_name').set('Cheezy')
browser.text_field(:id => 'order_address').set('123 Main St.')
browser.text_field(:id => 'order_email').set('cheezy@foo.com')
browser.select_list(:id => 'order_pay_type').select('Check')
place_order
verify_page_contains ('Thank you for adopting a puppy!')
close_browser