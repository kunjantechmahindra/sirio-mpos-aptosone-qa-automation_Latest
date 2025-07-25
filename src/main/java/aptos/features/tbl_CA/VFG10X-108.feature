@VFG10X-108 @Customer @Regression @SmokeTBL
Feature: VFG10X-108 Customer _Updating a Customer Profile

  Scenario: Customer _Updating a Customer Profile

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Search Customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant search a customer using email at index 1
    And the sales assistant validate the customer details at index 1

  #Edit customer details
    And the sales assistant clicks on edit customer option from Search customer page
    And the sales assistant will update "all" in customer details
    And the sales assistant clicks on Update button
    And the sales assistant validate if void button is enabled
    And then sales assistant clicks on Assign Customer button
    And the sales assistant validate "all" updated customer details
    And the test data is updated with "all" updated details at index 1
    And the sales assistant navigate to basket page
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application


