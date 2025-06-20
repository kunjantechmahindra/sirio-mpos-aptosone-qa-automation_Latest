@VFG10X-2115 @Regression @StoreSelling

  Feature: VFG10X-2115 Store Selling Functions _ Maximum Limit of Price Override

    Scenario: Store Selling Functions _ Maximum Limit of Price Override

      #Login and add product
      Given the sales assistant login to the application with valid username and password
      When the sales assistant clicks on Start Basket button
      And the sales assistant add 1 items from "General" product to the basket

      #Price override
      And the sales assistant selects the product at index 1
      And the sales assistant selects "Override price" Option from line Action
      And the sales assistant enter price as 99999
      And the sales assistant clicks on cancel button
      And the sales assistant lands on Basket Page
      And the sales assistant selects the product at index 1
      And the sales assistant selects "Override price" Option from line Action
      And the sales assistant enter maximum amount as "999.99"
      And the sales assistant clicks on Select a reason code button
      And the sales assistant selects "Incorrect PLU Price" as reason code
      And the sales assistant clicks on Apply button
      And the sales assistant validates amount is less than limit

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

