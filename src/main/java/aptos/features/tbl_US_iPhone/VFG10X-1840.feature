@VFG10X-1840 @StoreSelling @Regression
Feature: VFG10X-1840 Store Selling Functions_ Item Level Sales person Assignment

  Scenario: Store Selling Functions_ Item Level Sales person Assignment

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "LowerPrice" product to the basket without customer

    #assign salesperson - item level
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Salesperson" Option from line Action
    And the sales assistant add salesperson "600400" to the transaction item
    Then the sales assistant selects "Yes" from the salesperson popup box
    And the sales assistant clicks on menu button for iPhone basket
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application




