@VFG10X-898 @PriceOverride @Regression @SmokeTesting

Feature: VFG10X-898 Price Override _Suspend and Resume_Sales transaction with price override with Reason Code: RETURN/EXCHANGE for TBL

  Scenario: Price Override _Suspend and Resume_Sales transaction with price override with Reason Code: RETURN/EXCHANGE for TBL

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

  #Price override
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enter price as 100
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "RETURN/EXCHANGE" as reason code
    And the sales assistant clicks on Apply button

  #Suspend and Resume Transaction
    And then sales assistant clicks on Suspend button
    And the sales assistant enter the reference ID
    And the sales assistant clicks on Resume button
    And the sales assistant clicks on Basket button from header
    And the sales assistant clicks on Resume button
    And the sales assistant select the transaction to be resumed
    And the sales assistant proceed without selecting the customer

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

  #EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "RETURN/EXCHANGE" in EJ
    And the sales assistant logout from EJViewer
