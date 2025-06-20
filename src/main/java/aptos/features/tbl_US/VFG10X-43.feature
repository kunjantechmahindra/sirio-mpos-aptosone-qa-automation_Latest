@VFG10X-43 @SaleTransaction @Regression
Feature: VFG10X-43 Sale Transaction _Multiple Items_ Transactional Level Tax Override and Void transaction _ Functionality not persisting

  Scenario: Sale Transaction _Multiple Items_ Transactional Level Tax Override and Void transaction _ Functionality not persisting

    #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

    #Apply Tax override
    When the sales assistant clicks on "Tax" button from basket
    And the sales assistant selects "Tax override" Option from line Action
    And the sales assistant enter transactional level new tax rate as 5
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Tax override - 5%" is applied to item
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 2
    And the sales assistant validate "Tax override - 5%" is applied to item
    And the sales assistant lands on Basket Page

    #Void transaction
    And the sales assistant void the transaction from basket with reason code "Cashier Error"

    #Add items
    Then the sales assistant add 2 items from "General" product to the basket without customer
    And the sales assistant selects the product at index 1
    And the sales assistant validates "Tax override - 5%" is not getting applied
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 2
    And the sales assistant validates "Tax override - 5%" is not getting applied
    And the sales assistant lands on Basket Page

    #Void transaction
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application












