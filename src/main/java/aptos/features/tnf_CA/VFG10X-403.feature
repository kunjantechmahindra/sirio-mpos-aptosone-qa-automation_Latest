@VFG10X-403 @Regression @StoreSelling
Feature: VFG10X-403 Store Selling Functions _ Return without Receipt Functionality Validation

  Scenario: Store Selling Functions _ Return without Receipt Functionality Validation

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Return transaction
    And the sales assistant clicks on return button
    And the sales assistant select No receipt for blind return

  # Add Product
    Then the sales assistant add an items from "General" product for return
    And the sales assistant selects "Damaged" as reason code
    And the sales assistant clicks on Skip button
    And the sales assistant navigate to basket page from return mode page

  # Void Transaction
    And the sales assistant void the transaction from basket with reason code "Promo Error"
    And the sales assistant logout from the application