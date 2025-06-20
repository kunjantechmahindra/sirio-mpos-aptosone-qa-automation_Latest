@VFG10X-1163 @TaxManagement @Regression

Feature: VFG10X-1163 Tax _ Exchange transaction of Multiple item, 1st Item with tax exempt and voided, 2nd item with standard tax

  Scenario: Tax _ Exchange transaction of Multiple item, 1st Item with tax exempt and voided, 2nd item with standard tax

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

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
    And the sales assistant selects "RTL - CHANGED MIND" as reason code
    And the sales assistant lands on Basket Page
    And the sales assistant add 2 items from "General" product to the basket

#Apply Tax exempt
    And the sales assistant selects the product at index 3
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax exempt" Option from line Action
    And the sales assistant enter the tax ID
    And the sales assistant clicks on Select a reason code button on tax exempt page
    And the sales assistant clicks on reason code as tax exempt
    And the sales assistant clicks on Apply button
    #Intermittently we are getting a customer assignment page,use skip button for cancel customer assignment
    #And the sales assistant clicks on Skip button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 3
    And the sales assistant validate "Tax exempt" is applied to item

  #Void one item
    And the sales assistant selects the product at index 3
    And the sales assistant selects "Void item" Option from line Action
    And the sales assistant clicks on confirm button

  #Payment transaction
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
    And the sales assistant logout from EJViewer