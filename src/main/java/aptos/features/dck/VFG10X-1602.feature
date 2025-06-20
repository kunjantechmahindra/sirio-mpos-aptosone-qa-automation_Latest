@VFG10X-1602 @ReturnTransaction @Regression @SmokeDCK
Feature: VFG10X-1602 Returns - Return with Gift Receipt

  Scenario: Returns - Return with Gift Receipt

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Add Product
    Then the sales assistant add 2 items from "General" product to the basket
    And the sales assistant clicks on Gift receipt button from basket page
    And the sales assistant select Grouped receipt
    And the sales assistant validate gift logo is added to the product at index 1
    And the sales assistant validate gift logo is added to the product at index 2

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer wait for gift receipt and save the receipt for return

  # Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "Gift" as reason code

  # Refund transaction
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application