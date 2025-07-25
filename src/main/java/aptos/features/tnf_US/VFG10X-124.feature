@VFG10X-124 @Regression @ExchangeTransaction @Card @Visa @SmokeTNF

Feature: VFG10X-124 Exchange _Blind Exchange _Single item with Tax override _Refund as card_No Customer
  Scenario: Exchange _Blind Exchange _Single item with Tax override _Refund as card_No Customer

    #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant select No receipt for blind return

    #Add Product
    Then the sales assistant add an items from "HigherPrice" product for return
    And the sales assistant selects "Damaged/Defective" as reason code
    And the sales assistant clicks on Skip button
    And the sales assistant navigate to basket page from return mode page

    #Add exchange items
    And the sales assistant add 1 items from "LowerPrice" product to the basket

    And the sales assistant selects the product at index 2
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax override" Option from line Action
    And the sales assistant clicks on amount button for tax override
    And the sales assistant enter new tax amount as 5
    And the sales assistant lands on Basket Page

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

  #EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant logout from EJViewer
