@VFG10X-2164 @SaleTransaction @Regression
Feature: VFG10X-2164 Sale Transaction _Perform a sale transaction by multiplying the quantity of Upc, apply tax exempt to the UPC

  Scenario: Sale Transaction _Perform a sale transaction by multiplying the quantity of Upc, apply tax exempt to the UPC

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Search product from Product Inquiry
    And the sales assistant add 1 items from "General" product to the basket
    And the sales assistant selects the product at index 1
    And the sales assistant selects the Change Quantity button
    And the sales assistant add 2 quantity to the order
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page

   #Apply Tax exempt
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax exempt" Option from line Action
    And the sales assistant enter the tax ID
    And the sales assistant clicks on Apply button
    And the sales assistant selects the product at index 2
    And the sales assistant selects "Tax" Option from line Action
    And the sales assistant selects "Tax exempt" Option from line Action
    And the sales assistant enter the tax ID
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page

    #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant lands on Basket Page
    And the sales assistant logout from the application

    #EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant logout from EJViewer


