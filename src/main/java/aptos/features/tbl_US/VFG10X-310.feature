@VFG10X-310 @Customer @Regression
Feature: VFG10X-310 Customer _Search using Email Id and phone number

  Scenario: Customer _Search using Email Id and phone number

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Search Customer using Email and Phone Number
    And then sales assistant clicks on Assign Customer button
    And the sales assistant search a customer with Phone Number and email at index 1
    And the sales assistant validate the customer details at index 1
    And the sales assistant navigate to basket page from customer profile
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application




