@VFG10X-1448 @SaleTransaction @Regression @Card @GiftCard

  Feature: VFG10X-1448 DCK - Sale Transaction_Item level dollar off discount_Single Item

    Scenario: DCK - Sale Transaction_Item level dollar off discount_Single Item

      # Login
      Given the sales assistant login to the application with valid username and password
      When the sales assistant clicks on Start Basket button
      Then the sales assistant add 1 items from "General" product to the basket


      # Add Item level discount
      And the sales assistant selects the product at index 1
      And the sales assistant selects "Discounts" Option from line Action
      And the sales assistant select transaction discount button
      And the sales assistant enter discount amount as 1
      And the sales assistant clicks on Select a reason code button
      And the sales assistant selects "Damaged" as reason code
      And the sales assistant clicks on Apply button
      And the sales assistant lands on Basket Page
      And the sales assistant validate the discount applied as "1.00"

      #Payment transaction
      And the sales assistant clicks on Pay button
      And the sales assistant clicks on Accept button
      And the sales assistant save the transaction details of the sales transaction
      And the sales assistant clicks on gift card button from payment page
      And the sales assistant enter the gift card number for payment from index 1
      And the sales assistant clicks on redeem button
      And the sales assistant enter the the pin from index 1
      And the sales assistant save the payment details for the sales transaction
      And the sales assistant clicks on Print button
      And the sales assistant select the printer
      And the sales assistant logout from the application

