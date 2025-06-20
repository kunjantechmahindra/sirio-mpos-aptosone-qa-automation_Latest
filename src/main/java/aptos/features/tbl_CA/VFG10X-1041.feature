@VFG10X-1041 @ReturnTransaction @Regression @Card @Amex
Feature: VFG10X-1041 Return transaction_ Return with single Temp MD item with Tax Override_Refund to Amex card_Existing Customer Assigned

  Scenario: Return transaction_ Return with single Temp MD item with Tax Override_Refund to Amex card_Existing Customer Assigned

    #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Assign customer and add item to basket
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 1
    Then the sales assistant add 1 items from "WithOutCoupon-10%" product to the basket

    #Apply Tax override
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax override" Option from line Action
    And the sales assistant enter new tax as 8
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Tax override - 8%" is applied to item
    And the sales assistant lands on Basket Page

     #Partial Payment transaction with multiple cards
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "amex" card using a "tap" action, entering the pin "0"
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

    #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - CHANGED MIND" as reason code
    And the sales assistant clicks on "Ok" button to assign customer

    #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant selects amex card for refund
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

    # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "American Express" in EJ
    And the sales assistant logout from EJViewer

