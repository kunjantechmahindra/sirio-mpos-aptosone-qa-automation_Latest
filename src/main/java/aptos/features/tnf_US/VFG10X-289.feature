@VFG10X-289 @ExchangeTransaction @Regression @GiftCard @Card

Feature: VFG10X-289 Exchange _Multiple sale items _Void one item and void payment by gift card and complete by cash

  Scenario: Exchange _Multiple sale items _Void one item and void payment by gift card and complete by cash

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

  #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - Changed Mind" as reason code
    And the sales assistant lands on Basket Page
    And the sales assistant add 2 items from "HigherPrice" product to the basket

  #Void one item
    And the sales assistant selects the product at index 2
    And the sales assistant selects "Void item" Option from line Action
    And the sales assistant clicks on confirm button

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant enters half of the total amount in the payment section
    And the sales assistant clicks on gift card button from payment page
    And the sales assistant enter the gift card number for payment from index 0
    And the sales assistant clicks on redeem button
    And the sales assistant enter the the pin from index 0
    And the sales assistant validate the partial payment by gift card

  #Void the transaction
    And the sales assistant voids the partial payment

  #Complete the transaction by cash
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

  #EJ validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant logout from EJViewer
