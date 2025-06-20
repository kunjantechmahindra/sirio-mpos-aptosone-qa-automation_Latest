@VFG10X-2257 @StoreSelling @Regression

Feature: VFG10X- 2257 Store Selling Functions_ Predefined Comment Validations

  Scenario: Store Selling Functions_ Predefined Comment Validations

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

  #validates price override functionality
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Comments" Option from line Action
    And the sales assistant selects "Final Sale" as the comment
    And the sales assistant selects the product at index 2
    And the sales assistant selects "Comments" Option from line Action
    And the sales assistant selects "Exchange Only" as the comment

  #Validates comment added to the products
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validates comment tag is added to the product
    And the sales assistant selects the product at index 2
    And the sales assistant validates comment tag is added to the product
    And the sales assistant clicks on menu button for iPhone basket
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application

