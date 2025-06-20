@VFG10X-1584 @SaleTransaction @Regression @Smoke
Feature: VFG10X-1584 DCK - iPhone - Sales transaction with SFCC promotion for multiple line items

  Scenario: DCK - iPhone - Sales transaction with SFCC promotion for multiple line items

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "10%off-without-coupon" product to the basket

    #Payment transaction
      And the sales assistant clicks on Pay button
      And the sales assistant clicks on Accept button
      And the sales assistant clicks on Cash button
      And the sales assistant enter the Drawer ID
      And the sales assistant clicks on Print button
      And the sales assistant select the printer
      And the sales assistant logout from the application
