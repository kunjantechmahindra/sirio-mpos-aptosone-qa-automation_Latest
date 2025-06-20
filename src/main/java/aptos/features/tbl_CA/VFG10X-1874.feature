@VFG10X-1874 @ReturnTransaction @Regression @DetailedCalculation
Feature: VFG10X-1874 Return Transaction _ Multiple %off  items _Price override in the sale for both items

  Scenario: Return Transaction _ Multiple %off  items _Price override in the sale for both items

#Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "WithOutCoupon-10%" product to the basket without customer

#Price override for first product(price greater than %Off item)
    And the sales assistant save sale amount details
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enter price as 200
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "PRICE MATCH" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate the price after price override
    And the sales assistant validate price of the item at index 1 after "10%" discount is applied
    And the sales assistant lands on Basket Page

#Price override for second product(price less than %Off item)
    And the sales assistant save sale amount details
    And the sales assistant selects the product at index 2
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enter price as 10
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "PRICE MATCH" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 2
    And the sales assistant validate the price after price override
    And the sales assistant validate price of the item at index 2 after "10%" discount is applied
    And the sales assistant validate total transaction amount

 #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
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
    And the sales assistant selects "RTL - CHANGED MIND" as reason code

    #Complete refund
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
