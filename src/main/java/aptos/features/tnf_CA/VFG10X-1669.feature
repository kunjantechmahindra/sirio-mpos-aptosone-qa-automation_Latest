@VFG10X-1669 @PromotionsAndDiscounts @Regression @GiftCard @Card

Feature: VFG10X-1669 Promotions and Discounts _ Verify that promotion is not getting applied to New GC issued

  Scenario: Promotions and Discounts _ Verify that promotion is not getting applied to New GC issued

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Issue New Gift Card
    And the sales assistant clicks on gift card button
    And the sales assistant enters gift card number from index 1
    And the sales assistant enters gift card amount "50.00"
    And the sales assistant clicks on issue button
    And the sales assistant clicks on Skip button
    And the sales assistant lands on Basket Page

  #Add normal item to the basket
    And the sales assistant add 1 items from "General" product to the basket

  #Apply coupon
    When the sales assistant clicks on "Coupons" button from basket
    And  the sales assistant enter coupons code for "Coupon-AllItem"
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "10% off for all" is applied to item
    And the sales assistant lands on Basket Page
    And the sales assistant selects gift card item at index 1
    And sales assistant coupon discount is not applied to gift card

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant clicks on Cash option
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application



