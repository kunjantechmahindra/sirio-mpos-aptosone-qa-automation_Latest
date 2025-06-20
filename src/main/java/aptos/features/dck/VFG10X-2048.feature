@VFG10X-2048 @Regression @StoreSelling

Feature: VFG10X-2048 Store Selling Functions _ gift receipt will be printed for each individual line item when option to print at item level is selected

  Scenario: Store Selling Functions _ gift receipt will be printed for each individual line item when option to print at item level is selected

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket

  #Add Gift receipt
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Gift receipt" Option from line Action
    And the sales assistant validate gift logo is added to the product at index 1

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant validate individual gift receipts are printed for sale and gift
    And the sales assistant logout from the application

