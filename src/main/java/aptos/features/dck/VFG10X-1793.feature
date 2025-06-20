@VFG10X-1793 @ReturnTransaction @Regression

  Feature: VFG10X-1793 Return Transaction_Sale Transaction _Gift Receipt_Multiple Item_Taxexempt _and price override applied_Assign a sales person_Payment by Amex Card

    Scenario: Return Transaction_Sale Transaction _Gift Receipt_Multiple Item_Taxexempt _and price override applied_Assign a sales person_Payment by Amex Card

  # Login
      Given the sales assistant login to the application with valid username and password
      When the sales assistant clicks on Start Basket button
      Then the sales assistant add 2 items from "General" product to the basket

  # Price override
      And the sales assistant selects the product at index 1
      And the sales assistant selects "Override price" Option from line Action
      And the sales assistant enter price as 10
      And the sales assistant clicks on Select a reason code button
      And the sales assistant selects "Incorrect PLU Price" as reason code
      And the sales assistant clicks on Apply button
      And the sales assistant lands on Basket Page
      #And the sales assistant selects the product at index 1
      #And the sales assistant validate "$10.00" is applied to item


  #Apply Tax exempt
      And the sales assistant selects the product at index 2
      And the sales assistant selects "Tax" Option from line Action
      And the sales assistant selects "Tax exempt" Option from line Action
      And the sales assistant enter the tax ID
      And the sales assistant clicks on Apply button
      And the sales assistant lands on Basket Page
      #And the sales assistant selects the product at index 2
      #And the sales assistant validate "Tax exempt" is applied to item
      #And the sales assistant lands on Basket Page

  # Assign sale person
      And the sales assistant selects the product at index 1
      And the sales assistant selects "Salesperson" Option from line Action
      And the sales assistant add salesperson "300087" to the transaction item
      Then the sales assistant selects "Yes" from the salesperson popup box
      And the sales assistant selects the product at index 2
      And the sales assistant selects "Salesperson" Option from line Action
      And the sales assistant add salesperson "300087" to the transaction item
      Then the sales assistant selects "Yes" from the salesperson popup box
      And sales assistant saves the salesperson name

  #Gift Receipt
      And the sales assistant clicks on Gift receipt button from basket page
      And the sales assistant select Grouped receipt

  # Payment transaction
      And the sales assistant clicks on Pay button
      And the sales assistant clicks on Accept button
      And the sales assistant save the transaction details of the sales transaction
      And the sales assistant clicks on Card button
      And the sales assistant processes the payment with a "amex" card using a "tap" action, entering the pin "0"
      And the sales assistant save the payment details for the sales transaction
      And the sales assistant clicks on Print button
      And the sales assistant select the printer wait for gift receipt and save the receipt for return
      And the sales assistant validate salesperson name is not printed in physical receipt

  # Return transaction
      And the sales assistant clicks on return button
      And the sales assistant scan the receipt for returning the item
      And the sales assistant return all items from the transaction
      And the sales assistant selects "Gift" as reason code
      And the sales assistant lands on Basket Page
      And the sales assistant validate return amount

      # Verify price override and tax exempt
      And the sales assistant selects the product at index 1
      And the sales assistant validate "$10.00" is applied to item
      And the sales assistant selects the product at index 2
      And the sales assistant validate "Tax exempt" is applied to item

    #Refund transaction
      And the sales assistant clicks on Pay button
      And the sales assistant save the transaction details of the sales transaction
      And the sales assistant validate the refund amount is correct
      And the sales assistant selects amex card for refund
      And the sales assistant sign for the transaction
      And the sales assistant save the payment details for the sales transaction
      And the sales assistant clicks on Print button
      And the sales assistant select the printer
      And the sales assistant logout from the application

    # EJ Validation
      And the sales assistant login to EJViewer
      And the sales assistant enter the store and transaction detail
      And the sales assistant validate the payment details
      And the sales assistant validate details "300087" in EJ
      And the sales assistant logout from EJViewer
