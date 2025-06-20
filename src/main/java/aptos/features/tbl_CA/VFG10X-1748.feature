@VFG10X-1748 @Regression @SaleTransaction @DetailedCalculation @Card @Master
Feature: VFG10X-1748 Sale Transaction _Single Item with Tax Override and Coupon Applied_ Payment by Card & Cash

  Scenario: Sale Transaction _Single Item with Tax Override and Coupon Applied_ Payment by Card & Cash

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "Coupon-20%" product to the basket without customer

  #Tax override
    And the sales assistant save sale amount details
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax override" Option from line Action
    And the sales assistant enter new tax as 7
    And the sales assistant validate the sales amount after "7%" of "Tax-override" is applied to the item at index 1
    #above step does not applicable to item with discount

  # Apply coupon
    When the sales assistant clicks on "Coupons" button from basket
    And  the sales assistant enter coupons code for "Coupon-20%"
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "20% off with coupon" is applied to item
    And the sales assistant lands on Basket Page
    And the sales assistant validate price of the item at index 1 after "20%" discount is applied
    And the sales assistant validate total transaction amount

    # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant enters half of the total amount in the payment section
    And the sales assistant clicks on card for refund
    And the sales assistant processes the payment with a "master" card using a "tap" action, entering the pin "0"
    And the sales assistant validate if partial payment was success
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Email button
    And the sales assistant enter the email
    And the sales assistant logout from the application



