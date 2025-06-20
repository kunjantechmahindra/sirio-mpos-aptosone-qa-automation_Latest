@VFG10X-1963 @ExchangeTransaction @Regression @GiftCard @Card
Feature: VFG10X-1963 Exchange _Multiple items with same price _Issue New gift card_ Loyalty Customer Assigned_Loyalty points validation

  Scenario: Exchange _Multiple items with same price _Issue New gift card_ Loyalty Customer Assigned_Loyalty points validation

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Add items
    Then the sales assistant add 1 items from "General" product to the basket without customer
    And the sales assistant add same items to the basket

  # Payment transaction
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return


  #New customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant clicks on New Customer
    And the sales assistant enter New customer detail
    And the sales assistant clicks on Privacy Policy
    And the sales assistant clicks on Loyalty Terms
    And the sales assistant clicks on Save button

  # Return transaction
    And the sales assistant clicks on menu button for iPhone basket
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - CHANGED MIND" as reason code
    And the sales assistant lands on Basket Page
    And the sales assistant add same items to the basket
    And the sales assistant add same items to the basket

  # Issue New Gift Card
    And the sales assistant clicks on menu button for iPhone basket
    And the sales assistant clicks on gift card button
    And the sales assistant enters gift card number from index 3
    And the sales assistant enters gift card amount 50
    And the sales assistant clicks on issue button
    And the sales assistant lands on Basket Page

  # Payment transaction
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant validate the loyalty points of a new loyalty customer in physical receipt
    And the sales assistant logout from the application

