@VFG10X-2289 @GiftCard @Regression
Feature: VFG10X-2289 Gift Card _Top Up Gift card and Void

  Scenario: Gift Card _Top Up Gift card and Void

  # Login to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Top-Up Gift Card
    And the sales assistant clicks on gift card button
    And the sales assistant clicks on existing gift card button
    And the sales assistant enters gift card number from index 3
    And the sales assistant enters gift card amount "100.00"
    And the sales assistant clicks on add value button
    And the sales assistant clicks on Skip button

  # Void Transaction and Logout from Application
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application