@VFG10X-1711  @DetailedCalculation @Regression
Feature: VFG10X-1711 Promotions and Discounts _ Sale transaction with stacked promotions _Exclusivity set to "Do not Combine"

  Scenario: Promotions and Discounts _ Sale transaction with stacked promotions _Exclusivity set to "Do not Combine"

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "WithOutCoupon-10%-CantBeCombined" product to the basket without customer
    And the sales assistant lands on Basket Page
    And the sales assistant validate price of the item at index 1 after "20% off" discount is applied
    And the sales assistant validate price of the item at index 2 after "20% off" discount is applied

    # Apply coupon
    When the sales assistant clicks on "Coupons" button from basket
    And  the sales assistant enter coupons code for "CantBeCombined"
    Then the sales assistant lands on Basket Page
    And the sales assistant validate price of the item at index 1 after "10% off" discount is applied
    And the sales assistant validate price of the item at index 2 after "10% off" discount is applied
    And the sales assistant validate the promotions "20% off" and "10% off" aren't combined validation
    And the sales assistant validate total transaction amount

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application
