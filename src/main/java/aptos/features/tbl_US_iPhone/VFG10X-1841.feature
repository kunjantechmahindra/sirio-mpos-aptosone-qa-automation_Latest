@VFG10X-1841 @StoreSelling @Regression
Feature: VFG10X-1841 Store Selling Functions_ Transactional Level Sales person Assignment

  Scenario: Store Selling Functions_ Transactional Level Sales person Assignment

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "LowerPrice" product to the basket without customer
    And the sales assistant clicks on menu button for iPhone basket
    And the sales assistant selects "Salesperson" Option from line Action
    And the sales assistant add salesperson "600400" to the transaction item
    And the sales assistant clicks on menu button for iPhone basket
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application




