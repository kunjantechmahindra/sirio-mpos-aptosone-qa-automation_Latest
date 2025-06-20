@VFG10X-1308 @ExchangeTransaction @Regression @Card @Discover

Feature: VFG10X-1308 Exchange _Exchange single item and then return those item with Receipt and refund as cash

  Scenario: Exchange _Exchange single item and then return those item with Receipt and refund as cash

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "LowerPrice" product to the basket without customer

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

  #Exchange transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - CHANGED MIND" as reason code
    And the sales assistant lands on Basket Page
    And the sales assistant add 1 items from "HigherPrice" product to the basket

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

  #Return transaction
    And the sales assistant lands on Basket Page
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - CHANGED MIND" as reason code

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Cash button
    #Only the return amount got refund to cash,balance amount refund should be complete in another tender.Already bug raised.
    #Should rewrite the script according to the fix
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "discover" card using a "insert" action, entering the pin "0"
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application
