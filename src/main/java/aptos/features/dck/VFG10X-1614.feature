@VFG10X-1614  @SaleTransaction @Regression
Feature: VFG10X-1614 Sales transaction of Multiple items, 3 items with Tax Exempt

  Scenario: Sales transaction of Multiple items, 3 items with Tax Exempt

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Add Product
    Then the sales assistant add 3 items from "General" product to the basket

    #Apply Tax exempt
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax exempt" Option from line Action
    And the sales assistant enter the tax ID
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page

    #Apply Tax exempt
    And the sales assistant selects the product at index 2
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax exempt" Option from line Action
    And the sales assistant enter the tax ID
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page

    #Apply Tax exempt
    And the sales assistant selects the product at index 3
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax exempt" Option from line Action
    And the sales assistant enter the tax ID
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page

    #Transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application