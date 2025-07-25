@VFG10X-1458 @SaleTransaction @Regression @Card @Visa

  Feature: VFG10X-1458 DCK: Sales transaction_Employee transaction discount_ Single item_Use Visa Card

    Scenario: DCK: Sales transaction_Employee transaction discount_ Single item_Use Visa Card

      #Login and add item to basket
      Given the sales assistant login to the application with valid username and password
      When the sales assistant clicks on Start Basket button
      Then the sales assistant add 1 items from "General" product to the basket

      #Add Employee discount
      And the sales assistant clicks on Employee Sale button from basket page
      And the sales assistant enter "valid" Employee ID
      And the sales assistant clicks on Apply button
      And the sales assistant lands on Basket Page

      # Payment transaction
      And the sales assistant clicks on Pay button
      And the sales assistant clicks on Accept button
      And the sales assistant save the transaction details of the sales transaction
      And the sales assistant clicks on Card button
      And the sales assistant processes the payment with a "visa" card using a "tap" action, entering the pin "0"
      And the sales assistant save the payment details for the sales transaction
      And the sales assistant clicks on Print button
      And the sales assistant select the printer
      And the sales assistant logout from the application




