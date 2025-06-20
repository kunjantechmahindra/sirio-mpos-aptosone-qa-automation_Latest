@VFG10X-1509 @ReturnTransaction @Regression @SmokeDCK @Card @Visa
Feature: VFG10X-1509 DCK_Return Transaction_Apply Promotion_Without Original Sales Receipt - Blind Return

  Scenario: DCK_Return Transaction_Apply Promotion_Without Original Sales Receipt - Blind Return

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant select No receipt for blind return
    Then the sales assistant add an items from "Coupon-20%" product for return
    And the sales assistant selects "Damaged" as reason code
    And the sales assistant navigate to basket page from return mode page

    # Apply promotion
    When the sales assistant clicks on "Coupons" button from basket
    And  the sales assistant enter coupons code for "Coupon-20%"
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "20% with coupon" promotion is not applied

    #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on card for refund
    And the sales assistant processes the payment with a "visa" card using a "tap" action, entering the pin "0"
    And the sales assistant sign for the transaction
    And the sales assistant clicks on "Ok" button from unused coupon page
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Email button
    And the sales assistant enter the email
    And the sales assistant select the printer
    And the sales assistant logout from the application






