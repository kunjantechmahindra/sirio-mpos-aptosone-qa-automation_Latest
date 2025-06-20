@VFG10X-447 @StoreSelling @Regression

Feature: VFG10X-447 Store Selling Functions _Reason Code Mandatory for Item Level Tax Exempt

  Scenario: Store Selling Functions _Reason Code Mandatory for Item Level Tax Exempt

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

  #Tax exempt item level
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax exempt" Option from line Action
    And the sales assistant enter the tax ID
    And the sales assistant validates reason code is mandatory for transactional level tax exempt
    And the sales assistant clicks on Select a reason code button on tax exempt page
    And the sales assistant clicks on reason code as tax exempt
    And the sales assistant clicks on HST Exemption
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Tax exempt - HST Tax" is applied to item
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application