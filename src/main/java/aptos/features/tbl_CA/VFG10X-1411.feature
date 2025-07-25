@VFG10X-1411 @PromotionsAndDiscounts @Regression

Feature: VFG10X-1411 Promotions and Discounts _ Sale transaction with %off item and Promotion(with coupon) on same line item and apply manual transactional discount

  Scenario: Promotions and Discounts _ Sale transaction with %off item and Promotion(with coupon) on same line item and apply manual transactional discount

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "WithOutCoupon-10%" product to the basket without customer

    #validate discount
    And the sales assistant selects the product at index 1
    And the sales assistant validate "10% off without coupon" is applied to item
    And the sales assistant selects the product at index 2
    And the sales assistant validate "10% off without coupon" is applied to item

    #Apply coupon
    When the sales assistant clicks on "Coupons" button from basket
    And  the sales assistant enter coupons code for "Coupon-AllItem"
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "10% off for all" is applied to item
    And the sales assistant selects the product at index 2
    And the sales assistant validate "10% off for all" is applied to item

    #Apply transactional level discount
    And the sales assistant clicks on Discount button from basket page
    And the sales assistant select transaction discount button
    And the sales assistant clicks on percentage button
    And the sales assistant enter discount percentage as 6
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "E-MAIL" as reason code
    And the sales assistant clicks on Apply button

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

  # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "Coupon discount" in EJ
    And the sales assistant validate details "Transaction Discount" in EJ
    And the sales assistant validate details "10% off without coupon" in EJ
    And the sales assistant logout from EJViewer


