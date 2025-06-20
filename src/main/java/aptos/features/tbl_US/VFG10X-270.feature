@VFG10X-270 @PromotionsAndDiscounts @Regression @Smoke
Feature: VFG10X-270 Promotions and Discounts _ Sale Transaction with Stacked Promotions _Exclusivity set to "Can be Combined"

  Scenario: Promotions and Discounts _ Sale Transaction with Stacked Promotions _Exclusivity set to "Can be Combined"

    #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "WithOutCoupon-10%" product to the basket without customer

    #Apply promotions
    And the sales assistant selects the product at index 1
    And the sales assistant validate "10% off without coupon" is applied to item
    And the sales assistant selects the product at index 2
    And the sales assistant validate "10% off without coupon" is applied to item
    When the sales assistant clicks on "Coupons" button from basket
    And  the sales assistant enter coupons code for "Coupon-AllItem"
    And the sales assistant lands on Basket Page
    And the sales assistant scrolls the basket screen to top
    And the sales assistant selects the product at index 1
    And the sales assistant validate "10% off for all" is applied to item
    And the sales assistant selects the product at index 2
    And the sales assistant validate "10% off for all" is applied to item

    #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Email button
    And the sales assistant enter the email
    And the sales assistant logout from the application