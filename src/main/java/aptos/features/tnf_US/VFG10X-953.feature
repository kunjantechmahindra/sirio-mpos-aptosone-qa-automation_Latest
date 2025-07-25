@VFG10X-953 @ExchangeTransaction @Regression
Feature: VFG10X-953 Exchange _Single item with bag fee on initial sale transaction

  Scenario: Exchange _Single item with bag fee on initial sale transaction

    # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    # Add Product
    Then the sales assistant add 1 items from "EvenExchange" product to the basket
    And the sales assistant clicks on Skip button

    # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant adds 1 bag to the order
    And the sales assistant validate if bag quantity is "1"
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
    And the sales assistant selects "RTL - Changed Mind" as reason code

    # Add Product
    And the sales assistant lands on Basket Page
    Then the sales assistant add 1 items from "EvenExchange" product to the basket
    And the sales assistant navigate to information page
    And the sales assistant save the transaction number from information page
    And the sales assistant clicks on Basket button from header

    # Refund transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

    # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "RTL - Changed Mind" in EJ
    And the sales assistant logout from EJViewer