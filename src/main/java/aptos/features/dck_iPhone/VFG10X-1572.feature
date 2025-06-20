@VFG10X-1572 @SaleTransaction @Regression
Feature: VFG10X-1572 DCK - iPhone - Sales transaction with item level $ off for single item

  Scenario: DCK - iPhone - Sales transaction with item level $ off for single item

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket

   #Item level amount $ off
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount button
    And the sales assistant enter discount amount as 2
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Damaged" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant validate the discount applied as "2.00"

    # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application