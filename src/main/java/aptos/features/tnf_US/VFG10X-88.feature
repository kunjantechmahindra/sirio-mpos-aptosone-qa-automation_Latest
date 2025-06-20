@VFG10X-88 @StoreSelling @Regression

Feature: VFG10X-88 Store Selling Functions_ Gift Receipt Option_ Item Level

  Scenario: Store Selling Functions_ Gift Receipt Option_ Item Level

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

  #validates item level gift receipt button is enabled
    And the sales assistant selects the product at index 1
    And the sales assistant validate gift receipt option at line level is enable
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application

