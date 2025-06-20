@VFG10X-97 @StoreSelling @Regression

Feature: VFG10X-97 Store Selling Functions_ Transaction Void Option

  Scenario: Store Selling Functions_ Transaction Void Option

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

  #Void transaction
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application
