@VFG10X-2017 @SaleTransaction @Regression @DetailedCalculation @Card @Visa

Feature: VFG10X-2017 Sale Transaction _Single Items with Tax Exempt and Coupon applied_ Void Payment by Credit Card and complete by Cash

  Scenario: Sale Transaction _Single Items with Tax Exempt and Coupon applied_ Void Payment by Credit Card and complete by Cash

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Add Product
    And the sales assistant add 1 items from "Coupon-20%" product to the basket
    And the sales assistant clicks on "Coupons" button from basket
    And  the sales assistant enter coupons code for "Coupon-20%"
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant stores price of first product
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "20" % coupon applied correctly for the item
    And the sales assistant lands on Basket Page

  #Apply Tax exempt
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax exempt" Option from line Action
    And the sales assistant enter the tax ID
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant validates transactional level tax is exempted
    And the sales assistant validate total transaction amount

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant enters half of the total amount in the payment section
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "visa" card using a "tap" action, entering the pin "0"
    And the sales assistant validates if partial payment is completed with "visa"

  # Payment Void and Complete transaction
    And the sales assistant voids the partial payment

#Payment transaction
    And the sales assistant enter extra amount
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant validate change due amount
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application