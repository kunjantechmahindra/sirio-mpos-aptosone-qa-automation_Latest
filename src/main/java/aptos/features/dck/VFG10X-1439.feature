@VFG10X-1439 @SaleTransaction @Regression @SmokeDCK
Feature: VFG10X-1439 Sales with discount applied at item level % off - Multiple items - Tender: Cash with Change

  Scenario: Sales with discount applied at item level % off - Multiple items - Tender: Cash with Change

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket

  # Item level percentage Discount
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount button
    And the sales assistant clicks on percentage button
    And the sales assistant enter discount percentage as 10
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Birthday" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Discount - 10%" is applied to item

  # Item level percentage Discount
    And the sales assistant selects the product at index 2
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount button
    And the sales assistant clicks on percentage button
    And the sales assistant enter discount percentage as 15
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Clearance" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 2
    And the sales assistant validate "Discount - 15%" is applied to item

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant enter extra amount
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant validate change due amount
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application