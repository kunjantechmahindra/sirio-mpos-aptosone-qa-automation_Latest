@VFG10X-37 @SaleTransaction @Regression
Feature: VFG10X-37 Sale Transaction _ Single Item_ Void Transaction _No Customer

  Scenario: Sale Transaction _ Single Item_ Void Transaction _No Customer

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application
