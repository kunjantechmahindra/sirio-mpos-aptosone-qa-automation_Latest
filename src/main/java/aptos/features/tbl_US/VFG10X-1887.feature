@VFG10X-1887 @Customer @Regression
Feature: VFG10X-1887 Create a Customer with Mandatory fields + Opt-in to Privacy Policy first

  Scenario: Customer _Create a  Customer with Mandatory fields + Opt-in to Privacy Policy first

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Create Customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant clicks on New Customer
    And the sales assistant enter mandatory customer details
    And the sales assistant clicks on Privacy Policy
    And the sales assistant clicks on Newsletter
    And the sales assistant clicks on Save button
    And the sales assistant clicks on "No" to loyalty program
    And the sales assistant validate if void button is enabled
    And then sales assistant clicks on Assign Customer button
    And the sales assistant validate "zip code" and "email" for the newly created customer
    And the sales assistant navigate to basket page
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application


