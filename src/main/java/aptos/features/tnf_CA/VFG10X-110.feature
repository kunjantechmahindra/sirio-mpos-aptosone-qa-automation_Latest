@VFG10X-110 @Customer @Regression
Feature: VFG10X-110 Customer _Last Name field editable validation

  Scenario: Customer _Last Name field editable validation

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Search Customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant search a customer using email at index 0

  #Edit Customer Last Name
    And the sales assistant clicks on edit customer option from Search customer page
    And the sales assistant will update "Last Name" in customer details
    And the sales assistant clicks on Update button
    And then sales assistant clicks on Assign Customer button
    And the sales assistant validate "Last name" updated customer details
    And the test data is updated with "Last Name" updated details at index 0
    And the sales assistant navigate to basket page
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application

