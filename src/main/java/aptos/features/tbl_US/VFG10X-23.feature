@VFG10X-23 @SaleTransaction @Regression @Card @Diners @SmokeTesting
Feature: VFG10X-23 Sale Transaction _Multiple Items with Tax Exempt and Coupon Applied_ Payment by Diners card_ No customer

  Scenario: Sale Transaction _Multiple Items with Tax Exempt and Coupon Applied_ Payment by Diners card_ No customer

    #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

    #Apply coupon
    When the sales assistant clicks on "Coupons" button from basket
    And  the sales assistant enter coupons code for "Coupon-AllItem"
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "10% off for all" is applied to item
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 2
    And the sales assistant validate "10% off for all" is applied to item
    And the sales assistant lands on Basket Page

    #Tax exempt
    And the sales assistant selects Tax button from Basket page
    And the sales assistant selects "Tax exempt" Option from line Action
    And the sales assistant enter the tax ID
    And the sales assistant clicks on Select a reason code button on tax exempt page
    And the sales assistant clicks on reason code as tax exempt
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Tax exempt" is applied to item
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 2
    And the sales assistant validate "Tax exempt" is applied to item

    #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "diners" card using a "tap" action, entering the pin "0046"
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Email button
    And the sales assistant enter the email
    And the sales assistant logout from the application

    # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "Coupon discount" in EJ
    And the sales assistant validate details "Tax Exempt" in EJ
    And the sales assistant logout from EJViewer