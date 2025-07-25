@VFG10X-1303 @ReturnTransaction @Regression @Card @Visa @SmokeTNF
Feature: VFG10X-1303 Return Transaction _ Blind Return with single item and add tax exempt to the return transaction_Refund to Card_Existing customer assigned

  Scenario: Return Transaction _ Blind Return with single item and add tax exempt to the return transaction_Refund to Card_Existing customer assigned

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant select No receipt for blind return
    And the sales assistant clicks on Skip button

    #Add Product
    Then the sales assistant add an items from "General" product for return
    And the sales assistant selects "Damaged/Defective" as reason code
    And the sales assistant navigate to basket page from return mode page

    #Apply Tax exempt
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax exempt" Option from line Action
    And the sales assistant enter the tax ID
    And the sales assistant clicks on Select a reason code button on tax exempt page
    And the sales assistant clicks on reason code as tax exempt
    And the sales assistant clicks on GST & PST Exemption
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Tax exempt" is applied to item

    #Add a customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant search a customer using email at index 0
    And the sales assistant clicks on search results back button from customer profile
    And then sales assistant clicks on Assign Customer button

    #Refund transaction
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on card for refund
    And the sales assistant processes the payment with a "visa" card using a "tap" action, entering the pin "0"
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

    #EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "Damaged/Defective" in EJ
    And the sales assistant logout from EJViewer

