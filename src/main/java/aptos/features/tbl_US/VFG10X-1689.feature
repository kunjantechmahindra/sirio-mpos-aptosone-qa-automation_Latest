@VFG10X-1689 @SFCC @PrerequisiteRequired

Feature: VFG10X-1689 SFCC_Update in Promotion with Coupon validation in Aptos ONE_TBL
  Scenario: SFCC_Update in Promotion with Coupon validation in Aptos ONE_TBL

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Add item to the basket
    Then the sales assistant enters 1 "Promo-with-coupon-sfcc" item UPC manually in the basket without customer
    And the sales assistant lands on Basket Page

  #Apply coupon
    When the sales assistant clicks on "Coupons" button from basket
    And  the sales assistant enter coupons code for "Coupon-SFCC"
    And the sales assistant lands on Basket Page

  #Validate promotion is applied to the product
   And the sales assistant selects the product at index 1
   And the sales assistant validate "20% off with coupon" is applied to item
   And the sales assistant void the transaction from basket with reason code "Cashier Error"
   And the sales assistant logout from the application
