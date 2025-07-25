@VFG10X-2132 @StoreSelling @Regression
Feature: VFG10X-2132 Store Selling Functions_ Item Level Void

  Scenario: Store Selling Functions_ Item Level Void

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket

  # Validates item level void button is enabled
    And the sales assistant selects the product at index 1
    And the sales assistant validates and click void item button if enable
    And the sales assistant clicks on confirm button
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application