@VFG10X-1312 @ExchangeTransaction @GiftCard @Regression @Card
Feature: VFG10X-1312 Exchange _Negative Blind Exchange of single item with bag fee on exchange transaction_Issue New Gift card for refund_No Customer Assigned

  Scenario: Exchange _Negative Blind Exchange of single item with bag fee on exchange transaction_Issue New Gift card for refund_No Customer Assigned

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant select No receipt for blind return

    #Add Product
    Then the sales assistant add an items from "General" product for return
    And the sales assistant selects "DAMAGED/DEFECTIVE" as reason code
    And the sales assistant clicks on Skip button
    And the sales assistant navigate to basket page from return mode page
    Then the sales assistant add 1 items from "LowerPrice" product to the basket

    #Payment
    And the sales assistant clicks on Pay button
    And the sales assistant adds 1 bag to the order
    And the sales assistant clicks on Accept button

    #Issue New Gift Card
    And the sales assistant clicks on gift card button from Refund
    And the sales assistant enters gift card number from index 2
    And the sales assistant clicks on issue button from payment
    And the sales assistant sign for the transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer

    #Get transaction number from information
    And the sales assistant navigate to information page
    And the sales assistant save the transaction number from information page
    And the sales assistant clicks on Basket button from header
    And the sales assistant logout from the application

    #EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate details "2 RTL - DAMAGED/DEFECTIVE" in EJ
    And the sales assistant logout from EJViewer