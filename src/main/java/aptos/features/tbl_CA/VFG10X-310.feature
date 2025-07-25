@VFG10X-310 @Customer @Regression
Feature: VFG10X-310 Customer Search using non existing phone number and email and create customer

  Scenario: Customer Search using non existing phone number and email and create customer

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Search Customer using Email and Phone Number
    And then sales assistant clicks on Assign Customer button
    And the sales assistant search a customer with new Phone Number and email
    And the sales assistant clicks on New Customer without hiding the keyboard
    And the sales assistant enter New customer detail without email and phone number
    And the sales assistant clicks on Privacy Policy
    And the sales assistant clicks on Newsletter
    And the sales assistant clicks on Save button
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application



