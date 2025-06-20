@VFG10X-1674 @ReturnTransaction @Regression

Feature: VFG10X-1674 Return Transaction _ Receipt Return with %off item having Price Override and Promo applied

  Scenario: Return Transaction _ Receipt Return with %off item having Price Override and Promo applied

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "Temp-MD" product to the basket without customer

   # Price override
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enter price as 30
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Price Match" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate the price after price override
    And the sales assistant lands on Basket Page

    #Apply coupon
    When the sales assistant clicks on "Coupons" button from basket
    And  the sales assistant enter coupons code for "Coupon-AllItem"
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "10% off for all" is applied to item

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
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application