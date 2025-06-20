@VFG10X-1577 @TaxManagement @SaleTransaction @Regression
Feature: VFG10X-1577 Perform Sales transaction with multiple items with Tax Override,and Tax Exempt, Get E-Receipt

  Scenario: Perform Sales transaction with multiple items with Tax Override,and Tax Exempt, Get E-Receipt

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket

  # Apply Tax exempt
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax exempt" Option from line Action
    And the sales assistant enter the tax ID
    And the sales assistant clicks on Apply button
    And the sales assistant scrolls up the screen
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Tax exempt - Sales Tax" is applied to item

  # Apply Tax override
    And the sales assistant selects the product at index 2
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax override" Option from line Action
    And the sales assistant enter new tax as 3
    And the sales assistant scrolls up the screen
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 2
    And the sales assistant validate "Tax override - 3%" is applied to item

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Email button
    And the sales assistant enter the email
    And the sales assistant logout from the application