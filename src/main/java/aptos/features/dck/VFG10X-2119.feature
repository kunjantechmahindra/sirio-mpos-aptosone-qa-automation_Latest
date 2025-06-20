@VFG10X-2119 @StoreSelling @Regression
Feature: VFG10X-2119 Store Selling Functions _Reason Code is not their for Item Level Tax Exempt

  Scenario: Store Selling Functions _Reason Code is not their for Item Level Tax Exempt

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket

  #Tax exempt item level
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax exempt" Option from line Action
    And the sales assistant enter the tax ID
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Tax exempt - Sales Tax" is applied to item
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application