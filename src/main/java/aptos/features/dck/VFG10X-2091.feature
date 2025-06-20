@VFG10X-2091 @StoreSelling @Regression
Feature: VFG10X-2091 Store Selling Functions_ Line Item Level Tax Override Option

  Scenario: Store Selling Functions_ Line Item Level Tax Override Option

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket

  # Validates Tax Override line action button enabled
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant validate if tax override button is enabled
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application