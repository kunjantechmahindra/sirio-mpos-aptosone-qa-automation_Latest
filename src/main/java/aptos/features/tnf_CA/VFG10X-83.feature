@VFG10X-83 @StoreSelling @Regression
Feature: VFG10X-83 Store Selling Functions_ Change Quantity Function Not Present

  Scenario: Store Selling Functions_ Change Quantity Function Not Present

  # Login and add products
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

  # Price override
    And the sales assistant selects the product at index 1
    And the sales assistant validates Change Quantity button from line Action
    And the sales assistant clicks on cancel button
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application