@VFG10X-45 @SaleTransaction @Regression
Feature: VFG10X-45 Sale Transaction _Single Item_ Line Item Level Tax Override and Void Item and add same item _ Functionality not persisting

  Scenario: Sale Transaction _Single Item_ Line Item Level Tax Override and Void Item and add same item _ Functionality not persisting

    #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

    #Apply Tax override
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax override" Option from line Action
    And the sales assistant enter new tax as 5
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Tax override - 5%" is applied to item
    And the sales assistant lands on Basket Page

    #Void product
    And the sales assistant selects the product at index 1
    And the sales assistant void the product from basket

    #Add items
    And the sales assistant add same items to the basket
    And the sales assistant selects the product at index 1
    And the sales assistant validates "Tax override - 5%" is not getting applied
    And the sales assistant lands on Basket Page

    #Void transaction
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application













