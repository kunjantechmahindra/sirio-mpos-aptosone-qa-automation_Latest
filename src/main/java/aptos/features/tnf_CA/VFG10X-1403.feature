@VFG10X-1403 @SaleTransaction @Regression
Feature: VFG10X-1403 Validate transaction receipt footer -Full Price - Last day of Refund and Thank you msg

  Scenario: Validate transaction receipt footer -Full Price - Last day of Refund and Thank you msg

# Login
  Given the sales assistant login to the application with valid username and password
  When the sales assistant clicks on Start Basket button
  Then the sales assistant add 2 items from "General" product to the basket without customer

# Retrieve transaction data from Aptos
  And the sales assistant navigate to information page
  And the sales save the transaction date and address
    And the sales assistant clicks on Basket button from header

# Payment transaction
  And the sales assistant clicks on Pay button
  And the sales assistant clicks on Accept button
  And the sales assistant save the transaction details of the sales transaction
  And the sales assistant clicks on Cash button
    And the sales assistant clicks on Cash option
  And the sales assistant enter the Drawer ID
  And the sales assistant save the payment details for the sales transaction
  And the sales assistant clicks on Print button
  And the sales assistant select the printer
  And the sales assistant validate the physical receipt footer
  And the sales assistant logout from the application