@VFG10X-973 @Regression @ExchangeTransaction @Card @Visa

Feature: VFG10X-973 Exchange_Negative Blind Exchange transaction with multiple items with Multiple Employees_Refund by card_No Customer Assigned

  Scenario: Exchange_Negative Blind Exchange transaction with multiple items with Multiple Employees_Refund by card_No Customer Assigned

    #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant select No receipt for blind return
    And the sales assistant clicks on Skip button

    #Add Product
    Then the sales assistant add an items from "HigherPrice" product for return
    And the sales assistant selects "DAMAGED/DEFECTIVE" as reason code
    Then the sales assistant add an items from "HigherPrice" product for return
    And the sales assistant selects "CHANGED MIND" as reason code
    And the sales assistant navigate to basket page from return mode page

    #Add exchange items
    And the sales assistant add 2 items from "LowerPrice" product to the basket

    # Assign sale person for exchange items
    And the sales assistant selects the product at index 3
    And the sales assistant selects "Salesperson" Option from line Action
    And the sales assistant add salesperson "900500" to the transaction item
    Then the sales assistant selects "Yes" from the salesperson popup box
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 4
    And the sales assistant selects "Salesperson" Option from line Action
    And the sales assistant add salesperson "600400" to the transaction item
    Then the sales assistant selects "Yes" from the salesperson popup box
    And sales assistant saves the salesperson name

    #Refund transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on card for refund
    And the sales assistant processes the payment with a "visa" card using a "tap" action, entering the pin "0"
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

    # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "900500" in EJ
    And the sales assistant validate details "600400" in EJ
    And the sales assistant logout from EJViewer
