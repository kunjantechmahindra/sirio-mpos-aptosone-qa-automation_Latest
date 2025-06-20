@VFG10X-975 @ReturnTransaction @Regression @Card @VisaMaster
Feature: VFG10X-975 Return Transaction_Return single item with 50% payment by Visa Tap, 50% payment by Master Card Chip_Refund going to same Payments_Existing Customer assigned

  Scenario: Return Transaction_Return single item with 50% payment by Visa Tap, 50% payment by Master Card Chip_Refund going to same Payments_Existing Customer assigned. (Use Customer Search option )

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

  # Assign customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 1

  # Partial Payment transaction with card and cash
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant enters half of the total amount in the payment section
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "visa" card using a "tap" action, entering the pin "0"
    And the sales assistant validate if partial payment was success
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "master" card using a "tap" action, entering the pin "0"
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

  # Return transaction
    And the sales assistant clicks on return button
    And the sales assistant clicks on customer search button
    And the sales assistant search a customer using email at index 1
    And the sales assistant select the transaction to be returned
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - CHANGED MIND" as reason code
    And the sales assistant clicks on "Ok" button to assign customer

  # Refund to card partially
    And the sales assistant clicks on Pay button
    And the sales assistant select "master" card for refund
    And the sales assistant validate if partial refund was success
    And the sales assistant select "visa" card for refund
    And the sales assistant sign for the transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application