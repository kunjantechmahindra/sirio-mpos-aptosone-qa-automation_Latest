@returnCash
Feature: Return priceOverride payment by card Debit and Master

  Scenario: Return priceOverride payment by card Debit and Master

#   Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

#   add transaction level discount
    And the sales assistant clicks on Discount button from basket page
    And the sales assistant select transaction discount button
    And the sales assistant enter discount amount as 5
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "BOUNCEBACK" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant validate the discount applied as "5"

#   Price override
    And the sales assistant selects the product at index 2
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enter price as 30
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "PRICE MATCH" as reason code
    And the sales assistant clicks on Apply button

#   Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant enters half of the total amount in the payment section
    And the sales assistant clicks on Card button
    And the sales assistant validate if partial payment was success
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Card button
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

#   Assign customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 1

#   Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - CHANGED MIND" as reason code
    And the sales assistant clicks on Pay button
    And the sales assistant do partial refund to "MasterCard" at position 1
    And the sales assistant validate if amount is refunded
    And the sales assistant do partial refund to "Debit" at position 2
    And the sales assistant sign for the transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

# EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
#    And the sales assistant logout from EJViewer