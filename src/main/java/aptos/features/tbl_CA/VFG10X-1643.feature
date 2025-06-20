@VFG10X-1643 @SFCC @PrerequisiteRequired

Feature: VFG10X-1643 SFCC_Update in Promotion without Coupon validation in Aptos ONE
  Scenario: SFCC_Update in Promotion without Coupon validation in Aptos ONE

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Add item to the basket
    And the sales assistant enters 1 "Promo-without-coupon-sfcc" item UPC manually in the basket without customer

  #Validate promotion is applied to the product
   And the sales assistant selects the product at index 1
   And the sales assistant validate "10% off without coupon" is applied to item
   And the sales assistant void the transaction from basket with reason code "Cashier Error"
   And the sales assistant logout from the application
