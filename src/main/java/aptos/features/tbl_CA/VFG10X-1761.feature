@VFG10X-1761 @DetailedCalculation @Regression
Feature: VFG10X-1761 Promotions & discounts-Sales transaction with Spend 50$ or more & get 10$ off with coupon

  Scenario: Promotions & discounts-Sales transaction with Spend 50$ or more & get 10$ off with coupon

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "Spend-50$-get-10$Off" product to the basket without customer

  #Apply coupon
    When the sales assistant clicks on "Coupons" button from basket
    And  the sales assistant enter coupons code for "Spend-50$-get-10$Off"
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "10.00" $off applied correctly
    And the sales assistant validate total transaction amount

  #Payment transaction by cash
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application
