@VFG10X-1468 @SaleTransaction @Regression @Card @Visa
Feature: VFG10X-1468 Create a sale transaction with an SFCC promotion - B1G1 50% Off - Multiple line items

  Scenario: Create a sale transaction with an SFCC promotion - B1G1 50% Off - Multiple line items

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "BOGO@50%" product to the basket

  # Validate promotion is applied to the product
    And the sales assistant selects the product at index 1
    And the sales assistant validate "BOGO 50%" is applied to item
    And the sales assistant selects the product at index 2
    And the sales assistant validate "BOGO 50%" is applied to item

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "visa" card using a "tap" action, entering the pin "0"
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application