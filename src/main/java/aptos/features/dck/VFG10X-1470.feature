@VFG10X-1470  @ReturnTransaction @Regression @Card @Master
Feature: VFG10X-1470 Return Transaction_No Receipt_Single Item

  Scenario: Return Transaction_No Receipt_Single Item

  #Login and add item to basket
      Given the sales assistant login to the application with valid username and password
      When the sales assistant clicks on Start Basket button

      #Return transaction
      And the sales assistant clicks on return button
      And the sales assistant select No receipt for blind return

      #Add Product
      Then the sales assistant add an items from "General" product for return
      And the sales assistant selects "Changed Mind" as reason code
      And the sales assistant navigate to basket page from return mode page

      #Payment transaction
      And the sales assistant clicks on Pay button
      And the sales assistant clicks on Accept button
      And the sales assistant save the transaction details of the sales transaction
      And the sales assistant clicks on Card button
      And the sales assistant processes the payment with a "mastercard" card using a "tap" action, entering the pin "0"
      And the sales assistant sign for the transaction
      And the sales assistant save the payment details for the sales transaction
      And the sales assistant clicks on Print button
      And the sales assistant select the printer
      And the sales assistant logout from the application
