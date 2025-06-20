@VFG10X-1911 @SaleTransaction @Regression
Feature: VFG10X-1911 Sale Transaction _Multiple items_ Void one item and Suspend the transaction

  Scenario: Sale Transaction _Multiple items_ Void one item and Suspend the transaction

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

  # Get transaction number
    And the sales assistant save the transaction details of the sales transaction

  # Void at item level
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Void item" Option from line Action
    And the sales assistant clicks on confirm button

  # Suspend and Resume Transaction
    And the sales assistant clicks on menu button for iPhone basket
    And then sales assistant clicks on Suspend button
    And the sales assistant enter the reference ID
    And the sales assistant logout from the application