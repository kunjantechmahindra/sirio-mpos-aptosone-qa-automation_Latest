@VFG10X-1889 @ReturnTransaction @GiftCard @Card @Regression @Visa
Feature: VFG10X-1889 Perform a verified return for the sale transaction payment done by card and GC.

  Scenario: Perform a verified return for the sale transaction payment done by card and GC.

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Assign customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 4
    Then the sales assistant add 2 items from "LowerPrice" product to the basket

  # Partial Payment transaction with card and gift card
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant enters half of the total amount in the payment section
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "visa" card using a "tap" action, entering the pin "0"
    And the sales assistant validate if partial payment was success
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on gift card button from payment page
    And the sales assistant enter the gift card number for payment from index 4
    And the sales assistant clicks on redeem button
    And the sales assistant enter the the pin from index 4
    And the sales assistant validate the partial payment by gift card
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

  # Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "DAMAGED/DEFECTIVE" as reason code
    And the sales assistant clicks on "Ok" button to assign customer

  # Adding loyalty customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 4

  # Refund
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant select "visa" card for refund
    And the sales assistant validate if partial refund was success
    And the sales assistant clicks on gift card button from Refund
    And the sales assistant clicks on existing gift card button
    And the sales assistant enter the gift card number for payment from index 4
    And the sales assistant clicks on add value button from payment page
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application