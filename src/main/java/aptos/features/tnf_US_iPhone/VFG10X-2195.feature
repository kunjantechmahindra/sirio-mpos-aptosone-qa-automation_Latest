@VFG10X-2195 @Customer @Regression
Feature: VFG10X-2195 Customer _Customer creation with incorrect Email Id format

  Scenario: Customer _Customer creation with incorrect Email Id format

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Create Customer with incorrect email
    And then sales assistant clicks on Assign Customer button
    And the sales assistant clicks on New Customer
    And the sales assistant enter customer detail with "email" as "invalid"
    And the sales assistant clicks on Privacy Policy
    And the sales assistant clicks on XPLR Pass
    And the sales assistant clicks on Save button
    And the sales assistant validate if message is displayed as "email" is "invalid"
    And the sales assistant discard the changes from edit customer screen
    And the sales assistant navigate to basket page from Search customer page
    And the sales assistant logout from the application
