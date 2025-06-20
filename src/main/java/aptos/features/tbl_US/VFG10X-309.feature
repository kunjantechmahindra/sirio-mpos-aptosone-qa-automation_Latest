@VFG10X-309 @Customer @Regression
Feature: VFG10X-309 Customer _Customer creation with First Name field empty

  Scenario: Customer _Customer creation with First Name field empty

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Create Customer with empty First Name
    And then sales assistant clicks on Assign Customer button
    And the sales assistant clicks on New Customer
    And the sales assistant enter customer detail with "First Name" as "null"
    And the sales assistant clicks on Privacy Policy
    And the sales assistant clicks on Save button
    And the sales assistant clicks on "No" to loyalty program
    And then sales assistant clicks on Assign Customer button
    And the sales assistant validate "Last Name" and "email" for the newly created customer
    And the sales assistant navigate to basket page
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application
