@VFG10X-1366 @Regression @ExchangeTransaction

Feature: VFG10X-1366 Exchange Transaction_Exchange multi-items, Sale 1st item with Price-Override and Return 2nd item with 15 %Tax-Override with Receipt

  Scenario: Exchange Transaction_Exchange multi-items, Sale 1st item with Price-Override and Return 2nd item with 15 %Tax-Override with Receipt

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

  #Tax override
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax override" Option from line Action
    And the sales assistant enter new tax as 15
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Tax override - 15%" is applied to item

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

  #Exchange transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - Changed Mind" as reason code
    And the sales assistant lands on Basket Page
    And the sales assistant add 1 items from "General" product to the basket

  #Apply price override for sale item in exchange transaction
    And the sales assistant selects the product at index 2
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enter price as 30
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Price Match" as reason code
    And the sales assistant clicks on Apply button

  #payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
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
    And the sales assistant logout from EJViewer

