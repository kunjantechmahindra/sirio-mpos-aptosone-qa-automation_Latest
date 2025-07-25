@VFG10X-113 @Customer @Regression
Feature: VFG10X-113 Customer _Creation of New Customer Profile

  Scenario: Customer _Creation of New Customer Profile

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Create Customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant clicks on New Customer
    And the sales assistant enter New customer detail
    And the sales assistant clicks on Privacy Policy
    And the sales assistant clicks on Newsletter
    And the sales assistant clicks on Save button
    And then sales assistant clicks on Assign Customer button
    And the sales assistant validate all details for the newly created customer
    And the sales assistant navigate to basket page
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application


