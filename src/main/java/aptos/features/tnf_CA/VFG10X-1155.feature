@VFG10X-1155 @TaxManagement @Regression @Card @Visa
Feature: VFG10X-1155 Tax _ Sale Mono Temp MD item with tax exempt, suspended and resumed_Existing Customer

  Scenario: Tax _ Sale Mono Temp MD item with tax exempt, suspended and resumed_Existing Customer

    #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Assign customer and add item to basket
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 0
    Then the sales assistant add 1 items from "Temp-MD" product to the basket

    #Tax exempt
    And the sales assistant selects Tax button from Basket page
    And the sales assistant selects "Tax exempt" Option from line Action
    And the sales assistant enter the tax ID
    And the sales assistant clicks on Select a reason code button on tax exempt page
    And the sales assistant clicks on reason code as tax exempt
    And the sales assistant clicks on GST & PST Exemption
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Tax exempt" is applied to item
    And the sales assistant lands on Basket Page

    #Suspend and Resume Transaction
    And then sales assistant clicks on Suspend button
    And the sales assistant enter the reference ID
    And the sales assistant select the printer
    And the sales assistant clicks on Resume button
    And the sales assistant navigate to basket page
    And the sales assistant clicks on Resume button
    And the sales assistant select the transaction to be resumed

    #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "visa" card using a "tap" action, entering the pin "0"
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

    # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "Transaction tax exempt" in EJ
    And the sales assistant logout from EJViewer

