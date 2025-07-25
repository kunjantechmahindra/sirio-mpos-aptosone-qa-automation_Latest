@VFG10X-1696 @ReturnTransaction @Regression @DetailedCalculation

Feature: VFG10X-1696 Return Transaction _ Receipt Return with Temp-MD item having Price Override and Promo applied

  Scenario: Return Transaction _ Receipt Return with %off item having Price Override and Promo applied

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Add Temp MD product to basket
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

   # Price override
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enter price as 10
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Price Match" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant validate the price of the product is 10 at index 1
    And the sales assistant validate total transaction amount


    # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

    #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - Changed Mind" as reason code

    #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant validate the refund amount is correct
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application


