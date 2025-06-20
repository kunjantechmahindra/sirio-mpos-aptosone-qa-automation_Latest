@VFG10X-1151 @ExchangeTransaction @Regression @SmokeTesting

Feature: VFG10X-1151 Exchange Transaction_Exchange single-item, Sale item with tax exempt  and return item with promo with receipt

  Scenario: Exchange Transaction_Exchange single-item, Sale item with tax exempt  and return item with promo with receipt

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "WithOutCoupon-10%" product to the basket without customer

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
    And the sales assistant selects "DAMAGED/DEFECTIVE" as reason code
    And the sales assistant lands on Basket Page

  #Exchange
    And the sales assistant add 1 items from "HigherPrice" product to the basket

  #Apply Tax exempt
    And the sales assistant selects the product at index 2
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax exempt" Option from line Action
    And the sales assistant enter the tax ID
    And the sales assistant clicks on Select a reason code button on tax exempt page
    And the sales assistant clicks on reason code as tax exempt
    And the sales assistant clicks on HST Exemption
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page

  #Refund transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
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
    And the sales assistant validate details "RTL - DAMAGED/DEFECTIVE" in EJ
    And the sales assistant logout from EJViewer