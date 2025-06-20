@VFG10X-101 @StoreSelling @Regression

Feature: VFG10X-101 Store Selling Functions_ Transactional Level Tax Exempt Option

  Scenario: Store Selling Functions_ Transactional Level Tax Exempt Option

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

  #Validates Tax exempt button in transactional level is enabled
    And the sales assistant selects Tax button from Basket page
    And the sales assistant validate if tax exempt button is enabled
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application
