@VFG10X-283 @ExchangeTransaction @Regression @Card @VisaMaster @Smoke @SmokeTesting
Feature: VFG10X-283 Exchange _Negative Exchange transaction of mixed card payment with %off item _Refund also should go to both cards

  Scenario: Exchange _Negative Exchange transaction of mixed card payment with %off item _Refund also should go to both cards

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "WithOutCoupon-10%" product to the basket without customer

  # Validate %off item discount
    And the sales assistant selects the product at index 1
    And the sales assistant validate "10% off without coupon" is applied to item
    And the sales assistant selects the product at index 2
    And the sales assistant validate "10% off without coupon" is applied to item

  # Partial Payment transaction with multiple cards
      And the sales assistant clicks on Pay button
      And the sales assistant clicks on Accept button
      And the sales assistant save the transaction details of the sales transaction
      And the sales assistant enters half of the total amount in the payment section
      And the sales assistant clicks on Card button
      And the sales assistant processes the payment with a "visa" card using a "tap" action, entering the pin "0"
      And the sales assistant validate if partial payment was success
      And the sales assistant save the transaction details of the sales transaction
      And the sales assistant clicks on Card button
      And the sales assistant processes the payment with a "master" card using a "insert" action, entering the pin "0"
      And the sales assistant save the payment details for the sales transaction
      And the sales assistant clicks on Print button
      And the sales assistant select the printer and save the receipt for return

  # Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - CHANGED MIND" as reason code
    And the sales assistant lands on Basket Page
    And the sales assistant add 1 items from "LowerPrice" product to the basket

  # Refund transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant do partial refund to "MasterCard" at position 1
    And the sales assistant validate if amount is refunded
    And the sales assistant do partial refund to "Debit" at position 2
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

  # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant logout from EJViewer