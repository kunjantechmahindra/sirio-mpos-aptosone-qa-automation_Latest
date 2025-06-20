@VFG10X-2120 @StoreSelling @Regression

Feature: VFG10X-2120 Store Selling Functions _No Reason Code in Transactional Level Tax Exempt

  Scenario: Store Selling Functions _No Reason Code in Transactional Level Tax Exempt

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket

  #Tax exempt transactional level
    And the sales assistant selects Tax button from Basket page
    And the sales assistant selects "Tax exempt" Option from line Action
    And the sales assistant enter the tax ID
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant validates transactional level tax is exempted
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application