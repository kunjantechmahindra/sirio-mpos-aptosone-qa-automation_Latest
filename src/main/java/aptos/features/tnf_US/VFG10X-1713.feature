@VFG10X-1713 @Regression @DetailedCalculation
Feature: VFG10X-1713 Promotions and Discounts _ Sale transaction with Coupon - 20% with Coupon

  Scenario: Promotions and Discounts _ Sale transaction with Coupon - 20% with Coupon

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "Coupon-20%" product to the basket without customer

  # Apply and validate the coupon discount
    And the sales assistant selects the product at index 1
    And the sales assistant stores price of first product
    When the sales assistant clicks on "Coupons" button from basket
    And  the sales assistant enter coupons code for "Coupon-20%"
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "20" % coupon applied correctly for the item
    And the sales assistant validate total transaction amount

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application