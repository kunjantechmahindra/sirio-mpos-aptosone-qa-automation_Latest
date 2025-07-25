@VFG10X-1364 @Regression @ReturnTransaction @Card @Visa @SmokeTNF
Feature: VFG10X-1364 Return Transaction _Return using return search option _Refund to Same Payment methods _1st item Reason code ECOM - DAMAGED/DEFECTIVE and 2nd Item with Reason Code:ECOM - WRONG SIZE/COLOR

  Scenario: Return Transaction _Return using return search option _Refund to Same Payment methods _1st item Reason code ECOM - DAMAGED/DEFECTIVE and 2nd Item with Reason Code:ECOM - WRONG SIZE/COLOR

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Add products
    And the sales assistant add 1 items from "Temp-MD" product to the basket
    And the sales assistant clicks on Skip button
    Then the sales assistant add 1 items from "General" product to the basket

    #Partial Payment transaction with card and cash
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant enters half of the total amount in the payment section
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "visa" card using a "tap" action, entering the pin "0"
    And the sales assistant validate if partial payment was success
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "visa" card using a "insert" action, entering the pin "0"
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

    #Return transaction selecting reason codes
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant selects the return product at index 1
    And the sales assistant clicks on Done button
    And the sales assistant selects "ECOM - Damaged/Defective" as reason code
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant selects the return product at index 2
    And the sales assistant clicks on Done button
    And the sales assistant selects "ECOM - Wrong Size/Color" as reason code

    #Refund to card partially
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant selects the first visa debit
    And the sales assistant validate if partial refund was success
    And the sales assistant selects the second visa debit
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

