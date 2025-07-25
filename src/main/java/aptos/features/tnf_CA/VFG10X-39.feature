@VFG10X-39 @SaleTransaction @Regression
Feature: VFG10X-39 Sale Transaction _Single item with Bag Fee_ Void Bag Fee_ New Customer

  Scenario: Sale Transaction _Single item with Bag Fee_ Void Bag Fee_ New Customer

   #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #New customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant clicks on New Customer
    And the sales assistant enter New customer detail
    And the sales assistant clicks on Privacy Policy
    And the sales assistant clicks on XPLR Pass
    And the sales assistant clicks on Save button

    #Add Product
    Then the sales assistant add 1 items from "General" product to the basket

    #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant adds 1 bag to the order
    And the sales assistant validate if bag quantity is "1"
    And the sales assistant clicks on Accept button
    #And the sales assistant navigate to basket page
    And the sales assistant clicks on Basket button from header
    And the sales assistant clicks on Pay button
    And the sales assistant subtract 1 bag to the order
    And the sales assistant validate if bag quantity is "0"
    And the sales assistant clicks on Accept button
    #And the sales assistant navigate to basket page
    And the sales assistant clicks on Basket button from header
    Then the sales assistant add 1 items from "General" product to the basket
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application