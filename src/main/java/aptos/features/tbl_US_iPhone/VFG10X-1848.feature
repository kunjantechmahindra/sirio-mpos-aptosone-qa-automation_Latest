@VFG10X-1848 @Customer @Regression
Feature: VFG10X-1848 Customer _Search using Non Existing Email Id

  Scenario: Customer _Search using Non Existing Email Id

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Search Customer using non existing Email
    And then sales assistant clicks on Assign Customer button
    And the sales assistant search using non existing email id
    And the sales assistant clicks on New Customer
    And the sales assistant enter New customer details without email
    And the sales assistant clicks on Privacy Policy
    And the sales assistant clicks on Newsletter
    And the sales assistant clicks on Save button
    And the sales assistant clicks on "No" to loyalty program
    And the sales assistant clicks on menu button for iPhone basket
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application



