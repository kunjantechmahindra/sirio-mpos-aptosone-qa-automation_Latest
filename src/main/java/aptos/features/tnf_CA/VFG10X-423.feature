@VFG10X-423 @StoreSelling @Regression
Feature: VFG10X-423 Store Selling Functions _Prompt for adding a customer

  Scenario: Store Selling Functions _Prompt for adding a customer

  # Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket

  # Customer Prompt Validation
    And the sales assistant validate the customer prompt window
    And the sales assistant clicks on Skip button

  # Void Transaction
    And the sales assistant void the transaction from basket with reason code "Promo Error"
    And the sales assistant logout from the application