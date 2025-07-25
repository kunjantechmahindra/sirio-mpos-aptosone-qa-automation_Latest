@VFG10X-1 @SaleTransaction @Regression @Card @GiftCard @Amex
Feature: VFG10X-1 Sale Transaction _Normal item and Gift card item_ Partial Payment by two Credit Cards_ Existing customer

  Scenario: Sale Transaction _Normal item and Gift card item_ Partial Payment by two Credit Cards_ Existing customer

  # Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Add Product
    Then the sales assistant add 1 items from "General" product to the basket without customer

  # Issue New Gift Card
    And the sales assistant clicks on gift card button
    And the sales assistant enters gift card number from index 4
    And the sales assistant enters gift card amount "500.00"
    And the sales assistant clicks on issue button
#    And the sales assistant clicks on Skip button
    And the sales assistant lands on Basket Page

  # Assign customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 1

  # Partial Payment transaction with multiple cards
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
    And the sales assistant processes the payment with a "amex" card using a "swipe" action, entering the pin "0"
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

  # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "GIFT_CARD_ISSUE" in EJ
    And the sales assistant logout from EJViewer