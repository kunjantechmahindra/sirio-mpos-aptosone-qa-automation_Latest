@VFG10X-590 @StoreSelling @Regression @Card @PrerequisiteRequired
Feature: VFG10X-590 Store Selling Functions _ Return of items from Multiple store in same transaction

  Scenario: Store Selling Functions _ Return of items from Multiple store in same transaction

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

    #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

    #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - Changed Mind" as reason code
    And the sales assistant lands on Basket Page

    #Return from another store (completed using cash)
    And the sales assistant clicks on return button
    And the sales assistant clicks on return search button
    And the sales assistant enters store number "400528" terminal "40" and transaction number "1726"
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - Changed Mind" as reason code
    And the sales assistant lands on Basket Page

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

  # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant logout from EJViewer