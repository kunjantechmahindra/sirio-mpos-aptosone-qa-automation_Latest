@VFG10X-44 @SaleTransaction @Regression
Feature: VFG10X-44 Sale Transaction _Multiple Items_ Transactional Level Tax Exempt and Void transaction _ Functionality not persisting

  Scenario: Sale Transaction _Multiple Items_ Transactional Level Tax Exempt and Void transaction _ Functionality not persisting

    #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

    #Tax exempt
    When the sales assistant clicks on "Tax" button from basket
    And the sales assistant selects "Tax exempt" Option from line Action
    And the sales assistant enter the tax ID
    And the sales assistant clicks on Select a reason code button on tax exempt page
    And the sales assistant clicks on reason code as tax exempt
    And the sales assistant clicks on HST Exemption
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant validates transactional level tax is exempted

    #Void transaction
    And the sales assistant void the transaction from basket with reason code "Cashier Error"

    #Add items
    Then the sales assistant add 2 items from "General" product to the basket without customer
    And the sales assistant selects the product at index 1
    And the sales assistant validates "Tax Exempt" is not getting applied
    And the sales assistant lands on Basket Page

    #Void transaction
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application










