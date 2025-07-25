@VFG10X-948 @ReturnTransaction @Regression @SmokeTBL
Feature: VFG10X-948 Return Transaction _Single item and Void Transaction
  Scenario: Return Transaction _Single item and Void Transaction

 #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

 #Add Product
    Then the sales assistant add 2 items from "General" product to the basket without customer

 #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

  #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - CHANGED MIND" as reason code

  #Void at item level
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Void item" Option from line Action
    And the sales assistant clicks on confirm button

    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application
