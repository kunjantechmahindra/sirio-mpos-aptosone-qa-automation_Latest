@VFG10X-1141 @ExchangeTransaction @Card @Regression @Visa

Feature: VFG10X-1141  Exchange Transaction_ Positive Blind Exchange transaction of single item with payment by Visa Swipe Void Visa pay by Cash_Existing Customer Assigned

  Scenario: Exchange Transaction_ Positive Blind Exchange transaction of single item with payment by Visa Swipe Void Visa pay by Cash_Existing Customer Assigned

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant select No receipt for blind return

  #Add Product
    Then the sales assistant add an items from "LowerPrice" product for return
    And the sales assistant selects "DAMAGED/DEFECTIVE" as reason code
    And the sales assistant clicks on Skip button
    And the sales assistant navigate to basket page from return mode page

  #Assign Customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 1
    Then the sales assistant add 1 items from "HigherPrice" product to the basket

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant enters half of the total amount in the payment section
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "visa" card using a "tap" action, entering the pin "0"
    And the sales assistant validate if partial payment was success
    And the sales assistant save the transaction details of the sales transaction

  #Payment Void and Complete transaction
    And the sales assistant voids the partial payment

  #Payment transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application
