@VFG10X-1760 @Regression @DetailedCalculation @SmokeTBL
Feature: VFG10X-1760 Promotions & discounts-Sales transaction with 2 for 30$ promo

  Scenario: Promotions & discounts-Sales transaction with 2 for 30$ promo

  #Login and add items
   Given the sales assistant login to the application with valid username and password
   When the sales assistant clicks on Start Basket button
   Then the sales assistant add 2 items from "2-for-30$" product to the basket without customer

#validate promotion
   And the sales assistant save sale amount details
   And the sales assistant lands on Basket Page
   And the sales assistant selects the product at index 1
   And the sales assistant validate "2 For $30 Tees" is applied to item
   And the sales assistant selects the product at index 2
   And the sales assistant validate "2 For $30 Tees" is applied to item
   And the sales assistant validate two for thirty promo applied
   And the sales assistant validate total transaction amount

#Payment by cash
  And the sales assistant clicks on Pay button
  And the sales assistant clicks on Accept button
  And the sales assistant save the transaction details of the sales transaction
  And the sales assistant clicks on Cash button
  And the sales assistant enter the Drawer ID
  And the sales assistant save the payment details for the sales transaction
  And the sales assistant clicks on Print button
  And the sales assistant select the printer
  And the sales assistant logout from the application
