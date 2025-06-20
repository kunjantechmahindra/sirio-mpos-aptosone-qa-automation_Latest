@VFG10X-46 @SaleTransaction @Regression
Feature: VFG10X-46 Sale Transaction _Multiple Items_ Line Item Level Tax Exempt and Void Item and add same item_Existing Loyalty customer

  Scenario: Sale Transaction _Multiple Items_ Line Item Level Tax Exempt and Void Item and add same item_Existing Loyalty customer

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Add Item
    Then the sales assistant add 1 items from "General" product to the basket without customer

  # Assign customer
      And then sales assistant clicks on Assign Customer button
      #The customer has no loyalty program
      And the sales assistant assign customer details with index 0

  #Apply Tax exempt
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax exempt" Option from line Action
    And the sales assistant enter the tax ID
    And the sales assistant clicks on Select a reason code button on tax exempt page
    And the sales assistant clicks on reason code as tax exempt
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page

  #Void product
    And the sales assistant selects the product at index 1
    And the sales assistant void the product from basket

  #Add items
    And the sales assistant add same items to the basket
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Tax exempt - Sales Tax" is not applied to item
    And the sales assistant lands on Basket Page


  #Payment transaction
    And the sales assistant clicks on Pay button
    And  the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application
