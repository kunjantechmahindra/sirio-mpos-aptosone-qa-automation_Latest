@VFG10X-2166 @SaleTransaction @Regression

Feature: VFG10X-2166 Sale Transaction _Perform a sale transaction by multiplying the quantity of Upc, apply promo

  Scenario: Sale Transaction _Perform a sale transaction by multiplying the quantity of Upc, apply promo

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "10%off-without-coupon" product to the basket


    #Price override
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enter price as 20
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Incorrect Ticket" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page

    #Add Quantity
    And the sales assistant selects the product at index 1
    And the sales assistant selects the Change Quantity button
    And the sales assistant add 1 quantity to the order
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page

    # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application




