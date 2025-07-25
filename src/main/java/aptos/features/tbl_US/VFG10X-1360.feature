@VFG10X-1360 @Regression @ExchangeTransaction

Feature: VFG10X-1360 Exchange _Void an Blind Exchange Transaction with Single  Sale and Return Item

  Scenario:  Exchange _Void an Blind Exchange Transaction with Single  Sale and Return Item

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant select No receipt for blind return

  #Add Product for blind return
    Then the sales assistant add an items from "LowerPrice" product for return
    And the sales assistant selects "DAMAGED/DEFECTIVE" as reason code
    And the sales assistant clicks on Skip button
    And the sales assistant navigate to basket page from return mode page

  #Add exchange item and void
    Then the sales assistant add 1 items from "HigherPrice" product to the basket
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant void the transaction from payment with reason code "Cashier Error"
    And the sales assistant logout from the application

  #EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validates transaction got voided
    And the sales assistant logout from EJViewer

