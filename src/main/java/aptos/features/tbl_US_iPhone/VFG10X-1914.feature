@VFG10X-1914 @SaleTransaction @Regression
Feature: VFG10X-1914 Sale Transaction _Single Item with coupon_ No Customer

  Scenario: Sale Transaction _Single Item with coupon_ No Customer

   #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "Coupon-10%" product to the basket without customer

    #Apply coupon
    When the sales assistant clicks on menu button for iPhone basket
    And the sales assistant clicks on "Coupons" button from basket
    And  the sales assistant enter coupons code for "Coupon-10%"
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "10% off with coupon" is applied to item

    #Payment transaction
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application
