@VFG10X-1946 @Regression @PromotionsAndDiscounts

Feature: VFG10X-1946 Promotions and Discounts-EJ Should Capture SFCC promotion description

  Scenario: Promotions and Discounts-EJ Should Capture SFCC promotion description

    #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "Coupon-10%" product to the basket without customer
    Then the sales assistant add 1 items from "WithOutCoupon-10%" product to the basket

    #Apply coupon
    When the sales assistant clicks on "Coupons" button from basket
    And  the sales assistant enter coupons code for "Coupon-10%"
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    #And the sales assistant saves the promotion description
    And the sales assistant validate "10% off with coupon" is applied to item
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 2
    And the sales assistant validate "10% off without coupon" is applied to item

    # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant validate the promotion details in physical receipt
    And the sales assistant logout from the application

    # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate "Coupon-10%" code in EJ
    And the sales assistant validate details "10% off without coupon" in EJ
    And the sales assistant logout from EJViewer

