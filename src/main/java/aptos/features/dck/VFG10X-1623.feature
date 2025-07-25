@VFG10X-1623  @SaleTransaction @Regression
Feature: VFG10X-1623 Sale transaction with multiple items having Temporary markdown price

  Scenario: Sale transaction with multiple items having Temporary markdown price

  #Login and add products
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "Temp-MD" product to the basket

    #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application
