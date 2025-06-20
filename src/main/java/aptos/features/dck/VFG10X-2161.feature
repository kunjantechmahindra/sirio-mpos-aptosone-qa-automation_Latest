@VFG10X-2161 @ReturnTransaction @Regression
Feature: VFG10X-2161 Return Transaction _Perform employee Discount followed by Update qty

  Scenario: Return Transaction _Perform employee Discount followed by Update qty

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket

  # Add Employee discount
    And the sales assistant clicks on Employee Sale button from basket page
    And the sales assistant enter "valid" Employee ID
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page

  # Change Quantity
    And the sales assistant selects the product at index 1
    And the sales assistant selects the Change Quantity button
    And the sales assistant increase quantity by 2
    And the sales assistant clicks on Apply button

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

  # Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "Changed Mind" as reason code

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant validate the refund amount is correct
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application