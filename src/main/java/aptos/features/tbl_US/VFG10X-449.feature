@VFG10X-449 @StoreSelling @Regression
Feature: VFG10X-449 Store Selling Functions _Reason Code not Mandatory for Item Level Tax Override

  Scenario: Store Selling Functions _Reason Code not Mandatory for Item Level Tax Override

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

  #Tax override item level
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax override" Option from line Action
    And the sales assistant enter new tax as 3
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Tax override - 3%" is applied to item
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application