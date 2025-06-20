@VFG10X-1698 @ReturnTransaction @Regression @DetailedCalculation

Feature: VFG10X-1698 Return Transaction _Multiple items with Tax exempt and one without tax exempt_ coupon applied _Existing customer Assigned

  Scenario: Return Transaction _Multiple items with Tax exempt and one without tax exempt_ coupon applied _Existing customer Assigned

    #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Assign customer and add item to basket
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 1
    Then the sales assistant add 2 items from "Coupon-10%" product to the basket

    #Apply Tax exempt
    And the sales assistant save sale amount details
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax exempt" Option from line Action
    And the sales assistant enter the tax ID
    And the sales assistant clicks on Select a reason code button on tax exempt page
    And the sales assistant clicks on reason code as tax exempt
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Tax exempt" is applied to item
    And the sales assistant validate tax exempt applied in the transaction

    #Apply coupon
    When the sales assistant clicks on "Coupons" button from basket
    And  the sales assistant enter coupons code for "Coupon-10%"
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "10% off with coupon" is applied to item
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "10% off with coupon" is applied to item
    And the sales assistant lands on Basket Page
    And the sales assistant validate price of the item at index 1 after "10%" discount is applied
    And the sales assistant validate price of the item at index 2 after "10%" discount is applied
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
    And the sales assistant clicks on "Ok" button to assign customer

    #Complete refund
    And the sales assistant clicks on Pay button
    And the sales assistant validate the refund amount is correct
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application


