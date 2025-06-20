@VFG10X-1941 @ExchangeTransaction @Regression
Feature: VFG10X-1941 Exchange _Single item with Bag fee _Cash with change due
  Scenario: Exchange _Single item with Bag fee _Cash with change due

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Add Product
    Then the sales assistant add 1 items from "LowerPrice" product to the basket without customer

  #Payment transaction
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Pay button
    And the sales assistant adds 1 bag to the order
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

  #Return transaction
    And the sales assistant clicks on menu button for iPhone basket
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - CHANGED MIND" as reason code
    And the sales assistant lands on Basket Page

 #Add Product
    Then the sales assistant add 1 items from "HigherPrice" product to the basket
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Pay button
    And the sales assistant adds 1 bag to the order
    And the sales assistant clicks on Accept button

 #Change Due
    And the sales assistant enter extra amount
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant validate change due amount
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application
