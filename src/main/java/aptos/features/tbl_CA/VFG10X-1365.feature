@VFG10X-1365 @ReturnTransaction @Regression @Card @Amex
Feature: VFG10X-1365 Return Transaction _Refund to Same Payment methods _1st item with Reason Code ECOM - CHANGED MIND and 2nd Item with Reason Code ECOM - PRICE ADJUSTMENT

  Scenario: Return Transaction _Refund to Same Payment methods _1st item with Reason Code ECOM - CHANGED MIND and 2nd Item with Reason Code ECOM - PRICE ADJUSTMENT

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Add products
    Then the sales assistant add 2 items from "General" product to the basket without customer

    #Partial Payment transaction with card
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant enters half of the total amount in the payment section
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "amex" card using a "tap" action, entering the pin "0"
    And the sales assistant validate if partial payment was success
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant wait for robot to reach the starting position
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "amex" card using a "insert" action, entering the pin "0"
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

    #Return transaction selecting reason codes
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant selects the return product at index 1
    And the sales assistant clicks on Done button
    And the sales assistant selects "ECOM - CHANGED MIND" as reason code
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant selects the return product at index 2
    And the sales assistant clicks on Done button
    And the sales assistant selects "ECOM - PRICE ADJUSTMENT" as reason code

    #Refund to card partially - selecting same card Amex
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant select amex card for refund second
    And the sales assistant validate if partial refund was success
    And the sales assistant select amex card for refund first
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

    #EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant logout from EJViewer