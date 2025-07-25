@VFG10X-1627  @ExchangeTransaction @Regression
Feature: VFG10X-1627 Exchange transaction with multiple items having Temporary markdown price

  Scenario: Exchange transaction with multiple items having Temporary markdown price

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "Temp-MD" product to the basket
    And the sales assistant lands on Basket Page

    #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

    #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "Damaged" as reason code
    And the sales assistant lands on Basket Page

    #Exchange
    And the sales assistant add 2 items from "HigherPrice" product to the basket

    #Complete refund
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application