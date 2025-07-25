@VFG10X-29 @SaleTransaction @Regression
Feature: VFG10X-29 Sale Transaction _Multiple Items with Employee discount _ No customer

  Scenario: Sale Transaction _Multiple Items with Employee discount _ No customer

    # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

    # Add Employee discount
    And the sales assistant clicks on Employee Sale button from basket page
    And the sales assistant enter "valid" Employee ID
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
#    And the sales assistant selects the product at index 1
#    And the sales assistant validate "Employee Sale" is applied to item

    # Payment using cash
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Email button
    And the sales assistant enter the email
    And the sales assistant logout from the application

    # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "Employee Sale - 50% off" in EJ
    And the sales assistant logout from EJViewer