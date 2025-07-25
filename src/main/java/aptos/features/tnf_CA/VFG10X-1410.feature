@VFG10X-1410 @PromotionsAndDiscounts @Regression @SmokeTNF
Feature: VFG10X-1410 Promotions and Discounts _ Sale transaction with buy for $XX get $YY discount with coupon

  Scenario: Promotions and Discounts _ Sale transaction with buy for $XX get $YY discount with coupon

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    And the sales assistant add 1 items from "Buy-for-$XX-get-$YY" product to the basket without customer

    #Apply coupon
    When the sales assistant clicks on "Coupons" button from basket
    And  the sales assistant enter coupons code for "Buy-for-$XX-get-$YY"
    And the sales assistant lands on Basket Page

    #Validate the discount applied
    And the sales assistant selects the product at index 1
    And the sales assistant validate "buy for $XX get $YY discount with coupon" is applied to item
    And sales assistant validates transactional level discount 5 applied

    #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant clicks on Cash option
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

    #EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "Coupon discount" in EJ
    And the sales assistant logout from EJViewer
