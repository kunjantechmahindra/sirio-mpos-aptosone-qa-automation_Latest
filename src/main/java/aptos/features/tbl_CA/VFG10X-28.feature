@VFG10X-28 @SaleTransaction @Regression @SmokeTesting

  Feature: VFG10X-28 Sale Transaction _Normal Item and Temp MD item with Employee discount_ Existing Customer

    Scenario: Sale Transaction _Normal Item and Temp MD item with Employee discount_ Existing Customer

      # Login
      Given the sales assistant login to the application with valid username and password
      When the sales assistant clicks on Start Basket button

      # Assign customer
      And then sales assistant clicks on Assign Customer button
      And the sales assistant assign customer details with index 1
      Then the sales assistant add 1 items from "General" product to the basket
      Then the sales assistant add 1 items from "WithOutCoupon-10%" product to the basket


      #Add Employee discount
      And the sales assistant clicks on Employee Sale button from basket page
      And the sales assistant enter "valid" Employee ID
      And the sales assistant clicks on Apply button
      And the sales assistant lands on Basket Page


      #Payment transaction
      And the sales assistant clicks on Pay button
      And the sales assistant clicks on Accept button
      And the sales assistant save the transaction details of the sales transaction
      And the sales assistant clicks on Cash button
      And the sales assistant enter the Drawer ID
      And the sales assistant sign for the transaction
      And the sales assistant save the payment details for the sales transaction
      And the sales assistant clicks on Print button
      And the sales assistant select the printer
      And the sales assistant logout from the application

      # EJ Validation
      And the sales assistant login to EJViewer
      And the sales assistant enter the store and transaction detail
      And the sales assistant validate the payment details
      And the sales assistant logout from EJViewer