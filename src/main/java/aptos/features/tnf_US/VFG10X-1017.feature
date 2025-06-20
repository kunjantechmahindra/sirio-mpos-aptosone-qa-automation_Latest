@VFG10X-1017 @PromotionsAndDiscounts @Regression
Feature: VFG10X-1017 Promotions and Discounts _ Return  transaction with multiple promotions and Employee discount 60% off applied

  Scenario: Promotions and Discounts _ Return  transaction with multiple promotions and Employee discount 60% off applied

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "2-for-30$" product to the basket without customer

  # Apply coupon and validate promotions
    When the sales assistant clicks on "Coupons" button from basket
    And  the sales assistant enter coupons code for "Coupon-AllItem"
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "10% off for all" is applied to item
    And the sales assistant selects the product at index 2
    And the sales assistant validate "10% off for all" is applied to item
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "2 for 30$" is applied to item
    And the sales assistant selects the product at index 2
    And the sales assistant validate "2 for 30$" is applied to item
    And the sales assistant lands on Basket Page

  # Apply Employee Discount
    And the sales assistant clicks on Employee Sale button from basket page
    And the sales assistant enter "valid" Employee ID
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Employee Sale" is applied to item
    And the sales assistant selects the product at index 2
    And the sales assistant validate "Employee Sale" is applied to item

  # Payment
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

  # Return Transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - Wrong Size/Color" as reason code

  # Refund to cash
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant validate the refund amount is correct
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

  # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "RTL - Wrong Size/Color" in EJ
    And the sales assistant logout from EJViewer