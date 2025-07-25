@VFG10X-109 @Customer @Regression
Feature: VFG10X-109 Customer _First Name field is editable

  Scenario: Customer _First Name field is editable

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Search Customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant search a customer using email at index 2
    And the sales assistant clicks on edit customer option from Search customer page

  #Edit Customer Last Name
    And the sales assistant will update "First Name" in customer details
    And the sales assistant clicks on Update button
    And the sales assistant validate if void button is enabled
    And then sales assistant clicks on Assign Customer button
    And the sales assistant validate "First name" updated customer details
    And the test data is updated with "First Name" updated details at index 2
    And the sales assistant navigate to basket page
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application


