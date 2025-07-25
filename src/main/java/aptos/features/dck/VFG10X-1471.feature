@VFG10X-1471 @ReturnTransaction @Regression

  Feature: VFG10X-1471 DCK - Return Transaction_Return Search_Single Item

    Scenario: DCK - Return Transaction_Return Search_Single Item

  #Login and add item to basket
      Given the sales assistant login to the application with valid username and password
      When the sales assistant clicks on Start Basket button
      Then the sales assistant add 1 items from "General" product to the basket

  #Payment transaction
      And the sales assistant clicks on Pay button
      And the sales assistant save the transaction details of the sales transaction
      And the sales assistant clicks on Cash button
      And the sales assistant enter the Drawer ID
      And the sales assistant save the payment details for the sales transaction
      And the sales assistant clicks on Print button
      And the sales assistant select the printer and save the receipt for return

  #Return transaction
      And the sales assistant clicks on return button
      And the sales assistant scan the receipt for returning the item
      And the sales assistant return all items from the transaction
      And the sales assistant selects "Changed Mind" as reason code
      And the sales assistant lands on Basket Page

  #Refund transaction
      And the sales assistant clicks on Pay button
      And the sales assistant save the transaction details of the sales transaction
      And the sales assistant clicks on Cash button
      And the sales assistant enter the Drawer ID
      And the sales assistant sign for the transaction
      And the sales assistant save the payment details for the sales transaction
      And the sales assistant clicks on Print button
      And the sales assistant select the printer
      And the sales assistant logout from the application