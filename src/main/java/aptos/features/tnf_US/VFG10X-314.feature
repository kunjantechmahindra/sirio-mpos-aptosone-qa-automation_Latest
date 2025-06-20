@VFG10X-314 @Customer @Regression
Feature: VFG10X-314 Customer _Customer creation with Not accepting Terms and Conditions

  Scenario: Customer creation with Not accepting Terms and Conditions

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Create Customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant clicks on New Customer
    And the sales assistant enter New customer detail
    And the sales assistant clicks on Save button
    And the sales assistant validates that privacy policy and XPLR Terms error message is displayed
    And the sales assistant discard the changes from edit customer screen
    And the sales assistant navigate to basket page from Search customer page
    And the sales assistant logout from the application
