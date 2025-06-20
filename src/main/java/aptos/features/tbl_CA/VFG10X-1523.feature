@VFG10X-1523  @PromotionsAndDiscounts @Regression
Feature: VFG10X-1523 Promotions and Discounts _ Sale transaction with stacked promotions _Exclusivity set to "Do not Combine"

  Scenario: Promotions and Discounts _ Sale transaction with stacked promotions _Exclusivity set to "Do not Combine"

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "Coupon-10%" product to the basket without customer
    Then the sales assistant add 1 items from "Coupon-20%" product to the basket

    # Apply coupon
    When the sales assistant clicks on "Coupons" button from basket
    And  the sales assistant enter coupons code for "Coupon-10%"
    Then the sales assistant lands on Basket Page
    And the sales assistant clicks on "Coupons" button from basket
    And  the sales assistant enter coupons code for "Coupon-20%"
    Then the sales assistant lands on Basket Page
    And the sales assistant validate the promotions "10% off with coupon" and "20% off with coupon" aren't combined

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application