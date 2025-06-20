@VFG10X-2268 @SaleTransaction @Regression
Feature: VFG10X-2268 Sale Transaction _Non Merchandise Items_Shipping_Apply Employee Discount

  Scenario: Sale Transaction _Non Merchandise Items_Shipping_Apply Employee Discount

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Non Merch
    And the sales assistant clicks on Non-Merch button
    And the sales assistant select shipping
    And the sales assistant enter the shipping amount as 40
    And the sales assistant clicks on Apply button
    And the sales assistant clicks on Skip button
    And the sales assistant validate if "Shipping" is added to the basket at index 1

  # Add normal item to the basket
    And the sales assistant add 1 items from "General" product to the basket

  # Add Employee discount
    And the sales assistant clicks on Employee Sale button from basket page
    And the sales assistant enter "valid" Employee ID
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page

  # Validate the Employee Discount is not applied on Non-Merchandise item
    And the sales assistant selects the shipping item
    And the sales assistant validates Employee Discount not applied to Shipping

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

  # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "Merchandise" in EJ
    And the sales assistant validate details "Shipping" in EJ
    And the sales assistant logout from EJViewer