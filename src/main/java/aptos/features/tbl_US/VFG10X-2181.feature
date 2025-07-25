@VFG10X-2181 @ReturnTransaction @Regression

  Feature: VFG10X-2181 Return transaction_Return item with MixMatchPresentation promotion

    Scenario: Return transaction_Return item with MixMatchPresentation promotion

      #Login
      Given the sales assistant login to the application with valid username and password
      When the sales assistant clicks on Start Basket button

      #Assign customer
      And then sales assistant clicks on Assign Customer button
      And the sales assistant assign customer details with index 1

      #Add Product
      And the sales assistant add 2 items from "BOGO-Free" product to the basket
      And the sales assistant add 1 items from "WithOutCoupon-10%" product to the basket

      #Apply Tax exempt
      And the sales assistant selects Tax button from Basket page
      And the sales assistant selects "Tax exempt" Option from line Action
      And the sales assistant enter the tax ID
      And the sales assistant clicks on Select a reason code button on tax exempt page
      And the sales assistant clicks on reason code as tax exempt
      And the sales assistant clicks on Apply button
      And the sales assistant lands on Basket Page
      And the sales assistant validates transactional level tax is exempted

      #Payment transaction
      And the sales assistant clicks on Pay button
      And the sales assistant clicks on Accept button
      And the sales assistant save the transaction details of the sales transaction
      And the sales assistant clicks on Cash button
      And the sales assistant enter the Drawer ID
      And the sales assistant save the payment details for the sales transaction
      And the sales assistant clicks on Print button
      And the sales assistant select the printer

  #Return transaction
      And the sales assistant clicks on return button
      And the sales assistant clicks on customer search button
      And the sales assistant search a customer using email at index 1
      And the sales assistant assign customer on the return customer search
      And the sales assistant select the transaction to be returned
      And the sales assistant return all items from the transaction
      And the sales assistant selects "RTL - CHANGED MIND" as reason code
      And the sales assistant lands on Basket Page
      And the sales assistant validate return amount

  # Refund to cash
      And the sales assistant clicks on Pay button
      And the sales assistant save the transaction details of the sales transaction
      And the sales assistant validate the refund amount is correct
      And the sales assistant clicks on Cash button
      And the sales assistant enter the Drawer ID
      And the sales assistant sign for the transaction
      And the sales assistant save the payment details for the sales transaction
      And the sales assistant clicks on Print button
      And the sales assistant select the printer
      And the sales assistant logout from the application





