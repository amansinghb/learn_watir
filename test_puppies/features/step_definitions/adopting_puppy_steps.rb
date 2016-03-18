Given(/^I am on the puppy adoption site$/) do
  @browser.goto 'http://puppies.herokuapp.com'
end

When(/^I click the first View Details button$/) do
  @browser.button(:value => 'View Details', :index => 0).click
end

When(/^I click the Adopt Another Puppy button$/) do
  @browser.button(:value => 'Adopt Another Puppy').click
end

When(/^I click the second View Details button$/) do
  @browser.button(:value => 'View Details', :index => 1).click
end

When(/^I click the Adopt Me button$/) do
  @browser.button(:value => 'Adopt Me!').click
  @cart = ShoppingCartPage.new(@browser)
end

When(/^I click the Complete the Adoption button$/) do
  @browser.button(:value => 'Complete the Adoption').click
end

When(/^I enter "([^"]*)" in the name field$/) do |name|
  @browser.text_field(:id => 'order_name').set(name)
end

When(/^I enter "([^"]*)" in the address field$/) do |address|
  @browser.text_field(:id => 'order_address').set(address)
end

When(/^I enter "([^"]*)" in the email field$/) do |email|
  @browser.text_field(:id => 'order_email').set(email)
end

When(/^I select "([^"]*)" from the pay with dropdown$/) do |pay_type|
  @browser.select_list(:id => 'order_pay_type').select(pay_type)
end

When(/^I click the Place Order button$/) do
  @browser.button(:value => 'Place Order').click
end

Then(/^I should see "([^"]*)"$/) do |expected|
  @browser.text.should include expected
end



Then(/^I should see "([^"]*)" as the name for line item (\d+)$/) do |name, line_item|
  @cart.name_for_line_item(line_item.to_i).should include name
end

Then(/^I should see "([^"]*)" as the subtotal for line item (\d+)$/) do |subtotal, line_item|
  @cart.subtotal_for_line_item(line_item.to_i).should == subtotal
end

Then(/^I should see "([^"]*)" as the cart total$/) do |total|
  @cart.cart_total.should == total
end