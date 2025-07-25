@VFG10X-290 @ExchangeTransaction @Regression
Feature: VFG10X-290 Exchange _Single item _Suspend and Resume

  Scenario: Exchange _Single item _Suspend and Resume

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Add Product
    Then the sales assistant add 1 items from "General" product to the basket without customer

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

  #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - Changed Mind" as reason code
    And the sales assistant lands on Basket Page

 #Add Product
    Then the sales assistant add 1 items from "General" product to the basket

  #Suspend and Resume Transaction
    And then sales assistant clicks on Suspend button
    And the sales assistant enter the reference ID
    And the sales assistant select the printer
    And the sales assistant clicks on Resume button
    And the sales assistant navigate to basket page
    And the sales assistant clicks on Resume button
    And the sales assistant select the transaction to be resumed
    And the sales assistant proceed without selecting the customer

 #Payment
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

