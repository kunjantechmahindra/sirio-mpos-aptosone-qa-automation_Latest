@VFG10X-1712 @ReturnTransaction @Regression @DetailedCalculation

Feature: VFG10X-1712 Promotions and Discounts _ Sale transaction with Temporary markdown and Promotion(with coupon) on same line item and apply manual transactional discount

  Scenario: Promotions and Discounts _ Sale transaction with Temporary markdown and Promotion(with coupon) on same line item and apply manual transactional discount

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    #Then the sales assistant add 1 items from "Temp-MD" product to the basket without customer

    # Add Temp MD product to basket
    And the sales assistant navigate to product inquiry page
    And the sales assistant search product by UPC number from "Temp-MD"
    And the sales assistant save the original and temporary price
    And the sales assistant add item to the basket
    And the sales assistant clicks on basket button
    And the sales assistant clicks on Skip button
    And the sales assistant lands on Basket Page
    And the sales assistant validate temporary markdown discount


    # Apply coupon
    When the sales assistant clicks on "Coupons" button from basket
    And  the sales assistant enter coupons code for "Coupon-AllItem"
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "10% off for all" is applied to item
    And the sales assistant lands on Basket Page
    And the sales assistant validate price of the item at index 1 after "10%" discount is applied
    And the sales assistant validate total transaction amount

    # Discount at transaction level
    And the sales assistant save sale amount details
    And the sales assistant clicks on Discount button from basket page
    And the sales assistant select transaction discount button
    And the sales assistant clicks on percentage button
    And the sales assistant enter discount percentage as 6
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Damaged" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant validate "6%" discount is applied to the transaction
    And the sales assistant validate total transaction amount

    # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application


