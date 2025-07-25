@VFG10X-84 @StoreSelling @Regression

Feature: VFG10X-84 Store Selling Functions_ Item Level Void

  Scenario: Store Selling Functions_ Item Level Void

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

  #validates item level void button is enabled
    And the sales assistant selects the product at index 1
    And the sales assistant validates void item button is enable
    And the sales assistant clicks on confirm button
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application

