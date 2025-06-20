@VFG10X-2084 @StoreSelling @Regression
Feature: VFG10X-2084 Store Selling Functions_ Bag Fee Screen Validations

  Scenario: Store Selling Functions_ Bag Fee Screen Validations

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket

  # Validate Bag Fee page and Logout
    And the sales assistant clicks on Pay button
    And the sales assistant validate if Payment page is displayed instead of Bag Fee page
    And the sales assistant void the transaction from payment with reason code "Promo Error"
    And the sales assistant logout from the application