@VFG10X-1059 @ReturnTransaction @Regression @Card @Visa
Feature: VFG10X-1059 Return transaction_ Return single item Suspend transaction and Resume Transaction_Refund as Card_No Customer Assigned

  Scenario: Return transaction_ Return single item Suspend transaction and Resume Transaction_Refund as Card_No Customer Assigned

   #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

 #Add Product
    Then the sales assistant add 1 items from "General" product to the basket without customer

 #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "visa" card using a "tap" action, entering the pin "0"
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

 #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - CHANGED MIND" as reason code

 #Suspend and Resume Transaction
    And then sales assistant clicks on Suspend button
    And the sales assistant enter the reference ID
    And the sales assistant select the printer
    And the sales assistant clicks on Resume button
    And the sales assistant clicks on Basket button from header
    And the sales assistant clicks on Resume button
    And the sales assistant select the transaction to be resumed
    And the sales assistant proceed without selecting the customer

 #Refund transaction
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on card for refund
    And the sales assistant processes the payment with a "visa" card using a "insert" action, entering the pin "0"
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

  # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "RTL - CHANGED MIND" in EJ
    And the sales assistant logout from EJViewer
