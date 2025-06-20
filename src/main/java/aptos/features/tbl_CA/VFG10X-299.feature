@VFG10X-299 @StoreSelling @Regression

Feature: VFG10X-299 Store Selling Functions _ Suspend Option Enabled

  Scenario: Store Selling Functions _ Suspend Option Enabled

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

  #Suspend and Resume Transaction
    And the sales assistant validate if suspend button is enabled
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application
