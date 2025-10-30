@VFG10X-1298 @ReturnTransaction @Regression @Card @VisaMaster
Feature: VFG10X-1298 Return Transaction _Return single item with bag fee Void bag fee and Complete Transaction_Refund two different credit cards_No Customer Assigned

  Scenario: Return Transaction _Return single item with bag fee Void bag fee and Complete Transaction_Refund two different credit cards_No Customer Assigned

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

    #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant adds 1 bag to the order
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on basket button from payment
    And the sales assistant clicks on Pay button
    And the sales assistant subtract 1 bag to the order
    And the sales assistant clicks on Accept button

    #Partial payment transaction
    And the sales assistant enters half of the total amount in the payment section
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "diners" card using a "tap" action, entering the pin "0"
    And the sales assistant validate if partial payment was success
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "discover" card using a "tap" action, entering the pin "0"
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

    #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "Changed Mind" as reason code

    #Refund to card partially
    And the sales assistant clicks on Pay button
    And the sales assistant select "diners" card for refund
    And the sales assistant validate if partial refund was success
    And the sales assistant select "discover" card for refund
    And the sales assistant sign for the transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

    #EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant logout from EJViewer

