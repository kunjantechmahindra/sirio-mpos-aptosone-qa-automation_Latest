@VFG10X-1580 @ExchangeTransaction @Regression
Feature: VFG10X-1580 DCK - iPhone - Exchange transaction with even exchange

  Scenario: DCK - iPhone - Exchange transaction with even exchange

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "EvenExchange" product to the basket

  #Get transaction number from information
    And the sales assistant navigate to information page
    And the sales assistant save the transaction number from information page
    And the sales assistant navigate to basket page

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

  #Return transaction
    And the sales assistant clicks on menu button for iPhone basket
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "Changed Mind" as reason code

  #Add items
    And the sales assistant lands on Basket Page
    Then the sales assistant add 2 items from "EvenExchange" product to the basket

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant sign for the transaction
    And the sales assistant clicks on Email button
    And the sales assistant enter the email
    And the sales assistant select the printer
    And the sales assistant logout from the application
