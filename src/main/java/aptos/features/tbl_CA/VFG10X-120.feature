@VFG10X-120 @ReturnTransaction @Regression
Feature: VFG10X-120 Return Transaction _Single Item with Price Override _Existing customer

  Scenario: Return Transaction _Single Item with Price Override _Existing customer

 #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

 #Assign customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 1

 #Add Product
    Then the sales assistant add 1 items from "General" product to the basket

 #Price override
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enter price as 30
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "PRICE MATCH" as reason code
    And the sales assistant clicks on Apply button

 #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

  #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - CHANGED MIND" as reason code
    And the sales assistant clicks on "Ok" button to assign customer
    And the sales assistant clicks on Pay button
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
    And the sales assistant validate details "RTL - CHANGED MIND" in EJ
    And the sales assistant logout from EJViewer
