@VFG10X-2118 @StoreSelling @Regression
Feature: VFG10X-2118 Store Selling Functions _ Adding Same item Multiple times

  Scenario: Store Selling Functions _ Adding Same item Multiple times

 #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket
    And the sales assistant add same items to the basket
    And the sales assistant validate same item is added in a new line to the basket

    #Void transaction
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application

