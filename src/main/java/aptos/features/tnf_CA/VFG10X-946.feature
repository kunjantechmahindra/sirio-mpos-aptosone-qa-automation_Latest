@VFG10X-946 @ReturnTransaction @Regression
Feature: VFG10X-946 Return Transaction _Multiple items with Void One Item and Complete Transaction_Refund as Cash

  Scenario: Return Transaction _Multiple items with Void One Item and Complete Transaction_Refund as Cash

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Add Product
    Then the sales assistant add 2 items from "General" product to the basket without customer

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant clicks on Cash option
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

  # Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - Changed Mind" as reason code


  # Void at item level
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Void item" Option from line Action
    And the sales assistant clicks on confirm button

  # Refund transaction
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant clicks on Cash option
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

  # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate details "Return" in EJ
    And the sales assistant validate details "Voided" in EJ
    And the sales assistant validate details "Cash" in EJ
    And the sales assistant logout from EJViewer