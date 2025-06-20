@VFG10X-1745 @ReturnTransaction @Regression @OldVersionSale @PrerequisiteRequired
Feature: VFG10X-1745  Return Transaction_Price Overridden Sale transaction from Prev Version

  Scenario:  Return Transaction_Price Overridden Sale transaction from Prev Version

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Return transaction
    And the sales assistant clicks on return button
    And the sales assistant clicks on return search button
    And  the sales assistant enters store number "200252" terminal "78" and transaction number "4242"
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - CHANGED MIND" as reason code

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application