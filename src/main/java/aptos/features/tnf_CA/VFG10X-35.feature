@VFG10X-35 @SaleTransaction @Regression @Card @Visa
  Feature: VFG10X-35 Sale Transaction _Multiple Items_ Void One Item_ Existing Loyalty Customer
    Scenario: Sale Transaction _Multiple Items_ Void One Item_ Existing Loyalty Customer

  # Login and add item to basket
      Given the sales assistant login to the application with valid username and password
      When the sales assistant clicks on Start Basket button

  # Assign customer and Add item
      And then sales assistant clicks on Assign Customer button
      #The customer has no loyalty program
      And the sales assistant assign customer details with index 0
      Then the sales assistant add 3 items from "General" product to the basket

  #Void at item level
      And the sales assistant selects the product at index 1
      And the sales assistant selects "Void item" Option from line Action
      And the sales assistant clicks on confirm button

   # Payment transaction with card
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
      And the sales assistant logout from EJViewer
