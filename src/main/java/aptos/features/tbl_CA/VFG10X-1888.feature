@VFG10X-1888 @Customer @Regression @Loyalty
Feature: VFG10X-1888 Create a Customer with all subscriptions and add all mandatory and non-mandatory fields information.

  Scenario: Create a Customer with all subscriptions and add all mandatory and non-mandatory fields information.

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Create Customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant clicks on New Customer
    And the sales assistant enter New customer detail
    And the sales assistant enable all Terms and Conditions
    And the sales assistant clicks on Save button

  #Validate Customer Attributes
    And the sales assistant validate if void button is enabled
    And then sales assistant clicks on Assign Customer button
    And the sales assistant validate all attributes are enabled
    And the sales assistant navigate to basket page

  #Void Transaction
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application
