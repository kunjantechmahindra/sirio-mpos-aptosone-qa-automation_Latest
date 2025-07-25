@VFG10X-967 @ExchangeTransaction @Card @Regression @Visa @SmokeTNF
Feature: VFG10X-967 Exchange _ Negative Exchange transaction of multiple items with payment by Visa Swipe Void Visa pay by Cash on the initial sale transaction

  Scenario: Exchange _ Negative Exchange transaction of multiple items with payment by Visa Swipe Void Visa pay by Cash on the initial sale transaction

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Assign Customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 1
    Then the sales assistant add 2 items from "HigherPrice" product to the basket

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant enters half of the total amount in the payment section
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "visa" card using a "insert" action, entering the pin "0"
    And the sales assistant validate if partial payment was success
    And the sales assistant save the transaction details of the sales transaction

  #Payment Void and Complete transaction
    And the sales assistant voids the partial payment

 #payment transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

  #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - Changed Mind" as reason code
    And the sales assistant clicks on "Ok" button to assign customer
    And the sales assistant lands on Basket Page

#Add exchange items
    And the sales assistant add 2 items from "LowerPrice" product to the basket

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application