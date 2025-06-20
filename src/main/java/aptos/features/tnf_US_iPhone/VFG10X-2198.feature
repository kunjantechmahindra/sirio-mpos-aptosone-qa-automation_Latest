@VFG10X-2198 @Customer @Regression
Feature: VFG10X-2198 Customer _Search using Non Existing Phone Number

  Scenario: Customer _Search using Non Existing Phone Number

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Search Customer using non existing Phone number
    And then sales assistant clicks on Assign Customer button
    And the sales assistant search using non existing Phone number
    And the sales assistant clicks on New Customer
    And the sales assistant enter New customer details without phone number
    And the sales assistant clicks on Privacy Policy
    And the sales assistant clicks on Newsletter
    And the sales assistant clicks on Save button
    And the sales assistant clicks on menu button for iPhone basket
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application