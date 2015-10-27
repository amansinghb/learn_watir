require 'rubygems'
require 'watir-webdriver'
require_relative 'adoption_helper'

include AdoptionHelper

goto_puppy_adoption_site
adopt_puppy_number 1
checkout_wth('Cheezy','123 Main Street','cheezy@foo.com','Check')
verify_page_contains ('Thank you for adopting a puppy!')
close_browser