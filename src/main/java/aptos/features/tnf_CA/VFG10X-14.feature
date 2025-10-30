@VFG10X-14 @SaleTransaction @Regression @Card @GiftCard @Visa
Feature: VFG10X-14 Sale Transaction _Single Item with existing customer _Void Gift Card Payment and Pay using Credit Card

  Scenario: Sale Transaction _Single Item with existing customer _Void Gift Card Payment and Pay using Credit Card

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Gift card balance enquiry
    Then the sales assistant validates the Gift Card balance from basket page for index 3
    Then the sales assistant saves the Gift Card balance amount
    And the sales assistant closes the Balance Inquiry screen

  # Assign customer and Add item
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 0
    Then the sales assistant add 1 items from "General" product to the basket

  # Partial Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant enters half of the total amount in the payment section
    And the sales assistant clicks on gift card button from payment page
    And the sales assistant enter the gift card number for payment from index 3
    And the sales assistant clicks on redeem button
    And the sales assistant enter the the pin from index 3
    And the sales assistant validate the partial payment by gift card

  # Payment Void
    And the sales assistant voids the partial payment

  # Payment transaction with card
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "visa" card using a "tap" action, entering the pin "0"
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer

  # Gift card balance check after void and logout
    Then the sales assistant validates the Gift Card balance from basket page for index 3
    Then the sales assistant validates the Gift Card balance amount after void
    And the sales assistant closes the Balance Inquiry screen
    And the sales assistant logout from the application

  # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant logout from EJViewer