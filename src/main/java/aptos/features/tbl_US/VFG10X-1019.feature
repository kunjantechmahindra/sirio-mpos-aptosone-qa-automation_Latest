@VFG10X-1019 @PromotionsAndDiscounts @Regression

Feature: VFG10X-1019 Promotions and Discounts _Return  transaction with multiple promotions and Manual discount applied

  Scenario: Promotions and Discounts _Return  transaction with multiple promotions and Manual discount applied

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "2-for-30$" product to the basket without customer

  #Apply coupon and validate promotions
    When the sales assistant clicks on "Coupons" button from basket
    And  the sales assistant enter coupons code for "Coupon-AllItem"
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "10% off for all" is applied to item
    And the sales assistant selects the product at index 2
    And the sales assistant validate "10% off for all" is applied to item
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "2 For $30" is applied to item
    And the sales assistant selects the product at index 2
    And the sales assistant validate "2 For $30" is applied to item
    And the sales assistant lands on Basket Page

  #Transactional level Percentage off 30%
    And the sales assistant clicks on Discount button from basket page
    And the sales assistant select transaction discount
    And the sales assistant enter discount percentage as 30
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "E-MAIL" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant validate all the discounts applied

  #Payment
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

  #Return Transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - WRONG SIZE/COLOR" as reason code

  #Refund to cash
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

  #EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant logout from EJViewer
