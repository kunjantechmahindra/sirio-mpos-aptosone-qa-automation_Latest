@VFG10X-279 @ReturnTransaction @Regression @Card @Diners

Feature: VFG10X-279 Return Transaction _Sale of Single item with Promo _Refund to Diners card _Existing Customer

  Scenario: Return Transaction _Sale of Single item with Promo _Refund to Diners card _Existing Customer

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "WithOutCoupon-10%" product to the basket without customer

  #validate discount
    And the sales assistant selects the product at index 1
    And the sales assistant validate "10% off without coupon" is applied to item

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "diners" card using a "tap" action, entering the pin "0"
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

  #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - CHANGED MIND" as reason code

  #Assign customer
    And the sales assistant lands on Basket Page
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 1

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant selects diners card for refund
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


