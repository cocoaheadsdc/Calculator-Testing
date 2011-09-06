Then /^I should see a result of "([^\"]*)"$/ do |arg1|
  

  check_element_exists("view:'UILabel' marked:'#{arg1}'")
  
end