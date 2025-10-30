@VFG10X-384 @StoreSelling @Regression
Feature: VFG10X-384 Store Selling Functions _ Allow Cashier to be defaulted as Salesperson

  Scenario: Store Selling Functions _ Allow Cashier to be defaulted as Salesperson

  #Login and add products
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

    #Assign sale person
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Salesperson" Option from line Action
    And the sales assistant add salesperson "800500" to the transaction item
#    Then the sales assistant selects "Yes" from the salesperson popup box
    And the sales assistant selects the product at index 2
    And the sales assistant selects "Salesperson" Option from line Action
    And the sales assistant add salesperson "800500" to the transaction item
    Then the sales assistant selects "Yes" from the salesperson popup box

    #Void Transaction
    And the sales assistant void the transaction from basket with reason code "Promo Error"
    And the sales assistant logout from the application
