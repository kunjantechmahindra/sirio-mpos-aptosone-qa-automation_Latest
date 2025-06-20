@VFG10X-1310 @ExchangeTransaction @Regression @Smoke @SmokeTesting
Feature: VFG10X-1310 Exchange _Negative Exchange by hand typing the transaction barcode with Single item with Coupon on exchange transaction_Refund to Cash

  Scenario: Exchange _Negative Exchange by hand typing the transaction barcode with Single item with Coupon on exchange transaction_Refund to Cash

    #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "HigherPrice" product to the basket without customer

 #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Email button
    And the sales assistant enter the email

    #Save barcode from E-receipt
    Given the sales assistant launch the browser and navigate to YOP mail
    Then the sales assistant save the return barcode from the email receipt
    And the sales assistant closes the browser window.

 #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant enter the return barcode
    And the sales assistant verifies the barcode on the receipt is scanned
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - CHANGED MIND" as reason code
    And the sales assistant lands on Basket Page

    #Add Item and apply coupon
    And the sales assistant add 1 items from "Coupon-20%" product to the basket
    And the sales assistant clicks on "Coupons" button from basket
    And  the sales assistant enter coupons code for "Coupon-20%"
    And the sales assistant lands on Basket Page

#Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application