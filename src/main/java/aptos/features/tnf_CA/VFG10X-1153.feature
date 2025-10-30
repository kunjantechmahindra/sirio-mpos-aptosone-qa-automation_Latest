@VFG10X-1153 @Regression @ExchangeTransaction

Feature: VFG10X-1153 Exchange Transaction_Positive Exchange of multiple items with Multiple Employees on initial sale transaction

  Scenario: Exchange Transaction_Positive Exchange of multiple items with Multiple Employees on initial sale transaction

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "LowerPrice" product to the basket without customer

  #Assign sale person for multiple items
    And the sales assistant selects the product at index 2
    And the sales assistant selects "Salesperson" Option from line Action
    And the sales assistant add salesperson "800500" to the transaction item
#    Then the sales assistant selects "Yes" from the salesperson popup box
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Salesperson" Option from line Action
    And the sales assistant add salesperson "800400" to the transaction item
    Then the sales assistant selects "Yes" from the salesperson popup box
    And sales assistant saves the salesperson name

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant clicks on Cash option
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

  #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "Damaged/Defective" as reason code
    And the sales assistant lands on Basket Page

  #Add exchange items
    And the sales assistant add 2 items from "HigherPrice" product to the basket

 #Refund transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant clicks on Cash option
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

  #EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "RTL - Damaged/Defective" in EJ
    And the sales assistant logout from EJViewer
