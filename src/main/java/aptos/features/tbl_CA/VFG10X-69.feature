@VFG10X-69 @SaleTransaction @Regression
Feature: VFG10X-69 Sale Transaction _Single item _Void item and then void transaction

  Scenario: Sale Transaction _Single item _Void item and then void transaction

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

  #Void at item level
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Void item" Option from line Action
    And the sales assistant clicks on confirm button

  #Void transaction
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application

