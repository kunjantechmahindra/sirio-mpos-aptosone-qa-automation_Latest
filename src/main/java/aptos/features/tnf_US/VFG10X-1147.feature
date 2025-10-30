@VFG10X-1147 @ExchangeTransaction @Regression

Feature: VFG10X-1147 Exchange Transaction_Exchange single item with Item level Discount with Existing Customer while exchange

  Scenario: Exchange Transaction_Exchange single item with Item level Discount with Existing Customer while exchange

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Add Product
    Then the sales assistant add 1 items from "LowerPrice" product to the basket without customer

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
    And the sales assistant selects "Damaged/Defective" as reason code
    And the sales assistant lands on Basket Page

  #Exchange
    And the sales assistant add 1 items from "HigherPrice" product to the basket

  #Assign customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 1

  #Add item level discount
    And the sales assistant selects the product at index 2
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount
    And the sales assistant enter discount percentage as 6
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Damaged" as reason code
    And the sales assistant clicks on Apply button

  #Refund transaction
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

  # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "Damaged/Defective" in EJ
    And the sales assistant validate details "Damaged" in EJ
    And the sales assistant logout from EJViewer

