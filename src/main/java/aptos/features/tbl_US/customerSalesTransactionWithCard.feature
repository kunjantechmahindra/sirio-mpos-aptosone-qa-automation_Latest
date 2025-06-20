@SmokeTestR
Feature: Customer Sales Transaction with Card

  Scenario: Sales Transaction with Cash

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

  #Create and Assign new Customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant clicks on New Customer
    And the sales assistant enter New customer detail
    And the sales assistant clicks on Privacy Policy
    And the sales assistant clicks on Save button
    And the sales assistant clicks on "No" to loyalty program

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application