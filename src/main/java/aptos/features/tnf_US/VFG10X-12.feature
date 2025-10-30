@VFG10X-12 @SaleTransaction @Regression @Card @VisaMaster
Feature: VFG10X-12 Sale Transaction _Multiple Items with Line item & Transactional Discount _ Partial Payment by two Credit Cards_ Existing customer
  Scenario: Sale Transaction _Multiple Items with Line item & Transactional Discount _ Partial Payment by two Credit Cards_ Existing customer

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Assign customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 1
    Then the sales assistant add 2 items from "General" product to the basket

  # Discount at item level
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount
    And the sales assistant clicks on amount button
    And the sales assistant enter discount amount as 5
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Damaged" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant validate the discount applied as "5"

  # Discount at transaction level
    And the sales assistant clicks on Discount button from basket page
    And the sales assistant select transaction discount button
    And the sales assistant enter discount percentage as 6
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "In Store Promo" as reason code
    And the sales assistant clicks on Apply button

  # Partial Payment transaction with card and card
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant enters half of the total amount in the payment section
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "master" card using a "insert" action, entering the pin "0"
    And the sales assistant validate if partial payment was success
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "visa" card using a "tap" action, entering the pin "0"
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

  # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant logout from EJViewer