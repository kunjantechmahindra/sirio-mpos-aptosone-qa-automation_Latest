@VFG10X-969 @ExchangeTransaction @Regression @Card @Visa
Feature: VFG10X-969 Exchange _ Blind Negative Exchange transaction with multiple items with bag fee Void bag fee _Refund to card_ Existing Customer Assigned

  Scenario: Exchange _ Blind Negative Exchange transaction with multiple items with bag fee Void bag fee _Refund to card_ Existing Customer Assigned

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant select No receipt for blind return
#    And the sales assistant clicks on Skip button

    #Assign customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 1

    #Add Product for return
    Then the sales assistant add an items from "General" product for return
    And the sales assistant selects "DAMAGED/DEFECTIVE" as reason code
    Then the sales assistant add an items from "General" product for return
    And the sales assistant selects "CHANGED MIND" as reason code
    And the sales assistant navigate to basket page from return mode page

    #Add Product
    Then the sales assistant add 2 items from "LowerPrice" product to the basket

    #Void bag fee transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button

    #Payment transaction
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on card for refund
    And the sales assistant processes the payment with a "visa" card using a "tap" action, entering the pin "0"
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application
