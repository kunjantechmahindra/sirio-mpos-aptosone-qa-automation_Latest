@VFG10X-287 @Regression @ExchangeTransaction

Feature: VFG10X-287 Exchange _Multiple Items with Transaction discount on sale items_ New Customer

  Scenario:  Exchange _Exchange _Multiple Items with Transaction discount on sale items_ New Customer

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant select No receipt for blind return

  #Add Product for blind return
    Then the sales assistant add an items from "General" product for return
    And the sales assistant selects "Damaged/Defective" as reason code
    And the sales assistant clicks on Skip button
    And the sales assistant navigate to basket page from return mode page

  #Create Customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant clicks on New Customer
    And the sales assistant enter New customer detail
    And the sales assistant clicks on Privacy Policy
    And the sales assistant clicks on Newsletter
    And the sales assistant clicks on Save button

  #Add exchange item and apply transactional level discount
    Then the sales assistant add 2 items from "General" product to the basket
    And the sales assistant clicks on Discount button from basket page
    And the sales assistant select transaction discount
    And the sales assistant clicks on amount button
    And the sales assistant enter discount amount as 10
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Damaged" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant validate the discount applied as "10"

  #Payment transaction
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
    And the sales assistant logout from EJViewer


