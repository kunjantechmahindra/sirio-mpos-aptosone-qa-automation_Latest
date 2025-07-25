@VFG10X-262 @Customer @Regression @SmokeTesting
Feature: VFG10X-262 Customer _Search using Email Id

  Scenario: Customer _Search using Email Id

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Search Customer using Email
    And then sales assistant clicks on Assign Customer button
    And the sales assistant search a customer using email at index 1
    And the sales assistant validate the customer details at index 1
    And the sales assistant navigate to basket page from customer profile
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application




