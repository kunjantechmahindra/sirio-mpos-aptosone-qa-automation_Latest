@VFG10X-1612 @SaleTransaction @Regression

  Feature: VFG10X-1612 DCK - Sale Transaction of Mono item with tax exempt, suspended and resumed

    Scenario: DCK - Sale Transaction of Mono item with tax exempt, suspended and resumed

    #Login
      Given the sales assistant login to the application with valid username and password
      When the sales assistant clicks on Start Basket button
      Then the sales assistant add 1 items from "General" product to the basket

    #Apply Tax exempt
      And the sales assistant selects the product at index 1
      And the sales assistant selects "Tax" Option from line Action
      And the sales assistant selects "Tax exempt" Option from line Action
      And the sales assistant enter the tax ID
      And the sales assistant clicks on Apply button
      And the sales assistant lands on Basket Page
      And the sales assistant selects the product at index 1
      And the sales assistant validate "Tax exempt - Sales Tax" is applied to item

    #Suspend and Resume Transaction
      And then sales assistant clicks on Suspend button
      And the sales assistant enter the reference ID
      And the sales assistant clicks on Resume button
      And the sales assistant navigate to basket page
      And the sales assistant clicks on Resume button
      And the sales assistant select the transaction to be resumed

    #Payment transaction
      And the sales assistant clicks on Pay button
      And the sales assistant clicks on Accept button
      And the sales assistant save the transaction details of the sales transaction
      And the sales assistant clicks on Cash button
      And the sales assistant enter the Drawer ID
      And the sales assistant save the payment details for the sales transaction
      And the sales assistant clicks on Print button
      And the sales assistant select the printer
      And the sales assistant logout from the application